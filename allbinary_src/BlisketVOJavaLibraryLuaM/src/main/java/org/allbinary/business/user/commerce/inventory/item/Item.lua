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
-- package org.allbinary.business.user.commerce.inventory.item

-- local HashMap = require("java.util.HashMap")
local EntryData = require("org.allbinary.business.entry.EntryData")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicItem = require("org.allbinary.business.user.commerce.inventory.item.BasicItem")
local OrderItemInterface = require("org.allbinary.business.user.commerce.inventory.item.OrderItemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Item = {}
Item.__index = Item
Item.className = "Item"
setmetatable(Item, {__index = BasicItem})

function Item:_init_fields()
    self.group = nil
    self.tax = nil
    self.shippingType = nil
    self.shippingCost = nil
    self.shippedDate = nil
    self.shippingAddress = nil
    self.special = nil
end

function Item.new(...)
    local count = select("#", ...)
    if count == 1 then return Item._new1(...)
    elseif count == 0 then return Item._new0(...)
    end
end


function Item._new1(itemHashMap)
    local self = setmetatable(BasicItem.new(itemHashMap), Item)
    self:_init_fields()
        -- super(...) made self above
        self:setData(itemHashMap)
    return self
end


function Item._new0()
    local self = setmetatable(BasicItem.new(), Item)
    self:_init_fields()
        local EMPTY = StringUtil.getInstance().EMPTY_STRING
        self.group = EMPTY
        self.tax = EMPTY
        self.shippingType = EMPTY
        self.shippingCost = EMPTY
        self.shippingAddress = StreetAddress.new()
    return self
end


function Item:setData(itemHashMap)
        self.group = itemHashMap:get(ShippingMethodData.GROUP)
        self.tax = itemHashMap:get(OrderHistoryData.TAX)
        self.shippingType = itemHashMap:get(ShippingMethodData.NAME)
        self.shippingCost = itemHashMap:get(ShippingMethodData.COST)
        self.shippedDate = itemHashMap:get(OrderHistoryData.SHIPPEDDATE)
        itemHashMap:put(StreetAddressData.NAME, itemHashMap:get(ShippingAddressData.NAME))
        itemHashMap:put(StreetAddressData.STREET, itemHashMap:get(ShippingAddressData.STREET))
        itemHashMap:put(StreetAddressData.CITY, itemHashMap:get(ShippingAddressData.CITY))
        itemHashMap:put(StreetAddressData.STATE, itemHashMap:get(ShippingAddressData.STATE))
        itemHashMap:put(StreetAddressData.CODE, itemHashMap:get(ShippingAddressData.CODE))
        itemHashMap:put(StreetAddressData.COUNTRY, itemHashMap:get(ShippingAddressData.COUNTRY))
        self.shippingAddress = StreetAddress.new(itemHashMap)
end


function Item:setGroup(value)
        self.group = value
end


function Item:setTax(value)
        self.tax = value
end


function Item:setShippingType(value)
        self.shippingType = value
end


function Item:setShippingCost(value)
        self.shippingCost = value
end


function Item:setShippingAddress(value)
        self.shippingAddress = value
end


function Item:setSpecial(value)
        self.special = value
end


function Item:getGroup()
        return self.group
end


function Item:getTax()
        return self.tax
end


function Item:getShippingType()
        return self.shippingType
end


function Item:getShippingCost()
        return self.shippingCost
end


function Item:getShippingAddress()
        return self.shippingAddress
end


function Item:getSpecial()
        return self.special
end


function Item:toHashMap()
        local hashMap = BasicItem.toHashMap(self)
        hashMap:put(ShippingMethodData.GROUP, self.group)
        hashMap:put(OrderHistoryData.TAX, self.tax)
        hashMap:put(ShippingMethodData.NAME, self.shippingType)
        hashMap:put(ShippingMethodData.COST, self.shippingCost)
        hashMap:put(OrderHistoryData.SHIPPEDDATE, self.shippedDate)
        hashMap:put(EntryData.getInstance().SPECIAL, self.special)
        return hashMap
end

return Item

