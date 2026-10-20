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
-- local ChoiceGroup = require("javax.microedition.lcdui.ChoiceGroup")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Item = require("javax.microedition.lcdui.Item")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
-- local StringItem = require("javax.microedition.lcdui.StringItem")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GamePersistanceSingleton = require("org.allbinary.game.configuration.persistance.GamePersistanceSingleton")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local MEUtil = require("org.allbinary.logic.MEUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LoadGameForm = {}
LoadGameForm.__index = LoadGameForm
LoadGameForm.className = "LoadGameForm"
setmetatable(LoadGameForm, {__index = CommandForm})

function LoadGameForm:_init_fields()
    self.meUtil = MEUtil.getInstance()
    self.areChoices = false
end


function LoadGameForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CommandForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor), LoadGameForm)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:update()
        self:initCommands(commandListener)
    return self
end


function LoadGameForm:initCommands(cmdListener)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        self:removeAllCommands()
        self:addCommand(gameCommandsFactory.LOAD_FILE)
        self:addCommand(gameCommandsFactory.DELETE_FILE)
        self:addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end


-- throws Exception
function LoadGameForm:update()
        local list = GamePersistanceSingleton.getInstance():getIds()
        self:deleteAll()
        if list:size() > 0 then
            self:add(list, "Select A Saved Game", Choice.EXCLUSIVE)
            self.areChoices = true
        else
            self.meUtil:appendItem(self, StringItem.new("No Saved Games", StringUtil.getInstance().EMPTY_STRING, Item.PLAIN))
            self.areChoices = false
        end
        CommandForm.update(self)
end


function LoadGameForm:add(list, name, option)
        local choiceGroup = self:getChoiceGroup(list, name, option)
        if list:size() > 0 then
            choiceGroup:setSelectedIndex(0, true)
        end
        self.meUtil:appendItem(self, choiceGroup)
end


function LoadGameForm:getChoiceGroup(list, name, option)
        local METHOD_NAME = "getChoiceGroup"
        local ADDING_CHOICE = "Adding Choice: "
        local choiceGroup = ChoiceGroup.new(name, option, StringUtil.getInstance():getArrayInstance(), NullImage.NULL_IMAGE_ARRAY)
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list.objectArray[index + 1]
            self.logUtil:putF(tostring(StringMaker.new():append(ADDING_CHOICE):append(tostring(anyType))), self, METHOD_NAME)
            choiceGroup:append(tostring(anyType), NullImage.NULL_IMAGE)
        end
        return choiceGroup
end


function LoadGameForm:getSelectedId()
        if self.areChoices then
            local choiceGroup = self:get(0)
            return choiceGroup:getSelectedIndex()
        else
            return -1
        end
end


function LoadGameForm:getSelectedText()
        if self.areChoices then
            local choiceGroup = self:get(0)
            local value = math.tointeger(tostring(choiceGroup:getString(choiceGroup:getSelectedIndex())) // 1)
            return value
        else
            return -1
        end
end

return LoadGameForm

