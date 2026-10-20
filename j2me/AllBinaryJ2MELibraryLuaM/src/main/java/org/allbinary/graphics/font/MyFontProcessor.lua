-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.graphics.font

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyFontProcessor = {}
MyFontProcessor.__index = MyFontProcessor
MyFontProcessor.className = "MyFontProcessor"

function MyFontProcessor.new()
    local self = setmetatable({}, MyFontProcessor)
    return self
end


function MyFontProcessor.defaultCharWidth(font)
        return font:charWidth("C")
end


function MyFontProcessor.defaultStringWidth(font, size)
        return MyFontProcessor.defaultCharWidth(font) * size
end


function MyFontProcessor.getInstance()
        return MyFontProcessor.instance
end


function MyFontProcessor:process(graphics)
end

MyFontProcessor.instance = MyFontProcessor.new()

return MyFontProcessor

