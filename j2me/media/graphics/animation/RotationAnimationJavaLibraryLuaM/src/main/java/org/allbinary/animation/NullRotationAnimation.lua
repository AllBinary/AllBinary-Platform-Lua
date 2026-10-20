-- Generated Code Do Not Modify
-- package org.allbinary.animation

local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullRotationAnimation = {}
NullRotationAnimation.__index = NullRotationAnimation
NullRotationAnimation.className = "NullRotationAnimation"
setmetatable(NullRotationAnimation, {__index = RotationAnimation})


function NullRotationAnimation.createTotalAngle(angleInfo, totalAngle, animationBehavior)
        return NullRotationAnimation.new(angleInfo, CircularIndexUtil.createInstance(totalAngle / angleInfo:getAngleIncrementInfo():getAngleIncrement()), animationBehavior)
end


function NullRotationAnimation.createQuarter(animationBehavior)
        return NullRotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior)
end


function NullRotationAnimation.new(angleInfo, circularIndexUtil, animationBehavior)
    local self = setmetatable(RotationAnimation.new(angleInfo, circularIndexUtil, animationBehavior), NullRotationAnimation)
        -- super(...) made self above
    return self
end


-- throws Exception
function NullRotationAnimation:getAnimationSize()
        return 0
end

return NullRotationAnimation

