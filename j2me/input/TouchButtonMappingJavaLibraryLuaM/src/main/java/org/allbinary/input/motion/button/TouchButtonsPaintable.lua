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
-- package org.allbinary.input.motion.button

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonsPaintable = {}
TouchButtonsPaintable.__index = TouchButtonsPaintable
TouchButtonsPaintable.className = "TouchButtonsPaintable"
setmetatable(TouchButtonsPaintable, {__index = Paintable})

function TouchButtonsPaintable:_init_fields()
    self.foregroundBasicColor = nil
    self.foregroundColor = nil
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.touchButtonFactory = TouchButtonFactory.getInstance()
end


function TouchButtonsPaintable.new(basicColor)
    local self = setmetatable(Paintable.new(), TouchButtonsPaintable)
    self:_init_fields()
        self.foregroundBasicColor = basicColor
        self.foregroundColor = math.tointeger(basicColor // 1)
    return self
end


function TouchButtonsPaintable:paint(graphics)
        local list = self.touchButtonFactory:getList()
        self.basicSetColorUtil:setBasicColorP3(graphics, self.foregroundBasicColor, self.foregroundColor)
        local touchButton = nil
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            touchButton = list.objectArray[index + 1]
            touchButton:paint(graphics)
            end
        end
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            touchButton = list.objectArray[index + 1]
            touchButton:paintHint(graphics)
            end
        end
end

return TouchButtonsPaintable

