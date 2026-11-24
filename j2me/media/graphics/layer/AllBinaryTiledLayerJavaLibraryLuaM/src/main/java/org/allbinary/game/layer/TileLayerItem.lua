-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer

local TileLayerItem = {}
package.loaded["org.allbinary.game.layer.TileLayerItem"] = TileLayerItem

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Screen = require("javax.microedition.lcdui.Screen")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local ABCustomItemInterface = java_lazy("org.allbinary.graphics.form.item.ABCustomItemInterface")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table TileLayerItem is declared before the requires
TileLayerItem.__index = TileLayerItem
TileLayerItem.className = "TileLayerItem"
TileLayerItem.javaClassName = "org.allbinary.game.layer.TileLayerItem"
setmetatable(TileLayerItem, {__index = ABCustomItem})
TileLayerItem.java_implements = " ABCustomItemInterface "
TileLayerItem.java_interfaces = function() return {ABCustomItemInterface} end

function TileLayerItem:_init_fields()
    if self.tiledLayer == nil then self.tiledLayer = nil end
end


function TileLayerItem._jinit(self, label, tiledLayer, layout, altText, backgroundBasicColor, foregroundBasicColor)
    java_super_init(ABCustomItem, self, label, backgroundBasicColor, foregroundBasicColor)
    TileLayerItem._init_fields(self)
        -- super(...) made self above
        self.tiledLayer = tiledLayer
    return self
end

function TileLayerItem.new(...)
    local self = setmetatable({}, TileLayerItem)
    TileLayerItem._jinit(self, ...)
    return self
end


function TileLayerItem:setOwner(owner)
end
java_overload(TileLayerItem, "setOwner", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Screen")) end)


function TileLayerItem:getMinimumWidth()
        return self.tiledLayer:getWidth()
end
java_overload(TileLayerItem, "getMinimumWidth", 0)


function TileLayerItem:getMinimumHeight()
        return self.tiledLayer:getHeight()
end
java_overload(TileLayerItem, "getMinimumHeight", 0)


function TileLayerItem:getMinContentHeight()
        return self.tiledLayer:getHeight()
end
java_overload(TileLayerItem, "getMinContentHeight", 0)


function TileLayerItem:getMinContentWidth()
        return self.tiledLayer:getWidth()
end
java_overload(TileLayerItem, "getMinContentWidth", 0)


function TileLayerItem:getPrefContentHeight(width)
        return self.tiledLayer:getHeight()
end
java_overload(TileLayerItem, "getPrefContentHeight", 1, function(java_a1) return true and type(java_a1) == "number" end)


function TileLayerItem:getPrefContentWidth(height)
        return self.tiledLayer:getWidth()
end
java_overload(TileLayerItem, "getPrefContentWidth", 1, function(java_a1) return true and type(java_a1) == "number" end)


function TileLayerItem:paintXY(graphics, x, y)
        self.tiledLayer:setPosition(x, y, self.tiledLayer:getZP())
        self.tiledLayer:paint(graphics)
end
java_overload(TileLayerItem, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function TileLayerItem:paintUnselected(graphics, x, y)
end
java_overload(TileLayerItem, "paintUnselected", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function TileLayerItem:getLabel()
        return java_super(ABCustomItem, "getLabel", 0)(self)
end
java_overload(TileLayerItem, "getLabel", 0)

return TileLayerItem

