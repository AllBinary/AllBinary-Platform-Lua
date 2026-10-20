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

local CompleteMotionGestureInputEventHandler = require("org.allbinary.game.input.CompleteMotionGestureInputEventHandler")
local GameKeyCompleteMotionGestureInputEvent = require("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")
local GameKeyFromMotionGestureEventListener = require("org.allbinary.game.input.motion.action.GameKeyFromMotionGestureEventListener")
local MotionGestureToMotionGestureActionAssociation = require("org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation")
local MotionGestureConfiguration = require("org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration")
local MotionGestureConfigurationFactory = require("org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory")
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

local ResolveCompleteMotionGestureListener = {}
ResolveCompleteMotionGestureListener.__index = ResolveCompleteMotionGestureListener
ResolveCompleteMotionGestureListener.className = "ResolveCompleteMotionGestureListener"

function ResolveCompleteMotionGestureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ResolveCompleteMotionGestureListener.new()
    local self = setmetatable({}, ResolveCompleteMotionGestureListener)
    self:_init_fields()
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF("MotionGesture to CompleteMotionGesture Reciever", self, commonStrings.CONSTRUCTOR)
        CompleteMotionGestureInputEventHandler.getInstance():addListener(GameKeyFromMotionGestureEventListener.new())
    return self
end


-- throws Exception
function ResolveCompleteMotionGestureListener:onMotionGestureCompleted(list)
        local configuration = MotionGestureConfigurationFactory.getInstance()
        local commandActionsList = configuration:getAssociateCommandActionsList()
        local size = commandActionsList:size()
        for index = size - 1, 0, -1 do
            local association = commandActionsList.objectArray[index + 1]
            if association:isMotionGestureArrayEquals(list) == true then
                local completeMotionGestureInputEvent = association:getCommandAction()
                CompleteMotionGestureInputEventHandler.getInstance():fireEvent(completeMotionGestureInputEvent)
                break
            end
        end
end

return ResolveCompleteMotionGestureListener

