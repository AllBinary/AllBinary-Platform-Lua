--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.game.score

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local DataInputStream = require("java.io.DataInputStream")
-- local EOFException = require("java.io.EOFException")
-- local IOException = require("java.io.IOException")
-- local RecordComparator = require("javax.microedition.rms.RecordComparator")
-- local RecordEnumeration = require("javax.microedition.rms.RecordEnumeration")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
-- local RecordStoreException = require("javax.microedition.rms.RecordStoreException")
-- local RecordStoreNotFoundException = require("javax.microedition.rms.RecordStoreNotFoundException")
local TsUtil = require("org.allbinary.TsUtil")
local GameInfo = require("org.allbinary.game.GameInfo")
local NullRecordComparator = require("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = require("org.allbinary.game.configuration.persistance.NullRecordFilter")
local NullRecordStore = require("org.allbinary.game.configuration.persistance.NullRecordStore")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local PlatformRecordIdUtil = require("org.allbinary.persistance.PlatformRecordIdUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local HighScores = require("org.allbinary.game.score.HighScores")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RecordStoreHighScores = {}
RecordStoreHighScores.__index = RecordStoreHighScores
RecordStoreHighScores.className = "RecordStoreHighScores"
setmetatable(RecordStoreHighScores, {__index = HighScores})

function RecordStoreHighScores:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.platformRecordIdUtil = PlatformRecordIdUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.RECORD_ID = "_HS"
    self.MAXHIGHSCORES = 100
    self.gameInfo = nil
    self.abeClientInformation = nil
    self.recordComparatorInterface = nil
end


function RecordStoreHighScores.new(abeClientInformation, gameInfo, name, heading, columnTwoHeading, recordComparatorInterface)
    local self = setmetatable(HighScores.new(name, heading, columnTwoHeading), RecordStoreHighScores)
    self:_init_fields()
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self.gameInfo = gameInfo
        self.recordComparatorInterface = recordComparatorInterface
        self:load()
    return self
end


function RecordStoreHighScores.getInstance(abeClientInformation, gameInfo, highScoreName, heading, columnTwoHeading, recordComparatorInterface)
        local highScoresCanBeNull = RecordStoreHighScores.hashTable:get(highScoreName)
        if highScoresCanBeNull == nil then
            local highScores = RecordStoreHighScores.new(abeClientInformation, gameInfo, highScoreName, heading, columnTwoHeading, recordComparatorInterface)
            RecordStoreHighScores.hashTable:put(highScores:getName(), highScores)
            return highScores
        end
        return highScoresCanBeNull
end


function RecordStoreHighScores:getRecordId(abeClientInformation)
        return self.platformRecordIdUtil:getRecordId(abeClientInformation, tostring(StringMaker.new():append(CommonSeps.getInstance().UNDERSCORE):append(self:getName()):append(self.RECORD_ID)))
end


function RecordStoreHighScores:addHighScore(newHighScore)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Adding HighScore: "):appendlong(java_int(newHighScore:getScore()))), self, self.commonStrings.ADD)
            if self:isTooManyHighScores() then
                self.logUtil:putF("Removing Lowest Score", self, self.commonStrings.ADD)
                self:removeLowestHighScore()
            end
            recordStore = RecordStore.openRecordStore(self:getRecordId(self.abeClientInformation), true)
            local highScoreBytes = newHighScore:getAsBytes()
            local recordId = recordStore:addRecord(highScoreBytes, 0, (highScoreBytes.n or #highScoreBytes))
            self:load()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
        end
        do -- finally
            local try_ok, try_error = pcall(function()
                if recordStore ~= nil then
                    PreLogUtil.put("Closing RecordStore", self, self.commonStrings.ADD)
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
            end
        end
end


function RecordStoreHighScores:removeLowestHighScore()
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            recordStore = RecordStore.openRecordStore(self:getRecordId(self.abeClientInformation), true)
            local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
            local scoreComparator = (self.recordComparatorInterface)
            local bestHighScore = HighScore.new(-1, "none", GameInfo.NONE, scoreComparator:getBestScore())
            local recordAsBytes = nil
            local byteArrayInputStream = nil
            local inputStream = nil
            while recordEnum:hasNextElement() do
                local id = recordEnum:nextRecordId()
                recordAsBytes = self.tsUtil:getRecord(recordStore, id)
                if recordAsBytes ~= nil then
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    local name = inputStream:readUTF()
                    local nextScore = inputStream:readLong()
                    local nextCurrentHighScore = HighScore.new(id, name, GameInfo.NONE, nextScore)
                    if self.recordComparatorInterface:compare(nextCurrentHighScore:getAsBytes(), bestHighScore:getAsBytes()) == RecordComparator.FOLLOWS then
                        bestHighScore = nextCurrentHighScore
                    end
                end
            end
            if bestHighScore:getId() ~= -1 then
                self.logUtil:putF(tostring(StringMaker.new():append("Removing Lowest HighScore: "):appendlong(java_int(bestHighScore:getScore()))), self, self.commonStrings.LOAD)
                recordStore:deleteRecord(bestHighScore:getId())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "removeLowestHighScore", e)
        end
        do -- finally
            local try_ok, try_error = pcall(function()
                if recordStore ~= nil then
                    PreLogUtil.put("Closing RecordStore", self, "removeLowestHighScore")
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "removeLowestHighScore", e)
            end
        end
end


function RecordStoreHighScores:load()
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            recordStore = RecordStore.openRecordStore(self:getRecordId(self.abeClientInformation), true)
            self:setList(BasicArrayListD.new())
            local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
            local recordAsBytes = nil
            local byteArrayInputStream = nil
            local inputStream = nil
            while recordEnum:hasNextElement() do
                local id = recordEnum:nextRecordId()
                recordAsBytes = self.tsUtil:getRecord(recordStore, id)
                if recordAsBytes ~= nil then
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    local try_ok, try_error = pcall(function()
                        local name = inputStream:readUTF()
                        local score = inputStream:readLong()
                        local newHighScore = HighScore.new(id, name, GameInfo.NONE, score)
                        local list = self:getList()
                        local size = list:size()
                        local lastIndex = size
                        for index = 0, size - 1 do
                            local highScore = list.objectArray[index + 1]
                            if self.recordComparatorInterface:compare(newHighScore:getAsBytes(), highScore:getAsBytes()) == RecordComparator.PRECEDES then
                                lastIndex = index
                                break
                            end
                        end
                        list:addAt(lastIndex, newHighScore)
                    end)
                    if not try_ok then
                        local e = try_error
                        self.logUtil:put("EOF", self, self.commonStrings.LOAD, e)
                        error(e, 0)
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("No High Scores", self, self.commonStrings.LOAD, e)
        end
        do -- finally
            local try_ok, try_error = pcall(function()
                if recordStore ~= nil then
                    PreLogUtil.put("Closing RecordStore", self, self.commonStrings.LOAD)
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.LOAD, e)
            end
        end
end


function RecordStoreHighScores:isTooManyHighScores()
        if self:getList() ~= nil and self:getList():size() < self.MAXHIGHSCORES then
            return false
        else
            self.logUtil:putF(tostring(StringMaker.new():append("HighScores RecordStore Max Reached: "):appendint(self.MAXHIGHSCORES)), self, "isTooManyHighScores")
            return true
        end
end


-- throws Exception
function RecordStoreHighScores:isBestScore(newHighScore)
        local try_ok, try_error = pcall(function()
            if not self:isTooManyHighScores() then
                self.logUtil:putF("Slot Available for a High Score", self, "isBestScore")
                return true
            else
                local list = self:getList()
                local size = list:size()
                for index = 0, size - 1 do
                    local highScore = list.objectArray[index + 1]
                    if self.recordComparatorInterface:compare(newHighScore:getAsBytes(), highScore:getAsBytes()) == RecordComparator.FOLLOWS then
                        self.logUtil:putF("Obtained a High Score", self, "isBestScore")
                        return true
                    end
                end
            end
            self.logUtil:putF("Not a High Score", self, "isBestScore")
            return false
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
            error(e, 0)
        end
end


function RecordStoreHighScores:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(HighScores))
        local list = self:getList()
        local size = list:size()
        for index = 0, size - 1 do
            local highScore = list.objectArray[index + 1]
            stringBuffer:append(highScore:getScoreString())
            stringBuffer:append(CommonSeps.getInstance().COMMA_SEP)
        end
        return tostring(stringBuffer)
end
RecordStoreHighScores.__tostring = function(self) return self:toString() end

RecordStoreHighScores.hashTable = StdUtil.getInstance():createHashtable()

return RecordStoreHighScores

