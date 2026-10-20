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

-- local HashSet = require("java.util.HashSet")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Item = require("org.allbinary.business.user.commerce.inventory.item.Item")
local ItemView = require("org.allbinary.business.user.commerce.inventory.item.ItemView")
local StdUtil = require("org.allbinary.logic.StdUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasketReview = {}
BasketReview.__index = BasketReview
BasketReview.className = "BasketReview"

function BasketReview:_init_fields()
    self.items = BasicArrayListD.new()
end


function BasketReview.new()
    local self = setmetatable({}, BasketReview)
    self:_init_fields()
    return self
end


function BasketReview:isValid()
        return true
end


function BasketReview:addItem(item)
        self.items:add(item)
end


function BasketReview:getItems()
        return self.items
end


function BasketReview:removeItem(id)
        local itemArray = self.items:toArray()
        local size = (itemArray.n or #itemArray)
        for index = 0, size - 1 do
            local item = itemArray[index + 1]
            if item:getId():compareTo(id) == 0 then
                self.items:remove(item)
            end
        end
end


function BasketReview:adjustItem(id, num)
        local itemArray = self.items:toArray()
        local size = (itemArray.n or #itemArray)
        for index = 0, size - 1 do
            local item = itemArray[index + 1]
            if item:getId():compareTo(id) == 0 then
                item:setNumber(num)
            end
        end
end


function BasketReview:getTotalWeight()
        local weightFloat = 0.0
        local itemArray = self.items:toArray()
        local size = (itemArray.n or #itemArray)
        for index = 0, size - 1 do
            local item = itemArray[index + 1]
            weightFloat = weightFloat + ((item:getWeight() + 0.0))
        end
        return tostring(weightFloat)
end


function BasketReview:getNumberOfItems()
        return self.items:size()
end


function BasketReview:getIds()
        local idSet = HashSet.new()
        local itemArray = self.items:toArray()
        local size = (itemArray.n or #itemArray)
        for index = 0, size - 1 do
            local item = itemArray[index + 1]
            idSet:add(item:getId())
        end
        return idSet
end


function BasketReview:getNumberOf(id)
        local itemArray = self.items:toArray()
        local size = (itemArray.n or #itemArray)
        for index = 0, size - 1 do
            local item = itemArray[index + 1]
            if item:getId():compareTo(id) == 0 then
                return item:getNumber()
            end
        end
        return 0
end


-- throws Exception
function BasketReview:toXmlNode(document)
        local node = document:createElement(BasketData.BASKET)
        local itemArray = self.items:toArray()
        local size = (itemArray.n or #itemArray)
        for index = 0, size - 1 do
            local item = itemArray[index + 1]
            node:appendChild(ItemView.new(item, BasicArrayListD.new()):toXmlNode(document))
        end
        return node
end

return BasketReview

