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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameDifficultyFactory = require("org.allbinary.game.configuration.persistance.GameDifficultyFactory")
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

local GameDifficultyOptions = {}
GameDifficultyOptions.__index = GameDifficultyOptions
GameDifficultyOptions.className = "GameDifficultyOptions"
setmetatable(GameDifficultyOptions, {__index = CommandForm})

function GameDifficultyOptions:_init_fields()
    self.meUtil = MEUtil.getInstance()
    self.list = nil
end


function GameDifficultyOptions.new(commandListener, title, list, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CommandForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor), GameDifficultyOptions)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.list = list
        self:update()
        self:initCommands(commandListener)
        local gameDifficultyFactory = GameDifficultyFactory.getInstance()
        self:setSelectedId(gameDifficultyFactory:getLevel())
    return self
end


function GameDifficultyOptions:open()
        CommandForm.open(self)
end


-- throws Exception
function GameDifficultyOptions:close()
        CommandForm.close(self)
        self:save()
end


-- throws Exception
function GameDifficultyOptions:save()
        local gameDifficultyFactory = GameDifficultyFactory.getInstance()
        gameDifficultyFactory:setLevel(self:getSelectedId())
end


function GameDifficultyOptions:initCommands(cmdListener)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        self:removeAllCommands()
        self:addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end


-- throws Exception
function GameDifficultyOptions:update()
        self:deleteAll()
        self:add(self.list, "Difficulty", Choice.EXCLUSIVE)
        CommandForm.update(self)
end


function GameDifficultyOptions:add(list, name, option)
        local choiceGroup = self:getChoiceGroup(list, name, option)
        if list:size() > 0 then
            choiceGroup:setSelectedIndex(0, true)
        end
        self.meUtil:appendItem(self, choiceGroup)
end


function GameDifficultyOptions:getChoiceGroup(list, name, option)
        local METHOD_NAME = "addChoiceGroup"
        local NAME = "Adding Choice: "
        local choiceGroup = ChoiceGroup.new(name, option, StringUtil.getInstance():getArrayInstance(), NullImage.NULL_IMAGE_ARRAY)
        local size = list:size()
        local anyType = nil
        for index = 0, size - 1 do
            anyType = list.objectArray[index + 1]
            self.logUtil:putF(tostring(StringMaker.new():append(NAME):append(tostring(anyType))), self, METHOD_NAME)
            choiceGroup:append(tostring(anyType), NullImage.NULL_IMAGE)
        end
        return choiceGroup
end


function GameDifficultyOptions:setSelectedId(id)
        local choiceGroup = self:get(0)
        choiceGroup:setSelectedIndex(id, true)
end


function GameDifficultyOptions:getSelectedId()
        local choiceGroup = self:get(0)
        return choiceGroup:getSelectedIndex()
end


function GameDifficultyOptions:getSelectedText()
        local choiceGroup = self:get(0)
        local value = math.tointeger(tostring(choiceGroup:getString(choiceGroup:getSelectedIndex())) // 1)
        return value
end

return GameDifficultyOptions

