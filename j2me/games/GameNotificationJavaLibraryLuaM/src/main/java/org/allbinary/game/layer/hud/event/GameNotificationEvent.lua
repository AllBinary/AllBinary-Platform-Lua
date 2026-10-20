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
-- package org.allbinary.game.layer.hud.event

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local GameNotificationEvent = {}
GameNotificationEvent.__index = GameNotificationEvent
GameNotificationEvent.className = "GameNotificationEvent"
setmetatable(GameNotificationEvent, {__index = AllBinaryEventObject})

function GameNotificationEvent:_init_fields()
    self.string = StringUtil.getInstance().EMPTY_STRING
    self.seconds = nil
    self.basicColor = BasicColorFactory.getInstance().BLACK
    self.removeable = nil
end


function GameNotificationEvent.new(anyType, string, seconds, basicColor, permanent)
    local self = setmetatable(AllBinaryEventObject.new(anyType), GameNotificationEvent)
    self:_init_fields()
        -- super(...) made self above
        self:setString(string)
        self.seconds = seconds
        self:setBasicColorP(basicColor)
        self.removeable = permanent
    return self
end


function GameNotificationEvent:getString()
        return self.string
end


function GameNotificationEvent:getSeconds()
        return self.seconds
end


function GameNotificationEvent:getBasicColorP()
        return self.basicColor
end


function GameNotificationEvent:getPermanent()
        return self.removeable
end


function GameNotificationEvent:setString(string)
        self.string = string
end


function GameNotificationEvent:setBasicColorP(basicColor)
        self.basicColor = basicColor
end

return GameNotificationEvent

