-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.graphics.threed

local SWTJOGLProcessor = {}
package.loaded["org.allbinary.graphics.threed.SWTJOGLProcessor"] = SWTJOGLProcessor

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local MIDlet = require("javax.microedition.midlet.MIDlet")
local Runnable = require("java.lang.Runnable")
local GLHolder = java_lazy("org.allbinary.graphics.threed.GLHolder")
local RatioProcessor = java_lazy("org.allbinary.graphics.threed.RatioProcessor")

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

--SWTWithoutJOGL
-- class table SWTJOGLProcessor is declared before the requires
SWTJOGLProcessor.__index = SWTJOGLProcessor
SWTJOGLProcessor.className = "SWTJOGLProcessor"
SWTJOGLProcessor.javaClassName = "org.allbinary.graphics.threed.SWTJOGLProcessor"
SWTJOGLProcessor.java_implements = " Runnable "
SWTJOGLProcessor.java_interfaces = function() return {Runnable} end

function SWTJOGLProcessor:_init_fields()
    self.glHolder = (function()
        local o = GLHolder.new and GLHolder.new() or setmetatable({}, {__index = GLHolder})
        

        function o:run(renderer)
        end
        java_overload(o, "run", 1)
        return o
    end)()
end

function SWTJOGLProcessor._jinit(self)
    SWTJOGLProcessor._init_fields(self)
    return self
end

function SWTJOGLProcessor.new()
    return SWTJOGLProcessor._jinit(setmetatable({}, SWTJOGLProcessor))
end


function SWTJOGLProcessor.getInstance()
        return SWTJOGLProcessor.instance_f
end


function SWTJOGLProcessor:init(display, comp)
end


function SWTJOGLProcessor:isHolderCreated()
        return self.glHolder.isCreated
end


function SWTJOGLProcessor:setRenderer(renderer)
end


function SWTJOGLProcessor:isJOGL()
        return false
end


function SWTJOGLProcessor:createSurface()
end


function SWTJOGLProcessor:onSurfaceCreated()
end


function SWTJOGLProcessor:onSurfaceChangedForEvent(event)
end


function SWTJOGLProcessor:onSurfaceChanged()
end


function SWTJOGLProcessor:onSurfaceChangedWH(width, height)
end


function SWTJOGLProcessor:addListener()
end


function SWTJOGLProcessor:addListeners(midlet)
end


function SWTJOGLProcessor:run()
end


function SWTJOGLProcessor:clear()
end


function SWTJOGLProcessor:setCustom(width, height, ratio)
end


function SWTJOGLProcessor:setRatioProcessor(ratioProcessor)
end


function SWTJOGLProcessor:charWidth(font, ch)
        error(require("java.lang.RuntimeException").new(), 0)
end


function SWTJOGLProcessor:charsWidth(font, ch, offset, length)
        error(require("java.lang.RuntimeException").new(), 0)
end


function SWTJOGLProcessor:stringWidth(font, str)
        error(require("java.lang.RuntimeException").new(), 0)
end


function SWTJOGLProcessor:substringWidth(font, str, offset, len)
        error(require("java.lang.RuntimeException").new(), 0)
end

SWTJOGLProcessor.instance_f = SWTJOGLProcessor.new()

return SWTJOGLProcessor

