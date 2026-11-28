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

local OpenGLESGL11VBOImage = {}
package.loaded["org.allbinary.image.opengles.OpenGLESGL11VBOImage"] = OpenGLESGL11VBOImage

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

-- local ByteBuffer = require("java.nio.ByteBuffer")
-- local ByteOrder = require("java.nio.ByteOrder")
-- local FloatBuffer = require("java.nio.FloatBuffer")
local GL = java_lazy("javax.microedition.khronos.opengles.GL")
local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local Image = java_lazy("javax.microedition.lcdui.Image")
local OpenGLLogUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLLogUtil")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GLUtil = java_lazy("org.allbinary.opengles.GLUtil")
local PlatformBitmapBaseFactory = java_lazy("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformTextureBaseFactory = java_lazy("org.allbinary.platform.opengles.PlatformTextureBaseFactory")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

--This is not actually VBO impl
-- class table OpenGLESGL11VBOImage is declared before the requires
OpenGLESGL11VBOImage.__index = OpenGLESGL11VBOImage
OpenGLESGL11VBOImage.className = "OpenGLESGL11VBOImage"
OpenGLESGL11VBOImage.javaClassName = "org.allbinary.image.opengles.OpenGLESGL11VBOImage"
setmetatable(OpenGLESGL11VBOImage, {__index = OpenGLESImage})

function OpenGLESGL11VBOImage:_init_fields()
    self.glUtil = GLUtil.getInstance()
    self.textureVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2):order(ByteOrder.nativeOrder()):asFloatBuffer()
    self.regionRectangleFloatArray = {jt = "F", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
    self.regionRectangleVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 3):order(ByteOrder.nativeOrder()):asFloatBuffer()
    self.regionTextureRectangleFloatArray = java_typed_array("F", java_new_array(0.0, 8))
    self.regionTextureVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2):order(ByteOrder.nativeOrder()):asFloatBuffer()
end


function OpenGLESGL11VBOImage._jinit(self, image, bitmapFactory, textureFactory)
    java_super_init(OpenGLESImage, self, image, bitmapFactory, textureFactory)
    OpenGLESGL11VBOImage._init_fields(self)
        -- super(...) made self above
        self:initVertices()
        self.regionRectangleVertexFloatBuffer:put(FloatBuffer.wrap(self.regionRectangleFloatArray))
        self.regionTextureVertexFloatBuffer:put(FloatBuffer.wrap(self.regionTextureRectangleFloatArray))
    return self
end

function OpenGLESGL11VBOImage.new(...)
    local self = setmetatable({}, OpenGLESGL11VBOImage)
    OpenGLESGL11VBOImage._jinit(self, ...)
    return self
end


function OpenGLESGL11VBOImage:initVertices()
        self.textureVertexFloatBuffer:put(0.0)
        self.textureVertexFloatBuffer:put(1.0)
        self.textureVertexFloatBuffer:put(1.0)
        self.textureVertexFloatBuffer:put(1.0)
        self.textureVertexFloatBuffer:put(0.0)
        self.textureVertexFloatBuffer:put(0.0)
        self.textureVertexFloatBuffer:put(1.0)
        self.textureVertexFloatBuffer:put(0.0)
        self.textureVertexFloatBuffer:rewind()
end
java_overload(OpenGLESGL11VBOImage, "initVertices", 0)


function OpenGLESGL11VBOImage:set(gl)
        local gl10 = gl
        if java_super(OpenGLESImage, "initTexture", 1)(self, gl10) then
            self.textureFactory:load(gl10, GL10.GL_TEXTURE_2D, 0, self, 0, true)
            gl10:glDisable(GL10.GL_TEXTURE_2D)
            OpenGLLogUtil.getInstance():logError(gl10, self)
        end
end
java_overload(OpenGLESGL11VBOImage, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL")) end)


function OpenGLESGL11VBOImage:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
        self.regionRectangleFloatArray[1] = (x + 0.0)
        self.regionRectangleFloatArray[8] = (viewHeight - y + 0.0)
        self.regionRectangleFloatArray[2] = self.regionRectangleFloatArray[8] - height
        self.regionRectangleFloatArray[4] = (x + 0.0) + width
        self.regionRectangleFloatArray[5] = self.regionRectangleFloatArray[2]
        self.regionRectangleFloatArray[7] = (x + 0.0)
        self.regionRectangleFloatArray[10] = self.regionRectangleFloatArray[4]
        self.regionRectangleFloatArray[11] = self.regionRectangleFloatArray[8]
        self.regionTextureRectangleFloatArray[1] = x_src / self:getWidth()
        self.regionTextureRectangleFloatArray[2] = (y_src + height) / self:getHeight()
        self.regionTextureRectangleFloatArray[3] = (x_src + width) / self:getWidth()
        self.regionTextureRectangleFloatArray[4] = self.regionTextureRectangleFloatArray[2]
        self.regionTextureRectangleFloatArray[5] = self.regionTextureRectangleFloatArray[1]
        self.regionTextureRectangleFloatArray[6] = y_src / self:getHeight()
        self.regionTextureRectangleFloatArray[7] = self.regionTextureRectangleFloatArray[3]
        self.regionTextureRectangleFloatArray[8] = self.regionTextureRectangleFloatArray[6]
        self.glUtil:position(self.regionRectangleVertexFloatBuffer, 0)
        gl:glVertexPointer(3, GL10.GL_FLOAT, 0, self.regionRectangleVertexFloatBuffer)
        gl:glEnableClientState(GL10.GL_VERTEX_ARRAY)
        gl:glEnable(GL10.GL_TEXTURE_2D)
        gl:glBindTexture(GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
        gl:glEnableClientState(GL10.GL_TEXTURE_COORD_ARRAY)
        self.glUtil:position(self.regionTextureVertexFloatBuffer, 0)
        gl:glTexCoordPointer(2, GL10.GL_FLOAT, 0, self.regionTextureVertexFloatBuffer)
        gl:glDrawArrays(GL10.GL_TRIANGLE_STRIP, 0, 4)
        gl:glDisableClientState(GL10.GL_VERTEX_ARRAY)
        gl:glDisableClientState(GL10.GL_TEXTURE_COORD_ARRAY)
        gl:glDisable(GL10.GL_TEXTURE_2D)
end
java_overload(OpenGLESGL11VBOImage, "drawRegion", 9, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6, java_a7, java_a8, java_a9) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" and type(java_a5) == "number" and type(java_a6) == "number" and type(java_a7) == "number" and type(java_a8) == "number" and type(java_a9) == "number" end)


function OpenGLESGL11VBOImage:draw(gl, x, y, z)
        self.regionRectangleFloatArray[1] = (x + 0.0)
        self.regionRectangleFloatArray[8] = ((DisplayInfoSingleton.getInstance():getLastHeight() - y) + 0.0)
        self.regionRectangleFloatArray[2] = self.regionRectangleFloatArray[8] - self:getHeight()
        self.regionRectangleFloatArray[4] = ((x + self:getWidth()) + 0.0)
        self.regionRectangleFloatArray[5] = self.regionRectangleFloatArray[2]
        self.regionRectangleFloatArray[7] = (x + 0.0)
        self.regionRectangleFloatArray[10] = self.regionRectangleFloatArray[4]
        self.regionRectangleFloatArray[11] = self.regionRectangleFloatArray[8]
        self.glUtil:position(self.regionRectangleVertexFloatBuffer, 0)
        gl:glVertexPointer(3, GL10.GL_FLOAT, 0, self.regionRectangleVertexFloatBuffer)
        gl:glEnableClientState(GL10.GL_VERTEX_ARRAY)
        gl:glEnable(GL10.GL_TEXTURE_2D)
        gl:glBindTexture(GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
        gl:glEnableClientState(GL10.GL_TEXTURE_COORD_ARRAY)
        self.glUtil:position(self.textureVertexFloatBuffer, 0)
        gl:glTexCoordPointer(2, GL10.GL_FLOAT, 0, self.textureVertexFloatBuffer)
        gl:glDrawArrays(GL10.GL_TRIANGLE_STRIP, 0, 4)
        gl:glDisableClientState(GL10.GL_VERTEX_ARRAY)
        gl:glDisableClientState(GL10.GL_TEXTURE_COORD_ARRAY)
        gl:glDisable(GL10.GL_TEXTURE_2D)
end
java_overload(OpenGLESGL11VBOImage, "draw", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)

return OpenGLESGL11VBOImage

