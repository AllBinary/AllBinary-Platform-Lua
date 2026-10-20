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
-- package org.allbinary.game.displayable.canvas

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local CanvasDrawLineString = require("org.allbinary.graphics.draw.CanvasDrawLineString")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreGameSelectorPaintable = {}
PreGameSelectorPaintable.__index = PreGameSelectorPaintable
PreGameSelectorPaintable.className = "PreGameSelectorPaintable"
setmetatable(PreGameSelectorPaintable, {__index = InitUpdatePaintable})

function PreGameSelectorPaintable:_init_fields()
    self.title = nil
    self.canvasDrawLineString = nil
    self.preGameScrollSelectionForm = nil
end


function PreGameSelectorPaintable.new(title, preGameScrollSelectionForm)
    local self = setmetatable(InitUpdatePaintable.new(), PreGameSelectorPaintable)
    self:_init_fields()
        self.title = title
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.canvasDrawLineString = CanvasDrawLineString.new(displayInfo:getLastHalfWidth(), 0)
        self.preGameScrollSelectionForm = preGameScrollSelectionForm
    return self
end


function PreGameSelectorPaintable:update()
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.canvasDrawLineString = CanvasDrawLineString.new(displayInfo:getLastHalfWidth(), 0)
end


function PreGameSelectorPaintable:paint(graphics)
        graphics:setColor(math.tointeger(BasicColorFactory.getInstance().WHITE // 1))
        self.canvasDrawLineString:paint(graphics, self.title, 0)
        self:getPreGameSelectionForm():paint(graphics)
end


function PreGameSelectorPaintable:getPreGameSelectionForm()
        return self.preGameScrollSelectionForm
end

return PreGameSelectorPaintable

