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
local J2MEUtil = require("org.allbinary.J2MEUtil")
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

local BasicHud = {}
BasicHud.__index = BasicHud
BasicHud.className = "BasicHud"

function BasicHud:_init_fields()
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
    self.bufferZoneY = 0
    self.hudGraphicsPosition = HudGraphicsPosition.NULL_HUD_GRAPHICS_POSITION
    self.x = 0
    self.y = 0
    self.basicColor = BasicColorFactory.getInstance().BLACK
    self.color = nil
    self.updateMaxWidth = 0
    self.updateMaxHeight = 0
    self.offsetY = 0
end


function BasicHud.new(location, direction, bufferZone, basicColor)
    local self = setmetatable({}, BasicHud)
    self:_init_fields()
        self:setLocation(location)
        self:setDirection(direction)
        self:setBufferZone(bufferZone)
        self:onDisplayChangeEvent(DisplayInfoSingleton.getInstance().displayChangeEvent)
        self:setBasicColorP(basicColor)
        self.color = math.tointeger(basicColor // 1)
    return self
end


function BasicHud:updateMeasurement(graphics)
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


function BasicHud:getLocation()
        return self.location
end


function BasicHud:getDirection()
        return self.direction
end


-- throws Exception
function BasicHud:getHudGraphicsPositionWH(width, height, maxWidth, maxHeight)
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
            y = self.bufferZoneY
            anchor = Anchor.TOP_LEFT
        elseif basicHudFactory.TOPRIGHT == self:getLocation() then
            x = width - maxWidth
            y = self.bufferZoneY
            anchor = Graphics.TOP & Graphics.RIGHT
        elseif basicHudFactory.TOPCENTER == self:getLocation() then
            x = (java_idiv((width - maxWidth), 2))
            y = self.bufferZoneY
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


function BasicHud:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function BasicHud:onDisplayChangeEvent(displayChangeEvent)
        self.myFontProcessor = self.updateMyFontProcessor
end


function BasicHud:getPoint(x, y)
        return PointFactory.getInstance():createXY(x, y)
end


function BasicHud:getBufferZone()
        return self.bufferZone
end


function BasicHud:setBufferZone(bufferZone)
        self.bufferZone = bufferZone
        if J2MEUtil.isHTML() then
            self.bufferZoneY = self.bufferZone
        else
            self.bufferZoneY = self.bufferZone + 5
        end
end


function BasicHud:setLocation(location)
        self.location = location
end


function BasicHud:setDirection(direction)
        self.direction = direction
end


function BasicHud:getHudGraphicsPosition()
        return self.hudGraphicsPosition
end


function BasicHud:getColor()
        return self.color
end


function BasicHud:getX()
        return self.x
end


function BasicHud:setX(x)
        self.x = x
end


function BasicHud:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function BasicHud:getBasicColorP()
        return self.basicColor
end


function BasicHud:setY(y)
        self.y = y
end


function BasicHud:getY()
        return self.y
end


function BasicHud:paintSSO(graphics, string, string2, offset)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        graphics:drawString(string, self.x, self:getY(), self.hudGraphicsPosition:getAnchor())
        graphics:drawString(string2, self.x + offset, self:getY(), self.hudGraphicsPosition:getAnchor())
end


function BasicHud:paintSSOO(graphics, string, string2, offset, offset2)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self:getColor())
        graphics:drawString(string, self.x + offset, self:getY(), self.hudGraphicsPosition:getAnchor())
        graphics:drawString(string2, self.x + offset2, self:getY(), self.hudGraphicsPosition:getAnchor())
end


function BasicHud:paintDXY(graphics, charArray, offset, len, charArray2, offset2, len2, xOffset, xOffset2)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY()
        graphics:drawChars(charArray, offset, len, self.x + xOffset, y, self.hudGraphicsPosition:getAnchor())
        graphics:drawChars(charArray2, offset2, len2, self.x + xOffset2, y, self.hudGraphicsPosition:getAnchor())
end


function BasicHud:paintDX(graphics, charArray, offset, len, charArray2, offset2, len2, xOffset)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY()
        graphics:drawChars(charArray, offset, len, self.x, y, self.hudGraphicsPosition:getAnchor())
        graphics:drawChars(charArray2, offset2, len2, self.x + xOffset, y, self.hudGraphicsPosition:getAnchor())
end


function BasicHud:paintOffsetAndLength(graphics, charArray, offset, len)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY()
        graphics:drawChars(charArray, offset, len, self.x, y, self.hudGraphicsPosition:getAnchor())
end


function BasicHud:paintString(graphics, string)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY() + self.offsetY
        graphics:drawString(string, self.x, y, self.hudGraphicsPosition:getAnchor())
end

return BasicHud

