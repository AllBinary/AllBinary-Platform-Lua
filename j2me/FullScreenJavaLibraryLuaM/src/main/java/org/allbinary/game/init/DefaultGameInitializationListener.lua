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
-- package org.allbinary.game.init

local DefaultGameInitializationListener = {}
package.loaded["org.allbinary.game.init.DefaultGameInitializationListener"] = DefaultGameInitializationListener

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local GameInitializedEvent = java_lazy("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedEventHandler = java_lazy("org.allbinary.game.configuration.event.GameInitializedEventHandler")
local GameInitializedListenerInterface = java_lazy("org.allbinary.game.configuration.event.GameInitializedListenerInterface")
local FeatureResourceInitializationUtil = java_lazy("org.allbinary.game.resource.FeatureResourceInitializationUtil")
local SWTJOGLProcessor = java_lazy("org.allbinary.graphics.threed.SWTJOGLProcessor")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table DefaultGameInitializationListener is declared before the requires
DefaultGameInitializationListener.__index = DefaultGameInitializationListener
DefaultGameInitializationListener.className = "DefaultGameInitializationListener"
DefaultGameInitializationListener.javaClassName = "org.allbinary.game.init.DefaultGameInitializationListener"
DefaultGameInitializationListener.java_implements = " GameInitializedListenerInterface "
DefaultGameInitializationListener.java_interfaces = function() return {GameInitializedListenerInterface} end

function DefaultGameInitializationListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.swtJOGLProcessor = SWTJOGLProcessor.getInstance()
    self.firstTime = true
end


function DefaultGameInitializationListener._jinit(self)
    DefaultGameInitializationListener._init_fields(self)
        local gameInitializedEventHandler = GameInitializedEventHandler.getInstance()
        gameInitializedEventHandler:removeAllListeners()
        gameInitializedEventHandler:addListenerInterface(self)
    return self
end

function DefaultGameInitializationListener.new(...)
    local self = setmetatable({}, DefaultGameInitializationListener)
    DefaultGameInitializationListener._jinit(self, ...)
    return self
end


function DefaultGameInitializationListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function DefaultGameInitializationListener:onGameInitialized(gameInitializedEvent)
        local ON_GAME_INITIALIZED = "onGameInitialized"
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(commonStrings.START, self, ON_GAME_INITIALIZED)
            while not (self.swtJOGLProcessor:isHolderCreated()) do
                self.logUtil:putF(commonStrings.UPDATE, self, ON_GAME_INITIALIZED)
                require("java.lang.Thread").sleep(20)
            end
            FeatureResourceInitializationUtil.getInstance():init(gameInitializedEvent:getLevel())
            if self.firstTime then
                self.firstTime = false
            else
                self.swtJOGLProcessor:onSurfaceChanged()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(commonStrings.EXCEPTION, self, ON_GAME_INITIALIZED, e)
        end
end

return DefaultGameInitializationListener

