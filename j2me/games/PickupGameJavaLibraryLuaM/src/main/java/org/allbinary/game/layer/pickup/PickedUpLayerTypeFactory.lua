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
-- package org.allbinary.game.layer.pickup

local PickedUpLayerTypeFactory = {}
package.loaded["org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory"] = PickedUpLayerTypeFactory

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local PickedUpLayerType = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerType")

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

-- class table PickedUpLayerTypeFactory is declared before the requires
PickedUpLayerTypeFactory.__index = PickedUpLayerTypeFactory
PickedUpLayerTypeFactory.className = "PickedUpLayerTypeFactory"
PickedUpLayerTypeFactory.javaClassName = "org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory"

function PickedUpLayerTypeFactory:_init_fields()
    self.NONE = PickedUpLayerType.new(StringUtil.getInstance().NULL_STRING)
    self.BEAM = PickedUpLayerType.new("BEAM")
    self.MINE = PickedUpLayerType.new("MINE")
    self.PROJECTILE = PickedUpLayerType.new("PROJECTILE")
    self.ENHANCEMENT = PickedUpLayerType.new("Enhancement")
    self.MORPH = PickedUpLayerType.new("Morph")
    self.PART = PickedUpLayerType.new("Part")
    self.HEAL = PickedUpLayerType.new("Heal")
    self.LIFE = PickedUpLayerType.new("Life")
    self.POINTS = PickedUpLayerType.new("Points")
end

function PickedUpLayerTypeFactory._jinit(self)
    PickedUpLayerTypeFactory._init_fields(self)
    return self
end

function PickedUpLayerTypeFactory.new()
    return PickedUpLayerTypeFactory._jinit(setmetatable({}, PickedUpLayerTypeFactory))
end


function PickedUpLayerTypeFactory.getInstance()
        return PickedUpLayerTypeFactory.instance_f
end

PickedUpLayerTypeFactory.instance_f = PickedUpLayerTypeFactory.new()

return PickedUpLayerTypeFactory

