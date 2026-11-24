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
-- package org.allbinary.business.user.modules.configuration

local UserConfigurationInterface = {}
package.loaded["org.allbinary.business.user.modules.configuration.UserConfigurationInterface"] = UserConfigurationInterface

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

local TimeCreated = java_lazy("org.allbinary.business.time.created.TimeCreated")
local TimeLastModified = java_lazy("org.allbinary.business.time.modified.TimeLastModified")
local UserEmailConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")

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
-- class table UserConfigurationInterface is declared before the requires
UserConfigurationInterface.__index = UserConfigurationInterface
UserConfigurationInterface.className = "UserConfigurationInterface"
UserConfigurationInterface.javaClassName = "org.allbinary.business.user.modules.configuration.UserConfigurationInterface"


function UserConfigurationInterface:getUserEmailConfigurationInterface()
    error("abstract method getUserEmailConfigurationInterface")
end


function UserConfigurationInterface:setUserEmailConfigurationInterface(userEmailConfigurationInterface)
    error("abstract method setUserEmailConfigurationInterface")
end


function UserConfigurationInterface:getTimeCreated()
    error("abstract method getTimeCreated")
end


function UserConfigurationInterface:getTimeLastModified()
    error("abstract method getTimeLastModified")
end


function UserConfigurationInterface:setTimeCreated(timeCreated)
    error("abstract method setTimeCreated")
end


function UserConfigurationInterface:setTimeLastModified(timeLastModified)
    error("abstract method setTimeLastModified")
end

return UserConfigurationInterface

