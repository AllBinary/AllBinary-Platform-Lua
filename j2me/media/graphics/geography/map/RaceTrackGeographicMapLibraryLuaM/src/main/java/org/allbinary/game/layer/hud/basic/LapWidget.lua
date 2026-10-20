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
-- package org.allbinary.game.layer.hud.basic

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local LapInfo = require("org.allbinary.game.layer.hud.LapInfo")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LapWidget = {}
LapWidget.__index = LapWidget
LapWidget.className = "LapWidget"
setmetatable(LapWidget, {__index = BasicHud})

function LapWidget:_init_fields()
    self.LAP_STR = "Lap "
    self.OF_STR = " of "
    self.string = StringUtil.getInstance().EMPTY_STRING
end


function LapWidget.new(location, direction, basicColor)
    local self = setmetatable(BasicHud.new(location, direction, 2, basicColor), LapWidget)
    self:_init_fields()
        -- super(...) made self above
        self.updateMaxHeight = 15
        self.updateMaxWidth = 40
    return self
end


function LapWidget:update(lapInfo)
        local stringBuffer = StringMaker.new()
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.LAP_STR)
        stringBuffer:appendint(java_int(lapInfo:getCurrentLap()))
        stringBuffer:append(self.OF_STR)
        stringBuffer:appendint(java_int(lapInfo:getTotalLaps()))
        self.string = tostring(stringBuffer)
end


function LapWidget:paint(graphics)
        BasicHud.paintString(self, graphics, self.string)
end

return LapWidget

