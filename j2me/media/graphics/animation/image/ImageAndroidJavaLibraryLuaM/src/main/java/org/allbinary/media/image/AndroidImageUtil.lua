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

local Bitmap = require("android.graphics.Bitmap")
local Canvas = require("android.graphics.Canvas")
local Color = require("android.graphics.Color")
local Matrix = require("android.graphics.Matrix")
local Paint = require("android.graphics.Paint")
-- local Image = require("javax.microedition.lcdui.Image")
local AndroidImageInterface = require("org.microemu.android.device.AndroidImageInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidImageUtil = {}
AndroidImageUtil.__index = AndroidImageUtil
AndroidImageUtil.className = "AndroidImageUtil"

function AndroidImageUtil.new()
    local self = setmetatable({}, AndroidImageUtil)
    return self
end


function AndroidImageUtil.getInstance()
        return AndroidImageUtil.instance
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

AndroidImageUtil.instance = AndroidImageUtil.new()

return AndroidImageUtil

