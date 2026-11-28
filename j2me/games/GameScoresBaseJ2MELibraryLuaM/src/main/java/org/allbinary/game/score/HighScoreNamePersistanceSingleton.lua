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

local HighScoreNamePersistanceSingleton = {}
package.loaded["org.allbinary.game.score.HighScoreNamePersistanceSingleton"] = HighScoreNamePersistanceSingleton

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
local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
local DataInputStream = java_lazy("java.io.DataInputStream")
local DataOutputStream = java_lazy("java.io.DataOutputStream")
local RecordEnumeration = java_lazy("javax.microedition.rms.RecordEnumeration")
local RecordStore = java_lazy("javax.microedition.rms.RecordStore")
local RecordStoreException = java_lazy("javax.microedition.rms.RecordStoreException")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local NullRecordComparator = java_lazy("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = java_lazy("org.allbinary.game.configuration.persistance.NullRecordFilter")
local NullRecordStore = java_lazy("org.allbinary.game.configuration.persistance.NullRecordStore")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local ExceptionUtil = java_lazy("org.allbinary.logic.java.exception.ExceptionUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local PlatformRecordIdUtil = java_lazy("org.allbinary.persistance.PlatformRecordIdUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table HighScoreNamePersistanceSingleton is declared before the requires
HighScoreNamePersistanceSingleton.__index = HighScoreNamePersistanceSingleton
HighScoreNamePersistanceSingleton.className = "HighScoreNamePersistanceSingleton"
HighScoreNamePersistanceSingleton.javaClassName = "org.allbinary.game.score.HighScoreNamePersistanceSingleton"

function HighScoreNamePersistanceSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.platformRecordIdUtil = PlatformRecordIdUtil.getInstance()
    self.RECORD_ID = "_SN"
    self.name_f = StringUtil.getInstance().EMPTY_STRING
    self.nameBasicArrayList = BasicArrayListD.new()
end

function HighScoreNamePersistanceSingleton._jinit(self)
    HighScoreNamePersistanceSingleton._init_fields(self)
    return self
end

function HighScoreNamePersistanceSingleton.new()
    return HighScoreNamePersistanceSingleton._jinit(setmetatable({}, HighScoreNamePersistanceSingleton))
end


function HighScoreNamePersistanceSingleton.getInstance()
        return HighScoreNamePersistanceSingleton.SINGLETON
end


function HighScoreNamePersistanceSingleton:clear()
        self.name_f = StringUtil.getInstance().EMPTY_STRING
end


-- throws Exception
function HighScoreNamePersistanceSingleton:deleteAll(abeClientInformation, gameInfo)
        local size = self.nameBasicArrayList:size()
        for index = 0, size - 1 do
            local integer = self.nameBasicArrayList.objectArray[index + 1]
            self:delete(abeClientInformation, gameInfo, require("allbinary_java").number_value(integer, "intValue"))
        end
        self:clear()
end


function HighScoreNamePersistanceSingleton:getRecordId(abeClientInformation)
        return self.platformRecordIdUtil:getRecordId(abeClientInformation, self.RECORD_ID)
end


-- throws Exception
function HighScoreNamePersistanceSingleton:delete(abeClientInformation, gameInfo, deleteId)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Deleting: "):appendint(deleteId)), self, self.commonStrings.delete)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            recordStore:deleteRecord(deleteId)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        do -- finally
            if not rawequal(recordStore, nil) then
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
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(self.name_f, StringUtil.getInstance().EMPTY_STRING) then
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
                        self.name_f = inputStream:readUTF()
                    end
                    self.nameBasicArrayList:add(smallIntegerSingletonFactory:getAt(id))
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self:save(abeClientInformation, gameInfo, self.name_f)
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(ExceptionUtil.getInstance():getStackTrace(e))), self, self.commonStrings.LOAD)
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
        return self.name_f
end


function HighScoreNamePersistanceSingleton:save(abeClientInformation, gameInfo, name)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Saving: "):append(name)), self, self.commonStrings.SAVE)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local byteArrayOutputStream = require("java.io.ByteArrayOutputStream").new()
            local outputStream = DataOutputStream.new(byteArrayOutputStream)
            outputStream:writeUTF(name)
            local savedGameBytes = byteArrayOutputStream:toByteArray()
            recordStore:addRecord(savedGameBytes, 0, (savedGameBytes.n or #savedGameBytes))
            self.name_f = name
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
        end
        do -- finally
            local try_ok, try_error, try_value = pcall(function()
                if not rawequal(recordStore, nil) then
                    PreLogUtil.put("Closing RecordStore", self, self.commonStrings.SAVE)
                    recordStore:closeRecordStore()
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
            end
        end
end

HighScoreNamePersistanceSingleton.SINGLETON = HighScoreNamePersistanceSingleton.new()

return HighScoreNamePersistanceSingleton

