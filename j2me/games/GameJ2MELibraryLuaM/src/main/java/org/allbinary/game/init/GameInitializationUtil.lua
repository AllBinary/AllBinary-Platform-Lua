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

local ChangedGameFeatureListener = require("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local GameInitializedEvent = require("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedEventHandler = require("org.allbinary.game.configuration.event.GameInitializedEventHandler")
local Features = require("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInitializationUtil = {}
GameInitializationUtil.__index = GameInitializationUtil
GameInitializationUtil.className = "GameInitializationUtil"

function GameInitializationUtil:_init_fields()
    self.EVENT = GameInitializedEvent.new(self)
end

function GameInitializationUtil.new()
    local self = setmetatable({}, GameInitializationUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function GameInitializationUtil:initDemo(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface)
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        if ChangedGameFeatureListener.getInstance():isChangedFeature(mainFeatureFactory.STATIC) then
            local gameInitializationInterface = gameInitializationInterfaceFactoryInterface:getInstance()
            local features = Features.getInstance()
            if features:isFeature(mainFeatureFactory.LOAD_ALL) then
                self:initGame(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface)
            elseif features:isFeature(mainFeatureFactory.LOAD_ONDEMAND) then
                local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
                gameInitializationInterface:init(abeClientInformation, canvas:getCustomCommandListener(), resourceLoadingLevelFactory.LOAD_EARLY:getLevel())
                self.EVENT:setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_EARLY)
            else
                error(java_exception("Exception", "No Loading Feature Available"), 0)
            end
            GameInitializedEventHandler.getInstance():fireEvent(self.EVENT)
        end
end


-- throws Exception
function GameInitializationUtil:initGame(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface)
        if ChangedGameFeatureListener.getInstance():isChangedFeature(MainFeatureFactory.getInstance().STATIC) then
            local gameInitializationInterface = gameInitializationInterfaceFactoryInterface:getInstance()
            local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
            gameInitializationInterface:init(abeClientInformation, canvas:getCustomCommandListener(), resourceLoadingLevelFactory.LOAD_ALL:getLevel())
            self.EVENT:setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_ALL)
            GameInitializedEventHandler.getInstance():fireEvent(self.EVENT)
            ChangedGameFeatureListener.getInstance():remove(MainFeatureFactory.getInstance().STATIC)
        end
end


function GameInitializationUtil.getInstance()
        return GameInitializationUtil.instance
end

GameInitializationUtil.instance = GameInitializationUtil.new()

return GameInitializationUtil

