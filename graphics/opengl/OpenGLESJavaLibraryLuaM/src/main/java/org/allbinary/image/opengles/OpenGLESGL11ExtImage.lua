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

local OpenGLESGL11ExtImage = {}
package.loaded["org.allbinary.image.opengles.OpenGLESGL11ExtImage"] = OpenGLESGL11ExtImage

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
local GL11 = java_lazy("javax.microedition.khronos.opengles.GL11")
local GL11Ext = java_lazy("javax.microedition.khronos.opengles.GL11Ext")
local Image = java_lazy("javax.microedition.lcdui.Image")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local OpenGLLogUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
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

--Many devices don't support this even though it is supposed to
-- class table OpenGLESGL11ExtImage is declared before the requires
OpenGLESGL11ExtImage.__index = OpenGLESGL11ExtImage
OpenGLESGL11ExtImage.className = "OpenGLESGL11ExtImage"
OpenGLESGL11ExtImage.javaClassName = "org.allbinary.image.opengles.OpenGLESGL11ExtImage"
setmetatable(OpenGLESGL11ExtImage, {__index = OpenGLESImage})

function OpenGLESGL11ExtImage:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.a == nil then self.a = 0 end
    if self.rectangle == nil then self.rectangle = nil end
end


function OpenGLESGL11ExtImage._jinit(self, image, bitmapFactory, textureFactory)
    java_super_init(OpenGLESImage, self, image, bitmapFactory, textureFactory)
    OpenGLESGL11ExtImage._init_fields(self)
        -- super(...) made self above
        self:onDisplayChangeEvent(DisplayInfoSingleton.getInstance().displayChangeEvent)
        self.rectangle = {jt = "I", 0, self:getHeight(), self:getWidth(), -self:getHeight()}
    return self
end

function OpenGLESGL11ExtImage.new(...)
    local self = setmetatable({}, OpenGLESGL11ExtImage)
    OpenGLESGL11ExtImage._jinit(self, ...)
    return self
end


function OpenGLESGL11ExtImage:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onResize")
            self.a = DisplayInfoSingleton.getInstance():getLastHeight() - self:getHeight()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onResize", e)
        end
end
java_overload(OpenGLESGL11ExtImage, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


function OpenGLESGL11ExtImage:set(gl)
        self:onDisplayChangeEvent(DisplayInfoSingleton.getInstance().displayChangeEvent)
        local gl11 = gl
        if java_super(OpenGLESImage, "initTexture", 1)(self, gl11) then
            self.textureFactory:load(gl11, GL10.GL_TEXTURE_2D, 0, self, 0, true)
            gl11:glTexParameteriv(GL10.GL_TEXTURE_2D, GL11Ext.GL_TEXTURE_CROP_RECT_OES, self.rectangle, 0)
            gl11:glDisable(GL10.GL_TEXTURE_2D)
            OpenGLLogUtil.getInstance():logError(gl11, self)
        end
end
java_overload(OpenGLESGL11ExtImage, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL")) end)


function OpenGLESGL11ExtImage:draw(gl, x, y, z)
        gl:glEnable(GL10.GL_TEXTURE_2D)
        gl:glBindTexture(GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
        local gl11Ext = gl
        gl11Ext:glDrawTexfOES((x + 0.0), ((self.a - y) + 0.0), (z + 0.0), (self:getWidth() + 0.0), (self:getHeight() + 0.0))
        gl:glDisable(GL10.GL_TEXTURE_2D)
end
java_overload(OpenGLESGL11ExtImage, "draw", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)

return OpenGLESGL11ExtImage

