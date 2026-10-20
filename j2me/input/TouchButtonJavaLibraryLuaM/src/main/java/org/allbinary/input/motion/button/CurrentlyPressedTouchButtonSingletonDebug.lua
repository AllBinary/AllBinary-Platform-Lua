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
-- package org.allbinary.input.motion.button

local GPoint = require("org.allbinary.graphics.GPoint")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CurrentlyPressedTouchButtonSingleton = require("org.allbinary.input.motion.button.CurrentlyPressedTouchButtonSingleton")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CurrentlyPressedTouchButtonSingletonDebug = {}
CurrentlyPressedTouchButtonSingletonDebug.__index = CurrentlyPressedTouchButtonSingletonDebug
CurrentlyPressedTouchButtonSingletonDebug.className = "CurrentlyPressedTouchButtonSingletonDebug"
setmetatable(CurrentlyPressedTouchButtonSingletonDebug, {__index = CurrentlyPressedTouchButtonSingleton})

function CurrentlyPressedTouchButtonSingletonDebug:_init_fields()
    self.string = StringUtil.getInstance().EMPTY_STRING
    self.listString = StringUtil.getInstance().EMPTY_STRING
    self.append = StringUtil.getInstance().EMPTY_STRING
    self.PRESSED_AND_FIRED = "pressed & fired"
    self.PRESSED_AND_NOT_FIRED = "pressed in button but not fired"
    self.ASSOCIATED_RELEASED_AND_FIRED = "assoc. rel & fired"
    self.RELEASED_AND_FIRED = "rel & fired 1"
    self.RELEASED_AND_FIRED_2 = "rel & fired 2"
    self.RELEASED_AND_NOT_FIRED = "rel & not fired"
end

function CurrentlyPressedTouchButtonSingletonDebug.new()
    local self = setmetatable(CurrentlyPressedTouchButtonSingleton.new(), CurrentlyPressedTouchButtonSingletonDebug)
    self:_init_fields()
    return self
end


function CurrentlyPressedTouchButtonSingletonDebug.getInstance()
        return CurrentlyPressedTouchButtonSingletonDebug.instanceC
end


function CurrentlyPressedTouchButtonSingletonDebug:appendTouchButtonInput(append, touchButtonInput)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(touchButtonInput))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(append)
        self.append = tostring(stringBuffer)
        self.string = tostring(StringMaker.new():append(self.listString):append(self.append))
end


function CurrentlyPressedTouchButtonSingletonDebug:append(append)
        self.append = tostring(StringMaker.new():append(self.append):append(append))
        self.string = tostring(StringMaker.new():append(self.listString):append(self.append))
end


function CurrentlyPressedTouchButtonSingletonDebug:clearLog(x, y)
        self.append = tostring(StringMaker.new():append(GPoint.toStringStatic(x, y, 0)):append(CommonSeps.getInstance().SPACE))
        self.string = tostring(StringMaker.new():append(self.listString):append(self.append))
end


function CurrentlyPressedTouchButtonSingletonDebug:releaseAndNotFired()
        self:append(self.RELEASED_AND_NOT_FIRED)
end


function CurrentlyPressedTouchButtonSingletonDebug:releaseAndFired(touchButtonInput)
        self:appendTouchButtonInput(self.RELEASED_AND_FIRED, touchButtonInput)
end


function CurrentlyPressedTouchButtonSingletonDebug:releaseAndFired2(touchButtonInput)
        self:appendTouchButtonInput(self.RELEASED_AND_FIRED_2, touchButtonInput)
end


function CurrentlyPressedTouchButtonSingletonDebug:releaseAndFiredAssociated(touchButtonInput)
        self:appendTouchButtonInput(self.ASSOCIATED_RELEASED_AND_FIRED, touchButtonInput)
end


function CurrentlyPressedTouchButtonSingletonDebug:pressedAndFired(touchButtonInput)
        self:appendTouchButtonInput(self.PRESSED_AND_FIRED, touchButtonInput)
end


function CurrentlyPressedTouchButtonSingletonDebug:pressedAndNotFired(touchButtonInput)
        self:appendTouchButtonInput(self.PRESSED_AND_NOT_FIRED, touchButtonInput)
end


function CurrentlyPressedTouchButtonSingletonDebug:removeAt(index)
        local touchButtonInput = CurrentlyPressedTouchButtonSingleton.removeAt(self, index)
        self.listString = tostring(self.list)
        self.string = tostring(StringMaker.new():append(self.listString):append(self.append))
        return touchButtonInput
end


function CurrentlyPressedTouchButtonSingletonDebug:remove(touchButtonInput)
        local isRemoved = CurrentlyPressedTouchButtonSingleton.remove(self, touchButtonInput)
        self.listString = tostring(self.list)
        self.string = tostring(StringMaker.new():append(self.listString):append(self.append))
        return isRemoved
end


function CurrentlyPressedTouchButtonSingletonDebug:add(touchButtonInput)
        CurrentlyPressedTouchButtonSingleton.add(self, touchButtonInput)
        self.listString = tostring(self.list)
        self.string = tostring(StringMaker.new():append(self.listString):append(self.append))
end


function CurrentlyPressedTouchButtonSingletonDebug:toString()
        return self.string
end
CurrentlyPressedTouchButtonSingletonDebug.__tostring = function(self) return self:toString() end

CurrentlyPressedTouchButtonSingletonDebug.instanceC = CurrentlyPressedTouchButtonSingletonDebug.new()

return CurrentlyPressedTouchButtonSingletonDebug

