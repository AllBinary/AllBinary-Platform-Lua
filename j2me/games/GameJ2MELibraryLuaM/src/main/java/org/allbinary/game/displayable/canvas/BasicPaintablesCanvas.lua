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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = require("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = require("org.allbinary.game.paint.ColorFillPaintableFactory")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicPaintablesCanvas = {}
BasicPaintablesCanvas.__index = BasicPaintablesCanvas
BasicPaintablesCanvas.className = "BasicPaintablesCanvas"
setmetatable(BasicPaintablesCanvas, {__index = GameCommandCanvas})

function BasicPaintablesCanvas:_init_fields()
    self.paintableArray = nil
    self.colorFillPaintable = nil
end


function BasicPaintablesCanvas.new(cmdListener, name, allBinaryGameLayerManager, paintableArray)
    local self = setmetatable(GameCommandCanvas.new(cmdListener, name, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor()), BasicPaintablesCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.paintableArray = paintableArray
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
    return self
end


function BasicPaintablesCanvas:paint(graphics)
        self.colorFillPaintable:paint(graphics)
        graphics:setColor(self.foregroundColor)
        for index = (self.paintableArray.n or #self.paintableArray) - 1, 0, -1 do
            self.paintableArray[index + 1]:paint(graphics)
        end
        GameCommandCanvas.paint(self, graphics)
end

return BasicPaintablesCanvas

