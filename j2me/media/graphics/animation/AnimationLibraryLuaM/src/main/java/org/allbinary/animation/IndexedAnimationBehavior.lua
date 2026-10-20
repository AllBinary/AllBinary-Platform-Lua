-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IndexedAnimationBehavior = {}
IndexedAnimationBehavior.__index = IndexedAnimationBehavior
IndexedAnimationBehavior.className = "IndexedAnimationBehavior"
setmetatable(IndexedAnimationBehavior, {__index = AnimationBehavior})

function IndexedAnimationBehavior:_init_fields()
    self.frameDelayTime = nil
    self.loopTotal = nil
    self.elapsedTime = 0
    self.loopIndex = 0
end


function IndexedAnimationBehavior.new(loopTotal, frameDelayTime)
    local self = setmetatable(AnimationBehavior.new(), IndexedAnimationBehavior)
    self:_init_fields()
        self.loopTotal = loopTotal
        self.frameDelayTime = frameDelayTime
    return self
end


function IndexedAnimationBehavior:reset()
        self.loopIndex = 0
end

return IndexedAnimationBehavior

