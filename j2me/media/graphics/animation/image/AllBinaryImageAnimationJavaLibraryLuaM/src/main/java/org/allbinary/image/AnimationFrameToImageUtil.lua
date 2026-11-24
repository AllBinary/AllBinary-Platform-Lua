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
-- package org.allbinary.image

local AnimationFrameToImageUtil = {}
package.loaded["org.allbinary.image.AnimationFrameToImageUtil"] = AnimationFrameToImageUtil

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local Animation = java_lazy("org.allbinary.animation.Animation")

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

-- class table AnimationFrameToImageUtil is declared before the requires
AnimationFrameToImageUtil.__index = AnimationFrameToImageUtil
AnimationFrameToImageUtil.className = "AnimationFrameToImageUtil"
AnimationFrameToImageUtil.javaClassName = "org.allbinary.image.AnimationFrameToImageUtil"

function AnimationFrameToImageUtil._jinit(self)
    return self
end

function AnimationFrameToImageUtil.new()
    return AnimationFrameToImageUtil._jinit(setmetatable({}, AnimationFrameToImageUtil))
end


function AnimationFrameToImageUtil.getInstance()
        return AnimationFrameToImageUtil.instance_f
end


-- throws Exception
function AnimationFrameToImageUtil:getInstanceTranslate(width, height, animationInterface)
        local image = GameFeatureImageCacheFactory.getInstance():get((getmetatable(AnimationFrameToImageUtil.instance_f).javaClassName or getmetatable(AnimationFrameToImageUtil.instance_f).className), ((((width * 3)) // (1 << (1)))), ((((height * 3)) // (1 << (1)))))
        local graphics = image:getGraphics()
        local tranlateX = (((width) // (1 << (2))))
        local tranlateY = (((height) // (1 << (2))))
        graphics:translate(tranlateX, tranlateY)
        animationInterface:paintXY(graphics, 0, 0)
        graphics:translate(-tranlateX, -tranlateY)
        return image
end


-- throws Exception
function AnimationFrameToImageUtil:getInstanceWH(width, height, animationInterface)
        local image = GameFeatureImageCacheFactory.getInstance():get((getmetatable(AnimationFrameToImageUtil.instance_f).javaClassName or getmetatable(AnimationFrameToImageUtil.instance_f).className), width, height)
        local graphics = image:getGraphics()
        animationInterface:paintXY(graphics, 0, 0)
        return image
end

AnimationFrameToImageUtil.instance_f = AnimationFrameToImageUtil.new()

return AnimationFrameToImageUtil

