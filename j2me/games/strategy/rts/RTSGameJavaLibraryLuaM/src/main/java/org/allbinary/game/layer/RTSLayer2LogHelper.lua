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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayer2LogHelper = {}
RTSLayer2LogHelper.__index = RTSLayer2LogHelper
RTSLayer2LogHelper.className = "RTSLayer2LogHelper"

function RTSLayer2LogHelper.new()
    local self = setmetatable({}, RTSLayer2LogHelper)
    return self
end


function RTSLayer2LogHelper.getInstance()
        return RTSLayer2LogHelper.instance
end


function RTSLayer2LogHelper:steeringUp(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:steeringFireOrStop(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:buildingAbove(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:buildingChaseLeft(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingChaseRight(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingDown(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:buildingChaseDown(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingChaseUp(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingLeft()
end


function RTSLayer2LogHelper:buildingRight()
end

RTSLayer2LogHelper.instance = RTSLayer2LogHelper.new()

return RTSLayer2LogHelper

