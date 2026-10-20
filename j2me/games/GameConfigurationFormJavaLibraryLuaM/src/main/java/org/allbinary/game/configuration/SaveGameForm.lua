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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local TextField = require("javax.microedition.lcdui.TextField")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
local MEUtil = require("org.allbinary.logic.MEUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SaveGameForm = {}
SaveGameForm.__index = SaveGameForm
SaveGameForm.className = "SaveGameForm"
setmetatable(SaveGameForm, {__index = CommandForm})

function SaveGameForm:_init_fields()
    self.meUtil = MEUtil.getInstance()
end


-- throws Exception
function SaveGameForm.createForm(commandListener, title, backgrounBasicColor, foregroundBasicColor)
        SaveGameForm.FORM = SaveGameForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
        return SaveGameForm.FORM
end


function SaveGameForm.getInstance()
        return SaveGameForm.FORM
end


function SaveGameForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CommandForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor), SaveGameForm)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local timeString = tostring(ABSystemWrapper.getInstance():currentTimeMillis())
        self.meUtil:appendItem(self, TextField.new("Name: ", timeString, 30, TextField.ANY))
        self:initCommands(commandListener)
    return self
end


function SaveGameForm:initCommands(cmdListener)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        self:removeAllCommands()
        self:addCommand(gameCommandsFactory.SAVE)
        self:addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end

SaveGameForm.FORM = CommandForm.getNullCommandForm()

return SaveGameForm

