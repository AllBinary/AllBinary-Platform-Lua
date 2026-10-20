-- Generated Code Do Not Modify
-- package org.allbinary.graphics

-- local InputStream = require("java.io.InputStream")
-- local Image = require("javax.microedition.lcdui.Image")
local Bitmap = require("android.graphics.Bitmap")
local BitmapFactory = require("android.graphics.BitmapFactory")
-- local IOException = require("java.io.IOException")
local PlatformBitmapBaseFactory = require("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformBitmapBase = require("org.allbinary.platform.graphics.PlatformBitmapBase")
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

local OpenGLBitmapFactory = {}
OpenGLBitmapFactory.__index = OpenGLBitmapFactory
OpenGLBitmapFactory.className = "OpenGLBitmapFactory"
setmetatable(OpenGLBitmapFactory, {__index = PlatformBitmapBaseFactory})
local Config = {}
    Config.__index = Config
    Config.className = "Config"
    OpenGLBitmapFactory.Config = Config

    function Config:_init_fields()
        self.bitmapConfig = nil
    end
    

    function OpenGLBitmapFactory.new(bitmapConfig)
        local self = setmetatable({}, OpenGLBitmapFactory)
        self:_init_fields()
            self.bitmapConfig = bitmapConfig
        return self
    end


function OpenGLBitmapFactory:_init_fields()
    self.ARGB_8888 = Config.new(Bitmap.Config.ARGB_8888)
end

function OpenGLBitmapFactory.new()
    local self = setmetatable(PlatformBitmapBaseFactory.new(), OpenGLBitmapFactory)
    self:_init_fields()
    return self
end


function OpenGLBitmapFactory.getInstance()
        return OpenGLBitmapFactory.instance
end


function OpenGLBitmapFactory:createBitmap(width, height, config)
        return OpenGLBitmap.new(Bitmap.createBitmap(width, height, config.bitmapConfig))
end


-- throws IOException
function OpenGLBitmapFactory:decodeStream(inputStream)
        return OpenGLBitmap.new(BitmapFactory.decodeStream(inputStream))
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLBitmapFactory:createBitmap(image)
        return OpenGLBitmap.new((image):getBitmap())
end

OpenGLBitmapFactory.instance = OpenGLBitmapFactory.new()

return OpenGLBitmapFactory

