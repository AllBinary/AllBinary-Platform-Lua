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
-- package org.allbinary.game.score.displayable

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local TextField = require("javax.microedition.lcdui.TextField")
local PostGameCommandFactory = require("org.allbinary.PostGameCommandFactory")
local GameInfo = require("org.allbinary.game.GameInfo")
local HighScore = require("org.allbinary.game.score.HighScore")
local HighScoresHelperBaseInterface = require("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CustomTextBox = require("org.allbinary.graphics.form.item.CustomTextBox")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local SimpleTextPaintable = require("org.allbinary.graphics.paint.SimpleTextPaintable")
local VirtualKeyboardEventHandler = require("org.allbinary.input.event.VirtualKeyboardEventHandler")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local InApplicationPurchaseFactory = require("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoreTextBox = {}
HighScoreTextBox.__index = HighScoreTextBox
HighScoreTextBox.className = "HighScoreTextBox"
setmetatable(HighScoreTextBox, {__index = CustomTextBox})

function HighScoreTextBox:_init_fields()
    self.virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
    self.highScoreUtil = nil
    self.pleaseWait = SimpleTextPaintable.new(self.commonStrings.PLEASE_WAIT, BasicColorFactory.getInstance().WHITE)
    self.paintable = NullPaintable.getInstance()
    self.submitted = false
end


function HighScoreTextBox.new(highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(CustomTextBox.new(cmdListener, "New High Score Enter Name:", name, 12, TextField.ANY, Font.getDefaultFont(), backgrounBasicColor, foregroundBasicColor), HighScoreTextBox)
    self:_init_fields()
        -- super(...) made self above
        self.highScoreUtil = HighScoreUtil.new(highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore)
        local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
        if operatingSystemInterface:isOverScan() then
            local username = InApplicationPurchaseFactory.getInstance():getUserName()
            if username ~= nil then
                self:getTextFieldItem():setString(username)
            else
                self:getTextFieldItem():setString("NoGamerInfo")
            end
        end
    return self
end


function HighScoreTextBox:initCommands(cmdListener)
        self:removeAllCommands()
        PostGameCommandFactory.getInstance():addCommands(self)
        self:addCommand(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND)
        self:setCommandListener(cmdListener)
end


function HighScoreTextBox:open()
        self.virtualKeyboardEventHandler:open()
        self.paintable = NullPaintable.getInstance()
        CustomTextBox.open(self)
end


-- throws Exception
function HighScoreTextBox:close()
        self.virtualKeyboardEventHandler:close()
        self.paintable = self.pleaseWait
        self.repaintBehavior:onChangeRepaint(self)
        CustomTextBox.close(self)
        self:removeCommand(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND)
        self:update()
        if self.submitted then
            self.highScoreUtil:saveHighScore()
        else
        end
        self.paintable = NullPaintable.getInstance()
        self.repaintBehavior:onChangeRepaint(self)
end


-- throws Exception
function HighScoreTextBox:update()
        local name = self:getTextFieldItem():getString()
        self.highScoreUtil:update(name)
        CustomTextBox.update(self)
end


function HighScoreTextBox:paint(graphics)
        CustomTextBox.paint(self, graphics)
        self.paintable:paint(graphics)
end


function HighScoreTextBox:saveHighScore()
        self.highScoreUtil:saveHighScore()
end


function HighScoreTextBox:submit()
        self.highScoreUtil:submit(self)
end

return HighScoreTextBox

