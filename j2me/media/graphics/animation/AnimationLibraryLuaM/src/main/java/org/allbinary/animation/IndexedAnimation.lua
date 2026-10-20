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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Animation = require("org.allbinary.animation.Animation")
local IndexedAnimationInterface = require("org.allbinary.animation.IndexedAnimationInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IndexedAnimation = {}
IndexedAnimation.__index = IndexedAnimation
IndexedAnimation.className = "IndexedAnimation"
setmetatable(IndexedAnimation, {__index = Animation})

function IndexedAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.animationBehaviorP = nil
end


function IndexedAnimation.new(animationBehavior)
    local self = setmetatable(Animation.new(), IndexedAnimation)
    self:_init_fields()
        self.animationBehaviorP = animationBehavior
    return self
end


function IndexedAnimation:getAnimationBehavior()
        return self.animationBehaviorP
end


function IndexedAnimation:reset()
        self.animationBehaviorP:reset()
        self:setFrame(0)
end


function IndexedAnimation:setFrame(index)
end


function IndexedAnimation:getFrame()
        return 0
end


-- throws Exception
function IndexedAnimation:getAnimationSize()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function IndexedAnimation:getSize()
        return 0
end


function IndexedAnimation:previousFrame()
end


function IndexedAnimation:isLastFrame()
        if self:getFrame() == self:getSize() - 1 then
            return true
        else
            return false
        end
end


function IndexedAnimation:setSequence(sequence)
end


function IndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function IndexedAnimation:setState(indexedAnimation)
        self:setFrame(indexedAnimation:getFrame())
        self:setDx(indexedAnimation:getDx())
        self:setDy(indexedAnimation:getDy())
end


function IndexedAnimation:getWidth()
        return 0
end


function IndexedAnimation:getHeight()
        return 0
end

return IndexedAnimation

