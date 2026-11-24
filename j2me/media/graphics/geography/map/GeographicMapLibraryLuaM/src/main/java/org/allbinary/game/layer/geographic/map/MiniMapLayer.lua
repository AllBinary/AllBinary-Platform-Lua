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
-- package org.allbinary.game.layer.geographic.map

local MiniMapLayer = {}
package.loaded["org.allbinary.game.layer.geographic.map.MiniMapLayer"] = MiniMapLayer

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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local CircleFilledAnimation = java_lazy("org.allbinary.animation.vector.CircleFilledAnimation")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local ColorCompositeInterface = java_lazy("org.allbinary.graphics.color.ColorCompositeInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionEvent = java_lazy("org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEvent")
local GeographicMapCellPositionEventHandler = java_lazy("org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventHandler")
local GeographicMapCellPositionEventListenerInterface = java_lazy("org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventListenerInterface")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")

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

-- class table MiniMapLayer is declared before the requires
MiniMapLayer.__index = MiniMapLayer
MiniMapLayer.className = "MiniMapLayer"
MiniMapLayer.javaClassName = "org.allbinary.game.layer.geographic.map.MiniMapLayer"
setmetatable(MiniMapLayer, {__index = AllBinaryLayer})
MiniMapLayer.java_implements = " GeographicMapCellPositionEventListenerInterface "
MiniMapLayer.java_interfaces = function() return {GeographicMapCellPositionEventListenerInterface} end

function MiniMapLayer:_init_fields()
    if self.allBinaryTiledLayer == nil then self.allBinaryTiledLayer = nil end
    if self.geographicMapCellPositionFactory == nil then self.geographicMapCellPositionFactory = nil end
    if self.list == nil then self.list = nil end
    if self.basicColorList == nil then self.basicColorList = nil end
    if self.positionList == nil then self.positionList = nil end
    if self.animationInterface == nil then self.animationInterface = nil end
end


function MiniMapLayer._jinit(self, geographicMapInterface, viewPosition)
    java_super_init(AllBinaryLayer, self, StringUtil.getInstance().EMPTY_STRING, Rectangle.new(PointFactory.getInstance():createXY(0, viewPosition:getY()), geographicMapInterface:getAllBinaryTiledLayer():getWidth(), geographicMapInterface:getAllBinaryTiledLayer():getHeight()), viewPosition)
    MiniMapLayer._init_fields(self)
        -- super(...) made self above
        self.allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        self.geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        self.animationInterface = CircleFilledAnimation.new(self.allBinaryTiledLayer:getCellWidth(), self.allBinaryTiledLayer:getCellHeight(), BasicColorFactory.getInstance().WHITE)
        self.list = BasicArrayListD.new()
        self.basicColorList = BasicArrayListD.new()
        self.positionList = BasicArrayListD.new()
        GeographicMapCellPositionEventHandler.getInstance():addListener(self)
        self:init()
    return self
end

function MiniMapLayer.new(...)
    local self = setmetatable({}, MiniMapLayer)
    MiniMapLayer._jinit(self, ...)
    return self
end


-- throws Exception
function MiniMapLayer:init()
        self.allBinaryTiledLayer:setPosition(self.x, self.y, self.z)
end
java_overload(MiniMapLayer, "init", 0)


function MiniMapLayer:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(MiniMapLayer, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


-- throws Exception
function MiniMapLayer:onRemoveGeographicMapCellPositionEvent(geographicMapCellPositionEvent)
        local colorCompositeInterface = geographicMapCellPositionEvent:getSource()
        local index = self.list:indexOf(colorCompositeInterface)
        if index >= 0 then
            self.list:removeAt(index)
            self.basicColorList:removeAt(index)
            self.positionList:removeAt(index)
        end
end
java_overload(MiniMapLayer, "onRemoveGeographicMapCellPositionEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPositionEvent")) end)


-- throws Exception
function MiniMapLayer:onGeographicMapCellPositionEvent(geographicMapCellPositionEvent)
        local colorCompositeInterface = geographicMapCellPositionEvent:getSource()
        local layerIndex = -1
        local size = self.list:size()
        local nextColorCompositeInterface = nil
        for index = 0, size - 1 do
            nextColorCompositeInterface = self.list:get(index)
            if nextColorCompositeInterface == colorCompositeInterface then
                layerIndex = index
                break
            end
        end
        local geographicMapCellPosition = self.geographicMapCellPositionFactory:getInstance(geographicMapCellPositionEvent:getGeographicMapCellPosition())
        local point = geographicMapCellPosition:getPoint()
        if layerIndex == -1 then
            self.list:add(colorCompositeInterface)
            local basicColor = colorCompositeInterface:getBasicColorP()
            self.basicColorList:add(basicColor)
            self.positionList:add(point)
            layerIndex = self.basicColorList:size() - 1
        else
            self.positionList:set(layerIndex, point)
        end
end
java_overload(MiniMapLayer, "onGeographicMapCellPositionEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPositionEvent")) end)


function MiniMapLayer:paintDots(graphics)
        local localPositionList = self.positionList
        local localBasicColorList = self.basicColorList
        local length = localPositionList:size()
        local point = nil
        local basicColor = nil
        do
            local index = length
            while (function() index = index - 1 return index end)() >= 0 do
            point = localPositionList:get(index)
            basicColor = localBasicColorList:get(index)
            graphics:setColor(math.tointeger(basicColor // 1))
            self.animationInterface:setBasicColorP(basicColor)
            self.animationInterface:paintXY(graphics, point:getX() + self.x, point:getY() + self.y)
            end
        end
end
java_overload(MiniMapLayer, "paintDots", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function MiniMapLayer:paint(graphics)
        self.allBinaryTiledLayer:paint(graphics)
        self:paintDots(graphics)
end
java_overload(MiniMapLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return MiniMapLayer

