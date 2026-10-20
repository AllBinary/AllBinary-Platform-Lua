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

-- local Enumeration = require("java.util.Enumeration")
-- local ChoiceGroup = require("javax.microedition.lcdui.ChoiceGroup")
local TsUtil = require("org.allbinary.TsUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local EnumerationUtil = require("org.allbinary.util.EnumerationUtil")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local GameFeatureUtil = {}
GameFeatureUtil.__index = GameFeatureUtil
GameFeatureUtil.className = "GameFeatureUtil"

function GameFeatureUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.ON_GAME_FEATURE_CHANGE = "onGameFeatureChange"
    self.GAME_FEATURE_CHANGED = "Game Feature Changed: "
end

function GameFeatureUtil.new()
    local self = setmetatable({}, GameFeatureUtil)
    self:_init_fields()
    return self
end


function GameFeatureUtil.getInstance()
        return GameFeatureUtil.instance
end


-- throws Exception
function GameFeatureUtil:setDefault(choiceGroup)
        local stringBuffer = StringMaker.new()
        local METHOD_NAME = "setDefault"
        local SELECTED_ARRAY_RETURN = "selectedArray_return["
        local SELECTED_SEP = "] = "
        local selectedArray_return = java_new_array(false, choiceGroup:size())
        local total = choiceGroup:getSelectedFlags(selectedArray_return)
        stringBuffer:append("Multiple Total Choices: ")
        stringBuffer:appendint(total)
        self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
        local features = Features.getInstance()
        for index = 0, (selectedArray_return.n or #selectedArray_return) - 1 do
            local isSelected = selectedArray_return[index + 1]
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(SELECTED_ARRAY_RETURN)
            stringBuffer:appendint(index)
            stringBuffer:append(SELECTED_SEP)
            stringBuffer:appendboolean(isSelected)
            self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
            local selectedChoiceLabel = choiceGroup:getString(index)
            local gameFeature = Feature.getInstance(selectedChoiceLabel)
            if features:isDefault(gameFeature) then
                features:add(gameFeature)
                choiceGroup:setSelectedIndex(index, true)
            else
                features:remove(gameFeature)
                choiceGroup:setSelectedIndex(index, false)
            end
        end
end


-- throws Exception
function GameFeatureUtil:updateMultiple(choiceGroup)
        local stringBuffer = StringMaker.new()
        local METHOD_NAME = "updateMultiple"
        local SELECTED_ARRAY_RETURN = "selectedArray_return["
        local SELECTED_SEP = "] = "
        local selectedArray_return = java_new_array(false, choiceGroup:size())
        local total = choiceGroup:getSelectedFlags(selectedArray_return)
        stringBuffer:append("Multiple Total Choices: ")
        stringBuffer:appendint(total)
        self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
        local features = Features.getInstance()
        for index = 0, (selectedArray_return.n or #selectedArray_return) - 1 do
            local isSelected = selectedArray_return[index + 1]
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(SELECTED_ARRAY_RETURN)
            stringBuffer:appendint(index)
            stringBuffer:append(SELECTED_SEP)
            stringBuffer:appendboolean(isSelected)
            self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
            local selectedChoiceLabel = choiceGroup:getString(index)
            local gameFeature = Feature.getInstance(selectedChoiceLabel)
            if not isSelected and features:isFeature(gameFeature) then
                features:remove(gameFeature)
            elseif isSelected and not features:isFeature(gameFeature) then
                features:add(gameFeature)
            end
        end
end


-- throws Exception
function GameFeatureUtil:updateExclusiveForChoiceGroup(choiceGroup)
        local stringBuffer = StringMaker.new()
        local METHOD_NAME = "updateExclusive"
        local SELECTED_ARRAY_RETURN = "selectedArray_return["
        local SELECTED_SEP = "] = "
        local selectedArray_return = java_new_array(false, choiceGroup:size())
        local total = choiceGroup:getSelectedFlags(selectedArray_return)
        stringBuffer:append("Exclusive Total Choices: 1==")
        stringBuffer:appendint(total)
        self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
        for index = 0, (selectedArray_return.n or #selectedArray_return) - 1 do
            local isSelected = selectedArray_return[index + 1]
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(SELECTED_ARRAY_RETURN)
            stringBuffer:appendint(index)
            stringBuffer:append(SELECTED_SEP)
            stringBuffer:appendboolean(isSelected)
            self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
            if isSelected then
                local selectedChoiceLabel = choiceGroup:getString(index)
                self:updateExclusive(selectedChoiceLabel)
            end
        end
end


function GameFeatureUtil:isExclusive(itemLabel)
        local enumeration = GameFeatureChoiceGroups.getExclusiveInstance():get():keys()
        local name = nil
        while self.enumerationUtil:hasMoreElements(enumeration) do
            name = self.enumerationUtil:nextElement(enumeration)
            if self.tsUtil:compareTo(itemLabel, name) == 0 then
                return true
            end
        end
        return false
end


-- throws Exception
function GameFeatureUtil:updateExclusive(selectedChoiceLabel)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().ITEM_LABEL):append(selectedChoiceLabel)), self, "updateExclusive")
        local gameFeature = Feature.getInstance(selectedChoiceLabel)
        local hashtable = GameFeatureChoiceGroups.getExclusiveInstance():get()
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local basicArrayList = nil
        local anyType = nil
        local size = (objectArray.n or #objectArray)
        for index = 0, size - 1 do
            anyType = objectArray[index + 1]
            basicArrayList = hashtable:get(anyType)
            self:updateExclusiveList(gameFeature, basicArrayList)
        end
end


-- throws Exception
function GameFeatureUtil:updateExclusiveList(gameFeature, list)
        if list:contains(gameFeature) then
            local features = Features.getInstance()
            local addIndex = list:indexOf(gameFeature)
            local size = list:size()
            for index = 0, size - 1 do
                if addIndex ~= index then
                    features:remove(list.objectArray[index + 1])
                else
                    features:add(list.objectArray[index + 1])
                end
            end
        end
end

GameFeatureUtil.instance = GameFeatureUtil.new()

return GameFeatureUtil

