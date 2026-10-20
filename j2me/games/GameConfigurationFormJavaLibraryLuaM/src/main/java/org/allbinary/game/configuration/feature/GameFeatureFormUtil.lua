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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local GameConfigurationGauge = require("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationUtil = require("org.allbinary.game.configuration.GameConfigurationUtil")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local MEUtil = require("org.allbinary.logic.MEUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")

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

local GameFeatureFormUtil = {}
GameFeatureFormUtil.__index = GameFeatureFormUtil
GameFeatureFormUtil.className = "GameFeatureFormUtil"

function GameFeatureFormUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.meUtil = MEUtil.getInstance()
end

function GameFeatureFormUtil.new()
    local self = setmetatable({}, GameFeatureFormUtil)
    self:_init_fields()
    return self
end


function GameFeatureFormUtil.getInstance()
        return GameFeatureFormUtil.instance
end


function GameFeatureFormUtil:getChoiceGroup(hashtable, name, option)
        local stringMaker = StringMaker.new()
        local choiceGroup = ChoiceGroup.new(name, option, StringUtil.getInstance():getArrayInstance(), NullImage.NULL_IMAGE_ARRAY)
        local list = hashtable:get(name)
        local features = Features.getInstance()
        local ADD_CHOICE = ": Adding Choice: "
        local GET_CHOICE_GROUP = "getChoiceGroup"
        local size = list:size()
        for index = 0, size - 1 do
            local gameFeature = list.objectArray[index + 1]
            stringMaker:delete(0, stringMaker:length())
            self.logUtil:putF(tostring(stringMaker:append(name):append(ADD_CHOICE):append(tostring(gameFeature))), self, GET_CHOICE_GROUP)
            choiceGroup:append(tostring(gameFeature), NullImage.NULL_IMAGE)
            if features:isFeature(gameFeature) then
                choiceGroup:setSelectedIndex(index, true)
            end
        end
        return choiceGroup
end


function GameFeatureFormUtil:addChoiceGroup(form, hashtable, option)
        local stringMaker = StringMaker.new()
        local ADDING_CHOICE_GROUP = "Adding Choice Group: "
        local ADD_CHOICE_GROUP = "addChoiceGroup"
        local size = hashtable:size()
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local name = nil
        for index = 0, size - 1 do
            name = objectArray[index + 1]
            stringMaker:delete(0, stringMaker:length())
            self.logUtil:putF(tostring(stringMaker:append(ADDING_CHOICE_GROUP):append(name)), self, ADD_CHOICE_GROUP)
            self.meUtil:appendItem(form, self:getChoiceGroup(hashtable, name, option))
        end
end


-- throws Exception
function GameFeatureFormUtil:setDefault(form)
        local size = form:size()
        for index = 0, size - 1 do
            local item = form:get(index)
            if java_instanceof(item, GameConfigurationGauge) then
                GameConfigurationUtil.getInstance():setDefault(item)
            elseif java_instanceof(item, ChoiceGroup) then
                GameFeatureUtil.getInstance():setDefault(item)
            end
        end
end

GameFeatureFormUtil.instance = GameFeatureFormUtil.new()

return GameFeatureFormUtil

