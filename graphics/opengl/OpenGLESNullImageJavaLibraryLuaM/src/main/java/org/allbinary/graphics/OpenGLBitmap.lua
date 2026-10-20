-- Generated Code Do Not Modify
-- package org.allbinary.graphics

local PlatformBitmapBase = require("org.allbinary.platform.graphics.PlatformBitmapBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLBitmap = {}
OpenGLBitmap.__index = OpenGLBitmap
OpenGLBitmap.className = "OpenGLBitmap"
setmetatable(OpenGLBitmap, {__index = PlatformBitmapBase})

function OpenGLBitmap:_init_fields()
    self.bitmap = nil
end


function OpenGLBitmap.new(bitmap)
    local self = setmetatable(PlatformBitmapBase.new(), OpenGLBitmap)
    self:_init_fields()
        self.bitmap = bitmap
    return self
end


function OpenGLBitmap:getPixels(pixels, offset, stride, x, y, width, height)
end


function OpenGLBitmap:setPixels(pixels, offset, stride, x, y, width, height)
end


function OpenGLBitmap:recycle()
end

return OpenGLBitmap

