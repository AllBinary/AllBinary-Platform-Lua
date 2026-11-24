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

local MirrorMotionGestureEventUtil = {}
package.loaded["org.allbinary.input.motion.gesture.MirrorMotionGestureEventUtil"] = MirrorMotionGestureEventUtil

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

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local MotionEventCircularPool = java_lazy("org.allbinary.input.motion.gesture.observer.MotionEventCircularPool")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")

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

-- class table MirrorMotionGestureEventUtil is declared before the requires
MirrorMotionGestureEventUtil.__index = MirrorMotionGestureEventUtil
MirrorMotionGestureEventUtil.className = "MirrorMotionGestureEventUtil"
MirrorMotionGestureEventUtil.javaClassName = "org.allbinary.input.motion.gesture.MirrorMotionGestureEventUtil"

function MirrorMotionGestureEventUtil:_init_fields()
    if self.motionEventCircularPool == nil then self.motionEventCircularPool = nil end
end


function MirrorMotionGestureEventUtil._jinit(self)
    MirrorMotionGestureEventUtil._init_fields(self)
        self.motionEventCircularPool = MotionEventCircularPool.createPool(require("java.lang.Integer").MAX_VALUE)
    return self
end

function MirrorMotionGestureEventUtil.new(...)
    local self = setmetatable({}, MirrorMotionGestureEventUtil)
    MirrorMotionGestureEventUtil._jinit(self, ...)
    return self
end


-- throws Exception
function MirrorMotionGestureEventUtil:mirrorVerticle(motionGestureEvent, halfWidth)
        local event = self.motionEventCircularPool:getInstance(motionGestureEvent:getMotionGesture())
        local previousNewX = self:getNewX(motionGestureEvent:getPreviousPoint():getX(), halfWidth)
        local currentNewX = self:getNewX(motionGestureEvent:getCurrentPoint():getX(), halfWidth)
        local pointFactory = PointFactory.getInstance()
        local mirroredPreviousPoint = pointFactory:createXY(previousNewX, motionGestureEvent:getPreviousPoint():getY())
        local mirroredCurrentPoint = pointFactory:createXY(currentNewX, motionGestureEvent:getCurrentPoint():getY())
        event:setPreviousPoint(mirroredPreviousPoint)
        event:setCurrentPoint(mirroredCurrentPoint)
        return event
end


function MirrorMotionGestureEventUtil:getNewX(x, halfWidth)
        local newX = 0
        if x > halfWidth then
            newX = halfWidth - (x - halfWidth)
        else
            newX = halfWidth + (halfWidth - x)
        end
        return newX
end


function MirrorMotionGestureEventUtil.getInstance()
        return MirrorMotionGestureEventUtil.instance_f
end

MirrorMotionGestureEventUtil.instance_f = MirrorMotionGestureEventUtil.new()

return MirrorMotionGestureEventUtil

