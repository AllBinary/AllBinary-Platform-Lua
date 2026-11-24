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

local Animation = {}
package.loaded["org.allbinary.animation.Animation"] = Animation

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

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = java_lazy("org.allbinary.graphics.color.BasicColorSetUtil")
local OpenGLSurfaceChangedInterface = java_lazy("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local AnimationInterface = require("org.allbinary.animation.AnimationInterface")

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

-- class table Animation is declared before the requires
Animation.__index = Animation
Animation.className = "Animation"
Animation.javaClassName = "org.allbinary.animation.Animation"
Animation.java_implements = " AnimationInterface OpenGLSurfaceChangedInterface "
Animation.java_interfaces = function() return {AnimationInterface, OpenGLSurfaceChangedInterface} end

function Animation:_init_fields()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    if self.colorP == nil then self.colorP = 0 end
    self.changeBasicColorP = BasicColorFactory.getInstance().NULL_COLOR
    if self.changeColorP == nil then self.changeColorP = 0 end
    if self.alphaP == nil then self.alphaP = 0 end
end


function Animation._jinit(self)
    Animation._init_fields(self)
    return self
end

function Animation.new(...)
    local self = setmetatable({}, Animation)
    Animation._jinit(self, ...)
    return self
end


function Animation:setAlpha(alpha)
        self.alphaP = alpha
end


-- throws Exception
function Animation:nextFrame()
end


function Animation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
end


function Animation:paintThreedXYZ(graphics, x, y, z)
end


function Animation:isThreed()
        return false
end


function Animation:getBasicColorP()
        return self.basicColor
end


function Animation:setBasicColorP(basicColor)
        self.basicColor = basicColor
        self.colorP = math.tointeger(self.basicColor // 1)
end


function Animation:setBackgroundBasicColorP(basicColor)
end


function Animation:getChangeBasicColor()
        return self.changeBasicColorP
end


function Animation:changeBasicColor(basicColor)
        self.changeBasicColorP = basicColor
        self.changeColorP = math.tointeger(self.changeBasicColorP // 1)
end


function Animation:getChangeColor()
        return self.changeColorP
end


function Animation:getColor()
        return self.colorP
end


function Animation:setScale(scaleX, scaleY)
end


function Animation:setMaxScale(maxScaleX, maxScaleY)
end


-- throws Exception
function Animation:set(gl)
end


function Animation:setDx(dx)
end


function Animation:getDx()
        return 0
end


function Animation:setDy(dy)
end


function Animation:getDy()
        return 0
end

return Animation

