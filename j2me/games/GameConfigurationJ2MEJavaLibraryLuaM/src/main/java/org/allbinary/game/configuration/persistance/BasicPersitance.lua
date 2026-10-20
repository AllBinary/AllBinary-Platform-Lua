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

-- local RecordStore = require("javax.microedition.rms.RecordStore")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local PlatformRecordIdUtil = require("org.allbinary.persistance.PlatformRecordIdUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicPersitance = {}
BasicPersitance.__index = BasicPersitance
BasicPersitance.className = "BasicPersitance"

function BasicPersitance:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.persistanceStrings = PersistanceStrings.getInstance()
    self.platformRecordIdUtil = PlatformRecordIdUtil.getInstance()
    self.recordId = nil
    self.valueList = BasicArrayListD.new()
    self.idList = BasicArrayListD.new()
end


function BasicPersitance.new(recordId)
    local self = setmetatable({}, BasicPersitance)
    self:_init_fields()
        self.recordId = recordId
    return self
end


-- throws Exception
function BasicPersitance:deleteRecoreStore(abeClientInformation)
        RecordStore.deleteRecordStore(self:getRecordId(abeClientInformation))
end


-- throws Exception
function BasicPersitance:deleteAll(abeClientInformation)
        local size = self.idList:size()
        for index = 0, size - 1 do
            local integer = self.idList.objectArray[index + 1]
            self:delete(abeClientInformation, math.tointeger(integer // 1))
        end
        self:clear()
end


-- throws Exception
function BasicPersitance:delete(abeClientInformation, deleteId)
        local recordStore = NullRecordStore.NULL_RECORD_STORE
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(self.persistanceStrings.DELETING_WITH_ID):appendint(deleteId)), self, self.commonStrings.delete)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            recordStore:deleteRecord(deleteId)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            if recordStore ~= nil then
                PreLogUtil.put(self.persistanceStrings.CLOSING_RECORDSTORE, self, self.commonStrings.delete)
                recordStore:closeRecordStore()
            end
        end
end


function BasicPersitance:getRecordId(abeClientInformation)
        return self.platformRecordIdUtil:getRecordId(abeClientInformation, self.recordId)
end


function BasicPersitance:getList()
        return self.valueList
end


function BasicPersitance:getIds()
        return self.idList
end


function BasicPersitance:clear()
        self.valueList:clear()
        self.idList:clear()
end

return BasicPersitance

