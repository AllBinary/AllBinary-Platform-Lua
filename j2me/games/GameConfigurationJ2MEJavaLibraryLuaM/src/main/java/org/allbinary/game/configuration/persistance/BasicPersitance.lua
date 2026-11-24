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

local BasicPersitance = {}
package.loaded["org.allbinary.game.configuration.persistance.BasicPersitance"] = BasicPersitance

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

-- local RecordStore = require("javax.microedition.rms.RecordStore")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local PlatformRecordIdUtil = java_lazy("org.allbinary.persistance.PlatformRecordIdUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local NullRecordStore = java_lazy("org.allbinary.game.configuration.persistance.NullRecordStore")
local PersistanceStrings = java_lazy("org.allbinary.game.configuration.persistance.PersistanceStrings")

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

-- class table BasicPersitance is declared before the requires
BasicPersitance.__index = BasicPersitance
BasicPersitance.className = "BasicPersitance"
BasicPersitance.javaClassName = "org.allbinary.game.configuration.persistance.BasicPersitance"

function BasicPersitance:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.persistanceStrings = PersistanceStrings.getInstance()
    self.platformRecordIdUtil = PlatformRecordIdUtil.getInstance()
    if self.recordId == nil then self.recordId = nil end
    self.valueList = BasicArrayListD.new()
    self.idList = BasicArrayListD.new()
end


function BasicPersitance._jinit(self, recordId)
    BasicPersitance._init_fields(self)
        self.recordId = recordId
    return self
end

function BasicPersitance.new(...)
    local self = setmetatable({}, BasicPersitance)
    BasicPersitance._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(self.persistanceStrings.DELETING_WITH_ID):appendint(deleteId)), self, self.commonStrings.delete)
            recordStore = RecordStore.openRecordStore(self:getRecordId(abeClientInformation), true)
            recordStore:deleteRecord(deleteId)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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

