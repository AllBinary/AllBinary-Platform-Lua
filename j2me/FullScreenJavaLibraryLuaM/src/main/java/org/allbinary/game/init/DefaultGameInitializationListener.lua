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

local CommonStrings = require("org.allbinary.string.CommonStrings")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local GameInitializedEvent = require("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedEventHandler = require("org.allbinary.game.configuration.event.GameInitializedEventHandler")
local GameInitializedListenerInterface = require("org.allbinary.game.configuration.event.GameInitializedListenerInterface")
local FeatureResourceInitializationUtil = require("org.allbinary.game.resource.FeatureResourceInitializationUtil")
local SWTJOGLProcessor = require("org.allbinary.graphics.threed.SWTJOGLProcessor")
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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local DefaultGameInitializationListener = {}
DefaultGameInitializationListener.__index = DefaultGameInitializationListener
DefaultGameInitializationListener.className = "DefaultGameInitializationListener"

function DefaultGameInitializationListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.swtJOGLProcessor = SWTJOGLProcessor.getInstance()
    self.firstTime = true
end


function DefaultGameInitializationListener.new()
    local self = setmetatable({}, DefaultGameInitializationListener)
    self:_init_fields()
        local gameInitializedEventHandler = GameInitializedEventHandler.getInstance()
        gameInitializedEventHandler:removeAllListeners()
        gameInitializedEventHandler:addListenerInterface(self)
    return self
end


function DefaultGameInitializationListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function DefaultGameInitializationListener:onGameInitialized(gameInitializedEvent)
        local ON_GAME_INITIALIZED = "onGameInitialized"
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(commonStrings.START, self, ON_GAME_INITIALIZED)
            while not self.swtJOGLProcessor:isHolderCreated() do
                self.logUtil:putF(commonStrings.UPDATE, self, ON_GAME_INITIALIZED)
                java_sleep(20)
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
            self.logUtil:put(commonStrings.EXCEPTION, self, ON_GAME_INITIALIZED, e)
        end
end

return DefaultGameInitializationListener

