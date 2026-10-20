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
-- package org.allbinary.game.ag.layer.hud.basic.score

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local NumberStringHud = require("org.allbinary.game.ag.layer.hud.basic.NumberStringHud")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScoreHudWidget = {}
ScoreHudWidget.__index = ScoreHudWidget
ScoreHudWidget.className = "ScoreHudWidget"
setmetatable(ScoreHudWidget, {__index = NumberStringHud})


-- throws Exception
function ScoreHudWidget.getInstance(maxscore, location, direction)
        return ScoreHudWidget.new(maxscore, location, direction, 2, BasicColorFactory.getInstance().GREY)
end


function ScoreHudWidget.new(maxscore, location, direction, bufferZone, basicColor)
    local self = setmetatable(NumberStringHud.new("Pts ", maxscore, location, direction, bufferZone, basicColor), ScoreHudWidget)
        -- super(...) made self above
        self.updateMaxHeight = 14
    return self
end


function ScoreHudWidget:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.updateMaxWidth = font:getSize() * 5
        NumberStringHud.updateMeasurement(self, graphics)
end

return ScoreHudWidget

