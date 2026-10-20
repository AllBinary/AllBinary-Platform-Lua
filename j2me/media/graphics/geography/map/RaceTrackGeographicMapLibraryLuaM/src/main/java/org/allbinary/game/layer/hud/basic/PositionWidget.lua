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

--super.paint(graphics, positionString, currentPostString, offset2, offset);
local PositionWidget = {}
PositionWidget.__index = PositionWidget
PositionWidget.className = "PositionWidget"
setmetatable(PositionWidget, {__index = BasicHud})

function PositionWidget:_init_fields()
    self.position = 0
    self.positionString = StringUtil.getInstance().EMPTY_STRING
end


function PositionWidget.new(position, location, direction, basicColor)
    local self = setmetatable(BasicHud.new(location, direction, 2, basicColor), PositionWidget)
    self:_init_fields()
        -- super(...) made self above
        self.updateMaxHeight = 10
        self.updateMaxWidth = 40
    return self
end


function PositionWidget:get()
        return self.position
end


function PositionWidget:set(position)
        self.position = position
        self.positionString = PositionWidget.toString(self:get())
end


function PositionWidget:paint(graphics)
        BasicHud.paintString(self, graphics, self.positionString)
end


function PositionWidget.toString(position)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(position))
        if position == 1 then
            stringBuffer:append("st")
        elseif position == 2 then
            stringBuffer:append("nd")
        elseif position == 3 then
            stringBuffer:append("rd")
        else
            stringBuffer:append("th")
        end
        return tostring(stringBuffer)
end

return PositionWidget

