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

-- local InputStream = require("java.io.InputStream")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local NullGL10 = require("org.allbinary.device.NullGL10")
local AllBinaryRendererBase3 = require("org.allbinary.graphics.opengles.renderer.AllBinaryRendererBase3")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ImageCache = require("org.allbinary.image.ImageCache")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local PreResourceImageUtil = require("org.allbinary.image.PreResourceImageUtil")
local SynchObject = require("org.allbinary.thread.SynchObject")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ImageCacheOpenGLESJavaLibrary
local OpenGLImageCache = {}
OpenGLImageCache.__index = OpenGLImageCache
OpenGLImageCache.className = "OpenGLImageCache"
setmetatable(OpenGLImageCache, {__index = ImageCache})

function OpenGLImageCache:_init_fields()
    self.imageCache = ImageCacheFactory.getInstance()
    self.preResourceImageUtil = PreResourceImageUtil.getInstance()
    self.gl = NullGL10.NULL_GL10
    self.lock = SynchObject.new()
    self.list = BasicArrayListD.new()
    self.renderer = AllBinaryRendererBase3.new()
end


function OpenGLImageCache.new()
    local self = setmetatable(ImageCache.new(), OpenGLImageCache)
    self:_init_fields()
    return self
end


function OpenGLImageCache:addListener(renderer)
        self.renderer = renderer
end


-- throws Exception
function OpenGLImageCache:update(gl)
        self.gl = gl
        do -- synchronized (self.lock)
            for index = self.list:size() - 1, 0, -1 do
                local openGLESImage = (self.list.objectArray[index + 1])
                if openGLESImage ~= OpenGLESImage.NULL_OPENGL_IMAGE then
                    openGLESImage:set(gl)
                end
            end
        end
end


-- throws Exception
function OpenGLImageCache:createImage(caller, width, height)
        local textureSize = width
        if height > width then
            textureSize = height
        end
        while (math.fmod(textureSize, 4)) ~= 0 do
            textureSize = textureSize + 1
        end
        width = textureSize
        height = textureSize
        local image2 = self.imageCache:get(caller, width, height)
        local image = self.preResourceImageUtil:encapsulate(image2)
        do -- synchronized (self.lock)
            if image ~= NullImage.NULL_IMAGE then
                self.list:add(image)
            end
        end
        return image
end


-- throws Exception
function OpenGLImageCache:createImageFromInputStream(key, inputStream)
        local cachedImage = self.imageCache:getWithKey(key)
        local image = self.preResourceImageUtil:encapsulate(cachedImage)
        do -- synchronized (self.lock)
            if image ~= NullImage.NULL_IMAGE then
                self.list:add(image)
            end
        end
        return image
end


function OpenGLImageCache:getGlP()
        return self.gl
end


function OpenGLImageCache:init(image)
        local try_ok, try_error = pcall(function()
            do -- synchronized (self.lock)
                if self.list:contains(image) then
                    error(java_exception("RuntimeException"), 0)
                end
                self.list:add(image)
            end
            self.renderer:add(image)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end

return OpenGLImageCache

