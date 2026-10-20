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
-- package org.allbinary.graphics


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScreenListenerHandler = {}
ScreenListenerHandler.__index = ScreenListenerHandler
ScreenListenerHandler.className = "ScreenListenerHandler"

function ScreenListenerHandler:_init_fields()
    self.screenListenerInterface = ScreenEmptyListener.new()
end

function ScreenListenerHandler.new()
    local self = setmetatable({}, ScreenListenerHandler)
    self:_init_fields()
    return self
end


function ScreenListenerHandler.getInstance()
        return ScreenListenerHandler.instance
end


function ScreenListenerHandler:setListener(screenListenerInterface)
        self.screenListenerInterface = screenListenerInterface
end


function ScreenListenerHandler:fireWithState(isFullScreen)
        self.screenListenerInterface:onFullScreen(isFullScreen)
end


function ScreenListenerHandler:fire()
        self.screenListenerInterface:onFullScreenDisplay()
end

ScreenListenerHandler.instance = ScreenListenerHandler.new()

return ScreenListenerHandler

