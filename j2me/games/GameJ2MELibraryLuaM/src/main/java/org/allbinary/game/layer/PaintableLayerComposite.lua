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
-- package org.allbinary.game.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local Layer = require("org.allbinary.layer.Layer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaintableLayerComposite = {}
PaintableLayerComposite.__index = PaintableLayerComposite
PaintableLayerComposite.className = "PaintableLayerComposite"
setmetatable(PaintableLayerComposite, {__index = Paintable})

function PaintableLayerComposite:_init_fields()
    self.paintableArray = nil
end


function PaintableLayerComposite.new(paintableArray)
    local self = setmetatable(Paintable.new(), PaintableLayerComposite)
    self:_init_fields()
        self.paintableArray = paintableArray
    return self
end


function PaintableLayerComposite:paint(graphics)
        do
            local index = (self.paintableArray.n or #self.paintableArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.paintableArray[index + 1]:paint(graphics)
            end
        end
end


function PaintableLayerComposite:paintThreed(graphics)
        local paintableInterface = nil
        do
            local index = (self.paintableArray.n or #self.paintableArray)
            while (function() index = index - 1 return index end)() >= 0 do
            paintableInterface = self.paintableArray[index + 1]
            paintableInterface:paintThreed(graphics)
            end
        end
end

return PaintableLayerComposite

