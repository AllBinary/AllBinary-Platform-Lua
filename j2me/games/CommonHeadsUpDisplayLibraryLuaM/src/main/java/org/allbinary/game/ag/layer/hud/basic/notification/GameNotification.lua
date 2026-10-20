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

local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameNotification = {}
GameNotification.__index = GameNotification
GameNotification.className = "GameNotification"

function GameNotification:_init_fields()
    self.stringList = BasicArrayListD.new()
    self.timeList = BasicArrayListD.new()
    self.colorList = BasicArrayListD.new()
end

function GameNotification.new()
    local self = setmetatable({}, GameNotification)
    self:_init_fields()
    return self
end


function GameNotification:add(string, seconds, basicColor)
        if not self.stringList:contains(string) then
            self.stringList:add(string)
            self.timeList:add(seconds)
            self.colorList:add(basicColor)
        end
end


function GameNotification:clear()
        self.stringList:clear()
        self.timeList:clear()
        self.colorList:clear()
end


function GameNotification:getSize()
        return self.stringList:size()
end

GameNotification.NULL_GAME_NOTIFICATION_EVENT = GameNotificationEvent.new(NullUtil.getInstance().NULL_OBJECT, StringUtil.getInstance().EMPTY_STRING, 0, BasicColorFactory.getInstance().RED, BooleanFactory.getInstance().FALSE)

return GameNotification

