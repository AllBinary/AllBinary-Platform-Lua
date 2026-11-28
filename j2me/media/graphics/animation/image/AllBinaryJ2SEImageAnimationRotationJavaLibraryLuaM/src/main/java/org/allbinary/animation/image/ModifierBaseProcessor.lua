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
-- package org.allbinary.animation.image

local ModifierBaseProcessor = {}
package.loaded["org.allbinary.animation.image.ModifierBaseProcessor"] = ModifierBaseProcessor

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local ImageModifierUtil = java_lazy("org.allbinary.media.image.ImageModifierUtil")

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

-- class table ModifierBaseProcessor is declared before the requires
ModifierBaseProcessor.__index = ModifierBaseProcessor
ModifierBaseProcessor.className = "ModifierBaseProcessor"
ModifierBaseProcessor.javaClassName = "org.allbinary.animation.image.ModifierBaseProcessor"

function ModifierBaseProcessor._jinit(self)
    return self
end

function ModifierBaseProcessor.new()
    return ModifierBaseProcessor._jinit(setmetatable({}, ModifierBaseProcessor))
end


function ModifierBaseProcessor.getInstance()
        return ModifierBaseProcessor.instance_f
end


function ModifierBaseProcessor:updateColor(imageModifierUtil, originalImage, imageToShow, index, basicColor)
end


function ModifierBaseProcessor:updateAlpha(imageModifierUtil, originalImage, imageToShow, index, alpha)
end

ModifierBaseProcessor.instance_f = ModifierBaseProcessor.new()

return ModifierBaseProcessor

