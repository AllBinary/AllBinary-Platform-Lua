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

local Font = java_lazy("javax.microedition.lcdui.Font")
local MIDlet = java_lazy("javax.microedition.midlet.MIDlet")
local Runnable = require("java.lang.Runnable")
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

--OpenGLNone
-- class table SWTJOGLProcessor is declared before the requires
SWTJOGLProcessor.__index = SWTJOGLProcessor
SWTJOGLProcessor.className = "SWTJOGLProcessor"
SWTJOGLProcessor.javaClassName = "org.allbinary.graphics.threed.SWTJOGLProcessor"
SWTJOGLProcessor.java_implements = " Runnable "
SWTJOGLProcessor.java_interfaces = function() return {Runnable} end

function SWTJOGLProcessor._jinit(self)
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
        return true
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


function SWTJOGLProcessor:isPortraitRatioProcessor()
        return true
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

