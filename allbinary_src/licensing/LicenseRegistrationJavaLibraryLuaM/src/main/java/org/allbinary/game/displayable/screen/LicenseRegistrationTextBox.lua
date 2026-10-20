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
-- package org.allbinary.game.displayable.screen

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local TextField = require("javax.microedition.lcdui.TextField")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CustomTextBox = require("org.allbinary.graphics.form.item.CustomTextBox")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local SimpleTextPaintable = require("org.allbinary.graphics.paint.SimpleTextPaintable")
local VirtualKeyboardEventHandler = require("org.allbinary.input.event.VirtualKeyboardEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseRegistrationTextBox = {}
LicenseRegistrationTextBox.__index = LicenseRegistrationTextBox
LicenseRegistrationTextBox.className = "LicenseRegistrationTextBox"
setmetatable(LicenseRegistrationTextBox, {__index = CustomTextBox})

function LicenseRegistrationTextBox:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.pleaseWaitPaintable = SimpleTextPaintable.new(self.commonStrings.PLEASE_WAIT, BasicColorFactory.getInstance().WHITE)
    self.paintable = NullPaintable.getInstance()
end


function LicenseRegistrationTextBox.new(cmdListener, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CustomTextBox.new(cmdListener, "Enter Registration Code:", StringUtil.getInstance().EMPTY_STRING, 60, TextField.ANY, Font.getDefaultFont(), backgrounBasicColor, foregroundBasicColor), LicenseRegistrationTextBox)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function LicenseRegistrationTextBox:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:addCommand(GameCommandsFactory.getInstance().TOGGLE_KEYBOARD)
        self:addCommand(LicenseRegistrationTextBox.SUBMIT_COMMAND)
        self:setCommandListener(cmdListener)
end


function LicenseRegistrationTextBox:open()
        local try_ok, try_error = pcall(function()
            local virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
            virtualKeyboardEventHandler:fireEvent(virtualKeyboardEventHandler.SHOW_EVENT)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "open", e)
        end
        CustomTextBox.open(self)
        self.paintable = NullPaintable.getInstance()
        self:repaint()
end


-- throws Exception
function LicenseRegistrationTextBox:close()
        local try_ok, try_error = pcall(function()
            local virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
            virtualKeyboardEventHandler:fireEvent(virtualKeyboardEventHandler.HIDE_EVENT)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "open", e)
        end
        self.paintable = self.pleaseWaitPaintable
        self:repaint()
        CustomTextBox.close(self)
end


function LicenseRegistrationTextBox:paint(graphics)
        CustomTextBox.paint(self, graphics)
        self.paintable:paint(graphics)
end


function LicenseRegistrationTextBox:submit()
        local commandListener = self:getCustomCommandListener()
        commandListener:commandAction(LicenseRegistrationTextBox.SUBMIT_COMMAND, self)
end

LicenseRegistrationTextBox.DISPLAY_COMMAND = Command.new("Register", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3)
LicenseRegistrationTextBox.SUBMIT_COMMAND = Command.new("Submit", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3)

return LicenseRegistrationTextBox

