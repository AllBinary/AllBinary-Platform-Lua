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
-- package org.allbinary.game.configuration.persistance

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local DataInputStream = require("java.io.DataInputStream")
-- local DataOutputStream = require("java.io.DataOutputStream")
-- local RecordEnumeration = require("javax.microedition.rms.RecordEnumeration")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
local TsUtil = require("org.allbinary.TsUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local BasicPersitance = require("org.allbinary.game.configuration.persistance.BasicPersitance")

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

local KeyValuePersistance = {}
KeyValuePersistance.__index = KeyValuePersistance
KeyValuePersistance.className = "KeyValuePersistance"
setmetatable(KeyValuePersistance, {__index = BasicPersitance})

function KeyValuePersistance:_init_fields()
    self.tsUtil = TsUtil.getInstance()
end


function KeyValuePersistance.new(recordId)
    local self = setmetatable(BasicPersitance.new(recordId), KeyValuePersistance)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function KeyValuePersistance:loadAll(abeClientInformation)
        self:loadAllSize(abeClientInformation, 1)
end


-- throws Exception
function KeyValuePersistance:loadAllSize(abeClientInformation, size)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
            local hashtable = nil
            local name = nil
            local value = nil
            local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
            local stringBuffer = StringMaker.new()
            local recordAsBytes = nil
            local byteArrayInputStream = nil
            local inputStream = nil
            while recordEnum:hasNextElement() do
                local id = recordEnum:nextRecordId()
                stringBuffer:delete(0, stringBuffer:length())
                self.logUtil:putF(tostring(stringBuffer:append(self.persistanceStrings.LOADING_ID):appendint(id)), self, self.persistanceStrings.LOAD_ALL)
                recordAsBytes = self.tsUtil:getRecord(recordStore, id)
                if recordAsBytes ~= nil then
                    byteArrayInputStream = ByteArrayInputStream.new(recordAsBytes)
                    inputStream = DataInputStream.new(byteArrayInputStream)
                    hashtable = ABHashtable.new()
                    for index = 0, size - 1 do
                        name = inputStream:readUTF()
                        inputStream:readUTF()
                        value = inputStream:readUTF()
                        hashtable:put(name, value)
                    end
                    self.valueList:add(hashtable)
                    self.idList:add(smallIntegerSingletonFactory:getAt(id))
                end
            end
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            if recordStore ~= nil then
                PreLogUtil.put(self.persistanceStrings.CLOSING_RECORDSTORE, self, self.persistanceStrings.LOAD_ALL)
                recordStore:closeRecordStore()
            end
        end
end


-- throws Exception
function KeyValuePersistance:save(abeClientInformation, hashtable)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(self.persistanceStrings.SAVING):append(StringUtil.getInstance():toString(hashtable))), self, self.commonStrings.SAVE)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local byteArrayOutputStream = java_byte_array_output_stream()
            local outputStream = DataOutputStream.new(byteArrayOutputStream)
            local value = nil
            local commonSeps = CommonSeps.getInstance()
            local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
            local anyType = nil
            local size = (objectArray.n or #objectArray)
            for index = 0, size - 1 do
                outputStream:writeUTF(objectArray[index + 1])
                outputStream:writeUTF(commonSeps.EQUALS)
                anyType = objectArray[index + 1]
                value = hashtable:get(anyType)
                outputStream:writeUTF(value)
            end
            local tsUtil = TsUtil.getInstance()
            local savedGameBytes = tsUtil:getByteArray(tostring(byteArrayOutputStream))
            recordStore:addRecord(savedGameBytes, 0, (savedGameBytes.n or #savedGameBytes))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            if recordStore ~= nil then
                PreLogUtil.put(self.persistanceStrings.CLOSING_RECORDSTORE, self, self.commonStrings.SAVE)
                recordStore:closeRecordStore()
            end
        end
end


function KeyValuePersistance:get(index)
        local hashtable = self.valueList.objectArray[index + 1]
        return hashtable
end

return KeyValuePersistance

