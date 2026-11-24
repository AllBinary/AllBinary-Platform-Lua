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
-- package org.allbinary.logic.communication.http.request.session

local WeblisketSessionInterface = {}
package.loaded["org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface"] = WeblisketSessionInterface

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

local OrderInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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
-- class table WeblisketSessionInterface is declared before the requires
WeblisketSessionInterface.__index = WeblisketSessionInterface
WeblisketSessionInterface.className = "WeblisketSessionInterface"
WeblisketSessionInterface.javaClassName = "org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface"


function WeblisketSessionInterface:clear()
    error("abstract method clear")
end


function WeblisketSessionInterface:getAttempts()
    error("abstract method getAttempts")
end


function WeblisketSessionInterface:getAuthentication()
    error("abstract method getAuthentication")
end


function WeblisketSessionInterface:getCreationTime()
    error("abstract method getCreationTime")
end


function WeblisketSessionInterface:getId()
    error("abstract method getId")
end


function WeblisketSessionInterface:getLastAccessedTime()
    error("abstract method getLastAccessedTime")
end


-- throws Exception
function WeblisketSessionInterface:getOrder()
    error("abstract method getOrder")
end


function WeblisketSessionInterface:getPassword()
    error("abstract method getPassword")
end


function WeblisketSessionInterface:getPaymentMethod()
    error("abstract method getPaymentMethod")
end


-- throws Exception
function WeblisketSessionInterface:getRole()
    error("abstract method getRole")
end


function WeblisketSessionInterface:getStoreName()
    error("abstract method getStoreName")
end


function WeblisketSessionInterface:getTimeout()
    error("abstract method getTimeout")
end


function WeblisketSessionInterface:getUserName()
    error("abstract method getUserName")
end


function WeblisketSessionInterface:getWebAppPath()
    error("abstract method getWebAppPath")
end


function WeblisketSessionInterface:removeBasket()
    error("abstract method removeBasket")
end


function WeblisketSessionInterface:setAttempts(value)
    error("abstract method setAttempts")
end


function WeblisketSessionInterface:setAuthenticated_j0()
    error("abstract method setAuthenticated")
end


function WeblisketSessionInterface:setAuthenticated_j1(value)
    error("abstract method setAuthenticated")
end
function WeblisketSessionInterface:setAuthenticated(...)
    local count = select("#", ...)
    if count == 0 then return self:setAuthenticated_j0(...) end
    if count == 1 then return self:setAuthenticated_j1(...) end
    error("No method setAuthenticated takes " .. count .. " arguments")
end
WeblisketSessionInterface.setAuthenticated__jdispatcher = WeblisketSessionInterface.setAuthenticated


function WeblisketSessionInterface:setPassword(password)
    error("abstract method setPassword")
end


function WeblisketSessionInterface:setPaymentMethod(value)
    error("abstract method setPaymentMethod")
end


function WeblisketSessionInterface:setRole(aRole)
    error("abstract method setRole")
end


function WeblisketSessionInterface:setStoreName(value)
    error("abstract method setStoreName")
end


function WeblisketSessionInterface:setTimeout(value)
    error("abstract method setTimeout")
end


function WeblisketSessionInterface:setUserName(userName)
    error("abstract method setUserName")
end

return WeblisketSessionInterface

