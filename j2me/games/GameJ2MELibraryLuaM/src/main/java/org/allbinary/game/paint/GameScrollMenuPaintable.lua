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
-- package org.allbinary.game.paint

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ColorChangeEventHandler = require("org.allbinary.graphics.color.ColorChangeEventHandler")
local ColorChangeListener = require("org.allbinary.graphics.color.ColorChangeListener")
local FormPaintable = require("org.allbinary.graphics.form.FormPaintable")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local ABStringComponent = require("org.allbinary.graphics.form.item.ABStringComponent")
local ABTextItem = require("org.allbinary.graphics.form.item.ABTextItem")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local BasicGameDemoPaintable = require("org.allbinary.game.paint.BasicGameDemoPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameScrollMenuPaintable = {}
GameScrollMenuPaintable.__index = GameScrollMenuPaintable
GameScrollMenuPaintable.className = "GameScrollMenuPaintable"
setmetatable(GameScrollMenuPaintable, {__index = BasicGameDemoPaintable})


function GameScrollMenuPaintable.new(mainDemoStatePaintable, ownershipPaintable, helpPaintableInterface, basicColor)
    local self = setmetatable(BasicGameDemoPaintable.new(mainDemoStatePaintable, ownershipPaintable, helpPaintableInterface), GameScrollMenuPaintable)
        -- super(...) made self above
        self:setColor(basicColor)
        ColorChangeEventHandler.getInstance():addListenerInterface(self)
    return self
end


function GameScrollMenuPaintable:setState(state)
        self:setCurrentStatePaintable(self:getMainDemoStatePaintable())
end


function GameScrollMenuPaintable:onEvent(eventObject)
end


function GameScrollMenuPaintable:setColor(basicColor)
        local mainGameDemoStatePaintable = self:getMainDemoStatePaintable()
        local formPaintable = mainGameDemoStatePaintable:getMenuPaintableInterface()
        local scrollSelectionForm = formPaintable:getForm()
        mainGameDemoStatePaintable:getOwnershipPaintableInterface():setBasicColorP(basicColor)
        scrollSelectionForm:setButtonBasicColor(basicColor)
        local item = nil
        local stringComponent = nil
        for index = scrollSelectionForm:size() - 1, 0, -1 do
            item = scrollSelectionForm:get(index)
            stringComponent = item:getLabelStringComponent()
            if stringComponent ~= nil then
                stringComponent:setForegroundBasicColor(basicColor)
            end
        end
end

return GameScrollMenuPaintable

