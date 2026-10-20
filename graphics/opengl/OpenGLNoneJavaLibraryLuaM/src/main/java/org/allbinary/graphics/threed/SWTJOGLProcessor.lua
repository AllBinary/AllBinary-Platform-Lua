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

-- local Font = require("javax.microedition.lcdui.Font")
-- local MIDlet = require("javax.microedition.midlet.MIDlet")
-- java.lang.Runnable has no Lua module
local Runnable = {}

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

--OpenGLNone
local SWTJOGLProcessor = {}
SWTJOGLProcessor.__index = SWTJOGLProcessor
SWTJOGLProcessor.className = "SWTJOGLProcessor"

function SWTJOGLProcessor.new()
    local self = setmetatable({}, SWTJOGLProcessor)
    return self
end


function SWTJOGLProcessor.getInstance()
        return SWTJOGLProcessor.instance
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
        error(java_exception("RuntimeException"), 0)
end


function SWTJOGLProcessor:charsWidth(font, ch, offset, length)
        error(java_exception("RuntimeException"), 0)
end


function SWTJOGLProcessor:stringWidth(font, str)
        error(java_exception("RuntimeException"), 0)
end


function SWTJOGLProcessor:substringWidth(font, str, offset, len)
        error(java_exception("RuntimeException"), 0)
end

SWTJOGLProcessor.instance = SWTJOGLProcessor.new()

return SWTJOGLProcessor

