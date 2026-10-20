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
-- package org.allbinary.graphics.paint

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Paintable = require("org.allbinary.graphics.paint.Paintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaintableComposite = {}
PaintableComposite.__index = PaintableComposite
PaintableComposite.className = "PaintableComposite"
setmetatable(PaintableComposite, {__index = Paintable})

function PaintableComposite:_init_fields()
    self.paintableArray = nil
end


function PaintableComposite.new(paintableArray)
    local self = setmetatable(Paintable.new(), PaintableComposite)
    self:_init_fields()
        self.paintableArray = paintableArray
    return self
end


function PaintableComposite:paint(graphics)
        for index = (self.paintableArray.n or #self.paintableArray) - 1, 0, -1 do
            self.paintableArray[index + 1]:paint(graphics)
        end
end


function PaintableComposite:paintThreed(graphics)
        for index = (self.paintableArray.n or #self.paintableArray) - 1, 0, -1 do
            self.paintableArray[index + 1]:paintThreed(graphics)
        end
end

return PaintableComposite

