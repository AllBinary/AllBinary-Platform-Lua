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
-- package org.allbinary.game.ag.layer.pickup.points

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ViewPosition = require("org.allbinary.view.ViewPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PointsLayer = {}
PointsLayer.__index = PointsLayer
PointsLayer.className = "PointsLayer"
setmetatable(PointsLayer, {__index = AllBinaryLayer})

function PointsLayer:_init_fields()
    self.points = nil
end


function PointsLayer.new(points)
    local self = setmetatable(AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, Rectangle.new(PointFactory.getInstance().ZERO_ZERO, 0, 0), ViewPosition.getInstanceD()), PointsLayer)
    self:_init_fields()
        -- super(...) made self above
        self.points = points
    return self
end


function PointsLayer:paint(graphics)
end


function PointsLayer:visit(scoreableInterface)
        scoreableInterface:addPoints(self.points)
end

return PointsLayer

