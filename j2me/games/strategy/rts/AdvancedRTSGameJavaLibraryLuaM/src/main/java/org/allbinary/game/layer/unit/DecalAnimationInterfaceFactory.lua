-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.unit

local DecalAnimationInterfaceFactory = {}
package.loaded["org.allbinary.game.layer.unit.DecalAnimationInterfaceFactory"] = DecalAnimationInterfaceFactory

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

local BasicGameResources = java_lazy("org.allbinary.game.layer.resources.BasicGameResources")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local NullRotationAnimationFactory = java_lazy("org.allbinary.animation.NullRotationAnimationFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")

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

-- class table DecalAnimationInterfaceFactory is declared before the requires
DecalAnimationInterfaceFactory.__index = DecalAnimationInterfaceFactory
DecalAnimationInterfaceFactory.className = "DecalAnimationInterfaceFactory"
DecalAnimationInterfaceFactory.javaClassName = "org.allbinary.game.layer.unit.DecalAnimationInterfaceFactory"

function DecalAnimationInterfaceFactory._jinit(self)
    return self
end

function DecalAnimationInterfaceFactory.new()
    return DecalAnimationInterfaceFactory._jinit(setmetatable({}, DecalAnimationInterfaceFactory))
end


function DecalAnimationInterfaceFactory.getInstance()
        return DecalAnimationInterfaceFactory.instance_f
end


-- throws Exception
function DecalAnimationInterfaceFactory:getAnimationFactory(basicGameResources, basicColor)
        local animationInterfaceFactoryInterface = nil
        if rawequal(basicColor, BasicColorFactory.getInstance().RED) then
            animationInterfaceFactoryInterface = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(basicGameResources.RESOURCE)
        else
            animationInterfaceFactoryInterface = NullRotationAnimationFactory.getFactoryInstance()
        end
        return animationInterfaceFactoryInterface
end

DecalAnimationInterfaceFactory.instance_f = DecalAnimationInterfaceFactory.new()

return DecalAnimationInterfaceFactory

