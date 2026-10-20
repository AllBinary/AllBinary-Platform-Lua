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
-- package org.allbinary.game.configuration.feature


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputFeatureFactory = {}
InputFeatureFactory.__index = InputFeatureFactory
InputFeatureFactory.className = "InputFeatureFactory"

function InputFeatureFactory:_init_fields()
    self.REMOVE_DUPLICATE_KEY_PRESSES = InputFeature.new("Remove Duplicate Key Presses")
    self.INPUT_MAPPING = InputFeature.new("Input Mapping")
    self.MULTI_KEY_PRESS = InputFeature.new("Multi Key Press")
    self.SINGLE_KEY_REPEAT_PRESS = InputFeature.new("Single Key Repeat Press")
    self.SINGLE_KEY_PRESS = InputFeature.new("Single Key Press")
end


function InputFeatureFactory.getInstance()
        return InputFeatureFactory.instance
end


function InputFeatureFactory.new()
    local self = setmetatable({}, InputFeatureFactory)
    self:_init_fields()
    return self
end


function InputFeatureFactory:isSingleKeyProcessing()
        local features = Features.getInstance()
        if features:isFeature(self.SINGLE_KEY_REPEAT_PRESS) or features:isFeature(self.SINGLE_KEY_PRESS) then
            return true
        else
            return false
        end
end

InputFeatureFactory.instance = InputFeatureFactory.new()

return InputFeatureFactory

