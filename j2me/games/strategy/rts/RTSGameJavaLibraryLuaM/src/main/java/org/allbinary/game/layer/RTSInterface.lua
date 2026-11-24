-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local RTSInterface = {}
package.loaded["org.allbinary.game.layer.RTSInterface"] = RTSInterface

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
-- class table RTSInterface is declared before the requires
RTSInterface.__index = RTSInterface
RTSInterface.className = "RTSInterface"
RTSInterface.javaClassName = "org.allbinary.game.layer.RTSInterface"


function RTSInterface:isSelfUpgradeable()
    error("abstract method isSelfUpgradeable")
end


function RTSInterface:isCompleted()
    error("abstract method isCompleted")
end


function RTSInterface:getPercentComplete()
    error("abstract method getPercentComplete")
end


function RTSInterface:getLevel()
    error("abstract method getLevel")
end


function RTSInterface:getMaxLevel()
    error("abstract method getMaxLevel")
end


function RTSInterface:getCost()
    error("abstract method getCost")
end


function RTSInterface:downgrade()
    error("abstract method downgrade")
end


function RTSInterface:getDowngradeCost()
    error("abstract method getDowngradeCost")
end


function RTSInterface:isDowngradeable()
    error("abstract method isDowngradeable")
end


function RTSInterface:getUpgradeCost()
    error("abstract method getUpgradeCost")
end


function RTSInterface:isUpgradeable()
    error("abstract method isUpgradeable")
end


function RTSInterface:upgrade()
    error("abstract method upgrade")
end

return RTSInterface

