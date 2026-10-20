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
-- package org.allbinary.graphics.form

-- local Command = require("javax.microedition.lcdui.Command")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local RectangleAdjustedAnimation = require("org.allbinary.animation.vector.RectangleAdjustedAnimation")
local RectangleFilledAdjustedAnimation = require("org.allbinary.animation.vector.RectangleFilledAdjustedAnimation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local CommandTextItem = require("org.allbinary.graphics.form.item.CommandTextItem")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local ScrollCurrentSelectionForm = require("org.allbinary.graphics.form.ScrollCurrentSelectionForm")

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

local CommandCurrentSelectionForm = {}
CommandCurrentSelectionForm.__index = CommandCurrentSelectionForm
CommandCurrentSelectionForm.className = "CommandCurrentSelectionForm"
setmetatable(CommandCurrentSelectionForm, {__index = ScrollCurrentSelectionForm})

function CommandCurrentSelectionForm:_init_fields()
    self.selectedAnimationArray = java_new_array(nil, 16)
    self.unSelectedAnimationArray = java_new_array(nil, 16)
end


function CommandCurrentSelectionForm.new(title, items, border, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ScrollCurrentSelectionForm.new(title, items, ItemPaintableFactory.getInstance(), border, -3, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor), CommandCurrentSelectionForm)
    self:_init_fields()
        -- super(...) made self above
        self:initAnimations()
        self:addAll(items)
    return self
end


function CommandCurrentSelectionForm:updateMeasurement(graphics)
        self:updateAll(graphics, self:getAllitems())
        ScrollCurrentSelectionForm.updateMeasurement(self, graphics)
end


function CommandCurrentSelectionForm:initAnimations()
        local nullAnimation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        do
            local index = (self.selectedAnimationArray.n or #self.selectedAnimationArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.selectedAnimationArray[index + 1] = nullAnimation
            end
        end
        do
            local index = (self.unSelectedAnimationArray.n or #self.unSelectedAnimationArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.unSelectedAnimationArray[index + 1] = nullAnimation
            end
        end
end


function CommandCurrentSelectionForm:addAll(items)
        do
            local index = (items.n or #items)
            while (function() index = index - 1 return index end)() >= 0 do
            self:addAt(index, items[index + 1])
            end
        end
end


function CommandCurrentSelectionForm:addAt(index, item)
        local basicColorFactory = BasicColorFactory.getInstance()
        local buttonColor = basicColorFactory.TRANSPARENT_GREY
        local selectedButtonColor = basicColorFactory.TRANSPARENT_RED
        local width = item:getMinimumWidth()
        local height = item:getMinimumHeight()
        local adjustedBorder = 3
        local offset = -(self.halfBorder + adjustedBorder)
        local rectWidth = width + self.border - adjustedBorder
        local rectHeight = height + self.border - adjustedBorder
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            self.selectedAnimationArray[index + 1] = RectangleAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, selectedButtonColor)
        else
            self.selectedAnimationArray[index + 1] = RectangleFilledAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, selectedButtonColor)
        end
        adjustedBorder = 4
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            self.unSelectedAnimationArray[index + 1] = RectangleAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, buttonColor)
        else
            self.unSelectedAnimationArray[index + 1] = RectangleFilledAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, buttonColor)
        end
end


function CommandCurrentSelectionForm:updateAll(graphics, items)
        do
            local index = (items.n or #items)
            while (function() index = index - 1 return index end)() >= 0 do
            items[index + 1]:preMeasurement(graphics)
            self:updateAt(index, items[index + 1])
            end
        end
end


function CommandCurrentSelectionForm:updateAt(index, item)
        local basicColorFactory = BasicColorFactory.getInstance()
        local buttonColor = basicColorFactory.TRANSPARENT_GREY
        local selectedButtonColor = basicColorFactory.TRANSPARENT_RED
        local width = item:getMinimumWidth()
        local height = item:getMinimumHeight()
        local adjustedBorder = 3
        local offset = -(self.halfBorder + adjustedBorder)
        local rectWidth = width + self.border - adjustedBorder
        local rectHeight = height + self.border - adjustedBorder
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            local rectangleAdjustedAnimation = self.selectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(selectedButtonColor)
        else
            local rectangleAdjustedAnimation = self.selectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(selectedButtonColor)
        end
        adjustedBorder = 4
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            local rectangleAdjustedAnimation = self.unSelectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(buttonColor)
        else
            local rectangleAdjustedAnimation = self.unSelectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(buttonColor)
        end
end


function CommandCurrentSelectionForm:getSelectedCommand()
        local index = ScrollCurrentSelectionForm.getSelectedIndex(self)
        local commandTextItem = self:get(index)
        return commandTextItem:getCommand()
end


function CommandCurrentSelectionForm:append(item)
        local result = ScrollCurrentSelectionForm.append(self, item)
        self:addAt(result, item)
        return result
end


function CommandCurrentSelectionForm:delete(itemNum)
        ScrollCurrentSelectionForm.delete(self, itemNum)
end


function CommandCurrentSelectionForm:deleteAll()
        self:initAnimations()
        ScrollCurrentSelectionForm.deleteAll(self)
end


function CommandCurrentSelectionForm:insert(itemNum, item)
        ScrollCurrentSelectionForm.insert(self, itemNum, item)
end


function CommandCurrentSelectionForm:set(itemNum, item)
        ScrollCurrentSelectionForm.set(self, itemNum, item)
end


function CommandCurrentSelectionForm:paint(graphics)
        self.myFontProcessor:process(graphics)
        ScrollCurrentSelectionForm.paint(self, graphics)
end


-- throws Exception
function CommandCurrentSelectionForm:paintItem(graphics, index, item, x, y)
        self.selectedAnimationArray[index + 1]:paintXY(graphics, x, y)
        return ScrollCurrentSelectionForm.paintItem(self, graphics, index, item, x, y)
end


-- throws Exception
function CommandCurrentSelectionForm:paintUnselectedItem(graphics, index, item, x, y)
        self.unSelectedAnimationArray[index + 1]:paintXY(graphics, x, y)
        return ScrollCurrentSelectionForm.paintUnselectedItem(self, graphics, index, item, x, y)
end

return CommandCurrentSelectionForm

