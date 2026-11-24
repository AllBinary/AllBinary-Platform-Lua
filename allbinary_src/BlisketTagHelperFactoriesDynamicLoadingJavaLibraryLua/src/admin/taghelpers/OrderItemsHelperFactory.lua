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
-- package admin.taghelpers

local OrderItemsHelperFactory = {}
package.loaded["admin.taghelpers.OrderItemsHelperFactory"] = OrderItemsHelperFactory

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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")

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

-- class table OrderItemsHelperFactory is declared before the requires
OrderItemsHelperFactory.__index = OrderItemsHelperFactory
OrderItemsHelperFactory.className = "OrderItemsHelperFactory"
OrderItemsHelperFactory.javaClassName = "admin.taghelpers.OrderItemsHelperFactory"
OrderItemsHelperFactory.java_implements = " TagHelperFactoryInterface "
OrderItemsHelperFactory.java_interfaces = function() return {TagHelperFactoryInterface} end


function OrderItemsHelperFactory._jinit(self)
    return self
end

function OrderItemsHelperFactory.new(...)
    local self = setmetatable({}, OrderItemsHelperFactory)
    OrderItemsHelperFactory._jinit(self, ...)
    return self
end


-- throws LicensingException
function OrderItemsHelperFactory:getInstance(hashMap, pageContext)
        return HelperFactory.getInstance(OrderItemsHelperFactory.FACTORYNAME, OrderItemsHelperFactory.CLASSNAME, hashMap, pageContext)
end

OrderItemsHelperFactory.CLASSNAME = "admin.taghelpers.OrderItemsHelper"
OrderItemsHelperFactory.FACTORYNAME = "OrderItemsHelperFactory"

return OrderItemsHelperFactory

