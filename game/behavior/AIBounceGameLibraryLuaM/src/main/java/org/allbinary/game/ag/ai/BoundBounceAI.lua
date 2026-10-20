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
-- package org.allbinary.game.ag.ai

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BoundsVisitorInterface = require("org.allbinary.bounds.BoundsVisitorInterface")
local LayerBounds = require("org.allbinary.bounds.LayerBounds")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BoundBounceAI = {}
BoundBounceAI.__index = BoundBounceAI
BoundBounceAI.className = "BoundBounceAI"
setmetatable(BoundBounceAI, {__index = BasicAI})

function BoundBounceAI:_init_fields()
    self.currentRelativeAngle = 0
    self.layerBounds = nil
    self.boundsVisitorInterface = nil
end


function BoundBounceAI.new(ownerLayerInterface, gameInput, layerBounds, boundsVisitorInterface)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), BoundBounceAI)
    self:_init_fields()
        -- super(...) made self above
        self.layerBounds = layerBounds
        self.boundsVisitorInterface = boundsVisitorInterface
    return self
end


function BoundBounceAI:paint(graphics)
        local rectange = self.layerBounds:getRectangleP()
        graphics:drawRect(rectange:getPoint():getX(), rectange:getPoint():getY(), rectange:getWidth(), rectange:getHeight())
end


-- throws Exception
function BoundBounceAI:processAI(allBinaryLayerManager)
        self.layerBounds:visit(self.boundsVisitorInterface)
end

return BoundBounceAI

