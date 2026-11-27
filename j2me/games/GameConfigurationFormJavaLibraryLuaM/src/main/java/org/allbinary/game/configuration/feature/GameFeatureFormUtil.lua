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

local GameFeatureFormUtil = {}
package.loaded["org.allbinary.game.configuration.feature.GameFeatureFormUtil"] = GameFeatureFormUtil

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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local MIDPUtil = java_lazy("org.allbinary.MIDPUtil")
local GameConfigurationGauge = java_lazy("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationUtil = java_lazy("org.allbinary.game.configuration.GameConfigurationUtil")
local CommandForm = java_lazy("org.allbinary.graphics.displayable.screen.CommandForm")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureUtil = java_lazy("org.allbinary.game.configuration.feature.GameFeatureUtil")

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

-- class table GameFeatureFormUtil is declared before the requires
GameFeatureFormUtil.__index = GameFeatureFormUtil
GameFeatureFormUtil.className = "GameFeatureFormUtil"
GameFeatureFormUtil.javaClassName = "org.allbinary.game.configuration.feature.GameFeatureFormUtil"

function GameFeatureFormUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.meUtil = MIDPUtil.getInstance()
end

function GameFeatureFormUtil._jinit(self)
    GameFeatureFormUtil._init_fields(self)
    return self
end

function GameFeatureFormUtil.new()
    return GameFeatureFormUtil._jinit(setmetatable({}, GameFeatureFormUtil))
end


function GameFeatureFormUtil.getInstance()
        return GameFeatureFormUtil.instance_f
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

GameFeatureFormUtil.instance_f = GameFeatureFormUtil.new()

return GameFeatureFormUtil

