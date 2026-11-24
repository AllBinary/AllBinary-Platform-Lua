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

local InputFeatureFactory = {}
package.loaded["org.allbinary.game.configuration.feature.InputFeatureFactory"] = InputFeatureFactory

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeature = java_lazy("org.allbinary.game.configuration.feature.InputFeature")

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

-- class table InputFeatureFactory is declared before the requires
InputFeatureFactory.__index = InputFeatureFactory
InputFeatureFactory.className = "InputFeatureFactory"
InputFeatureFactory.javaClassName = "org.allbinary.game.configuration.feature.InputFeatureFactory"

function InputFeatureFactory:_init_fields()
    self.REMOVE_DUPLICATE_KEY_PRESSES = InputFeature.new("Remove Duplicate Key Presses")
    self.INPUT_MAPPING = InputFeature.new("Input Mapping")
    self.MULTI_KEY_PRESS = InputFeature.new("Multi Key Press")
    self.SINGLE_KEY_REPEAT_PRESS = InputFeature.new("Single Key Repeat Press")
    self.SINGLE_KEY_PRESS = InputFeature.new("Single Key Press")
end


function InputFeatureFactory.getInstance()
        return InputFeatureFactory.instance_f
end


function InputFeatureFactory._jinit(self)
    InputFeatureFactory._init_fields(self)
    return self
end

function InputFeatureFactory.new(...)
    local self = setmetatable({}, InputFeatureFactory)
    InputFeatureFactory._jinit(self, ...)
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

InputFeatureFactory.instance_f = InputFeatureFactory.new()

return InputFeatureFactory

