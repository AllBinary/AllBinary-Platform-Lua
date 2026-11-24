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

local CompleteMotionGestureInputToGameMotionGestureInput = {}
package.loaded["org.allbinary.input.motion.CompleteMotionGestureInputToGameMotionGestureInput"] = CompleteMotionGestureInputToGameMotionGestureInput

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local MotionGestureConfiguration = java_lazy("org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration")
local MotionGestureConfigurationFactory = java_lazy("org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory")
local DiagonalDownLeftTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.DiagonalDownLeftTouchInputToGameKeyEventAction")
local DiagonalDownRightTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.DiagonalDownRightTouchInputToGameKeyEventAction")
local DiagonalUpLeftTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.DiagonalUpLeftTouchInputToGameKeyEventAction")
local DiagonalUpRightTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.DiagonalUpRightTouchInputToGameKeyEventAction")
local DownTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.DownTouchInputToGameKeyEventAction")
local LeftTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.LeftTouchInputToGameKeyEventAction")
local ReleaseTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.ReleaseTouchInputToGameKeyEventAction")
local RightTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.RightTouchInputToGameKeyEventAction")
local UpTouchInputToGameKeyEventAction = java_lazy("org.allbinary.input.motion.touch.action.UpTouchInputToGameKeyEventAction")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CompleteMotionGestureInputToGameMotionGestureInput is declared before the requires
CompleteMotionGestureInputToGameMotionGestureInput.__index = CompleteMotionGestureInputToGameMotionGestureInput
CompleteMotionGestureInputToGameMotionGestureInput.className = "CompleteMotionGestureInputToGameMotionGestureInput"
CompleteMotionGestureInputToGameMotionGestureInput.javaClassName = "org.allbinary.input.motion.CompleteMotionGestureInputToGameMotionGestureInput"

function CompleteMotionGestureInputToGameMotionGestureInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CompleteMotionGestureInputToGameMotionGestureInput._jinit(self)
    CompleteMotionGestureInputToGameMotionGestureInput._init_fields(self)
    return self
end

function CompleteMotionGestureInputToGameMotionGestureInput.new()
    return CompleteMotionGestureInputToGameMotionGestureInput._jinit(setmetatable({}, CompleteMotionGestureInputToGameMotionGestureInput))
end


function CompleteMotionGestureInputToGameMotionGestureInput.getInstance()
        return CompleteMotionGestureInputToGameMotionGestureInput.instance_f
end


function CompleteMotionGestureInputToGameMotionGestureInput:init()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
        end
end

CompleteMotionGestureInputToGameMotionGestureInput.instance_f = CompleteMotionGestureInputToGameMotionGestureInput.new()

return CompleteMotionGestureInputToGameMotionGestureInput

