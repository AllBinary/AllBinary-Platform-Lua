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
-- package org.allbinary.game.ag.layer.hud.basic.notification

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationListenerInterface = require("org.allbinary.game.layer.hud.event.GameNotificationListenerInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameNotificationHud = {}
GameNotificationHud.__index = GameNotificationHud
GameNotificationHud.className = "GameNotificationHud"
setmetatable(GameNotificationHud, {__index = BasicHud})

function GameNotificationHud:_init_fields()
    self.METHOD_NAME = "onGameNotificationEvent"
    self.lastGameNotificationEvent = GameNotification.NULL_GAME_NOTIFICATION_EVENT
end


function GameNotificationHud.new(location, direction, bufferZone, basicColor)
    local self = setmetatable(BasicHud.new(location, direction, bufferZone, basicColor), GameNotificationHud)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function GameNotificationHud:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function GameNotificationHud:onGameNotificationEvent(gameNotificationEvent)
        if self.lastGameNotificationEvent ~= gameNotificationEvent then
            self.lastGameNotificationEvent = gameNotificationEvent
            self.logUtil:putF(gameNotificationEvent:getString(), self, self.METHOD_NAME)
        end
        self:add(gameNotificationEvent:getString(), gameNotificationEvent:getSeconds(), gameNotificationEvent:getBasicColorP(), gameNotificationEvent:getPermanent())
end


function GameNotificationHud:add(string, seconds, basicColor, permanent)
end


-- throws Exception
function GameNotificationHud:processTick()
end


function GameNotificationHud:paint(graphics)
end


function GameNotificationHud:clear()
end

GameNotificationHud.NULL_GAME_NOTIFICATION = GameNotificationHud.new(BasicHudFactory.getInstance().TOPCENTER, BasicHudFactory.getInstance().HORIZONTAL, 0, BasicColorFactory.getInstance().RED)

return GameNotificationHud

