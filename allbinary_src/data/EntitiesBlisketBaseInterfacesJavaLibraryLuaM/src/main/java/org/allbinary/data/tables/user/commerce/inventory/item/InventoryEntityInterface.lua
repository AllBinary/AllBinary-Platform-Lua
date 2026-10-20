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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local InventoryEntityInterface = {}
InventoryEntityInterface.__index = InventoryEntityInterface
InventoryEntityInterface.className = "InventoryEntityInterface"
setmetatable(InventoryEntityInterface, {__index = BasicDataTableInterface})


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

