-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.displayable.canvas

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryGameCanvasInterface = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface")

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

local NullAllBinaryGameCanvas = {}
NullAllBinaryGameCanvas.__index = NullAllBinaryGameCanvas
NullAllBinaryGameCanvas.className = "NullAllBinaryGameCanvas"

function NullAllBinaryGameCanvas.new()
    local self = setmetatable({}, NullAllBinaryGameCanvas)
    return self
end


function NullAllBinaryGameCanvas:getLayerManager()
        error(java_exception("RuntimeException"), 0)
end


function NullAllBinaryGameCanvas:addCommand(cmd)
        error(java_exception("RuntimeException"), 0)
end


function NullAllBinaryGameCanvas:getHeight()
        error(java_exception("RuntimeException"), 0)
end


function NullAllBinaryGameCanvas:getWidth()
        error(java_exception("RuntimeException"), 0)
end


function NullAllBinaryGameCanvas:removeCommand(cmd)
        error(java_exception("RuntimeException"), 0)
end


function NullAllBinaryGameCanvas:setCommandListener(l)
        error(java_exception("RuntimeException"), 0)
end

NullAllBinaryGameCanvas.NULL_ALLBINARY_GAME_CANVAS = NullAllBinaryGameCanvas.new()

return NullAllBinaryGameCanvas

