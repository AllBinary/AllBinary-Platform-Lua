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
-- package org.allbinary.game.configuration.feature

-- local ChoiceGroup = require("javax.microedition.lcdui.ChoiceGroup")
-- local Item = require("javax.microedition.lcdui.Item")
-- local ItemStateListener = require("javax.microedition.lcdui.ItemStateListener")
local GameConfigurationGauge = require("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationUtil = require("org.allbinary.game.configuration.GameConfigurationUtil")
local GameOptionsForm = require("org.allbinary.game.configuration.GameOptionsForm")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local GameFeatureItemStateListener = {}
GameFeatureItemStateListener.__index = GameFeatureItemStateListener
GameFeatureItemStateListener.className = "GameFeatureItemStateListener"

function GameFeatureItemStateListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameOptionsForm = nil
end


function GameFeatureItemStateListener.new(gameOptionsForm)
    local self = setmetatable({}, GameFeatureItemStateListener)
    self:_init_fields()
        self.gameOptionsForm = gameOptionsForm
        local gameFeatureFactory = GameFeatureFactory.getInstance()
        GameFeatureItemStateListener.add(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR)
        GameFeatureItemStateListener.add(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR)
        GameFeatureItemStateListener.add(gameFeatureFactory.DAMAGE_FLOATERS)
        GameFeatureItemStateListener.add(gameFeatureFactory.DROPPED_ITEMS)
        GameFeatureItemStateListener.add(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR)
        GameFeatureItemStateListener.add(gameFeatureFactory.HEALTH_BARS)
        GameFeatureItemStateListener.add(gameFeatureFactory.SOUND)
        GameFeatureItemStateListener.add(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR)
    return self
end


function GameFeatureItemStateListener.add(gameFeature)
        if not GameFeatureItemStateListener.toggleList:contains(gameFeature) then
            GameFeatureItemStateListener.toggleList:add(gameFeature)
        end
end


function GameFeatureItemStateListener:itemStateChanged(item)
        local try_ok, try_error = pcall(function()
            local itemLabel = item:getLabel()
            self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().ITEM_LABEL):append(itemLabel)), self, "itemStateChanged")
            if java_instanceof(item, GameConfigurationGauge) then
                GameConfigurationUtil.getInstance():change(self.gameOptionsForm, item)
            elseif java_instanceof(item, ChoiceGroup) then
                local gameFeatureUtil = GameFeatureUtil.getInstance()
                if gameFeatureUtil:isExclusive(itemLabel) then
                    gameFeatureUtil:updateExclusiveForChoiceGroup(item)
                else
                    gameFeatureUtil:updateMultiple(item)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "itemStateChanged", e)
        end
end

GameFeatureItemStateListener.toggleList = BasicArrayListD.new()

return GameFeatureItemStateListener

