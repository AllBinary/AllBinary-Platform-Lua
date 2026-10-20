-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathAnimation = {}
PathAnimation.__index = PathAnimation
PathAnimation.className = "PathAnimation"
setmetatable(PathAnimation, {__index = Animation})

function PathAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.linePathAnimation = nil
    self.pathFindingLayer = nil
    self.allBinaryGameLayerManagerP = AllBinaryGameLayerManager.getNullInstance()
    self.startColor = BasicColorFactory.getInstance().RED
    self.middleColor = BasicColorFactory.getInstance().BLUE
    self.endColor = BasicColorFactory.getInstance().GREEN
end


function PathAnimation.new(pathFindingLayer, linePathAnimation)
    local self = setmetatable(Animation.new(), PathAnimation)
    self:_init_fields()
        self.pathFindingLayer = pathFindingLayer
        self.linePathAnimation = linePathAnimation
    return self
end


-- throws Exception
function PathAnimation:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.allBinaryGameLayerManagerP = allBinaryGameLayerManager
end


-- throws Exception
function PathAnimation:nextFrame()
end


function PathAnimation:paintXY(graphics, x, y)
        local try_ok, try_error = pcall(function()
            local waypointBehaviorBase = self.pathFindingLayer:getWaypointBehavior()
            if waypointBehaviorBase ~= nil then
                local geographicMapCellHistory = waypointBehaviorBase:getCurrentGeographicMapCellHistory()
                local list = geographicMapCellHistory:getTracked()
                local size = list:size()
                if size > 0 then
                    local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
                    local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
                    local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
                    local geographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                    local nextPoint = nil
                    local point = nil
                    local start = size - 2
                    for index = 0, size - 1 - 1 do
                        if index == start then
                            self:setBasicColorP(self.startColor)
                            self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
                        elseif geographicMapCellHistory:isVisited(geographicMapCellPosition) then
                            self:setBasicColorP(self.endColor)
                            self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
                        else
                            self:setBasicColorP(self.middleColor)
                            self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
                        end
                        geographicMapCellPosition = list:get(index)
                        point = geographicMapCellPosition:getMidPoint()
                        geographicMapCellPosition = list:get(index + 1)
                        nextPoint = geographicMapCellPosition:getMidPoint()
                        self.linePathAnimation:paint(graphics, point, nextPoint, tiledLayer)
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF("Cleared Target", self, CanvasStrings.getInstance().PAINT)
        end
end

return PathAnimation

