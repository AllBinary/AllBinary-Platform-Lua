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
-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local DataInputStream = require("java.io.DataInputStream")
-- local DataOutputStream = require("java.io.DataOutputStream")
-- local RecordEnumeration = require("javax.microedition.rms.RecordEnumeration")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
-- local RecordStoreException = require("javax.microedition.rms.RecordStoreException")
local TsUtil = require("org.allbinary.TsUtil")
local GameInfo = require("org.allbinary.game.GameInfo")
local NullRecordComparator = require("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = require("org.allbinary.game.configuration.persistance.NullRecordFilter")
local NullRecordStore = require("org.allbinary.game.configuration.persistance.NullRecordStore")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local ExceptionUtil = require("org.allbinary.logic.java.exception.ExceptionUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local PlatformRecordIdUtil = require("org.allbinary.persistance.PlatformRecordIdUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoreNamePersistanceSingleton = {}
HighScoreNamePersistanceSingleton.__index = HighScoreNamePersistanceSingleton
HighScoreNamePersistanceSingleton.className = "HighScoreNamePersistanceSingleton"

function HighScoreNamePersistanceSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.platformRecordIdUtil = PlatformRecordIdUtil.getInstance()
    self.RECORD_ID = "_SN"
    self.name = StringUtil.getInstance().EMPTY_STRING
    self.nameBasicArrayList = BasicArrayListD.new()
end

function HighScoreNamePersistanceSingleton.new()
    local self = setmetatable({}, HighScoreNamePersistanceSingleton)
    self:_init_fields()
    return self
end


function HighScoreNamePersistanceSingleton.getInstance()
        return HighScoreNamePersistanceSingleton.SINGLETON
end


function HighScoreNamePersistanceSingleton:clear()
        self.name = StringUtil.getInstance().EMPTY_STRING
end


-- throws Exception
function HighScoreNamePersistanceSingleton:deleteAll(abeClientInformation, gameInfo)
        local size = self.nameBasicArrayList:size()
        for index = 0, size - 1 do
            local integer = self.nameBasicArrayList.objectArray[index + 1]
            self:delete(abeClientInformation, gameInfo, math.tointeger(integer // 1))
        end
        self:clear()
end


function HighScoreNamePersistanceSingleton:getRecordId(abeClientInformation)
        return self.platformRecordIdUtil:getRecordId(abeClientInformation, self.RECORD_ID)
end


-- throws Exception
function HighScoreNamePersistanceSingleton:delete(abeClientInformation, gameInfo, deleteId)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Deleting: "):appendint(deleteId)), self, self.commonStrings.delete)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            recordStore:deleteRecord(deleteId)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            if recordStore ~= nil then
                PreLogUtil.put("Closing RecordStore", self, self.commonStrings.delete)
                recordStore:closeRecordStore()
            end
        end
end


function HighScoreNamePersistanceSingleton:getIds()
        return self.nameBasicArrayList
end


function HighScoreNamePersistanceSingleton:load(abeClientInformation, gameInfo)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            if self.name == StringUtil.getInstance().EMPTY_STRING then
                local LOADING_ID = "Loading id: "
                recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
                local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
                local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
                local recordAsBytes = nil
                local byteArrayInputStream = nil
                local inputStream = nil
                while recordEnum:hasNextElement() do
                    local id = recordEnum:nextRecordId()
                    self.logUtil:putF(tostring(StringMaker.new():append(LOADING_ID):appendint(id)), self, self.commonStrings.LOAD)
                    recordAsBytes = self.tsUtil:getRecord(recordStore, id)
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    while inputStream:available() > 0 do
                        self.name = inputStream:readUTF()
                    end
                    self.nameBasicArrayList:add(smallIntegerSingletonFactory:getAt(id))
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self:save(abeClientInformation, gameInfo, self.name)
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(ExceptionUtil.getInstance():getStackTrace(e))), self, self.commonStrings.LOAD)
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
        return self.name
end


function HighScoreNamePersistanceSingleton:save(abeClientInformation, gameInfo, name)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Saving: "):append(name)), self, self.commonStrings.SAVE)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local byteArrayOutputStream = java_byte_array_output_stream()
            local outputStream = DataOutputStream.new(byteArrayOutputStream)
            outputStream:writeUTF(name)
            local savedGameBytes = byteArrayOutputStream:toByteArray()
            recordStore:addRecord(savedGameBytes, 0, (savedGameBytes.n or #savedGameBytes))
            self.name = name
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
        end
        do -- finally
            local try_ok, try_error = pcall(function()
                if recordStore ~= nil then
                    PreLogUtil.put("Closing RecordStore", self, self.commonStrings.SAVE)
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
            end
        end
end

HighScoreNamePersistanceSingleton.SINGLETON = HighScoreNamePersistanceSingleton.new()

return HighScoreNamePersistanceSingleton

