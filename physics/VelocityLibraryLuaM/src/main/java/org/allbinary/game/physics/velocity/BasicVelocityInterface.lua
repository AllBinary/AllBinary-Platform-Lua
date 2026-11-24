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
-- package org.allbinary.game.physics.velocity

local BasicVelocityInterface = {}
package.loaded["org.allbinary.game.physics.velocity.BasicVelocityInterface"] = BasicVelocityInterface

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

local Direction = java_lazy("org.allbinary.direction.Direction")
local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local Angle = java_lazy("org.allbinary.math.Angle")

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

-- Java interface
-- class table BasicVelocityInterface is declared before the requires
BasicVelocityInterface.__index = BasicVelocityInterface
BasicVelocityInterface.className = "BasicVelocityInterface"
BasicVelocityInterface.javaClassName = "org.allbinary.game.physics.velocity.BasicVelocityInterface"


function BasicVelocityInterface:getVelocityXBasicDecimalP()
    error("abstract method getVelocityXBasicDecimalP")
end


function BasicVelocityInterface:getVelocityYBasicDecimalP()
    error("abstract method getVelocityYBasicDecimalP")
end


function BasicVelocityInterface:zero()
    error("abstract method zero")
end


function BasicVelocityInterface:setVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal, direction, otherDirection)
    error("abstract method setVelocityWithBigDecimalAndDirection")
end


function BasicVelocityInterface:addVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal, direction, otherDirection)
    error("abstract method addVelocityWithBigDecimalAndDirection")
end


function BasicVelocityInterface:setVelocityWithDirection(magnitude, direction, otherDirection)
    error("abstract method setVelocityWithDirection")
end


function BasicVelocityInterface:addVelocityWithDirection(magnitude, direction, otherDirection)
    error("abstract method addVelocityWithDirection")
end


function BasicVelocityInterface:setVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
    error("abstract method setVelocityWithBigDecimal")
end


function BasicVelocityInterface:addVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
    error("abstract method addVelocityWithBigDecimal")
end


function BasicVelocityInterface:setVelocity(magnitude, angle, otherAngle)
    error("abstract method setVelocity")
end


function BasicVelocityInterface:addVelocity(magnitude, angle, otherAngle)
    error("abstract method addVelocity")
end


function BasicVelocityInterface:addVelocityi(magnitude, angle, otherAngle)
    error("abstract method addVelocityi")
end

return BasicVelocityInterface

