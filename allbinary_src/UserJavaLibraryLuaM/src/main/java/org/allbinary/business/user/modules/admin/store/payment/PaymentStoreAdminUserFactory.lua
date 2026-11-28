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
-- package org.allbinary.business.user.modules.admin.store.payment

local PaymentStoreAdminUserFactory = {}
package.loaded["org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUserFactory"] = PaymentStoreAdminUserFactory

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

local HashMap = java_lazy("java.util.HashMap")
local UserFactoryInterface = java_lazy("org.allbinary.business.user.UserFactoryInterface")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local PaymentStoreAdminUser = java_lazy("org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUser")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table PaymentStoreAdminUserFactory is declared before the requires
PaymentStoreAdminUserFactory.__index = PaymentStoreAdminUserFactory
PaymentStoreAdminUserFactory.className = "PaymentStoreAdminUserFactory"
PaymentStoreAdminUserFactory.javaClassName = "org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUserFactory"
PaymentStoreAdminUserFactory.java_implements = " UserFactoryInterface "
PaymentStoreAdminUserFactory.java_interfaces = function() return {UserFactoryInterface} end


function PaymentStoreAdminUserFactory._jinit(self)
    return self
end

function PaymentStoreAdminUserFactory.new(...)
    local self = setmetatable({}, PaymentStoreAdminUserFactory)
    PaymentStoreAdminUserFactory._jinit(self, ...)
    return self
end


-- throws Exception
function PaymentStoreAdminUserFactory:getInstance_j0()
        return PaymentStoreAdminUser.new()
end


-- throws Exception
function PaymentStoreAdminUserFactory:getInstance_j1(hashMap)
        return PaymentStoreAdminUser.new(hashMap)
end
function PaymentStoreAdminUserFactory:getInstance(...)
    local count = select("#", ...)
    if count == 0 then return self:getInstance_j0(...) end
    if count == 1 then return self:getInstance_j1(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
PaymentStoreAdminUserFactory.getInstance__jdispatcher = PaymentStoreAdminUserFactory.getInstance

return PaymentStoreAdminUserFactory

