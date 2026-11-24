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

local TextNotificationUtil = {}
package.loaded["org.allbinary.game.input.TextNotificationUtil"] = TextNotificationUtil

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
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local PrimaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SelectSound = java_lazy("org.allbinary.media.audio.SelectSound")

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

-- class table TextNotificationUtil is declared before the requires
TextNotificationUtil.__index = TextNotificationUtil
TextNotificationUtil.className = "TextNotificationUtil"
TextNotificationUtil.javaClassName = "org.allbinary.game.input.TextNotificationUtil"

function TextNotificationUtil:_init_fields()
    self.TWO = SmallIntegerSingletonFactory.getInstance():getAt(2)
    self.FALSE = BooleanFactory.getInstance().FALSE
    self.gameNotificationEventHandler = GameNotificationEventHandler.getInstance()
end

function TextNotificationUtil._jinit(self)
    TextNotificationUtil._init_fields(self)
    return self
end

function TextNotificationUtil.new()
    return TextNotificationUtil._jinit(setmetatable({}, TextNotificationUtil))
end


function TextNotificationUtil.getInstance()
        return TextNotificationUtil.instance_f
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

TextNotificationUtil.instance_f = TextNotificationUtil.new()

return TextNotificationUtil

