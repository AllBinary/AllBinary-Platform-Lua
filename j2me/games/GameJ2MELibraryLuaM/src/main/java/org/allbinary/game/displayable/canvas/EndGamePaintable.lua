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

local EndGamePaintable = {}
EndGamePaintable.__index = EndGamePaintable
EndGamePaintable.className = "EndGamePaintable"
setmetatable(EndGamePaintable, {__index = Paintable})

function EndGamePaintable:_init_fields()
    self.gameCanvas = nil
end


function EndGamePaintable.new(gameCanvas)
    local self = setmetatable(Paintable.new(), EndGamePaintable)
    self:_init_fields()
        self.gameCanvas = gameCanvas
    return self
end


function EndGamePaintable:paint(graphics)
        self.gameCanvas:paintGameOver(graphics)
end

return EndGamePaintable

