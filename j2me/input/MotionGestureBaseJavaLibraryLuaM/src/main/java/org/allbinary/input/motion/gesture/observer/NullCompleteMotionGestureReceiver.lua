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
-- package org.allbinary.input.motion.gesture.observer

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CompleteMotionGestureListenerInterface = require("org.allbinary.input.motion.gesture.observer.CompleteMotionGestureListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullCompleteMotionGestureReceiver = {}
NullCompleteMotionGestureReceiver.__index = NullCompleteMotionGestureReceiver
NullCompleteMotionGestureReceiver.className = "NullCompleteMotionGestureReceiver"

function NullCompleteMotionGestureReceiver:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NullCompleteMotionGestureReceiver.new()
    local self = setmetatable({}, NullCompleteMotionGestureReceiver)
    self:_init_fields()
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF("Null Gesture Reciever", self, commonStrings.CONSTRUCTOR)
    return self
end


-- throws Exception
function NullCompleteMotionGestureReceiver:onMotionGestureCompleted(list)
end

return NullCompleteMotionGestureReceiver

