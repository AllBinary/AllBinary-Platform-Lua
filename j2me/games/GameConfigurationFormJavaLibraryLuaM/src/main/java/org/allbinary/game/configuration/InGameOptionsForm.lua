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
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameFeatureFormUtil = require("org.allbinary.game.configuration.feature.GameFeatureFormUtil")
local InGameFeatureChoiceGroups = require("org.allbinary.game.configuration.feature.InGameFeatureChoiceGroups")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InGameOptionsForm = {}
InGameOptionsForm.__index = InGameOptionsForm
InGameOptionsForm.className = "InGameOptionsForm"
setmetatable(InGameOptionsForm, {__index = CommandForm})


function InGameOptionsForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CommandForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor), InGameOptionsForm)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local gameFeatureFormUtil = GameFeatureFormUtil.getInstance()
        gameFeatureFormUtil:addChoiceGroup(self, InGameFeatureChoiceGroups.getExclusiveInstance():get(), Choice.EXCLUSIVE)
        gameFeatureFormUtil:addChoiceGroup(self, InGameFeatureChoiceGroups.getMultipleInstance():get(), Choice.MULTIPLE)
        self:initCommands(commandListener)
    return self
end


function InGameOptionsForm:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:addCommand(InGameOptionsForm.DEFAULT)
        self:setCommandListener(cmdListener)
end

InGameOptionsForm.DISPLAY = Command.new("Options In Game", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
InGameOptionsForm.SAVE = Command.new("Save", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
InGameOptionsForm.DEFAULT = Command.new("Default", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)

return InGameOptionsForm

