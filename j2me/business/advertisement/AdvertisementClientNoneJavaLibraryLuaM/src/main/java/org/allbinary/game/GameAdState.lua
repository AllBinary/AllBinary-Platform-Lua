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
-- package org.allbinary.game

local GameAdStateBase = require("org.allbinary.business.advertisement.GameAdStateBase")
local AdConfiguration = require("org.allbinary.business.advertisement.AdConfiguration")
local VirtualKeyboardEvent = require("org.allbinary.input.event.VirtualKeyboardEvent")
local VirtualKeyboardEventHandler = require("org.allbinary.input.event.VirtualKeyboardEventHandler")
local VirtualKeyboardEventListenerInterface = require("org.allbinary.input.event.VirtualKeyboardEventListenerInterface")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameAdState = {}
GameAdState.__index = GameAdState
GameAdState.className = "GameAdState"
setmetatable(GameAdState, {__index = GameAdStateBase})


function GameAdState.new(adConfiguration)
    local self = setmetatable(GameAdStateBase.new(adConfiguration), GameAdState)
        -- super(...) made self above
        VirtualKeyboardEventHandler.getInstance():addListenerInterface(self)
    return self
end


-- throws Exception
function GameAdState:onVirtualKeyboardEvent(virtualKeyboardEvent)
end


function GameAdState:onEvent(eventObject)
        GameAdStateBase.onEvent(self, eventObject)
end

return GameAdState

