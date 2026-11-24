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
-- package org.allbinary.data.tables.user.address.billing

local BillingAddressesEntityFactory = {}
package.loaded["org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory"] = BillingAddressesEntityFactory

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

local StreetAddressesEntity = java_lazy("org.allbinary.data.tables.user.address.StreetAddressesEntity")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local BillingAddressesEntity = java_lazy("org.allbinary.data.tables.user.address.billing.BillingAddressesEntity")

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

-- class table BillingAddressesEntityFactory is declared before the requires
BillingAddressesEntityFactory.__index = BillingAddressesEntityFactory
BillingAddressesEntityFactory.className = "BillingAddressesEntityFactory"
BillingAddressesEntityFactory.javaClassName = "org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory"

function BillingAddressesEntityFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function BillingAddressesEntityFactory.getInstance()
        return BillingAddressesEntityFactory.instance_f
end


function BillingAddressesEntityFactory._jinit(self)
    BillingAddressesEntityFactory._init_fields(self)
    return self
end

function BillingAddressesEntityFactory.new(...)
    local self = setmetatable({}, BillingAddressesEntityFactory)
    BillingAddressesEntityFactory._jinit(self, ...)
    return self
end


function BillingAddressesEntityFactory:getInstance(userName)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", BillingAddressesEntity.new(userName) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

BillingAddressesEntityFactory.instance_f = BillingAddressesEntityFactory.new()

return BillingAddressesEntityFactory

