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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local CircleFilledAnimation = require("org.allbinary.animation.vector.CircleFilledAnimation")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ColorCompositeInterface = require("org.allbinary.graphics.color.ColorCompositeInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionEvent = require("org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEvent")
local GeographicMapCellPositionEventHandler = require("org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventHandler")
local GeographicMapCellPositionEventListenerInterface = require("org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventListenerInterface")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MiniMapLayer = {}
MiniMapLayer.__index = MiniMapLayer
MiniMapLayer.className = "MiniMapLayer"
setmetatable(MiniMapLayer, {__index = AllBinaryLayer})

function MiniMapLayer:_init_fields()
    self.allBinaryTiledLayer = nil
    self.geographicMapCellPositionFactory = nil
    self.list = nil
    self.basicColorList = nil
    self.positionList = nil
    self.animationInterface = nil
end


function MiniMapLayer.new(geographicMapInterface, viewPosition)
    local self = setmetatable(AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, Rectangle.new(PointFactory.getInstance():createXY(0, viewPosition:getY()), geographicMapInterface:getAllBinaryTiledLayer():getWidth(), geographicMapInterface:getAllBinaryTiledLayer():getHeight()), viewPosition), MiniMapLayer)
    self:_init_fields()
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


-- throws Exception
function MiniMapLayer:init()
        self.allBinaryTiledLayer:setPosition(self.x, self.y, self.z)
end


function MiniMapLayer:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


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


function MiniMapLayer:paint(graphics)
        self.allBinaryTiledLayer:paint(graphics)
        self:paintDots(graphics)
end

return MiniMapLayer

