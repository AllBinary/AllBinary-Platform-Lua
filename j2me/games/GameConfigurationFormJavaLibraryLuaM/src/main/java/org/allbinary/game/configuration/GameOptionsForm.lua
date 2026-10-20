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
-- package org.allbinary.game.configuration

-- local Choice = require("javax.microedition.lcdui.Choice")
-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Item = require("javax.microedition.lcdui.Item")
-- local TextField = require("javax.microedition.lcdui.TextField")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameFeatureChoiceGroups = require("org.allbinary.game.configuration.feature.GameFeatureChoiceGroups")
local GameFeatureFormUtil = require("org.allbinary.game.configuration.feature.GameFeatureFormUtil")
local GameFeatureItemCommandListener = require("org.allbinary.game.configuration.feature.GameFeatureItemCommandListener")
local GameFeatureItemStateListener = require("org.allbinary.game.configuration.feature.GameFeatureItemStateListener")
local SensorFeatureFactory = require("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local GameConfigurationPersistanceSingleton = require("org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton")
local KeyValuePersistance = require("org.allbinary.game.configuration.persistance.KeyValuePersistance")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local OrientationData = require("org.allbinary.input.gyro.OrientationData")
local MEUtil = require("org.allbinary.logic.MEUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local GameOptionsForm = {}
GameOptionsForm.__index = GameOptionsForm
GameOptionsForm.className = "GameOptionsForm"
setmetatable(GameOptionsForm, {__index = CommandForm})

function GameOptionsForm:_init_fields()
    self.meUtil = MEUtil.getInstance()
end


function GameOptionsForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CommandForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor), GameOptionsForm)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:addConfiguration()
        local gameFeatureFormUtil = GameFeatureFormUtil.getInstance()
        gameFeatureFormUtil:addChoiceGroup(self, GameFeatureChoiceGroups.getExclusiveInstance():get(), Choice.EXCLUSIVE)
        gameFeatureFormUtil:addChoiceGroup(self, GameFeatureChoiceGroups.getMultipleInstance():get(), Choice.MULTIPLE)
        self:initCommands(commandListener)
        self:setItemStateListener(GameFeatureItemStateListener.new(self))
        self:addTextFieldsIfSimulated()
    return self
end


-- throws Exception
function GameOptionsForm:closeClientInformation(abeClientInformation)
        CommandForm.close(self)
        self:save(abeClientInformation)
end


function GameOptionsForm:addTextFieldsIfSimulated()
        local key = OrientationData.getInstance().ORIENTATION_SENSOR_INPUT
        local hashtable = GameFeatureChoiceGroups.getExclusiveInstance():get()
        if hashtable ~= nil then
            local listCanBeNull = hashtable:get(key)
            if listCanBeNull ~= nil then
                local list = listCanBeNull
                if list:contains(SensorFeatureFactory.getInstance().SIMULATED_ORIENTATION_SENSORS) then
                    self:addTextFields()
                end
            end
        end
end


function GameOptionsForm:addTextFields()
        local hashtable = GameConfigurationTextInput.getHashtable()
        local size = hashtable:size()
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local gameConfigurationTextInput = nil
        local textField = nil
        for index = 0, size - 1 do
            gameConfigurationTextInput = hashtable:get(objectArray[index + 1])
            textField = TextField.new(gameConfigurationTextInput:getLabel(), gameConfigurationTextInput:getText(), 30, TextField.ANY)
            self.meUtil:appendItem(self, textField)
        end
end


function GameOptionsForm:addConfiguration()
        local METHOD_NAME = "addConfiguration"
        local NAME = "Name: "
        local list = GameConfigurationSingleton.getInstance():getOptionsBasicArrayList()
        local GAUGE_CHANGE = MyCommandsFactory.getInstance().GAUGE_CHANGE
        local stringMaker = StringMaker.new()
        local size = list:size()
        local gameConfiguration = nil
        local gauge = nil
        for index = 0, size - 1 do
            gameConfiguration = list.objectArray[index + 1]
            stringMaker:delete(0, stringMaker:length())
            self.logUtil:putF(tostring(stringMaker:append(NAME):append(tostring(gameConfiguration))), self, METHOD_NAME)
            gauge = GameConfigurationGauge.new(gameConfiguration)
            gauge:setDefaultCommand(GAUGE_CHANGE)
            gauge:setItemCommandListener(GameFeatureItemCommandListener.new(self))
            self.meUtil:appendItem(self, gauge)
        end
end


function GameOptionsForm:initCommands(cmdListener)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        self:removeAllCommands()
        self:addCommand(gameCommandsFactory.CLOSE_OPTIONS)
        self:addCommand(gameCommandsFactory.DEFAULT_OPTIONS)
        self:setCommandListener(cmdListener)
end


-- throws Exception
function GameOptionsForm:save(abeClientInformation)
        local size = self:size()
        local item = nil
        for index = 0, size - 1 do
            item = self:get(index)
            if java_instanceof(item, GameConfigurationGauge) then
                GameConfigurationUtil.getInstance():update(item)
            elseif java_instanceof(item, TextField) then
                GameConfigurationTextInput.update(item)
            end
        end
        GameConfigurationUtil.getInstance():updateCompetitionValue()
        local hashtable = StdUtil.getInstance():createHashtable()
        local SCALE = GameConfigurationCentral.getInstance().SCALE
        hashtable:put(SCALE:getName(), tostring(SCALE:getValue()))
        local keyValuePersistance = GameConfigurationPersistanceSingleton.getInstance()
        keyValuePersistance:clear()
        keyValuePersistance:loadAll(abeClientInformation)
        local list = keyValuePersistance:getIds()
        keyValuePersistance:save(abeClientInformation, hashtable)
        local size2 = list:size()
        local integer = nil
        for index = 0, size2 - 1 do
            integer = list.objectArray[index + 1]
            keyValuePersistance:delete(abeClientInformation, math.tointeger(integer // 1))
        end
end

return GameOptionsForm

