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

local GamePersistanceStrings = require("org.allbinary.game.configuration.persistance.GamePersistanceStrings")
local PersistentInputMapping = require("org.allbinary.game.input.mapping.PersistentInputMapping")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PCGameInputMapping = {}
PCGameInputMapping.__index = PCGameInputMapping
PCGameInputMapping.className = "PCGameInputMapping"
setmetatable(PCGameInputMapping, {__index = PersistentInputMapping})


function PCGameInputMapping.new()
    local self = setmetatable(PersistentInputMapping.new(GamePersistanceStrings.getInstance().SAVED_INPUT_CONFIGURATION_RECORD_ID), PCGameInputMapping)
        -- super(...) made self above
    return self
end


-- throws Exception
function PCGameInputMapping:init(abeClientInformation)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.INIT)
        PCKeyFactory.getInstance()
        PersistentInputMapping.init(self, abeClientInformation)
        if self:getTotalMapped() == 0 or self:isDefaultNew() then
            self:getInputMapping():addMapping(self:getDefault())
            self:save(abeClientInformation)
        end
end


function PCGameInputMapping:isDelete(input)
        if input == PCKeyFactory.getInstance().DEL then
            return true
        else
            return false
        end
end


function PCGameInputMapping:isSystemInput(input)
        return false
end

return PCGameInputMapping

