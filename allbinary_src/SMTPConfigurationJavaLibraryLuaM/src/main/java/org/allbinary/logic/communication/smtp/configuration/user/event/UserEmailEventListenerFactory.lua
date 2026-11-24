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
-- package org.allbinary.logic.communication.smtp.configuration.user.event

local UserEmailEventListenerFactory = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventListenerFactory"] = UserEmailEventListenerFactory

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

local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local UserEmailEventListenerInterface = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local UserEmailEventConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table UserEmailEventListenerFactory is declared before the requires
UserEmailEventListenerFactory.__index = UserEmailEventListenerFactory
UserEmailEventListenerFactory.className = "UserEmailEventListenerFactory"
UserEmailEventListenerFactory.javaClassName = "org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventListenerFactory"


function UserEmailEventListenerFactory._jinit(self)
    return self
end

function UserEmailEventListenerFactory.new(...)
    local self = setmetatable({}, UserEmailEventListenerFactory)
    UserEmailEventListenerFactory._jinit(self, ...)
    return self
end


-- throws Exception
function UserEmailEventListenerFactory.getInstance(abeClientInformation, userEmailEventConfigurationInterface, userInterface)
        local params = java_new_array(nil, 1)
        local classes = java_new_array(nil, 1)
        classes[1] = UserInterface
        params[1] = userInterface
        return AbeFactory.getInstance():getInstance(abeClientInformation, userEmailEventConfigurationInterface:getEventListenerClassPath(), classes, params)
end

return UserEmailEventListenerFactory

