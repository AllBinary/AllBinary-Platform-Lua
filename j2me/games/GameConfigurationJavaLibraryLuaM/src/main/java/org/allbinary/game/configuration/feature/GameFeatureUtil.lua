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

local GameFeatureUtil = {}
package.loaded["org.allbinary.game.configuration.feature.GameFeatureUtil"] = GameFeatureUtil

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

local Enumeration = java_lazy("java.util.Enumeration")
local ChoiceGroup = java_lazy("javax.microedition.lcdui.ChoiceGroup")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureChoiceGroups = java_lazy("org.allbinary.game.configuration.feature.GameFeatureChoiceGroups")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table GameFeatureUtil is declared before the requires
GameFeatureUtil.__index = GameFeatureUtil
GameFeatureUtil.className = "GameFeatureUtil"
GameFeatureUtil.javaClassName = "org.allbinary.game.configuration.feature.GameFeatureUtil"

function GameFeatureUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.ON_GAME_FEATURE_CHANGE = "onGameFeatureChange"
    self.GAME_FEATURE_CHANGED = "Game Feature Changed: "
end

function GameFeatureUtil._jinit(self)
    GameFeatureUtil._init_fields(self)
    return self
end

function GameFeatureUtil.new()
    return GameFeatureUtil._jinit(setmetatable({}, GameFeatureUtil))
end


function GameFeatureUtil.getInstance()
        return GameFeatureUtil.instance_f
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
            if not (isSelected) and features:isFeature(gameFeature) then
                features:remove(gameFeature)
            elseif isSelected and not (features:isFeature(gameFeature)) then
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
            if rawequal(self.tsUtil:compareTo(itemLabel, name), 0) then
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
                if not rawequal(addIndex, index) then
                    features:remove(list.objectArray[index + 1])
                else
                    features:add(list.objectArray[index + 1])
                end
            end
        end
end

GameFeatureUtil.instance_f = GameFeatureUtil.new()

return GameFeatureUtil

