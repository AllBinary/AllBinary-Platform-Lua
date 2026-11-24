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

local LockedFeatureNotificationUtil = {}
package.loaded["org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil"] = LockedFeatureNotificationUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local PrimaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local LicenseStrings = java_lazy("org.allbinary.logic.system.security.licensing.LicenseStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LockedFeatureNotificationUtil is declared before the requires
LockedFeatureNotificationUtil.__index = LockedFeatureNotificationUtil
LockedFeatureNotificationUtil.className = "LockedFeatureNotificationUtil"
LockedFeatureNotificationUtil.javaClassName = "org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil"

function LockedFeatureNotificationUtil:_init_fields()
    self.gameNotificationEvent = GameNotificationEvent.new(self, LicenseStrings.getInstance().LOCKED, SmallIntegerSingletonFactory.getInstance():getAt(3), BasicColorFactory.getInstance().RED, BooleanFactory.getInstance().FALSE)
end

function LockedFeatureNotificationUtil._jinit(self)
    LockedFeatureNotificationUtil._init_fields(self)
    return self
end

function LockedFeatureNotificationUtil.new()
    return LockedFeatureNotificationUtil._jinit(setmetatable({}, LockedFeatureNotificationUtil))
end


function LockedFeatureNotificationUtil.getInstance()
        return LockedFeatureNotificationUtil.instance_f
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

LockedFeatureNotificationUtil.instance_f = LockedFeatureNotificationUtil.new()

return LockedFeatureNotificationUtil

