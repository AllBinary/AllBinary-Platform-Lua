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
-- package org.allbinary.image.opengles

local OpenGLESImage = {}
package.loaded["org.allbinary.image.opengles.OpenGLESImage"] = OpenGLESImage

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
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local PlatformBitmapBase = java_lazy("org.allbinary.platform.graphics.PlatformBitmapBase")
local PlatformBitmapBaseFactory = java_lazy("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformTextureBaseFactory = java_lazy("org.allbinary.platform.opengles.PlatformTextureBaseFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local OpenGLESImageProperties = java_lazy("org.allbinary.image.opengles.OpenGLESImageProperties")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

--OpenGLESNullImageJ2MEJavaLibrary
-- class table OpenGLESImage is declared before the requires
OpenGLESImage.__index = OpenGLESImage
OpenGLESImage.className = "OpenGLESImage"
OpenGLESImage.javaClassName = "org.allbinary.image.opengles.OpenGLESImage"
OpenGLESImage.java_implements = " OpenGLSurfaceChangedInterface "
OpenGLESImage.java_interfaces = function() return {OpenGLSurfaceChangedInterface} end

function OpenGLESImage:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    if self.textureFactory == nil then self.textureFactory = nil end
    if self.openGLBitmap == nil then self.openGLBitmap = nil end
    self.openGLESImageProperties = OpenGLESImageProperties.new()
end


function OpenGLESImage._jinit(self, image, bitmapFactory, textureFactory)
    OpenGLESImage._init_fields(self)
        self.openGLBitmap = bitmapFactory:createBitmap(image)
        self.textureFactory = textureFactory
    return self
end

function OpenGLESImage.new(...)
    local self = setmetatable({}, OpenGLESImage)
    OpenGLESImage._jinit(self, ...)
    return self
end


-- throws Exception
function OpenGLESImage:set(gl)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


function OpenGLESImage:initTexture(gl)
        return false
end


function OpenGLESImage:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
end


function OpenGLESImage:draw(gl, x, y, z)
end


function OpenGLESImage:getType()
        return OpenGLESImage.TYPE
end

OpenGLESImage.NULL_OPENGL_IMAGE = OpenGLESImage.new(NullImage.NULL_IMAGE, PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY, PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY)
OpenGLESImage.texture2dList = BasicArrayListD.new()
OpenGLESImage.TYPE = 4

return OpenGLESImage

