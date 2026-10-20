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
-- package org.allbinary.game.input.mapping

local InputMappingEvent = require("org.allbinary.game.input.mapping.event.InputMappingEvent")
local InputMappingEventListenerInterface = require("org.allbinary.game.input.mapping.event.InputMappingEventListenerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionInputMappingEventListener = {}
MotionInputMappingEventListener.__index = MotionInputMappingEventListener
MotionInputMappingEventListener.className = "MotionInputMappingEventListener"

function MotionInputMappingEventListener.new()
    local self = setmetatable({}, MotionInputMappingEventListener)
    return self
end


function MotionInputMappingEventListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function MotionInputMappingEventListener:onInputMappingEvent(inputMappingEvent)
end

return MotionInputMappingEventListener

