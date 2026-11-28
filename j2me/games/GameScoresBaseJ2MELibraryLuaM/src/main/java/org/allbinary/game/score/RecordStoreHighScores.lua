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

local RecordStoreHighScores = {}
package.loaded["org.allbinary.game.score.RecordStoreHighScores"] = RecordStoreHighScores

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
local DataInputStream = java_lazy("java.io.DataInputStream")
-- local EOFException = require("java.io.EOFException")
-- local IOException = require("java.io.IOException")
local RecordComparator = java_lazy("javax.microedition.rms.RecordComparator")
local RecordEnumeration = java_lazy("javax.microedition.rms.RecordEnumeration")
local RecordStore = java_lazy("javax.microedition.rms.RecordStore")
local RecordStoreException = java_lazy("javax.microedition.rms.RecordStoreException")
local RecordStoreNotFoundException = java_lazy("javax.microedition.rms.RecordStoreNotFoundException")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local NullRecordComparator = java_lazy("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = java_lazy("org.allbinary.game.configuration.persistance.NullRecordFilter")
local NullRecordStore = java_lazy("org.allbinary.game.configuration.persistance.NullRecordStore")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local PlatformRecordIdUtil = java_lazy("org.allbinary.persistance.PlatformRecordIdUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local HighScores = require("org.allbinary.game.score.HighScores")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")
local ScoreComparator = java_lazy("org.allbinary.game.score.ScoreComparator")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table RecordStoreHighScores is declared before the requires
RecordStoreHighScores.__index = RecordStoreHighScores
RecordStoreHighScores.className = "RecordStoreHighScores"
RecordStoreHighScores.javaClassName = "org.allbinary.game.score.RecordStoreHighScores"
setmetatable(RecordStoreHighScores, {__index = HighScores})

function RecordStoreHighScores:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.platformRecordIdUtil = PlatformRecordIdUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.RECORD_ID = "_HS"
    self.MAXHIGHSCORES = 100
    if self.gameInfo == nil then self.gameInfo = nil end
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.recordComparatorInterface == nil then self.recordComparatorInterface = nil end
end


function RecordStoreHighScores._jinit(self, abeClientInformation, gameInfo, name, heading, columnTwoHeading, recordComparatorInterface)
    java_super_init(HighScores, self, name, heading, columnTwoHeading)
    RecordStoreHighScores._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self.gameInfo = gameInfo
        self.recordComparatorInterface = recordComparatorInterface
        self:load()
    return self
end

function RecordStoreHighScores.new(...)
    local self = setmetatable({}, RecordStoreHighScores)
    RecordStoreHighScores._jinit(self, ...)
    return self
end


function RecordStoreHighScores.getInstance(abeClientInformation, gameInfo, highScoreName, heading, columnTwoHeading, recordComparatorInterface)
        local highScoresCanBeNull = RecordStoreHighScores.hashTable:get(highScoreName)
        if rawequal(highScoresCanBeNull, nil) then
            local highScores = RecordStoreHighScores.new(abeClientInformation, gameInfo, highScoreName, heading, columnTwoHeading, recordComparatorInterface)
            RecordStoreHighScores.hashTable:put(highScores:getName(), highScores)
            return highScores
        end
        return highScoresCanBeNull
end


function RecordStoreHighScores:getRecordId(abeClientInformation)
        return self.platformRecordIdUtil:getRecordId(abeClientInformation, tostring(StringMaker.new():append(CommonSeps.getInstance().UNDERSCORE):append(self:getName()):append(self.RECORD_ID)))
end
java_overload(RecordStoreHighScores, "getRecordId", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)


function RecordStoreHighScores:addHighScore(newHighScore)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
        end
        do -- finally
            local try_ok, try_error, try_value = pcall(function()
                if not rawequal(recordStore, nil) then
                    PreLogUtil.put("Closing RecordStore", self, self.commonStrings.ADD)
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
            end
        end
end
java_overload(RecordStoreHighScores, "addHighScore", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HighScore")) end)


function RecordStoreHighScores:removeLowestHighScore()
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
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
                if not rawequal(recordAsBytes, nil) then
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    local name = inputStream:readUTF()
                    local nextScore = inputStream:readLong()
                    local nextCurrentHighScore = HighScore.new(id, name, GameInfo.NONE, nextScore)
                    if rawequal(self.recordComparatorInterface:compare(nextCurrentHighScore:getAsBytes(), bestHighScore:getAsBytes()), RecordComparator.FOLLOWS) then
                        bestHighScore = nextCurrentHighScore
                    end
                end
            end
            if not rawequal(bestHighScore:getId(), -1) then
                self.logUtil:putF(tostring(StringMaker.new():append("Removing Lowest HighScore: "):appendlong(java_int(bestHighScore:getScore()))), self, self.commonStrings.LOAD)
                recordStore:deleteRecord(bestHighScore:getId())
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "removeLowestHighScore", e)
        end
        do -- finally
            local try_ok, try_error, try_value = pcall(function()
                if not rawequal(recordStore, nil) then
                    PreLogUtil.put("Closing RecordStore", self, "removeLowestHighScore")
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "removeLowestHighScore", e)
            end
        end
end
java_overload(RecordStoreHighScores, "removeLowestHighScore", 0)


function RecordStoreHighScores:load()
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
            recordStore = RecordStore.openRecordStore(self:getRecordId(self.abeClientInformation), true)
            self:setList(BasicArrayListD.new())
            local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
            local recordAsBytes = nil
            local byteArrayInputStream = nil
            local inputStream = nil
            while recordEnum:hasNextElement() do
                local id = recordEnum:nextRecordId()
                recordAsBytes = self.tsUtil:getRecord(recordStore, id)
                if not rawequal(recordAsBytes, nil) then
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    local try_ok, try_error, try_value = pcall(function()
                        local name = inputStream:readUTF()
                        local score = inputStream:readLong()
                        local newHighScore = HighScore.new(id, name, GameInfo.NONE, score)
                        local list = self:getList()
                        local size = list:size()
                        local lastIndex = size
                        for index = 0, size - 1 do
                            local highScore = list.objectArray[index + 1]
                            if rawequal(self.recordComparatorInterface:compare(newHighScore:getAsBytes(), highScore:getAsBytes()), RecordComparator.PRECEDES) then
                                lastIndex = index
                                break
                            end
                        end
                        list:addAt(lastIndex, newHighScore)
                    end)
                    if not try_ok then
                        local e = try_error
                        if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                        self.logUtil:put("EOF", self, self.commonStrings.LOAD, e)
                        error(e, 0)
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("No High Scores", self, self.commonStrings.LOAD, e)
        end
        do -- finally
            local try_ok, try_error, try_value = pcall(function()
                if not rawequal(recordStore, nil) then
                    PreLogUtil.put("Closing RecordStore", self, self.commonStrings.LOAD)
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.LOAD, e)
            end
        end
end
java_overload(RecordStoreHighScores, "load", 0)


function RecordStoreHighScores:isTooManyHighScores()
        if not rawequal(self:getList(), nil) and self:getList():size() < self.MAXHIGHSCORES then
            return false
        else
            self.logUtil:putF(tostring(StringMaker.new():append("HighScores RecordStore Max Reached: "):appendint(self.MAXHIGHSCORES)), self, "isTooManyHighScores")
            return true
        end
end
java_overload(RecordStoreHighScores, "isTooManyHighScores", 0)


-- throws Exception
function RecordStoreHighScores:isBestScore(newHighScore)
        local try_ok, try_error, try_value = pcall(function()
            if not (self:isTooManyHighScores()) then
                self.logUtil:putF("Slot Available for a High Score", self, "isBestScore")
                do return "__jreturn", true end
            else
                local list = self:getList()
                local size = list:size()
                for index = 0, size - 1 do
                    local highScore = list.objectArray[index + 1]
                    if rawequal(self.recordComparatorInterface:compare(newHighScore:getAsBytes(), highScore:getAsBytes()), RecordComparator.FOLLOWS) then
                        self.logUtil:putF("Obtained a High Score", self, "isBestScore")
                        do return "__jreturn", true end
                    end
                end
            end
            self.logUtil:putF("Not a High Score", self, "isBestScore")
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(RecordStoreHighScores, "isBestScore", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HighScore")) end)


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
java_overload(RecordStoreHighScores, "toString", 0)
RecordStoreHighScores.__tostring = function(self) return self:toString() end

RecordStoreHighScores.hashTable = StdUtil.getInstance():createHashtable()

return RecordStoreHighScores

