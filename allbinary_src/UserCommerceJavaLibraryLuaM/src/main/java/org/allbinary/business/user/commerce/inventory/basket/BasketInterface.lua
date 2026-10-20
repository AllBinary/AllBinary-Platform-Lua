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
-- package org.allbinary.business.user.commerce.inventory.basket

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")

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
local BasketInterface = {}
BasketInterface.__index = BasketInterface
BasketInterface.className = "BasketInterface"


function BasketInterface:addItem(id, num)
    error("abstract method addItem")
end


function BasketInterface:removeItem(id)
    error("abstract method removeItem")
end


function BasketInterface:adjustItem(id, num)
    error("abstract method adjustItem")
end


function BasketInterface:getTotalWeight()
    error("abstract method getTotalWeight")
end


function BasketInterface:getNumberOfItems()
    error("abstract method getNumberOfItems")
end


function BasketInterface:getIds()
    error("abstract method getIds")
end


function BasketInterface:getItems()
    error("abstract method getItems")
end


function BasketInterface:getNumberOf(product)
    error("abstract method getNumberOf")
end


-- throws MoneyException
function BasketInterface:getSubTotal()
    error("abstract method getSubTotal")
end

return BasketInterface

