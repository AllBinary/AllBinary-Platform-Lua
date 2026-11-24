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
-- package org.allbinary.data.tables.context.module.storefronts

local StoreFrontsEntityInterface = {}
package.loaded["org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityInterface"] = StoreFrontsEntityInterface

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

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
-- class table StoreFrontsEntityInterface is declared before the requires
StoreFrontsEntityInterface.__index = StoreFrontsEntityInterface
StoreFrontsEntityInterface.className = "StoreFrontsEntityInterface"
StoreFrontsEntityInterface.javaClassName = "org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityInterface"
setmetatable(StoreFrontsEntityInterface, {__index = BasicDataTableInterface})
StoreFrontsEntityInterface.java_interfaces = function() return {BasicDataTableInterface} end


-- throws Exception
function StoreFrontsEntityInterface:getStoreFrontInterface(name)
    error("abstract method getStoreFrontInterface")
end


function StoreFrontsEntityInterface:getStoreFrontNames()
    error("abstract method getStoreFrontNames")
end


function StoreFrontsEntityInterface:delete(value)
    error("abstract method delete")
end


function StoreFrontsEntityInterface:insert(values)
    error("abstract method insert")
end


function StoreFrontsEntityInterface:update(updatedValues)
    error("abstract method update")
end

return StoreFrontsEntityInterface

