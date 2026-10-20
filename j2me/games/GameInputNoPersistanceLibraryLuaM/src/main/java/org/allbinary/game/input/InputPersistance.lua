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

-- local RecordEnumeration = require("javax.microedition.rms.RecordEnumeration")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
local BasicPersitance = require("org.allbinary.game.configuration.persistance.BasicPersitance")
local NullRecordComparator = require("org.allbinary.game.configuration.persistance.NullRecordComparator")
local NullRecordFilter = require("org.allbinary.game.configuration.persistance.NullRecordFilter")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--GameInputNoPersistanceLibrary
local InputPersistance = {}
InputPersistance.__index = InputPersistance
InputPersistance.className = "InputPersistance"
setmetatable(InputPersistance, {__index = BasicPersitance})

function InputPersistance:_init_fields()
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
        local recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
        local recordEnum = recordStore:enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)
        local hashtable = nil
        local stringBuffer = StringMaker.new()
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local id = 0
        while recordEnum:hasNextElement() do
            id = recordEnum:nextRecordId()
            stringBuffer:delete(0, stringBuffer:length())
            self.logUtil:putF(tostring(stringBuffer:append(self.persistanceStrings.LOADING_ID):appendint(id)), self, self.persistanceStrings.LOAD_ALL)
            hashtable = StdUtil.getInstance():createHashtable()
            self.valueList:add(hashtable)
            self.idList:add(smallIntegerSingletonFactory:getAt(id))
        end
        recordStore:closeRecordStore()
end


-- throws Exception
function InputPersistance:save(abeClientInformation, hashtable)
        PreLogUtil.put(tostring(StringMaker.new():append(self.persistanceStrings.NOT_SAVING):append(StringUtil.getInstance():toString(hashtable))), self, self.commonStrings.SAVE)
        local recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
        local gameActionInput = nil
        local list = nil
        local input = nil
        local inputObjectArray = self.hashtableUtil:getKeysAsArray(hashtable)
        local size = (inputObjectArray.n or #inputObjectArray)
        for index = 0, size - 1 do
            gameActionInput = inputObjectArray[index + 1]
            list = hashtable:get(inputObjectArray[index + 1])
            for index2 = 0, list:size() - 1 do
                input = list:get(index2)
            end
        end
        recordStore:closeRecordStore()
end

return InputPersistance

