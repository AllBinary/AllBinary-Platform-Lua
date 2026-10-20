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
-- package org.allbinary.animation.image.sprite

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ColorCompositeInterface = require("org.allbinary.graphics.color.ColorCompositeInterface")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")

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

local SpriteIndexedAnimation = {}
SpriteIndexedAnimation.__index = SpriteIndexedAnimation
SpriteIndexedAnimation.className = "SpriteIndexedAnimation"
setmetatable(SpriteIndexedAnimation, {__index = IndexedAnimation})

function SpriteIndexedAnimation:_init_fields()
    self.sprite = nil
    self.image = nil
    self.basicColorArray = nil
end


function SpriteIndexedAnimation.new(sprite, image, basicColorArray, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), SpriteIndexedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.sprite = sprite
        self.image = image
        self.basicColorArray = basicColorArray
        if (self.basicColorArray.n or #self.basicColorArray) ~= 0 and self:getSize() ~= (self.basicColorArray.n or #self.basicColorArray) then
            error(java_exception("Exception", tostring(StringMaker.new():append(CommonLabels.getInstance().TOTAL_LABEL):appendint(self:getSize()):append("!="):appendint((self.basicColorArray.n or #self.basicColorArray)))), 0)
        end
    return self
end


-- throws Exception
function SpriteIndexedAnimation:getAnimationSize()
        return self:getSize()
end


function SpriteIndexedAnimation:setBasicColorP(basicColor)
        for index = 0, (self.basicColorArray.n or #self.basicColorArray) - 1 do
            if basicColor == self.basicColorArray[index + 1] then
                self:setFrame(index)
                break
            end
        end
end


function SpriteIndexedAnimation:getBasicColorP()
        if (self.basicColorArray.n or #self.basicColorArray) < self:getFrame() then
            return self.basicColorArray[self:getFrame() + 1]
        else
            return BasicColorFactory.getInstance().WHITE
        end
end


function SpriteIndexedAnimation:paintFrame(graphics, frame, x, y)
        self:setFrame(frame)
        self.sprite:setPosition(x, y)
        self.sprite:paint(graphics)
end


function SpriteIndexedAnimation:paintXY(graphics, x, y)
        self.sprite:setPosition(x, y)
        self.sprite:paint(graphics)
end


function SpriteIndexedAnimation:paint(graphics)
        self.sprite:paint(graphics)
end


function SpriteIndexedAnimation:nextFrame()
        self.sprite:nextFrame()
end


function SpriteIndexedAnimation:previousFrame()
        self.sprite:prevFrame()
end


function SpriteIndexedAnimation:getSize()
        return self.sprite:getRawFrameCount()
end


function SpriteIndexedAnimation:setFrame(frame)
        self.sprite:setFrame(frame)
end


function SpriteIndexedAnimation:getFrame()
        return self.sprite:getFrame()
end


function SpriteIndexedAnimation:isLastFrame()
        if self.sprite:getFrame() == self:getSize() - 1 then
            return true
        else
            return false
        end
end


function SpriteIndexedAnimation:getLastFrame()
        return self:getSize()
end


function SpriteIndexedAnimation:setSequence(sequence)
end


function SpriteIndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


-- throws Exception
function SpriteIndexedAnimation:close()
end


-- throws Throwable
function SpriteIndexedAnimation:finalize()
end

return SpriteIndexedAnimation

