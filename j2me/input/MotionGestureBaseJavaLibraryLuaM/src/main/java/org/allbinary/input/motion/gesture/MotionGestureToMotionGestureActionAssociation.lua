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
-- package org.allbinary.input.motion.gesture

local CompleteMotionGestureInputEvent = require("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionGestureToMotionGestureActionAssociation = {}
MotionGestureToMotionGestureActionAssociation.__index = MotionGestureToMotionGestureActionAssociation
MotionGestureToMotionGestureActionAssociation.className = "MotionGestureToMotionGestureActionAssociation"

function MotionGestureToMotionGestureActionAssociation:_init_fields()
    self.list = nil
    self.motionGestureAction = nil
end


function MotionGestureToMotionGestureActionAssociation.new(list, commandAction)
    local self = setmetatable({}, MotionGestureToMotionGestureActionAssociation)
    self:_init_fields()
        self.list = list
        self.motionGestureAction = commandAction
    return self
end


function MotionGestureToMotionGestureActionAssociation:getMotionGesture()
        return self.list
end


function MotionGestureToMotionGestureActionAssociation:setMotionGestures(list)
        self.list = list
end


function MotionGestureToMotionGestureActionAssociation:getCommandAction()
        return self.motionGestureAction
end


function MotionGestureToMotionGestureActionAssociation:setMotionGestureAction(commandAction)
        self.motionGestureAction = commandAction
end


function MotionGestureToMotionGestureActionAssociation:isMotionGestureArrayEquals(aList)
        local size = aList:size()
        if self.list:size() ~= size then
            return false
        end
        for i = size - 1, 0, -1 do
            if aList.objectArray[i + 1] ~= self.list.objectArray[i + 1] then
                return false
            end
        end
        return true
end

return MotionGestureToMotionGestureActionAssociation

