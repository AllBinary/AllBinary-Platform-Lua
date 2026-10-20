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

local TouchButtonRecognizer = require("org.allbinary.input.motion.button.TouchButtonRecognizer")
local MotionRecognizer = require("org.allbinary.input.motion.MotionRecognizer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OnlyTouchButtonRecognizer = {}
OnlyTouchButtonRecognizer.__index = OnlyTouchButtonRecognizer
OnlyTouchButtonRecognizer.className = "OnlyTouchButtonRecognizer"
setmetatable(OnlyTouchButtonRecognizer, {__index = MotionRecognizer})

function OnlyTouchButtonRecognizer:_init_fields()
    self.touchButtonRecognizer = nil
    self.touchButtonProcessing = false
end


function OnlyTouchButtonRecognizer.new()
    local self = setmetatable(MotionRecognizer.new(), OnlyTouchButtonRecognizer)
    self:_init_fields()
        self.touchButtonRecognizer = TouchButtonRecognizer.new()
    return self
end


-- throws Exception
function OnlyTouchButtonRecognizer:processStartMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonRecognizer:pressTouchButtonInput(x, y, deviceId) then
            self.touchButtonProcessing = true
        end
end


-- throws Exception
function OnlyTouchButtonRecognizer:processEndMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonProcessing then
            self.touchButtonProcessing = false
        end
        if self.touchButtonRecognizer:releaseTouchButtonInput(x, y, deviceId) then
            return
        end
end


-- throws Exception
function OnlyTouchButtonRecognizer:processDraggedMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonProcessing then
            self.touchButtonRecognizer:pressTouchButtonInput(x, y, deviceId)
        end
end

return OnlyTouchButtonRecognizer

