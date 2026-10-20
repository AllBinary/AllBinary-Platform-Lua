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

local PersistentInputMapping = require("org.allbinary.game.input.mapping.PersistentInputMapping")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlatformInputMappingFactory = {}
PlatformInputMappingFactory.__index = PlatformInputMappingFactory
PlatformInputMappingFactory.className = "PlatformInputMappingFactory"

function PlatformInputMappingFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputToGameKeyMapping = PersistentInputMapping.getNullInstance()
end

function PlatformInputMappingFactory.new()
    local self = setmetatable({}, PlatformInputMappingFactory)
    self:_init_fields()
    return self
end


function PlatformInputMappingFactory.getInstance()
        return PlatformInputMappingFactory.instance
end


function PlatformInputMappingFactory:getPersistentInputMappingInstance()
        local try_ok, try_error = pcall(function()
            if self.inputToGameKeyMapping == PersistentInputMapping.getNullInstance() then
                self.inputToGameKeyMapping = MotionJ2MEGameInputMapping.new()
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
        end
        return self.inputToGameKeyMapping
end

PlatformInputMappingFactory.instance = PlatformInputMappingFactory.new()

return PlatformInputMappingFactory

