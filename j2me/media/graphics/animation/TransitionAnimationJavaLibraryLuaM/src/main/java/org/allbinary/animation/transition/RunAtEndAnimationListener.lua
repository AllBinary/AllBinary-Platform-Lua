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
-- package org.allbinary.animation.transition

local AnimationListenerInterface = require("org.allbinary.animation.transition.AnimationListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RunAtEndAnimationListener = {}
RunAtEndAnimationListener.__index = RunAtEndAnimationListener
RunAtEndAnimationListener.className = "RunAtEndAnimationListener"

function RunAtEndAnimationListener:_init_fields()
    self.runnable = nil
end


function RunAtEndAnimationListener.new(runnable)
    local self = setmetatable({}, RunAtEndAnimationListener)
    self:_init_fields()
        self.runnable = runnable
    return self
end


function RunAtEndAnimationListener:onPlatformAnimationStart()
end


function RunAtEndAnimationListener:onPlatformAnimationEnd()
end


function RunAtEndAnimationListener:onPlatformAnimationRepeat()
end

return RunAtEndAnimationListener

