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

-- local Command = require("javax.microedition.lcdui.Command")
-- local ImageItem = require("javax.microedition.lcdui.ImageItem")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local ScreenInfo = require("org.allbinary.graphics.form.ScreenInfo")
local VectorUtil = require("org.allbinary.logic.VectorUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local CommandTextItemArrayFactory = {}
CommandTextItemArrayFactory.__index = CommandTextItemArrayFactory
CommandTextItemArrayFactory.className = "CommandTextItemArrayFactory"

function CommandTextItemArrayFactory:_init_fields()
    self.list = BasicArrayListD.new()
    self.visitorInterface = nil
end


function CommandTextItemArrayFactory.new(visitorInterface)
    local self = setmetatable({}, CommandTextItemArrayFactory)
    self:_init_fields()
        self.visitorInterface = visitorInterface
    return self
end


function CommandTextItemArrayFactory:getInstance(vector, backgroundBasicColor, foregroundBasicColor)
        local vectorUtil = VectorUtil.getInstance()
        local size = vectorUtil:getSize(vector)
        self.list:clear()
        local textItem = nil
        local priorityLimit = 7
        local displayInfo = DisplayInfoSingleton.getInstance()
        local isLargeEnoughDisplayForBigMenu = (displayInfo:isPortrait() and displayInfo:getLastHeight() >= ScreenInfo.getInstance().MEDIUM_WIDTH) or (not displayInfo:isPortrait() and displayInfo:getLastWidth() >= ScreenInfo.getInstance().MEDIUM_WIDTH)
        if not isLargeEnoughDisplayForBigMenu and size > 3 then
            priorityLimit = 3
        end
        local command = nil
        for index = 0, size - 1 do
            command = vectorUtil:elementAt(vector, index)
            if command:getPriority() < priorityLimit then
                local aBoolean = self.visitorInterface:visit(command)
                if aBoolean then
                    textItem = CommandTextItem.new(command, ImageItem.LAYOUT_DEFAULT, StringUtil.getInstance().EMPTY_STRING, backgroundBasicColor, foregroundBasicColor)
                    self.list:add(textItem)
                end
            end
        end
        local textItemArray = java_new_array(nil, self.list:size())
        local size2 = (textItemArray.n or #textItemArray)
        for index = 0, size2 - 1 do
            textItemArray[index + 1] = self.list.objectArray[index + 1]
        end
        return textItemArray
end

return CommandTextItemArrayFactory

