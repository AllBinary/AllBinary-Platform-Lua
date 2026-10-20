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
-- package org.allbinary.animation.caption

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CaptionAnimationHelperBase = {}
CaptionAnimationHelperBase.__index = CaptionAnimationHelperBase
CaptionAnimationHelperBase.className = "CaptionAnimationHelperBase"
setmetatable(CaptionAnimationHelperBase, {__index = Animation})

function CaptionAnimationHelperBase.new()
    local self = setmetatable(Animation.new(), CaptionAnimationHelperBase)
    return self
end


function CaptionAnimationHelperBase:isShowing()
        return false
end


function CaptionAnimationHelperBase:tick()
end


function CaptionAnimationHelperBase:update(message, basicColor)
end


function CaptionAnimationHelperBase:paintXY(graphics, x, y)
end

CaptionAnimationHelperBase.INSTANCE = CaptionAnimationHelperBase.new()

return CaptionAnimationHelperBase

