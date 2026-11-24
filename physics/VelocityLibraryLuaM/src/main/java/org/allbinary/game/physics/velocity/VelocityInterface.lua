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

local VelocityInterface = {}
package.loaded["org.allbinary.game.physics.velocity.VelocityInterface"] = VelocityInterface

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

local BasicVelocityInterface = require("org.allbinary.game.physics.velocity.BasicVelocityInterface")

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
-- class table VelocityInterface is declared before the requires
VelocityInterface.__index = VelocityInterface
VelocityInterface.className = "VelocityInterface"
VelocityInterface.javaClassName = "org.allbinary.game.physics.velocity.VelocityInterface"
setmetatable(VelocityInterface, {__index = BasicVelocityInterface})
VelocityInterface.java_interfaces = function() return {BasicVelocityInterface} end


function VelocityInterface:getMaxForwardVelocity()
    error("abstract method getMaxForwardVelocity")
end


function VelocityInterface:getMaxReverseVelocity()
    error("abstract method getMaxReverseVelocity")
end


function VelocityInterface:limitMaxXYForwardVelocity()
    error("abstract method limitMaxXYForwardVelocity")
end


function VelocityInterface:limitMaxXYReverseVelocity()
    error("abstract method limitMaxXYReverseVelocity")
end


function VelocityInterface:limitXYToForwardAndReverseMaxVelocity()
    error("abstract method limitXYToForwardAndReverseMaxVelocity")
end


function VelocityInterface:limitMaxXYVelocity(maxVelocity)
    error("abstract method limitMaxXYVelocity")
end


function VelocityInterface:setMaxForwardVelocity(maxForwardVelocity)
    error("abstract method setMaxForwardVelocity")
end


function VelocityInterface:setMaxReverseVelocity(maxReverseVelocity)
    error("abstract method setMaxReverseVelocity")
end

return VelocityInterface

