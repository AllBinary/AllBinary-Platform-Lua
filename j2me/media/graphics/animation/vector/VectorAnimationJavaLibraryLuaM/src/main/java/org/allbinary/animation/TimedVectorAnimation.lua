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
-- package org.allbinary.animation

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local VectorAnimation = require("org.allbinary.animation.VectorAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimedVectorAnimation = {}
TimedVectorAnimation.__index = TimedVectorAnimation
TimedVectorAnimation.className = "TimedVectorAnimation"
setmetatable(TimedVectorAnimation, {__index = VectorAnimation})

function TimedVectorAnimation:_init_fields()
    self.timeElapsedHelper = TimeDelayHelper.new(200)
end


function TimedVectorAnimation.new(currentPoints, basicColor, animationBehavior)
    local self = setmetatable(VectorAnimation.new(currentPoints, basicColor, animationBehavior), TimedVectorAnimation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TimedVectorAnimation:nextFrame()
        if self.timeElapsedHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            VectorAnimation.nextFrame(self)
        end
end

return TimedVectorAnimation

