-- Generated Code Do Not Modify
-- package org.allbinary.graphics

-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local Image = require("javax.microedition.lcdui.Image")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PlatformBitmapBase = require("org.allbinary.platform.graphics.PlatformBitmapBase")
local PlatformBitmapBaseFactory = require("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")

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
    self.ARGB_8888 = Config.new(NullUtil.getInstance().NULL_OBJECT)
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
        return OpenGLBitmap.new(NullUtil.getInstance().NULL_OBJECT)
end


-- throws IOException
function OpenGLBitmapFactory:decodeStream(inputStream)
        return OpenGLBitmap.new(NullUtil.getInstance().NULL_OBJECT)
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLBitmapFactory:createBitmap(image)
        return OpenGLBitmap.new(NullUtil.getInstance().NULL_OBJECT)
end

OpenGLBitmapFactory.instance = OpenGLBitmapFactory.new()

return OpenGLBitmapFactory

