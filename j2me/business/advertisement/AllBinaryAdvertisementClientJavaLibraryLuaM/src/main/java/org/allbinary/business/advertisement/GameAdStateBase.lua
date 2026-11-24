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

local GameAdStateBase = {}
package.loaded["org.allbinary.business.advertisement.GameAdStateBase"] = GameAdStateBase

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

local GameType = java_lazy("org.allbinary.game.GameType")
local GameState = java_lazy("org.allbinary.game.state.GameState")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local AdConfiguration = java_lazy("org.allbinary.business.advertisement.AdConfiguration")
local Advertisements = java_lazy("org.allbinary.business.advertisement.Advertisements")

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

-- class table GameAdStateBase is declared before the requires
GameAdStateBase.__index = GameAdStateBase
GameAdStateBase.className = "GameAdStateBase"
GameAdStateBase.javaClassName = "org.allbinary.business.advertisement.GameAdStateBase"

function GameAdStateBase:_init_fields()
    if self.adConfigurationP == nil then self.adConfigurationP = nil end
    self.advertisementsP = Advertisements.new()
    if self.okayToShowAdsP == nil then self.okayToShowAdsP = false end
end


function GameAdStateBase._jinit(self, adConfiguration)
    GameAdStateBase._init_fields(self)
        self.adConfigurationP = adConfiguration
    return self
end

function GameAdStateBase.new(...)
    local self = setmetatable({}, GameAdStateBase)
    GameAdStateBase._jinit(self, ...)
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

