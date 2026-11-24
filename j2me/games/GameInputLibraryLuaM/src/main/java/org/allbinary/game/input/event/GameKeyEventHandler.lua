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
-- package org.allbinary.game.input.event

local GameKeyEventHandler = {}
package.loaded["org.allbinary.game.input.event.GameKeyEventHandler"] = GameKeyEventHandler

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local EventListenerInterface = java_lazy("org.allbinary.logic.util.event.EventListenerInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local DownGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.DownGameKeyEventHandler")
local PressGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.PressGameKeyEventHandler")
local UpGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.UpGameKeyEventHandler")

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

-- class table GameKeyEventHandler is declared before the requires
GameKeyEventHandler.__index = GameKeyEventHandler
GameKeyEventHandler.className = "GameKeyEventHandler"
GameKeyEventHandler.javaClassName = "org.allbinary.game.input.event.GameKeyEventHandler"

function GameKeyEventHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.pressGameKeyEventHandler = PressGameKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
end

function GameKeyEventHandler._jinit(self)
    GameKeyEventHandler._init_fields(self)
    return self
end

function GameKeyEventHandler.new()
    return GameKeyEventHandler._jinit(setmetatable({}, GameKeyEventHandler))
end


function GameKeyEventHandler.getInstance()
        return GameKeyEventHandler.instance_f
end


function GameKeyEventHandler:removeAllListeners()
        self.pressGameKeyEventHandler:removeAllListeners()
        self.upGameKeyEventHandler:removeAllListeners()
        self.downGameKeyEventHandler:removeAllListeners()
end


function GameKeyEventHandler:addListenerForPlayer(eventListenerInterface, playerInputId)
        self.logUtil:putF(tostring(eventListenerInterface), self, self.commonStrings.ADD_LISTENER)
        self.pressGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        self.upGameKeyEventHandler:getInstanceForPlayer(playerInputId):addListenerSingleThreaded(eventListenerInterface)
        self.downGameKeyEventHandler:getInstanceForPlayer(playerInputId):addListenerSingleThreaded(eventListenerInterface)
end


function GameKeyEventHandler:addListener(eventListenerInterface)
        self.logUtil:putF(tostring(eventListenerInterface), self, self.commonStrings.ADD_LISTENER)
        self.pressGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        self.upGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        self.downGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
end


function GameKeyEventHandler:removeListener(eventListenerInterface)
        self.logUtil:putF(tostring(eventListenerInterface), self, self.commonStrings.REMOVE_LISTENER)
        self.pressGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        self.upGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        self.downGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
end

GameKeyEventHandler.instance_f = GameKeyEventHandler.new()

return GameKeyEventHandler

