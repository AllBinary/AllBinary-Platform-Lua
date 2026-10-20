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
-- package org.allbinary.game.input

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local DataInputStream = require("java.io.DataInputStream")
-- local DataOutputStream = require("java.io.DataOutputStream")
-- local RecordEnumeration = require("javax.microedition.rms.RecordEnumeration")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
local TsUtil = require("org.allbinary.TsUtil")
local BasicPersitance = require("org.allbinary.game.configuration.persistance.BasicPersitance")
local NullRecordComparator = require("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = require("org.allbinary.game.configuration.persistance.NullRecordFilter")
local NullRecordStore = require("org.allbinary.game.configuration.persistance.NullRecordStore")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

--GameInputPersistanceLibrary
local InputPersistance = {}
InputPersistance.__index = InputPersistance
InputPersistance.className = "InputPersistance"
setmetatable(InputPersistance, {__index = BasicPersitance})

function InputPersistance:_init_fields()
    self.tsUtil = TsUtil.getInstance()
    self.hashtableUtil = HashtableUtil.getInstance()
end


function InputPersistance.new(name)
    local self = setmetatable(BasicPersitance.new(name), InputPersistance)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function InputPersistance:loadAll(abeClientInformation)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
            local gameActionInputId = 0
            local inputId = 0
            local gameActionInput = nil
            local input = nil
            local hashtable = nil
            local gameKeyFactory = GameKeyMappingFactory.getInstance()
            local stringBuffer = StringMaker.new()
            local inputFactory = InputFactory.getInstance()
            local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
            local stdUtil = StdUtil.getInstance()
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
                    hashtable = stdUtil:createHashtable()
                    local value = 0
                    while inputStream:available() > 0 do
                        local gameActionInputIdAsString = inputStream:readUTF()
                        value = math.tointeger(tonumber(gameActionInputIdAsString))
                        gameActionInputId = value
                        inputStream:readUTF()
                        value = math.tointeger(tonumber(inputStream:readUTF()))
                        inputId = value
                        gameActionInput = gameKeyFactory:getGameKey(gameActionInputId)
                        input = inputFactory:getInstanceById(inputId)
                        if input == inputFactory.NO_INPUT or gameActionInput == nil then
                            stringBuffer:delete(0, stringBuffer:length())
                            if input == inputFactory.NO_INPUT then
                                stringBuffer:append(self.persistanceStrings.ERROR_LOADING_ID)
                                stringBuffer:appendlong(inputId)
                                stringBuffer:append(self.persistanceStrings.GAME_ACTION_INPUT)
                                stringBuffer:appendlong(gameActionInputId)
                                PreLogUtil.put(tostring(stringBuffer), self, self.persistanceStrings.LOAD_ALL)
                            end
                            if gameActionInput == nil then
                                stringBuffer:delete(0, stringBuffer:length())
                                stringBuffer:append(self.persistanceStrings.ERROR_LOADING)
                                stringBuffer:appendlong(gameActionInputId)
                                stringBuffer:append(self.persistanceStrings.ID)
                                stringBuffer:appendlong(inputId)
                                PreLogUtil.put(tostring(stringBuffer), self, self.persistanceStrings.LOAD_ALL)
                            end
                        else
                        end
                        hashtable:put(input, gameActionInput)
                    end
                    self.valueList:add(hashtable)
                    self.idList:add(smallIntegerSingletonFactory:getAt(id))
                else
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
function InputPersistance:save(abeClientInformation, hashtable)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            PreLogUtil.put(tostring(stringBuffer:append(self.persistanceStrings.SAVING):append(StringUtil.getInstance():toString(hashtable))), self, self.commonStrings.SAVE)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            local byteArrayOutputStream = java_byte_array_output_stream()
            local outputStream = DataOutputStream.new(byteArrayOutputStream)
            local gameActionInput = nil
            local list = nil
            local input = nil
            local savedGameBytes = nil
            local commonSeps = CommonSeps.getInstance()
            local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
            local inputObjectArray = self.hashtableUtil:getKeysAsArray(hashtable)
            local size = (inputObjectArray.n or #inputObjectArray)
            for index = 0, size - 1 do
                gameActionInput = inputObjectArray[index + 1]
                list = hashtable:get(inputObjectArray[index + 1])
                for index2 = 0, list:size() - 1 do
                    local gameActionInputIdAsString = tostring(smallIntegerSingletonFactory:getAt(gameActionInput:getId()))
                    outputStream:writeUTF(gameActionInputIdAsString)
                    outputStream:writeUTF(commonSeps.EQUALS)
                    input = list.objectArray[index2 + 1]
                    local inputIdAsString = tostring(smallIntegerSingletonFactory:getAt(input:getId()))
                    outputStream:writeUTF(inputIdAsString)
                end
            end
            savedGameBytes = byteArrayOutputStream:toByteArray()
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

return InputPersistance

