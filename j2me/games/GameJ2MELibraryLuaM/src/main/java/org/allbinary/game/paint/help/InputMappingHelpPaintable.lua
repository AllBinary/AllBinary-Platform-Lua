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
-- package org.allbinary.game.paint.help

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local Input = require("org.allbinary.game.input.Input")
local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local GameInputMapping = require("org.allbinary.game.input.mapping.GameInputMapping")
local PersistentInputMapping = require("org.allbinary.game.input.mapping.PersistentInputMapping")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HelpPaintable = require("org.allbinary.game.paint.help.HelpPaintable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local InputMappingHelpPaintable = {}
InputMappingHelpPaintable.__index = InputMappingHelpPaintable
InputMappingHelpPaintable.className = "InputMappingHelpPaintable"
setmetatable(InputMappingHelpPaintable, {__index = HelpPaintable})
local UpdateMyFontProperties = {}
    UpdateMyFontProperties.__index = UpdateMyFontProperties
    UpdateMyFontProperties.className = "UpdateMyFontProperties"
    InputMappingHelpPaintable.UpdateMyFontProperties = UpdateMyFontProperties

    function UpdateMyFontProperties:_init_fields()
        self.actionStringArray = StringUtil.getInstance():getArrayInstance()
        self.keymappingBeginWidthArray = NullUtil.getInstance().NULL_INT_ARRAY
        self.actionStringDeltaXArray = NullUtil.getInstance().NULL_INT_ARRAY
        self.inputDeltaXArray = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY
        self.sepArray = java_new_array(nil, 0, 0)
        self.sepWidthArray = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY
        self.charHeight = 0
    end

    function UpdateMyFontProperties.new()
        local self = setmetatable({}, UpdateMyFontProperties)
        self:_init_fields()
        return self
    end


function InputMappingHelpPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.NONE = GameKeyFactory.getInstance().NONE
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.gameInputMappingArray = nil
    self.keyMappingArray = java_new_array(nil, 0)
    self.actionBasicColor = java_new_array(nil, 0)
    self.inputBasicColorArray = java_new_array(nil, 0, 0)
    self.selectedBasicColor = nil
    self.updateMyFontProperties = UpdateMyFontProperties.new()
end


function InputMappingHelpPaintable.new(gameInputMappingArray, backgroundBasicColor, basicColor)
    local self = setmetatable(HelpPaintable.new("Input Mapping", backgroundBasicColor, basicColor), InputMappingHelpPaintable)
    self:_init_fields()
        -- super(...) made self above
        self.gameInputMappingArray = gameInputMappingArray
        self:update(self.NONE, self.NONE)
        if backgroundBasicColor == self.basicColorFactory.WHITE or basicColor == self.basicColorFactory.WHITE then
            self.selectedBasicColor = self.basicColorFactory.RED
        else
            self.selectedBasicColor = self.basicColorFactory.WHITE
        end
    return self
end


function InputMappingHelpPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        local updateMyFontProperties = UpdateMyFontProperties.new()
        updateMyFontProperties.charHeight = font:getHeight()
        local stringMaker = StringMaker.new()
        local inputInfo = self.inputInfo
        local size = (inputInfo.n or #inputInfo)
        updateMyFontProperties.actionStringArray = java_new_array(nil, size)
        updateMyFontProperties.keymappingBeginWidthArray = java_new_array(0, size)
        updateMyFontProperties.actionStringDeltaXArray = java_new_array(0, size)
        updateMyFontProperties.inputDeltaXArray = java_new_array(0, size, 0)
        updateMyFontProperties.sepArray = java_new_array(nil, size, 0)
        updateMyFontProperties.sepWidthArray = java_new_array(0, size, 0)
        local list = nil
        local keyMappings = nil
        local actionString = nil
        local input = nil
        local size2 = 0
        for index = 0, size - 1 do
            list = self.keyMappingArray[index + 1]
            keyMappings = self:get(list)
            stringMaker:delete(0, stringMaker:length())
            actionString = tostring(stringMaker:append(inputInfo[index + 1]):append(self.commonSeps.COLON):append(self.commonSeps.SPACE):append(self.commonSeps.SPACE))
            updateMyFontProperties.actionStringArray[index + 1] = actionString
            stringMaker:delete(0, stringMaker:length())
            updateMyFontProperties.keymappingBeginWidthArray[index + 1] = (((font:stringWidth(tostring(stringMaker:append(updateMyFontProperties.actionStringArray[index + 1]):append(keyMappings)))) // (1 << (1))))
            updateMyFontProperties.actionStringDeltaXArray[index + 1] = font:stringWidth(actionString)
            size2 = list:size()
            updateMyFontProperties.inputDeltaXArray[index + 1] = java_new_array(0, size2)
            updateMyFontProperties.sepArray[index + 1] = java_new_array(nil, size2)
            updateMyFontProperties.sepWidthArray[index + 1] = java_new_array(0, size2)
            for index2 = 0, size2 - 1 do
                input = list.objectArray[index2 + 1]
                updateMyFontProperties.inputDeltaXArray[index + 1][index2 + 1] = font:stringWidth(input:getName())
                updateMyFontProperties.sepArray[index + 1][index2 + 1] = self.EMPTY_STRING
                if index2 + 1 < list:size() then
                    if list:size() == 2 then
                        updateMyFontProperties.sepArray[index + 1][index2 + 1] = InputMappingHelpPaintable.AND
                    else
                        if index2 + 2 == list:size() then
                            updateMyFontProperties.sepArray[index + 1][index2 + 1] = InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND
                        else
                            updateMyFontProperties.sepArray[index + 1][index2 + 1] = InputMappingHelpPaintable.SEP
                        end
                    end
                end
                if updateMyFontProperties.sepArray[index + 1][index2 + 1] ~= self.EMPTY_STRING then
                    updateMyFontProperties.sepWidthArray[index + 1][index2 + 1] = font:stringWidth(updateMyFontProperties.sepArray[index + 1][index2 + 1])
                end
            end
        end
        self.updateMyFontProperties = updateMyFontProperties
        HelpPaintable.updateMeasurement(self, graphics)
end


function InputMappingHelpPaintable:update(selectedGameKey, selectedInput)
        local stringMaker = StringMaker.new()
        self.logUtil:putF(tostring(stringMaker:append(CommonLabels.getInstance().START_LABEL):append("selected GameKey: "):append(self.stringUtil:toString(selectedGameKey)):append(" Input: "):append(self.stringUtil:toString(selectedInput))), self, self.commonStrings.UPDATE)
        local gameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance()
        local size = (self.gameInputMappingArray.n or #self.gameInputMappingArray)
        local keyInfo = java_new_array(nil, size)
        local keyMappingArray = java_new_array(nil, size)
        local actionBasicColor = java_new_array(nil, size)
        local inputBasicColorArray = java_new_array(nil, size)
        local gameInputMapping = nil
        local gameKey = nil
        local list = nil
        for index = 0, size - 1 do
            gameInputMapping = self.gameInputMappingArray[index + 1]
            gameKey = gameInputMapping:getGameKey()
            list = gameKeyMapping:getInputMapping():getMappedInput(gameKey)
            local size2 = list:size()
            inputBasicColorArray[index + 1] = java_new_array(nil, size2)
            for index2 = 0, size2 - 1 do
                inputBasicColorArray[index + 1][index2 + 1] = self.basicColor
            end
            if gameKey == selectedGameKey then
                stringMaker:delete(0, stringMaker:length())
                self.logUtil:putF(tostring(stringMaker:append("Found: selected GameKey: "):append(self.stringUtil:toString(selectedGameKey))), self, self.commonStrings.UPDATE)
                actionBasicColor[index + 1] = self.selectedBasicColor
                local indexOfSelectedInput = list:indexOf(selectedInput)
                if indexOfSelectedInput >= 0 then
                    stringMaker:delete(0, stringMaker:length())
                    self.logUtil:putF(tostring(stringMaker:append("Found: selected Input: "):append(self.stringUtil:toString(selectedInput))), self, self.commonStrings.UPDATE)
                    inputBasicColorArray[index + 1][indexOfSelectedInput + 1] = self.selectedBasicColor
                end
            else
                actionBasicColor[index + 1] = self.basicColor
            end
            keyInfo[index + 1] = gameInputMapping:getName()
            keyMappingArray[index + 1] = list
        end
        self.keyMappingArray = keyMappingArray
        self.actionBasicColor = actionBasicColor
        self.inputBasicColorArray = inputBasicColorArray
        HelpPaintable.setInputInfoP(self, keyInfo)
        self.myFontProcessor = self.updateMyFontProcessor
end


function InputMappingHelpPaintable:get(keyList)
        local stringBuffer = StringMaker.new()
        local key = nil
        local size = keyList:size()
        for index = 0, size - 1 do
            key = keyList.objectArray[index + 1]
            stringBuffer:append(key:getName())
            if index + 1 < keyList:size() then
                if keyList:size() == 2 then
                    stringBuffer:append(InputMappingHelpPaintable.AND)
                else
                    if index + 2 == keyList:size() then
                        stringBuffer:append(InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND)
                    else
                        stringBuffer:append(InputMappingHelpPaintable.SEP)
                    end
                end
            end
        end
        return tostring(stringBuffer)
end


function InputMappingHelpPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        graphics:setColor(math.tointeger(self.basicColor // 1))
        graphics:drawString(self.title, halfWidth - self.titleBeginWidth, self.updateMyFontProperties.charHeight, self.anchor)
        local inputInfo = self.inputInfo
        local size = (inputInfo.n or #inputInfo)
        local y = 0
        local deltaX = 0
        local size2 = 0
        local actionString = nil
        local input = nil
        local list = nil
        local sep = nil
        local beginWidth = 0
        for index = 0, size - 1 do
            y = (index + 3) * self.updateMyFontProperties.charHeight
            deltaX = 0
            list = self.keyMappingArray[index + 1]
            size2 = list:size()
            beginWidth = self.updateMyFontProperties.keymappingBeginWidthArray[index + 1]
            graphics:setColor(math.tointeger(self.actionBasicColor[index + 1] // 1))
            actionString = self.updateMyFontProperties.actionStringArray[index + 1]
            graphics:drawString(actionString, halfWidth - beginWidth + deltaX, y, self.anchor)
            deltaX = deltaX + (self.updateMyFontProperties.actionStringDeltaXArray[index + 1])
            for index2 = 0, size2 - 1 do
                input = list.objectArray[index2 + 1]
                graphics:setColor(math.tointeger(self.inputBasicColorArray[index + 1][index2 + 1] // 1))
                graphics:drawString(input:getName(), halfWidth - beginWidth + deltaX, y, self.anchor)
                deltaX = deltaX + (self.updateMyFontProperties.inputDeltaXArray[index + 1][index2 + 1])
                sep = self.updateMyFontProperties.sepArray[index + 1][index2 + 1]
                graphics:setColor(math.tointeger(self.basicColor // 1))
                graphics:drawString(sep, halfWidth - beginWidth + deltaX, y, self.anchor)
                deltaX = deltaX + (self.updateMyFontProperties.sepWidthArray[index + 1][index2 + 1])
            end
        end
end

InputMappingHelpPaintable.AND = " and "
InputMappingHelpPaintable.SEP = ", "
InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND = ", and "

return InputMappingHelpPaintable

