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
-- package org.allbinary.graphics.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")

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

local OpenGLESStrings = {}
OpenGLESStrings.__index = OpenGLESStrings
OpenGLESStrings.className = "OpenGLESStrings"

function OpenGLESStrings.new()
    local self = setmetatable({}, OpenGLESStrings)
    return self
end


-- throws Exception
function OpenGLESStrings:set(gl)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:initFont(gl, width, height)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function OpenGLESStrings:update(gl, width, height)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:drawChar(gl, graphics, character, x, y, anchor)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:drawChars(gl, graphics, data, offset, length, x, y, anchor)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:drawString(gl, graphics, string, x, y, anchor)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:drawSubstring(gl, graphics, string, offset, len, x, y, anchor)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:charWidth(ch)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:charsWidth(ch, offset, length)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLESStrings:stringWidth(string)
        error(java_exception("RuntimeException"), 0)
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLESStrings:stringWidth(string, offset, len)
        error(java_exception("RuntimeException"), 0)
end

return OpenGLESStrings

