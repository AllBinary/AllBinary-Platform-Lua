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

local Item = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.Item"] = Item

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
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local ShippingAddressData = java_lazy("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = java_lazy("org.allbinary.business.user.address.StreetAddressData")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local MoneyException = java_lazy("org.allbinary.business.user.commerce.money.MoneyException")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicItem = require("org.allbinary.business.user.commerce.inventory.item.BasicItem")
local OrderItemInterface = require("org.allbinary.business.user.commerce.inventory.item.OrderItemInterface")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table Item is declared before the requires
Item.__index = Item
Item.className = "Item"
Item.javaClassName = "org.allbinary.business.user.commerce.inventory.item.Item"
setmetatable(Item, {__index = BasicItem})
Item.java_implements = " OrderItemInterface "
Item.java_interfaces = function() return {OrderItemInterface} end

function Item:_init_fields()
    if self.group == nil then self.group = nil end
    if self.tax == nil then self.tax = nil end
    if self.shippingType == nil then self.shippingType = nil end
    if self.shippingCost == nil then self.shippingCost = nil end
    if self.shippedDate == nil then self.shippedDate = nil end
    if self.shippingAddress == nil then self.shippingAddress = nil end
    if self.special == nil then self.special = nil end
end

function Item._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Item._new1(self, ...)
    elseif count == 0 then return Item._new0(self, ...)
    end
    error("No constructor of Item takes " .. count .. " arguments")
end

function Item.new(...)
    local self = setmetatable({}, Item)
    Item._jinit(self, ...)
    return self
end


function Item._new1(self, itemHashMap)
    java_super_init(BasicItem, self, itemHashMap)
    Item._init_fields(self)
        -- super(...) made self above
        self:setData(itemHashMap)
    return self
end


function Item._new0(self)
    java_super_init(BasicItem, self)
    Item._init_fields(self)
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
java_overload(Item, "setData", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function Item:setGroup(value)
        self.group = value
end
java_overload(Item, "setGroup", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function Item:setTax(value)
        self.tax = value
end
java_overload(Item, "setTax", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function Item:setShippingType(value)
        self.shippingType = value
end
java_overload(Item, "setShippingType", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function Item:setShippingCost(value)
        self.shippingCost = value
end
java_overload(Item, "setShippingCost", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function Item:setShippingAddress(value)
        self.shippingAddress = value
end
java_overload(Item, "setShippingAddress", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StreetAddress")) end)


function Item:setSpecial(value)
        self.special = value
end
java_overload(Item, "setSpecial", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function Item:getGroup()
        return self.group
end
java_overload(Item, "getGroup", 0)


function Item:getTax()
        return self.tax
end
java_overload(Item, "getTax", 0)


function Item:getShippingType()
        return self.shippingType
end
java_overload(Item, "getShippingType", 0)


function Item:getShippingCost()
        return self.shippingCost
end
java_overload(Item, "getShippingCost", 0)


function Item:getShippingAddress()
        return self.shippingAddress
end
java_overload(Item, "getShippingAddress", 0)


function Item:getSpecial()
        return self.special
end
java_overload(Item, "getSpecial", 0)


function Item:toHashMap()
        local hashMap = java_super(BasicItem, "toHashMap", 0)(self)
        hashMap:put(ShippingMethodData.GROUP, self.group)
        hashMap:put(OrderHistoryData.TAX, self.tax)
        hashMap:put(ShippingMethodData.NAME, self.shippingType)
        hashMap:put(ShippingMethodData.COST, self.shippingCost)
        hashMap:put(OrderHistoryData.SHIPPEDDATE, self.shippedDate)
        hashMap:put(EntryData.getInstance().SPECIAL, self.special)
        return hashMap
end
java_overload(Item, "toHashMap", 0)

return Item

