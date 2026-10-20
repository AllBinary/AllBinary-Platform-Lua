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
-- package org.allbinary.game.ag.ai.scroller

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local GameInput = require("org.allbinary.game.input.GameInput")
local GroupLayerManagerListener = require("org.allbinary.game.layer.identification.GroupLayerManagerListener")
local WeaponLayer = require("org.allbinary.game.layer.weapon.WeaponLayer")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
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

local FlockingAI = {}
FlockingAI.__index = FlockingAI
FlockingAI.className = "FlockingAI"
setmetatable(FlockingAI, {__index = BasicAI})

function FlockingAI:_init_fields()
    self.allowedDistance = nil
end


function FlockingAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), FlockingAI)
    self:_init_fields()
        -- super(...) made self above
        local allowedDistance = hashtable:get(BasePatrolAI.MAX_DISTANCE)
        self.allowedDistance = math.tointeger(allowedDistance // 1)
    return self
end


-- throws Exception
function FlockingAI:processAI(allBinaryLayerManager)
        local maxDistance = 0
        local farAllbinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER
        local groupLayerManagerListener = GroupLayerManagerListener.getInstance()
        local list = groupLayerManagerListener:getList(BasicGroupFactory.getInstance().ENEMY)
        local size = list:size()
        local allBinaryLayer = nil
        local ownerLayerInterface = nil
        for index = 0, size - 1 do
            allBinaryLayer = list:get(index)
            if allBinaryLayer:getType() ~= WeaponLayer.getStaticType() then
                local distance = self:getXYDistance(allBinaryLayer)
                if distance > maxDistance then
                    maxDistance = distance
                    farAllbinaryLayer = allBinaryLayer
                    if distance > self.allowedDistance then
                        break
                    end
                end
            end
        end
        if maxDistance > self.allowedDistance then
            if farAllbinaryLayer ~= AllBinaryLayer.NULL_ALLBINARY_LAYER then
                ownerLayerInterface = self:getOwnerLayerInterface()
                if farAllbinaryLayer:getXP() < ownerLayerInterface:getXP() then
                    self:processKeyAI(Canvas.LEFT)
                elseif farAllbinaryLayer:getXP() > ownerLayerInterface:getXP() then
                    self:processKeyAI(Canvas.RIGHT)
                elseif farAllbinaryLayer:getYP() > ownerLayerInterface:getYP() then
                    self:processKeyAI(Canvas.UP)
                elseif farAllbinaryLayer:getYP() < ownerLayerInterface:getYP() then
                    self:processKeyAI(Canvas.DOWN)
                end
            end
        end
end


function FlockingAI:getXYDistance(allBinaryLayer)
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local xTotalDistance = (allBinaryLayer:getXP() + allBinaryLayer:getHalfWidth()) - (ownerLayerInterface:getXP() + ownerLayerInterface:getHalfWidth())
        local yTotalDistance = (allBinaryLayer:getYP() + allBinaryLayer:getHalfHeight()) - (ownerLayerInterface:getYP() + ownerLayerInterface:getHalfHeight())
        local mathUtil = MathUtil.getInstance()
        local totalDistance = mathUtil:abs(xTotalDistance) + mathUtil:abs(yTotalDistance)
        return totalDistance
end

return FlockingAI

