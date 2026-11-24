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

local GameFeatureItemStateListener = {}
package.loaded["org.allbinary.game.configuration.feature.GameFeatureItemStateListener"] = GameFeatureItemStateListener

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

-- local ChoiceGroup = require("javax.microedition.lcdui.ChoiceGroup")
-- local Item = require("javax.microedition.lcdui.Item")
-- local ItemStateListener = require("javax.microedition.lcdui.ItemStateListener")
local GameConfigurationGauge = java_lazy("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationUtil = java_lazy("org.allbinary.game.configuration.GameConfigurationUtil")
local GameOptionsForm = java_lazy("org.allbinary.game.configuration.GameOptionsForm")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

local function java_instanceof(object, class)
    class = java_real(class)
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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameFeatureItemStateListener is declared before the requires
GameFeatureItemStateListener.__index = GameFeatureItemStateListener
GameFeatureItemStateListener.className = "GameFeatureItemStateListener"
GameFeatureItemStateListener.javaClassName = "org.allbinary.game.configuration.feature.GameFeatureItemStateListener"
GameFeatureItemStateListener.java_implements = " ItemStateListener "
GameFeatureItemStateListener.java_interfaces = function() return {ItemStateListener} end

function GameFeatureItemStateListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.gameOptionsForm == nil then self.gameOptionsForm = nil end
end


function GameFeatureItemStateListener._jinit(self, gameOptionsForm)
    GameFeatureItemStateListener._init_fields(self)
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

function GameFeatureItemStateListener.new(...)
    local self = setmetatable({}, GameFeatureItemStateListener)
    GameFeatureItemStateListener._jinit(self, ...)
    return self
end


function GameFeatureItemStateListener.add(gameFeature)
        if not GameFeatureItemStateListener.toggleList:contains(gameFeature) then
            GameFeatureItemStateListener.toggleList:add(gameFeature)
        end
end


function GameFeatureItemStateListener:itemStateChanged(item)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "itemStateChanged", e)
        end
end

GameFeatureItemStateListener.toggleList = BasicArrayListD.new()

return GameFeatureItemStateListener

