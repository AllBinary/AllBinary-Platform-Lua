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
-- package org.allbinary.game.ai.path

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local AngleIncrementInfo = require("org.allbinary.math.AngleIncrementInfo")
local AngleInfo = require("org.allbinary.math.AngleInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicDirectionAIHelper = {}
BasicDirectionAIHelper.__index = BasicDirectionAIHelper
BasicDirectionAIHelper.className = "BasicDirectionAIHelper"

function BasicDirectionAIHelper:_init_fields()
    self.name = nil
    self.angleInfo = nil
end


function BasicDirectionAIHelper.new(name, angleInfo)
    local self = setmetatable({}, BasicDirectionAIHelper)
    self:_init_fields()
        self.name = name
        self.angleInfo = angleInfo
    return self
end


function BasicDirectionAIHelper:turnAI(frame)
        local keyDirection = -1
        local directionAngle = self.angleInfo:getAngleIncrementInfo():getFrameAngle(frame)
        local angle = self.angleInfo:getAngle()
        local degrees = math.abs(directionAngle - angle)
        if degrees < 180 then
            if angle > directionAngle then
                keyDirection = Canvas.LEFT
            elseif angle < directionAngle then
                keyDirection = Canvas.RIGHT
            end
        else
            if angle > directionAngle then
                keyDirection = Canvas.RIGHT
            elseif angle < directionAngle then
                keyDirection = Canvas.LEFT
            end
        end
        return keyDirection
end


function BasicDirectionAIHelper:getAIKeyPressed(frame)
        local angle = java_int(self.angleInfo:getAngleIncrementInfo():getFrameAngle(math.tointeger(frame // 1)))
        if self.angleInfo:getAngle() ~= angle then
            return self:turnAI(math.tointeger(frame // 1))
        else
            return Canvas.UP
        end
end


function BasicDirectionAIHelper:getAIKeyPressedFromDirection(geographicMapDirectionData)
        local keyDirection = -1
        local angleIncrementInfo = self.angleInfo:getAngleIncrementInfo()
        local directionFactory = DirectionFactory.getInstance()
        if geographicMapDirectionData == directionFactory.DOWN then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.DOWN_FRAME)
        elseif geographicMapDirectionData == directionFactory.UP then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.UP_FRAME)
        elseif geographicMapDirectionData == directionFactory.LEFT then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.LEFT_FRAME)
        elseif geographicMapDirectionData == directionFactory.RIGHT then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.RIGHT_FRAME)
        end
        return keyDirection
end


function BasicDirectionAIHelper:getAngleInfoP()
        return self.angleInfo
end


function BasicDirectionAIHelper:getName()
        return self.name
end

return BasicDirectionAIHelper

