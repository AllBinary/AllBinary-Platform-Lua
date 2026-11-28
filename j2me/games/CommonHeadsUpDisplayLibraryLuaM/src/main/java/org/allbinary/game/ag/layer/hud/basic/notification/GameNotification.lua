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

local GameNotification = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.notification.GameNotification"] = GameNotification

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
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table GameNotification is declared before the requires
GameNotification.__index = GameNotification
GameNotification.className = "GameNotification"
GameNotification.javaClassName = "org.allbinary.game.ag.layer.hud.basic.notification.GameNotification"

function GameNotification:_init_fields()
    self.stringList = BasicArrayListD.new()
    self.timeList = BasicArrayListD.new()
    self.colorList = BasicArrayListD.new()
end

function GameNotification._jinit(self)
    GameNotification._init_fields(self)
    return self
end

function GameNotification.new()
    return GameNotification._jinit(setmetatable({}, GameNotification))
end


function GameNotification:add(string_, seconds, basicColor)
        if not (self.stringList:contains(string_)) then
            self.stringList:add(string_)
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

