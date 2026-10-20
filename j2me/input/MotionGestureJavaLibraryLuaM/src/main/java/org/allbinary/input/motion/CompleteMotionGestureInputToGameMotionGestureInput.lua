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
-- package org.allbinary.input.motion

local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local MotionGestureConfiguration = require("org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration")
local MotionGestureConfigurationFactory = require("org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory")
local DiagonalDownLeftTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.DiagonalDownLeftTouchInputToGameKeyEventAction")
local DiagonalDownRightTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.DiagonalDownRightTouchInputToGameKeyEventAction")
local DiagonalUpLeftTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.DiagonalUpLeftTouchInputToGameKeyEventAction")
local DiagonalUpRightTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.DiagonalUpRightTouchInputToGameKeyEventAction")
local DownTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.DownTouchInputToGameKeyEventAction")
local LeftTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.LeftTouchInputToGameKeyEventAction")
local ReleaseTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.ReleaseTouchInputToGameKeyEventAction")
local RightTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.RightTouchInputToGameKeyEventAction")
local UpTouchInputToGameKeyEventAction = require("org.allbinary.input.motion.touch.action.UpTouchInputToGameKeyEventAction")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local CompleteMotionGestureInputToGameMotionGestureInput = {}
CompleteMotionGestureInputToGameMotionGestureInput.__index = CompleteMotionGestureInputToGameMotionGestureInput
CompleteMotionGestureInputToGameMotionGestureInput.className = "CompleteMotionGestureInputToGameMotionGestureInput"

function CompleteMotionGestureInputToGameMotionGestureInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CompleteMotionGestureInputToGameMotionGestureInput.new()
    local self = setmetatable({}, CompleteMotionGestureInputToGameMotionGestureInput)
    self:_init_fields()
    return self
end


function CompleteMotionGestureInputToGameMotionGestureInput.getInstance()
        return CompleteMotionGestureInputToGameMotionGestureInput.instance
end


function CompleteMotionGestureInputToGameMotionGestureInput:init()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            PreLogUtil.put("Compound Motion Gestures", self, commonStrings.INIT)
            local motionGestureConfiguration = MotionGestureConfigurationFactory.getInstance()
            local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
            local list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.DIAGONAL_DOWN_LEFT)
            motionGestureConfiguration:addMotionGestureAction(list, DiagonalDownLeftTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.DIAGONAL_DOWN_RIGHT)
            motionGestureConfiguration:addMotionGestureAction(list, DiagonalDownRightTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.DIAGONAL_UP_LEFT)
            motionGestureConfiguration:addMotionGestureAction(list, DiagonalUpLeftTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.DIAGONAL_UP_RIGHT)
            motionGestureConfiguration:addMotionGestureAction(list, DiagonalUpRightTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.LEFT)
            motionGestureConfiguration:addMotionGestureAction(list, LeftTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.RIGHT)
            motionGestureConfiguration:addMotionGestureAction(list, RightTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.DOWN)
            motionGestureConfiguration:addMotionGestureAction(list, DownTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.UP)
            motionGestureConfiguration:addMotionGestureAction(list, UpTouchInputToGameKeyEventAction.getInstance())
            list = BasicArrayListD.new()
            list:add(touchMotionGestureFactory.RELEASED)
            motionGestureConfiguration:addMotionGestureAction(list, ReleaseTouchInputToGameKeyEventAction.getInstance())
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
        end
end

CompleteMotionGestureInputToGameMotionGestureInput.instance = CompleteMotionGestureInputToGameMotionGestureInput.new()

return CompleteMotionGestureInputToGameMotionGestureInput

