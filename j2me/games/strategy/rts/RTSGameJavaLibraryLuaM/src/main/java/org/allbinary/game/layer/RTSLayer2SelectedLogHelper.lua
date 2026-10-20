-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local RTSLayer2LogHelper = require("org.allbinary.game.layer.RTSLayer2LogHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayer2SelectedLogHelper = {}
RTSLayer2SelectedLogHelper.__index = RTSLayer2SelectedLogHelper
RTSLayer2SelectedLogHelper.className = "RTSLayer2SelectedLogHelper"
setmetatable(RTSLayer2SelectedLogHelper, {__index = RTSLayer2LogHelper})

function RTSLayer2SelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.TRACK_TO_FIRE_OR_MOVE = "trackTo:fireOrMove"
    self.BUILDING_CHASE = "buildingChase"
end

function RTSLayer2SelectedLogHelper.new()
    local self = setmetatable(RTSLayer2LogHelper.new(), RTSLayer2SelectedLogHelper)
    self:_init_fields()
    return self
end


function RTSLayer2SelectedLogHelper.getInstance()
        return RTSLayer2SelectedLogHelper.instanceC
end


function RTSLayer2SelectedLogHelper:steeringUp(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" steering - Up")), self, self.TRACK_TO_FIRE_OR_MOVE)
end


function RTSLayer2SelectedLogHelper:steeringFireOrStop(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" steering - Fire/All Stop")), self, self.TRACK_TO_FIRE_OR_MOVE)
end


function RTSLayer2SelectedLogHelper:buildingAbove(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" Building Above")), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingChaseLeft(pathFindingLayerInterface, angle)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" steering - Going Left: "):appendint(angle)), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingChaseRight(pathFindingLayerInterface, angle)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" steering - Going Right: "):appendint(angle)), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingDown(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" Building Below")), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingChaseDown(pathFindingLayerInterface, angle)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" steering - Going Down: "):appendint(angle)), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingChaseUp(pathFindingLayerInterface, angle)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" steering - Going Up: "):appendint(angle)), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingLeft(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" Building Left")), self, self.BUILDING_CHASE)
end


function RTSLayer2SelectedLogHelper:buildingRight(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(" Building Right")), self, self.BUILDING_CHASE)
end

RTSLayer2SelectedLogHelper.instanceC = RTSLayer2SelectedLogHelper.new()

return RTSLayer2SelectedLogHelper

