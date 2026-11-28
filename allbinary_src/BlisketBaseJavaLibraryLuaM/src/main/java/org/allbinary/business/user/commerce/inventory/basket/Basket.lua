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

local Basket = {}
package.loaded["org.allbinary.business.user.commerce.inventory.basket.Basket"] = Basket

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

local Serializable = java_lazy("java.io.Serializable")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local MoneyException = java_lazy("org.allbinary.business.user.commerce.money.MoneyException")
local InventoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")

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

-- class table Basket is declared before the requires
Basket.__index = Basket
Basket.className = "Basket"
Basket.javaClassName = "org.allbinary.business.user.commerce.inventory.basket.Basket"
Basket.java_implements = " BasketInterface Serializable "
Basket.java_interfaces = function() return {BasketInterface, Serializable} end

function Basket:_init_fields()
    self.items = StdUtil.getInstance():createHashMap()
end


function Basket._jinit(self)
    Basket._init_fields(self)
    return self
end

function Basket.new(...)
    local self = setmetatable({}, Basket)
    Basket._jinit(self, ...)
    return self
end


function Basket:addItem(id, num)
        if self.items:containsKey(id) then
            local oldNumStr = tostring(self.items:get(id))
            local oldNumInt = tostring(oldNumStr)
            local numInt = tostring(num)
            local newNumInt = require("allbinary_java").number_value(oldNumInt, "intValue") + require("allbinary_java").number_value(numInt, "intValue")
            self.items:put(id, tostring(newNumInt))
        else
            self.items:put(id, num)
        end
end


function Basket:removeItem(id)
        self.items:remove(id)
end


function Basket:adjustItem(id, num)
        if require("allbinary_java").number_value(tostring(num), "intValue") > 0 then
            self.items:put(id, num)
        else
            self.items:remove(id)
        end
end


function Basket:getTotalWeight()
        local itemsAndNumberInBasket = self:getItems()
        local totalWeight = Money.new()
        if itemsAndNumberInBasket:size() > 0 then
            local items = itemsAndNumberInBasket:keySet()
            local product = nil
            local weightFloat = nil
            local itemArray = items:toArray()
            local size = (itemArray.n or #itemArray)
            for index = 0, size - 1 do
                product = tostring(itemArray[index + 1])
                weightFloat = InventoryEntity.new():getWeight(product)
                weightFloat = (self:getNumberOf(product) + 0.0) * (weightFloat + 0.0)
                totalWeight:add(tostring(weightFloat))
            end
        end
        return tostring(totalWeight)
end


function Basket:getNumberOfItems()
        return self.items:size()
end


function Basket:getIds()
        local set = self.items:keySet()
        return set
end


function Basket:getItems()
        return self.items
end


function Basket:getNumberOf(product)
        local numStr = self.items:get(product)
        return tostring(numStr)
end


-- throws MoneyException
function Basket:getSubTotal()
        local itemsAndNumberInBasket = self:getItems()
        local subTotal = Money.new()
        if itemsAndNumberInBasket:size() > 0 then
            local items = itemsAndNumberInBasket:keySet()
            local inventoryEntityFactory = InventoryEntityFactory.getInstance()
            local inventoryEntity = inventoryEntityFactory:getInventoryEntityInstance()
            local itemArray = items:toArray()
            local size = (itemArray.n or #itemArray)
            for index = 0, size - 1 do
                local product = tostring(itemArray[index + 1])
                local itemInterface = inventoryEntity:getItem(product)
                local productTotal = itemInterface:getPrice()
                productTotal:multiply(require("allbinary_java").number_value(self:getNumberOf(product), "intValue"))
                subTotal:add(tostring(productTotal))
            end
        end
        return subTotal
end

return Basket

