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
-- package org.allbinary.game.layer.unit

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local SteeringVisitor = require("org.allbinary.game.layer.SteeringVisitor")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableRTSBehavior = require("org.allbinary.game.layer.CollidableRTSBehavior")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local TiledLayerUtil = require("org.allbinary.game.layer.TiledLayerUtil")
local LayerPartialCellPositionsUtil = require("org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableUnitBehavior = {}
CollidableUnitBehavior.__index = CollidableUnitBehavior
CollidableUnitBehavior.className = "CollidableUnitBehavior"
setmetatable(CollidableUnitBehavior, {__index = CollidableRTSBehavior})
local SimpleSteeringVisitor = {}
    SimpleSteeringVisitor.__index = SimpleSteeringVisitor
    SimpleSteeringVisitor.className = "SimpleSteeringVisitor"
    setmetatable(SimpleSteeringVisitor, {__index = SteeringVisitor})
    CollidableUnitBehavior.SimpleSteeringVisitor = SimpleSteeringVisitor

    function SimpleSteeringVisitor.new()
        local self = setmetatable(SteeringVisitor.new(), SimpleSteeringVisitor)
        return self
    end
    

    function CollidableUnitBehavior:visit(anyType)
            local logUtil = LogUtil.getInstance()
            local try_ok, try_error = pcall(function()
                local ownerLayer = anyType
                if self:getList():size() > 0 then
                    local allbinaryLayer = self:getList():get(0)
                    local clear = self:steer(ownerLayer, allbinaryLayer)
                    if clear then
                        self:getList():clear()
                        return NullUtil.getInstance().NULL_OBJECT
                    end
                    return BooleanFactory.getInstance().TRUE
                end
                return NullUtil.getInstance().NULL_OBJECT
            end)
            if not try_ok then
                local e = try_error
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, "visit", e)
                return NullUtil.getInstance().NULL_OBJECT
            end
    end


function CollidableUnitBehavior:_init_fields()
    self.layerPartialCellPositionsUtil = LayerPartialCellPositionsUtil.getInstance()
    self.simpleSteeringVisitor = SimpleSteeringVisitor.new()
end


function CollidableUnitBehavior.new(collidable)
    local self = setmetatable(CollidableRTSBehavior.new(collidable), CollidableUnitBehavior)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function CollidableUnitBehavior:collideNone(ownerLayer, collidableInterfaceCompositeInterface)
        self:chase(ownerLayer, collidableInterfaceCompositeInterface)
        local rtsLayer = collidableInterfaceCompositeInterface
        if rtsLayer:getType() == UnitLayer.getStaticType() then
            self:collideUnit(ownerLayer, rtsLayer)
        end
end


-- throws Exception
function CollidableUnitBehavior:steer(ownerLayer, collidableInterfaceCompositeInterface)
        local ownerUnitLayer = ownerLayer
        local unitLayer = collidableInterfaceCompositeInterface
        local angleInfo2 = unitLayer:getRotationAnimationInterface():getAngleInfoP()
        local angleInfo = ownerUnitLayer:getRotationAnimationInterface():getAngleInfoP()
        local angle = angleInfo:getAngle() - angleInfo2:getAngle()
        if angle < 90 or angle > 270 then
            return true
        elseif angle >= 90 or angle <= 270 then
            ownerUnitLayer:getGameKeyEventList():add(GameKeyEventFactory.getInstance():getInstanceForKey(ownerUnitLayer, Canvas.RIGHT))
            return false
        end
        error(java_exception("Exception", "Error"), 0)
end


-- throws Exception
function CollidableUnitBehavior:chase(ownerLayer, collidableInterfaceCompositeInterface)
        local rtsLayer = collidableInterfaceCompositeInterface
        if rtsLayer:getType() == UnitLayer.getStaticType() then
            if not self.simpleSteeringVisitor:getList():contains(collidableInterfaceCompositeInterface) then
                self.simpleSteeringVisitor:getList():add(collidableInterfaceCompositeInterface)
            end
            local ownerUnitLayer = ownerLayer
            local list = ownerUnitLayer:getUnitWaypointBehavior():getSteeringVisitorList()
            if not list:contains(self.simpleSteeringVisitor) then
                list:add(self.simpleSteeringVisitor)
            end
        end
end


-- throws Exception
function CollidableUnitBehavior:collideUnit(ownerLayer, unitLayer)
        local ownerUnitLayer = ownerLayer
        local partialPositionList = UnitLayer.getPartialpositionlist()
        local geographicMapCompositeInterface = ownerUnitLayer.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local basicGeographicMap = geographicMapInterface
        local dropCellPositionHistory = DropCellPositionHistory.getInstance()
        local tiledLayerUtil = TiledLayerUtil.getInstance()
        local tiledLayer = basicGeographicMap:getAllBinaryTiledLayer()
        if ownerLayer:getXP() < unitLayer:getXP() and ownerLayer:getX2() > unitLayer:getXP() then
            local diff = ownerLayer:getWidth() + 1
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, ownerLayer, -diff, 0, partialPositionList)
            if not dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList) then
                local x = unitLayer:getXP() - diff
                local y = ownerLayer:getYP()
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, ownerLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, ownerLayer:getHeight())
                ownerLayer:setPosition(x, y, ownerLayer:getZP())
            end
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, unitLayer, diff, 0, partialPositionList)
            if not dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList) then
                local x = unitLayer:getXP() + diff
                local y = unitLayer:getYP()
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, unitLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, unitLayer:getHeight())
                unitLayer:setPosition(x, y, unitLayer:getZP())
            end
        end
        if ownerLayer:getYP() < unitLayer:getYP() and ownerLayer:getY2() > unitLayer:getYP() then
            local diff = ownerLayer:getHeight() + 1
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, ownerLayer, 0, -diff, partialPositionList)
            if not dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList) then
                local x = ownerLayer:getXP()
                local y = unitLayer:getYP() - diff
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, ownerLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, ownerLayer:getHeight())
                ownerLayer:setPosition(x, y, ownerLayer:getZP())
            end
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, unitLayer, 0, diff, partialPositionList)
            if not dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList) then
                local x = unitLayer:getXP()
                local y = unitLayer:getYP() + diff
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, unitLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, unitLayer:getHeight())
                unitLayer:setPosition(x, y, unitLayer:getZP())
            end
        end
end

return CollidableUnitBehavior

