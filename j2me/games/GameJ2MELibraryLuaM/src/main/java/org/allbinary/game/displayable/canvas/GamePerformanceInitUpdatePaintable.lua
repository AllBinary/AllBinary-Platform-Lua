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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameStatisticsFactory = require("org.allbinary.canvas.GameStatisticsFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GamePerformanceInitUpdatePaintable = {}
GamePerformanceInitUpdatePaintable.__index = GamePerformanceInitUpdatePaintable
GamePerformanceInitUpdatePaintable.className = "GamePerformanceInitUpdatePaintable"
setmetatable(GamePerformanceInitUpdatePaintable, {__index = InitUpdatePaintable})

function GamePerformanceInitUpdatePaintable:_init_fields()
    self.halfHeight = DisplayInfoSingleton.getInstance():getLastHalfHeight()
    self.yArray = {self.halfHeight + 30, self.halfHeight + 30, self.halfHeight + 30 + 15, self.halfHeight + 30 + 15, self.halfHeight + 30 + 30, self.halfHeight + 30 + 30, self.halfHeight + 30 + 45, self.halfHeight + 30 + 45}
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.baseRefreshHelperCharArray = java_new_array("\0", 0, 0)
    self.defaultStringWidth = 0
    self.RED = math.tointeger(BasicColorFactory.getInstance().RED // 1)
end

function GamePerformanceInitUpdatePaintable.new()
    local self = setmetatable(InitUpdatePaintable.new(), GamePerformanceInitUpdatePaintable)
    self:_init_fields()
    return self
end


function GamePerformanceInitUpdatePaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.defaultStringWidth = MyFontProcessor.defaultStringWidth(font, 2)
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function GamePerformanceInitUpdatePaintable:init()
end


function GamePerformanceInitUpdatePaintable:update()
        self.baseRefreshHelperCharArray = GameStatisticsFactory.getInstance():to2DCharArray()
end


function GamePerformanceInitUpdatePaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self.RED)
        local charArray = nil
        local charArray2 = nil
        local size2 = 0
        local size3 = 0
        local size = (self.baseRefreshHelperCharArray.n or #self.baseRefreshHelperCharArray) - 2
        for index = size, 0, -2 do
            charArray = self.baseRefreshHelperCharArray[index + 1]
            charArray2 = self.baseRefreshHelperCharArray[index + 1 + 1]
            size2 = (charArray.n or #charArray)
            size3 = (charArray2.n or #charArray2)
            graphics:drawChars(charArray, 0, size2, 0, self.yArray[index + 1], 0)
            graphics:drawChars(charArray2, 0, size3, size2 * self.defaultStringWidth, self.yArray[index + 1 + 1], 0)
        end
end

return GamePerformanceInitUpdatePaintable

