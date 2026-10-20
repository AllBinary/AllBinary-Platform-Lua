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
-- package org.allbinary.game.graphics.hud

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicHud_1 = {}
BasicHud_1.__index = BasicHud_1
BasicHud_1.className = "BasicHud_1"

function BasicHud_1:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.location = 0
    self.direction = 0
    self.bufferZone = 0
    self.hudGraphicsPosition = HudGraphicsPosition.NULL_HUD_GRAPHICS_POSITION
    self.x = 0
    self.y = 0
    self.basicColor = BasicColorFactory.getInstance().BLACK
    self.color = nil
    self.updateMaxWidth = 0
    self.updateMaxHeight = 0
    self.offsetY = 0
end


function BasicHud_1.new(location, direction, bufferZone, basicColor)
    local self = setmetatable({}, BasicHud_1)
    self:_init_fields()
        self:setLocation(location)
        self:setDirection(direction)
        self:setBufferZone(bufferZone)
        self:onDisplayChangeEvent(DisplayInfoSingleton.getInstance().displayChangeEvent)
        self:setBasicColorP(basicColor)
        self.color = math.tointeger(basicColor // 1)
    return self
end


function BasicHud_1:updateMeasurement(graphics)
        local try_ok, try_error = pcall(function()
            self.hudGraphicsPosition = self:getHudGraphicsPositionWH(self.displayInfo:getLastWidth(), self.displayInfo:getLastHeight(), self.updateMaxWidth, self.updateMaxHeight)
            self.x = self.hudGraphicsPosition:getPoint():getX()
            self:setY(self.hudGraphicsPosition:getPoint():getY())
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function BasicHud_1:getLocation()
        return self.location
end


function BasicHud_1:getDirection()
        return self.direction
end


-- throws Exception
function BasicHud_1:getHudGraphicsPositionWH(width, height, maxWidth, maxHeight)
        local x = 0
        local y = 0
        local anchor = 0
        local basicHudFactory = BasicHudFactory.getInstance()
        if basicHudFactory.BOTTOMLEFT == self:getLocation() then
            x = self.bufferZone + 2
            y = height - maxHeight - self.bufferZone
            anchor = Graphics.BOTTOM & Graphics.LEFT
        elseif basicHudFactory.BOTTOMRIGHT == self:getLocation() then
            x = width - maxWidth
            y = height - maxHeight - self.bufferZone
            anchor = Graphics.BOTTOM & Graphics.RIGHT
        elseif basicHudFactory.TOPLEFT == self:getLocation() then
            x = self.bufferZone + 2
            y = self.bufferZone + 5
            anchor = Anchor.TOP_LEFT
        elseif basicHudFactory.TOPRIGHT == self:getLocation() then
            x = width - maxWidth
            y = self.bufferZone + 5
            anchor = Graphics.TOP & Graphics.RIGHT
        elseif basicHudFactory.TOPCENTER == self:getLocation() then
            x = (java_idiv((width - maxWidth), 2))
            y = self.bufferZone + 5
            anchor = Graphics.TOP & Graphics.HCENTER
        elseif basicHudFactory.BOTTOMCENTER == self:getLocation() then
            x = (java_idiv((width - maxWidth), 2))
            y = height - maxHeight - self.bufferZone
            anchor = Graphics.BOTTOM & Graphics.HCENTER
        elseif basicHudFactory.ABSOLUTE == self:getLocation() then
            x = maxHeight
            y = maxWidth
            anchor = 0
        end
        return HudGraphicsPosition.new(self:getPoint(x, y), anchor)
end


function BasicHud_1:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function BasicHud_1:onDisplayChangeEvent(displayChangeEvent)
        self.myFontProcessor = self.updateMyFontProcessor
end


function BasicHud_1:getPoint(x, y)
        return PointFactory.getInstance():createXY(x, y)
end


function BasicHud_1:getBufferZone()
        return self.bufferZone
end


function BasicHud_1:setBufferZone(bufferZone)
        self.bufferZone = bufferZone
end


function BasicHud_1:setLocation(location)
        self.location = location
end


function BasicHud_1:setDirection(direction)
        self.direction = direction
end


function BasicHud_1:getHudGraphicsPosition()
        return self.hudGraphicsPosition
end


function BasicHud_1:getColor()
        return self.color
end


function BasicHud_1:getX()
        return self.x
end


function BasicHud_1:setX(x)
        self.x = x
end


function BasicHud_1:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function BasicHud_1:getBasicColorP()
        return self.basicColor
end


function BasicHud_1:setY(y)
        self.y = y
end


function BasicHud_1:getY()
        return self.y
end


function BasicHud_1:paintSSO(graphics, string, string2, offset)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        graphics:drawString(string, self.x, self:getY(), self.hudGraphicsPosition:getAnchor())
        graphics:drawString(string2, self.x + offset, self:getY(), self.hudGraphicsPosition:getAnchor())
end


function BasicHud_1:paintSSOO(graphics, string, string2, offset, offset2)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self:getColor())
        graphics:drawString(string, self.x + offset, self:getY(), self.hudGraphicsPosition:getAnchor())
        graphics:drawString(string2, self.x + offset2, self:getY(), self.hudGraphicsPosition:getAnchor())
end


function BasicHud_1:paintDXY(graphics, charArray, offset, len, charArray2, offset2, len2, xOffset, xOffset2)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY()
        graphics:drawChars(charArray, offset, len, self.x + xOffset, y, self.hudGraphicsPosition:getAnchor())
        graphics:drawChars(charArray2, offset2, len2, self.x + xOffset2, y, self.hudGraphicsPosition:getAnchor())
end


function BasicHud_1:paintDX(graphics, charArray, offset, len, charArray2, offset2, len2, xOffset)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY()
        graphics:drawChars(charArray, offset, len, self.x, y, self.hudGraphicsPosition:getAnchor())
        graphics:drawChars(charArray2, offset2, len2, self.x + xOffset, y, self.hudGraphicsPosition:getAnchor())
end


function BasicHud_1:paintOffsetAndLength(graphics, charArray, offset, len)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY()
        graphics:drawChars(charArray, offset, len, self.x, y, self.hudGraphicsPosition:getAnchor())
end


function BasicHud_1:paintString(graphics, string)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY() + self.offsetY
        graphics:drawString(string, self.x, y, self.hudGraphicsPosition:getAnchor())
end

return BasicHud_1

