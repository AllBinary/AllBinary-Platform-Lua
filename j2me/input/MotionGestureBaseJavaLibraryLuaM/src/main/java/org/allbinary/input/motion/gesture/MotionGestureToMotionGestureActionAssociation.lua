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

local MotionGestureToMotionGestureActionAssociation = {}
package.loaded["org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation"] = MotionGestureToMotionGestureActionAssociation

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

local CompleteMotionGestureInputEvent = java_lazy("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table MotionGestureToMotionGestureActionAssociation is declared before the requires
MotionGestureToMotionGestureActionAssociation.__index = MotionGestureToMotionGestureActionAssociation
MotionGestureToMotionGestureActionAssociation.className = "MotionGestureToMotionGestureActionAssociation"
MotionGestureToMotionGestureActionAssociation.javaClassName = "org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation"

function MotionGestureToMotionGestureActionAssociation:_init_fields()
    if self.list == nil then self.list = nil end
    if self.motionGestureAction == nil then self.motionGestureAction = nil end
end


function MotionGestureToMotionGestureActionAssociation._jinit(self, list, commandAction)
    MotionGestureToMotionGestureActionAssociation._init_fields(self)
        self.list = list
        self.motionGestureAction = commandAction
    return self
end

function MotionGestureToMotionGestureActionAssociation.new(...)
    local self = setmetatable({}, MotionGestureToMotionGestureActionAssociation)
    MotionGestureToMotionGestureActionAssociation._jinit(self, ...)
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

