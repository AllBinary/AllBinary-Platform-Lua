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

local BasketReview = {}
package.loaded["org.allbinary.business.user.commerce.inventory.basket.BasketReview"] = BasketReview

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

local HashSet = java_lazy("java.util.HashSet")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Item = java_lazy("org.allbinary.business.user.commerce.inventory.item.Item")
local ItemView = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemView")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")

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

-- class table BasketReview is declared before the requires
BasketReview.__index = BasketReview
BasketReview.className = "BasketReview"
BasketReview.javaClassName = "org.allbinary.business.user.commerce.inventory.basket.BasketReview"

function BasketReview:_init_fields()
    self.items = BasicArrayListD.new()
end


function BasketReview._jinit(self)
    BasketReview._init_fields(self)
    return self
end

function BasketReview.new(...)
    local self = setmetatable({}, BasketReview)
    BasketReview._jinit(self, ...)
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

