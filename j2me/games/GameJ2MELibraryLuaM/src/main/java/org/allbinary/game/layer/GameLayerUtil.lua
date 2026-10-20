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
-- package org.allbinary.game.layer

local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
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

local GameLayerUtil = {}
GameLayerUtil.__index = GameLayerUtil
GameLayerUtil.className = "GameLayerUtil"


function GameLayerUtil.new()
    local self = setmetatable({}, GameLayerUtil)
    return self
end


function GameLayerUtil.isOnScreen(layer)
        local displayInfo = DisplayInfoSingleton.getInstance()
        local viewPosition = layer:getViewPosition()
        return GameLayerUtil.isInside(viewPosition:getX(), viewPosition:getY(), viewPosition:getX2(), viewPosition:getY2(), 0, 0, displayInfo:getLastWidth(), displayInfo:getLastHeight())
end


function GameLayerUtil.isInside(rectX1, rectY1, rectX2, rectY2, rect2X1, rect2Y1, rect2X2, rect2Y2)
        if rectX1 > rect2X1 and rectX2 < rect2X2 and rectY1 > rect2Y1 and rectY2 < rect2Y2 then
            return true
        else
            return false
        end
end

return GameLayerUtil

