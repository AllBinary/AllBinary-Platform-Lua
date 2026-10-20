-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultiSelectPaintable = {}
MultiSelectPaintable.__index = MultiSelectPaintable
MultiSelectPaintable.className = "MultiSelectPaintable"
setmetatable(MultiSelectPaintable, {__index = SelectionHudPaintable})

function MultiSelectPaintable:_init_fields()
    self.rootNameList = BasicArrayListD.new()
    self.totalCharArray = NullUtil.getInstance().NULL_CHAR_ARRAY
    self.rootNamesString = StringUtil.getInstance().EMPTY_STRING
    self.TOTAL = "Total Selected: "
    self.backgroundColor = math.tointeger(BasicColorFactory.getInstance().GREY // 1)
    self.totalWidth = 0
    self.textLine2Y = 0
end


function MultiSelectPaintable.new()
    local self = setmetatable(SelectionHudPaintable.new(), MultiSelectPaintable)
    self:_init_fields()
    return self
end


function MultiSelectPaintable:updateMeasurement(graphics)
        SelectionHudPaintable.updateMeasurement(self, graphics)
        local font = graphics:getFont()
        self.totalWidth = font:stringWidth(self.TOTAL)
        self.textLine2Y = (self.y + font:getHeight())
end


function MultiSelectPaintable:update(list)
        self:clear()
        local size = list:size()
        self.totalCharArray = self:getPrimitiveLongUtil():getCharArray(size)
        for index = list:size() - 1, 0, -1 do
            local rtsLayer = list:get(index)
            if not self.rootNameList:contains(rtsLayer:getRootName()) then
                self.rootNameList:add(rtsLayer:getRootName())
            end
        end
        local COMMA_SEP = CommonSeps.getInstance().COMMA_SEP
        local stringBuffer = StringMaker.new()
        for index = self.rootNameList:size() - 1, 0, -1 do
            local rootName = self.rootNameList:get(index)
            stringBuffer:append(rootName)
            if index ~= 0 then
                stringBuffer:append(COMMA_SEP)
            end
        end
        self.rootNamesString = tostring(stringBuffer)
end


function MultiSelectPaintable:clear()
        self.rootNameList:clear()
end


function MultiSelectPaintable:paint(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:drawRect(self:getX(), self.y, self:getWidth(), self:getHeight())
        graphics:setColor(self:getColor())
        graphics:drawString(self.TOTAL, self.textX, self.y, 0)
        graphics:drawChars(self.totalCharArray, 0, self:getPrimitiveLongUtil():getCurrentTotalDigits(), self.textX + self.totalWidth, self.y, 0)
        graphics:drawString(self.rootNamesString, self.textX, self.textLine2Y, 0)
end

return MultiSelectPaintable

