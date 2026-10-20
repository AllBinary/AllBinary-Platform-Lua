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
-- package org.allbinary.logic.system.security.licensing

local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local PrimaryPlayerQueueFactory = require("org.allbinary.media.audio.PrimaryPlayerQueueFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LockedFeatureNotificationUtil = {}
LockedFeatureNotificationUtil.__index = LockedFeatureNotificationUtil
LockedFeatureNotificationUtil.className = "LockedFeatureNotificationUtil"

function LockedFeatureNotificationUtil:_init_fields()
    self.gameNotificationEvent = GameNotificationEvent.new(self, LicenseStrings.getInstance().LOCKED, SmallIntegerSingletonFactory.getInstance():getAt(3), BasicColorFactory.getInstance().RED, BooleanFactory.getInstance().FALSE)
end

function LockedFeatureNotificationUtil.new()
    local self = setmetatable({}, LockedFeatureNotificationUtil)
    self:_init_fields()
    return self
end


function LockedFeatureNotificationUtil.getInstance()
        return LockedFeatureNotificationUtil.instance
end


-- throws Exception
function LockedFeatureNotificationUtil:fire()
        PrimaryPlayerQueueFactory.getInstance():add(ErrorSound.getInstance())
        GameNotificationEventHandler.getInstance():fireEvent(self.gameNotificationEvent)
end


-- throws Exception
function LockedFeatureNotificationUtil:fireWithColor(basicColor)
        PrimaryPlayerQueueFactory.getInstance():add(ErrorSound.getInstance())
        self.gameNotificationEvent:setBasicColorP(basicColor)
        GameNotificationEventHandler.getInstance():fireEvent(self.gameNotificationEvent)
end

LockedFeatureNotificationUtil.instance = LockedFeatureNotificationUtil.new()

return LockedFeatureNotificationUtil

