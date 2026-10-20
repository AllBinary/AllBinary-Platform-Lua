-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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

local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local FormTypeFactory = require("org.allbinary.graphics.form.FormTypeFactory")
local MultipleScrollSelectionHorizontalForm = require("org.allbinary.graphics.form.MultipleScrollSelectionHorizontalForm")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local CommonButtons = require("org.allbinary.input.motion.button.CommonButtons")
local TouchButtonLocationHelper = require("org.allbinary.input.motion.button.TouchButtonLocationHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSScrollSelectionFormFactory = {}
RTSScrollSelectionFormFactory.__index = RTSScrollSelectionFormFactory
RTSScrollSelectionFormFactory.className = "RTSScrollSelectionFormFactory"

function RTSScrollSelectionFormFactory.new()
    local self = setmetatable({}, RTSScrollSelectionFormFactory)
    return self
end


-- throws Exception
function RTSScrollSelectionFormFactory.getInstance(formLabel, items)
        local basicColorFactory = BasicColorFactory.getInstance()
        local touchButtonLocationHelper = TouchButtonLocationHelper.new()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local menuX = CommonButtons.getInstance().STANDARD_BUTTON_SIZE + touchButtonLocationHelper:getColumnsRemainderHalf()
        local width = displayInfo:getLastWidth() - (menuX * 2)
        local menuRectangle = Rectangle.new(PointFactory.getInstance():createXY(menuX, 16), width, CommonButtons.getInstance().STANDARD_BUTTON_SIZE)
        return MultipleScrollSelectionHorizontalForm.createForm(formLabel, items, menuRectangle, FormTypeFactory.getInstance().HORIZONTAL_FORM, 0, basicColorFactory.BLACK, basicColorFactory.WHITE)
end

return RTSScrollSelectionFormFactory

