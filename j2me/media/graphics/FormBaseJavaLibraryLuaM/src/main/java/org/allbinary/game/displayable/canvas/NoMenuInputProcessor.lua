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

-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local BasicMenuInputProcessor = require("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoMenuInputProcessor = {}
NoMenuInputProcessor.__index = NoMenuInputProcessor
NoMenuInputProcessor.className = "NoMenuInputProcessor"
setmetatable(NoMenuInputProcessor, {__index = BasicMenuInputProcessor})


function NoMenuInputProcessor.getInstance()
        return NoMenuInputProcessor.SINGLETON
end


function NoMenuInputProcessor.new()
    local self = setmetatable(BasicMenuInputProcessor.new(BasicArrayListUtil.getInstance():getImmutableInstance(), -1, NullCanvas.NULL_CANVAS), NoMenuInputProcessor)
        -- super(...) made self above
    return self
end


function NoMenuInputProcessor:onDownGameKeyEvent(gameKeyEvent)
end


function NoMenuInputProcessor:onUpGameKeyEvent(gameKeyEvent)
end


function NoMenuInputProcessor:onMotionGestureEvent(motionGestureEvent)
end

NoMenuInputProcessor.SINGLETON = NoMenuInputProcessor.new()

return NoMenuInputProcessor

