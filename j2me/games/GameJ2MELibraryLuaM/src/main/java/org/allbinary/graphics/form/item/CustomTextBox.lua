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
-- package org.allbinary.graphics.form.item

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")
local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local PlatformKeyFactory = require("org.allbinary.game.input.PlatformKeyFactory")
local RawKeyEventListener = require("org.allbinary.game.input.event.RawKeyEventListener")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local TextItemVisitor = require("org.allbinary.graphics.form.item.validation.TextItemVisitor")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomTextBox = {}
CustomTextBox.__index = CustomTextBox
CustomTextBox.className = "CustomTextBox"
setmetatable(CustomTextBox, {__index = GameCommandCanvas})

function CustomTextBox:_init_fields()
    self.textFieldItem = nil
    self.inputFactory = InputFactory.getInstance()
end


function CustomTextBox.new(cmdListener, label, text, maxSize, constraints, font, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(GameCommandCanvas.new(cmdListener, label, backgroundBasicColor, foregroundBasicColor), CustomTextBox)
    self:_init_fields()
        -- super(...) made self above
        local stringUtil = StringUtil.getInstance()
        local textFieldItem = ABTextFieldItem.new(self, TextItemVisitor.new(), stringUtil.EMPTY_STRING, stringUtil.EMPTY_STRING, maxSize, 0, stringUtil.EMPTY_STRING, font, backgroundBasicColor, foregroundBasicColor)
        textFieldItem:setString(text)
        self.textFieldItem = textFieldItem
        self:setTitle(label)
    return self
end


function CustomTextBox:submit()
end


function CustomTextBox:onEventRaw(keyCode, deviceId, repeated)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):appendint(keyCode)), self, "onEvent")
        self:keyPressedByDevice(keyCode, deviceId)
end


function CustomTextBox:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end


function CustomTextBox:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end


function CustomTextBox:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end


function CustomTextBox:keyPressedByDevice(keyCode, deviceId)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):appendint(keyCode)), self, self.gameInputStrings.KEY_PRESSED)
            local platformKeyFactory = PlatformKeyFactory.getInstance()
            local input = self.inputFactory:getInstanceById(keyCode)
            if platformKeyFactory:isSubmission(input) then
                self:submit()
            else
                self.textFieldItem:keyPressed(keyCode)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.KEY_PRESSED, e)
        end
end


function CustomTextBox:keyReleasedByDevice(keyCode, deviceId)
end


function CustomTextBox:paint(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:fillRect(0, 0, self.displayInfo:getLastWidth(), self.displayInfo:getLastHeight())
        graphics:setColor(self.foregroundColor)
        if not J2MEUtil.isJ2ME() then
            graphics:drawString(self:getTitle(), 8, 1, 0)
        end
        self:paintXY(graphics, 8, graphics:getFont():getHeight() + 2)
        GameCommandCanvas.paint(self, graphics)
end


function CustomTextBox:paintXY(graphics, x, y)
        self.textFieldItem:paintXY(graphics, x, y)
end


function CustomTextBox:getTextFieldItem()
        return self.textFieldItem
end

return CustomTextBox

