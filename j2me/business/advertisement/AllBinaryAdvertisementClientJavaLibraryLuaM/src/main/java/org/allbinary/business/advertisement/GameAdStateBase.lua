-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.business.advertisement

local GameType = require("org.allbinary.game.GameType")
local GameState = require("org.allbinary.game.state.GameState")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
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

local GameAdStateBase = {}
GameAdStateBase.__index = GameAdStateBase
GameAdStateBase.className = "GameAdStateBase"

function GameAdStateBase:_init_fields()
    self.adConfigurationP = nil
    self.advertisementsP = Advertisements.new()
    self.okayToShowAdsP = false
end


function GameAdStateBase.new(adConfiguration)
    local self = setmetatable({}, GameAdStateBase)
    self:_init_fields()
        self.adConfigurationP = adConfiguration
    return self
end


function GameAdStateBase:initViewArray(viewArray)
end


function GameAdStateBase:onStart(anyType)
        self:init()
end


function GameAdStateBase:init()
end


function GameAdStateBase:isShowingAtLocation(location)
        return false
end


function GameAdStateBase:isShowingAt()
        return false
end


function GameAdStateBase:show()
end


function GameAdStateBase:hide()
end


function GameAdStateBase:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function GameAdStateBase:processAdState(gameState, gameType)
end


function GameAdStateBase:processPageAdState()
end


-- throws Exception
function GameAdStateBase:playingAdState()
end


-- throws Exception
function GameAdStateBase:playingAdStateWH(width, height)
end


-- throws Exception
function GameAdStateBase:notPlayingAdState()
end


function GameAdStateBase:setGameIsReady(gameIsReady)
end


function GameAdStateBase:isGameIsReady()
        return false
end


function GameAdStateBase:getAdvertisements()
        return self.advertisementsP
end


function GameAdStateBase:getAdConfiguration()
        return self.adConfigurationP
end


function GameAdStateBase:isOkayToShowPageAd()
        return false
end


function GameAdStateBase:setOkayToShowAds(okayToShowAds)
        self.okayToShowAdsP = okayToShowAds
end


function GameAdStateBase:isOkayToShowAds()
        return self.okayToShowAdsP
end


function GameAdStateBase:isEnabled()
        return false
end

return GameAdStateBase

