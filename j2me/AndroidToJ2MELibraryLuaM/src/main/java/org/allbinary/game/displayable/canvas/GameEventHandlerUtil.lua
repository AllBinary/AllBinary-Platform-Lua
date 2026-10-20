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

local GameInputMotionEventProcessorFactory = require("org.allbinary.android.input.motion.GameInputMotionEventProcessorFactory")
local GameKeyEventHandler = require("org.allbinary.game.input.event.GameKeyEventHandler")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameEventHandlerUtil = {}
GameEventHandlerUtil.__index = GameEventHandlerUtil
GameEventHandlerUtil.className = "GameEventHandlerUtil"

function GameEventHandlerUtil.new()
    local self = setmetatable({}, GameEventHandlerUtil)
    return self
end


function GameEventHandlerUtil.removeAllListeners()
        BasicMotionGesturesHandler.getInstance():removeAllListeners()
        GameKeyEventHandler.getInstance():removeAllListeners()
        GameInputMotionEventProcessorFactory.getInstance():addListener()
end

return GameEventHandlerUtil

