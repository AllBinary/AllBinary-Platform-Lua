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
-- package org.allbinary.data.tables.user.commerce.inventory.item

local InventoryEntityInterface = {}
package.loaded["org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface"] = InventoryEntityInterface

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
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local MoneyException = java_lazy("org.allbinary.business.user.commerce.money.MoneyException")
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
-- class table InventoryEntityInterface is declared before the requires
InventoryEntityInterface.__index = InventoryEntityInterface
InventoryEntityInterface.className = "InventoryEntityInterface"
InventoryEntityInterface.javaClassName = "org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface"
setmetatable(InventoryEntityInterface, {__index = BasicDataTableInterface})
InventoryEntityInterface.java_interfaces = function() return {BasicDataTableInterface} end


-- throws MoneyException
function InventoryEntityInterface:getItem(id)
    error("abstract method getItem")
end


-- throws Exception
function InventoryEntityInterface:getItems(storeFrontInterface)
    error("abstract method getItems")
end


function InventoryEntityInterface:getWeight(id)
    error("abstract method getWeight")
end


function InventoryEntityInterface:deleteWhere(key, value)
    error("abstract method deleteWhere")
end


function InventoryEntityInterface:insert(values)
    error("abstract method insert")
end


function InventoryEntityInterface:update(updatedValues)
    error("abstract method update")
end

return InventoryEntityInterface

