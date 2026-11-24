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
-- package org.allbinary.media.image

local AndroidImageUtil = {}
package.loaded["org.allbinary.media.image.AndroidImageUtil"] = AndroidImageUtil

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

local Bitmap = java_lazy("android.graphics.Bitmap")
local Canvas = java_lazy("android.graphics.Canvas")
local Color = java_lazy("android.graphics.Color")
local Matrix = java_lazy("android.graphics.Matrix")
local Paint = java_lazy("android.graphics.Paint")
-- local Image = require("javax.microedition.lcdui.Image")
local AndroidImageInterface = java_lazy("org.microemu.android.device.AndroidImageInterface")

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

-- class table AndroidImageUtil is declared before the requires
AndroidImageUtil.__index = AndroidImageUtil
AndroidImageUtil.className = "AndroidImageUtil"
AndroidImageUtil.javaClassName = "org.allbinary.media.image.AndroidImageUtil"

function AndroidImageUtil._jinit(self)
    return self
end

function AndroidImageUtil.new()
    return AndroidImageUtil._jinit(setmetatable({}, AndroidImageUtil))
end


function AndroidImageUtil.getInstance()
        return AndroidImageUtil.instance_f
end


function AndroidImageUtil:paintBitmap(bitmap, originalBitmap, paint)
        bitmap:eraseColor(Color.TRANSPARENT)
        local canvas = Canvas.new()
        canvas:setBitmap(bitmap)
        canvas:drawBitmap(originalBitmap, 0.0, 0.0, paint)
end


function AndroidImageUtil:paint(image, originalImage, paint)
        local androidImage = image
        androidImage:getBitmap():eraseColor(Color.TRANSPARENT)
        local canvas = androidImage:getCanvas()
        local originalAndroidImage = originalImage
        canvas:drawBitmap(originalAndroidImage:getBitmap(), 0.0, 0.0, paint)
end


function AndroidImageUtil:rotate(image, originalImage, matrix, paint)
        local androidImage = image
        androidImage:getBitmap():eraseColor(Color.TRANSPARENT)
        local canvas = androidImage:getCanvas()
        canvas:concat(matrix)
        local originalAndroidImage = originalImage
        canvas:drawBitmap(originalAndroidImage:getBitmap(), 0.0, 0.0, paint)
end

AndroidImageUtil.instance_f = AndroidImageUtil.new()

return AndroidImageUtil

