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
-- package org.allbinary.game.configuration.event

local Feature = require("org.allbinary.game.configuration.feature.Feature")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureUtil = require("org.allbinary.game.configuration.feature.GameFeatureUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local GameFeatureListenerInterface = require("org.allbinary.game.configuration.event.GameFeatureListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseChangedGameFeatureListener = {}
BaseChangedGameFeatureListener.__index = BaseChangedGameFeatureListener
BaseChangedGameFeatureListener.className = "BaseChangedGameFeatureListener"

function BaseChangedGameFeatureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameFeatureUtil = GameFeatureUtil.getInstance()
    self.list = BasicArrayListD.new()
    self.changed = true
end

function BaseChangedGameFeatureListener.new()
    local self = setmetatable({}, BaseChangedGameFeatureListener)
    self:_init_fields()
    return self
end


function BaseChangedGameFeatureListener:onEvent(eventObject)
        ForcedLogUtil.log(CommonStrings.getInstance().NOT_IMPLEMENTED, self)
end


function BaseChangedGameFeatureListener:onGameFeatureChange(gameFeatureEvent)
        self.logUtil:putF(tostring(StringMaker.new():append(self.gameFeatureUtil.GAME_FEATURE_CHANGED):append(gameFeatureEvent:getWhatChanged())), self, self.gameFeatureUtil.ON_GAME_FEATURE_CHANGE)
        self.list:add(gameFeatureEvent:getGameOption())
        self:setChanged(true)
end


function BaseChangedGameFeatureListener:add(gameFeature)
        self.list:add(gameFeature)
end


function BaseChangedGameFeatureListener:remove(gameFeature)
        self.list:remove(gameFeature)
end


function BaseChangedGameFeatureListener:setChanged(initialized)
        self.changed = initialized
        if not self:isChanged() then
            self.list:clear()
        end
end


function BaseChangedGameFeatureListener:isChangedFeature(gameFeature)
        local isChanged = self.list:contains(gameFeature)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("GameFeature: ")
        stringBuffer:append(StringUtil.getInstance():toString(gameFeature))
        stringBuffer:append(" isFeature: ")
        stringBuffer:appendboolean(Features.getInstance():isFeature(gameFeature))
        stringBuffer:append(" isChanged: ")
        stringBuffer:appendboolean(isChanged)
        self.logUtil:putF(tostring(stringBuffer), self, "isChanged")
        return isChanged
end


function BaseChangedGameFeatureListener:isChanged()
        return self.changed
end

return BaseChangedGameFeatureListener

