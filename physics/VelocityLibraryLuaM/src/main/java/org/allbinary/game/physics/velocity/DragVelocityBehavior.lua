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
-- package org.allbinary.game.physics.velocity

local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local VelocityBehaviorBase = require("org.allbinary.game.physics.velocity.VelocityBehaviorBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DragVelocityBehavior = {}
DragVelocityBehavior.__index = DragVelocityBehavior
DragVelocityBehavior.className = "DragVelocityBehavior"
setmetatable(DragVelocityBehavior, {__index = VelocityBehaviorBase})

function DragVelocityBehavior.new()
    local self = setmetatable(VelocityBehaviorBase.new(), DragVelocityBehavior)
    return self
end


function DragVelocityBehavior:reduce(velocityProperties, nominator, denominator)
        if velocityProperties:getVelocityXBasicDecimalP():getUnscaled() ~= 0 then
            local basicDecimal = velocityProperties:getVelocityXBasicDecimalP()
            basicDecimal:multiplyint(nominator)
            basicDecimal:divideint(denominator)
        end
        if velocityProperties:getVelocityYBasicDecimalP():getUnscaled() ~= 0 then
            local basicDecimal = velocityProperties:getVelocityYBasicDecimalP()
            basicDecimal:multiplyint(nominator)
            basicDecimal:divideint(denominator)
        end
end


function DragVelocityBehavior:reduceX(velocityProperties, nominator, denominator)
        local basicDecimal = velocityProperties:getVelocityXBasicDecimalP()
        if basicDecimal:getUnscaled() ~= 0 then
            basicDecimal:multiplyint(nominator)
            basicDecimal:divideint(denominator)
        end
end


function DragVelocityBehavior:reduceY(velocityProperties, nominator, denominator)
        if velocityProperties:getVelocityYBasicDecimalP():getUnscaled() ~= 0 then
            local basicDecimal = velocityProperties:getVelocityYBasicDecimalP()
            basicDecimal:multiplyint(nominator)
            basicDecimal:divideint(denominator)
        end
end

DragVelocityBehavior.instance = DragVelocityBehavior.new()

return DragVelocityBehavior

