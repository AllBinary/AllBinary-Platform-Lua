-- Generated Code Do Not Modify
-- package org.allbinary.graphics.font

-- local Font = require("javax.microedition.lcdui.Font")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--OpenGLESBaseJ2MEJavaLibrary
local FontDebugBase = {}
FontDebugBase.__index = FontDebugBase
FontDebugBase.className = "FontDebugBase"

function FontDebugBase:_init_fields()
    self.SET_FONT = "setFont"
end

function FontDebugBase.new()
    local self = setmetatable({}, FontDebugBase)
    self:_init_fields()
    return self
end


function FontDebugBase.getInstance()
        return FontDebugBase.instanceBase
end


function FontDebugBase:debugMetrics(currentFont, convertedTextSize, displayMetrics, stringBuffer)
end


function FontDebugBase:debugDpi(densityDpi, stringBuffer)
end


function FontDebugBase:debugDimension(currentFont, convertedTextSize, longestDimensionTotalPixels, stringBuffer)
end

FontDebugBase.instanceBase = FontDebugBase.new()

return FontDebugBase

