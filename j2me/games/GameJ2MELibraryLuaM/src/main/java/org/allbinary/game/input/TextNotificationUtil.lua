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
-- package org.allbinary.game.input

local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local PrimaryPlayerQueueFactory = require("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SelectSound = require("org.allbinary.media.audio.SelectSound")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TextNotificationUtil = {}
TextNotificationUtil.__index = TextNotificationUtil
TextNotificationUtil.className = "TextNotificationUtil"

function TextNotificationUtil:_init_fields()
    self.TWO = SmallIntegerSingletonFactory.getInstance():getAt(2)
    self.FALSE = BooleanFactory.getInstance().FALSE
    self.gameNotificationEventHandler = GameNotificationEventHandler.getInstance()
end

function TextNotificationUtil.new()
    local self = setmetatable({}, TextNotificationUtil)
    self:_init_fields()
    return self
end


function TextNotificationUtil.getInstance()
        return TextNotificationUtil.instance
end


-- throws Exception
function TextNotificationUtil:fireError(message)
        PrimaryPlayerQueueFactory.getInstance():add(ErrorSound.getInstance())
        self:fire(message)
end


-- throws Exception
function TextNotificationUtil:fireNew(message)
        PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
        self:fire(message)
end


-- throws Exception
function TextNotificationUtil:fireSuccess(message)
        PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
        self:fire(message)
end


-- throws Exception
function TextNotificationUtil:fire(message)
        local gameNotificationEvent = GameNotificationEvent.new(self, message, self.TWO, BasicColorFactory.getInstance().RED, self.FALSE)
        self.gameNotificationEventHandler:fireEvent(gameNotificationEvent)
end

TextNotificationUtil.instance = TextNotificationUtil.new()

return TextNotificationUtil

