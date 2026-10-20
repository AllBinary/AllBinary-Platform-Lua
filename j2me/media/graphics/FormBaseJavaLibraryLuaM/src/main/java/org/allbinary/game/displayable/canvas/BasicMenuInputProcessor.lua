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
-- package org.allbinary.game.displayable.canvas

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local BaseMotionGestureEventListener = require("org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicMenuInputProcessor = {}
BasicMenuInputProcessor.__index = BasicMenuInputProcessor
BasicMenuInputProcessor.className = "BasicMenuInputProcessor"
setmetatable(BasicMenuInputProcessor, {__index = PlayerGameInput})

function BasicMenuInputProcessor:_init_fields()
    self.motionGestureEventList = BasicArrayListD.new()
    self.canvas = NullCanvas.NULL_CANVAS
end


function BasicMenuInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas)
    local self = setmetatable(PlayerGameInput.new(gameKeyEventList, BasicArrayListD.new(), playerInputId), BasicMenuInputProcessor)
    self:_init_fields()
        -- super(...) made self above
        self.canvas = gameCanvas
    return self
end


function BasicMenuInputProcessor:onMotionGestureEvent(motionGestureEvent)
        self.motionGestureEventList:add(motionGestureEvent)
end


function BasicMenuInputProcessor:onScrolledMotionGestureEvent(motionGestureEvent)
end


function BasicMenuInputProcessor:setCanvas(canvas)
        self.canvas = canvas
end


function BasicMenuInputProcessor:getCanvas()
        return self.canvas
end


-- throws Exception
function BasicMenuInputProcessor:processInputList()
        return -1
end

return BasicMenuInputProcessor

