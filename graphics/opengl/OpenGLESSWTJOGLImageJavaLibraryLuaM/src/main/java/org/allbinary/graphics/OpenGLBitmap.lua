-- Generated Code Do Not Modify
-- package org.allbinary.graphics

-- local Image = require("javax.microedition.lcdui.Image")
local DisposalUtil = require("org.allbinary.DisposalUtil")
local PlatformBitmapBase = require("org.allbinary.platform.graphics.PlatformBitmapBase")
local SwtImmutableImage = require("org.microemu.device.swt.SwtImmutableImage")
local SwtMutableImage = require("org.microemu.device.swt.SwtMutableImage")

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
    self.image = nil
end


function OpenGLBitmap.new(bitmap)
    local self = setmetatable(PlatformBitmapBase.new(), OpenGLBitmap)
    self:_init_fields()
        self.image = bitmap
    return self
end


function OpenGLBitmap:getImage()
        return self.image
end


function OpenGLBitmap:getDepth()
        if self.image:isMutable() then
            local mutableImage = self.image
            return mutableImage:getDepth()
        else
            local immutableImage = self.image
            return immutableImage:getDepth()
        end
end


function OpenGLBitmap:getPixels(pixels, offset, stride, x, y, width, height)
        if self.image:isMutable() then
            local mutableImage = self.image
            mutableImage:getRGB(pixels, offset, stride, x, y, width, height)
        else
            local immutableImage = self.image
            immutableImage:getRGB(pixels, offset, stride, x, y, width, height)
        end
end


function OpenGLBitmap:setPixels(pixels, offset, stride, x, y, width, height)
        self.image:setRGB2(pixels, offset, height, x, y, width, height)
end


function OpenGLBitmap:getWidth()
        return self.image:getWidth()
end


function OpenGLBitmap:getHeight()
        return self.image:getHeight()
end


function OpenGLBitmap:recycle()
        DisposalUtil.getInstance():disposeImage(self.image)
end

return OpenGLBitmap

