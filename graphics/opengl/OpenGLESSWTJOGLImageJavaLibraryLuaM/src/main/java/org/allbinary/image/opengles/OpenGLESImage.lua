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

local GL = java_lazy("javax.microedition.khronos.opengles.GL")
local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local Image = require("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local OpenGLESPostLoadPlatformImage = java_lazy("javax.microedition.lcdui.OpenGLESPostLoadPlatformImage")
local PostLoadImageProcessor = java_lazy("javax.microedition.lcdui.PostLoadImageProcessor")
local GraphicsStrings = java_lazy("org.allbinary.graphics.GraphicsStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PlatformBitmapBase = java_lazy("org.allbinary.platform.graphics.PlatformBitmapBase")
local PlatformBitmapBaseFactory = java_lazy("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformTextureBaseFactory = java_lazy("org.allbinary.platform.opengles.PlatformTextureBaseFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local OpenGLESImageProcessor = java_lazy("org.allbinary.image.opengles.OpenGLESImageProcessor")
local OpenGLESImageProperties = java_lazy("org.allbinary.image.opengles.OpenGLESImageProperties")
local OpenGLESImageTranslate = java_lazy("org.allbinary.image.opengles.OpenGLESImageTranslate")
local OpenGLImageCacheFactory = java_lazy("org.allbinary.image.opengles.OpenGLImageCacheFactory")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

--OpenGLESSWTJOGLImageJavaLibrary
-- class table OpenGLESImage is declared before the requires
OpenGLESImage.__index = OpenGLESImage
OpenGLESImage.className = "OpenGLESImage"
OpenGLESImage.javaClassName = "org.allbinary.image.opengles.OpenGLESImage"
setmetatable(OpenGLESImage, {__index = Image})
OpenGLESImage.java_implements = " OpenGLSurfaceChangedInterface "
OpenGLESImage.java_interfaces = function() return {OpenGLSurfaceChangedInterface} end

function OpenGLESImage:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.textureFactory == nil then self.textureFactory = nil end
    if self.openGLBitmap == nil then self.openGLBitmap = nil end
    self.imageProcessor = OpenGLESImageProcessor.getInstance()
    self.openGLESImageTranslate = OpenGLESImageTranslate.getInstance()
    self.openGLESImageProperties = OpenGLESImageProperties.new()
end


function OpenGLESImage._jinit(self, image, bitmapFactory, textureFactory)
    java_super_init(Image, self, image:getName(), PostLoadImageProcessor.NULL_POST_LOAD_IMAGE_PROCESSOR)
    OpenGLESImage._init_fields(self)
        -- super(...) made self above
        self.openGLBitmap = bitmapFactory:createBitmap(image)
        self.textureFactory = textureFactory
        OpenGLImageCacheFactory.getInstance():init(self)
        self.platformImage = OpenGLESPostLoadPlatformImage.getInstance()
    return self
end

function OpenGLESImage.new(...)
    local self = setmetatable({}, OpenGLESImage)
    OpenGLESImage._jinit(self, ...)
    return self
end


function OpenGLESImage:getHeight()
        return java_int((self.openGLBitmap:getHeight() * self.openGLESImageProperties.scaleY2))
end
java_overload(OpenGLESImage, "getHeight", 0)


function OpenGLESImage:getWidth()
        return java_int((self.openGLBitmap:getWidth() * self.openGLESImageProperties.scaleX2))
end
java_overload(OpenGLESImage, "getWidth", 0)


-- throws Exception
function OpenGLESImage:set(gl)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(OpenGLESImage, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL")) end)


function OpenGLESImage:initTexture(gl)
        if not (OpenGLESImage.texture2dList:contains(self)) then
            OpenGLESImage.texture2dList:add(self)
            local textures = java_typed_array("I", java_new_array(0, 1))
            gl:glEnable(GL10.GL_TEXTURE_2D)
            if not rawequal(self.openGLESImageProperties.textureID, -1) then
                textures[1] = self.openGLESImageProperties.textureID
                gl:glDeleteTextures(1, textures, 0)
            end
            gl:glGenTextures(1, textures, 0)
            self.openGLESImageProperties.textureID = textures[1]
            gl:glBindTexture(GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
            gl:glTexParameterf(GL10.GL_TEXTURE_2D, GL10.GL_TEXTURE_MIN_FILTER, GL10.GL_NEAREST)
            gl:glTexParameterf(GL10.GL_TEXTURE_2D, GL10.GL_TEXTURE_WRAP_S, GL10.GL_CLAMP_TO_EDGE)
            gl:glTexParameterf(GL10.GL_TEXTURE_2D, GL10.GL_TEXTURE_WRAP_T, GL10.GL_CLAMP_TO_EDGE)
            return true
        end
        return false
end
java_overload(OpenGLESImage, "initTexture", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL10")) end)


function OpenGLESImage:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
end
java_overload(OpenGLESImage, "drawRegion", 9, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6, java_a7, java_a8, java_a9) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" and type(java_a5) == "number" and type(java_a6) == "number" and type(java_a7) == "number" and type(java_a8) == "number" and type(java_a9) == "number" end)


function OpenGLESImage:draw(gl, x, y, z)
end
java_overload(OpenGLESImage, "draw", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function OpenGLESImage:getType()
        return OpenGLESImage.TYPE
end
java_overload(OpenGLESImage, "getType", 0)


function OpenGLESImage:toString()
        local graphicsStrings = GraphicsStrings.getInstance()
        return tostring(StringMaker.new():append(self:getName()):append(tostring(Image)):append(graphicsStrings.OPACITY):appendfloat((self.openGLESImageProperties.alphaf + 0.0)))
end
java_overload(OpenGLESImage, "toString", 0)
OpenGLESImage.__tostring = function(self) return self:toString() end

OpenGLESImage.NULL_OPENGL_IMAGE = OpenGLESImage.new(NullImage.NULL_IMAGE, PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY, PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY)
OpenGLESImage.texture2dList = BasicArrayListD.new()
OpenGLESImage.TYPE = 4

return OpenGLESImage

