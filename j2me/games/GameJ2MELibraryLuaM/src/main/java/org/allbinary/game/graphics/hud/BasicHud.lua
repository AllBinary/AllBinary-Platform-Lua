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

local BasicHud = {}
package.loaded["org.allbinary.game.graphics.hud.BasicHud"] = BasicHud

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = java_lazy("org.allbinary.graphics.color.BasicColorSetUtil")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local HudGraphicsPosition = java_lazy("org.allbinary.game.graphics.hud.HudGraphicsPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicHud is declared before the requires
BasicHud.__index = BasicHud
BasicHud.className = "BasicHud"
BasicHud.javaClassName = "org.allbinary.game.graphics.hud.BasicHud"
BasicHud.java_implements = " UpdateMyFontInterface "
BasicHud.java_interfaces = function() return {UpdateMyFontInterface} end

function BasicHud:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    if self.location == nil then self.location = 0 end
    if self.direction == nil then self.direction = 0 end
    if self.bufferZone == nil then self.bufferZone = 0 end
    if self.bufferZoneY == nil then self.bufferZoneY = 0 end
    self.hudGraphicsPosition = HudGraphicsPosition.NULL_HUD_GRAPHICS_POSITION
    if self.x == nil then self.x = 0 end
    if self.y == nil then self.y = 0 end
    self.basicColor = BasicColorFactory.getInstance().BLACK
    if self.color == nil then self.color = nil end
    if self.updateMaxWidth == nil then self.updateMaxWidth = 0 end
    if self.updateMaxHeight == nil then self.updateMaxHeight = 0 end
    if self.offsetY == nil then self.offsetY = 0 end
end


function BasicHud._jinit(self, location, direction, bufferZone, basicColor)
    BasicHud._init_fields(self)
        self:setLocation(location)
        self:setDirection(direction)
        self:setBufferZone(bufferZone)
        self:onDisplayChangeEvent(DisplayInfoSingleton.getInstance().displayChangeEvent)
        self:setBasicColorP(basicColor)
        self.color = math.tointeger(basicColor // 1)
    return self
end

function BasicHud.new(...)
    local self = setmetatable({}, BasicHud)
    BasicHud._jinit(self, ...)
    return self
end


function BasicHud:updateMeasurement(graphics)
        local try_ok, try_error, try_value = pcall(function()
            self.hudGraphicsPosition = self:getHudGraphicsPositionWH(self.displayInfo:getLastWidth(), self.displayInfo:getLastHeight(), self.updateMaxWidth, self.updateMaxHeight)
            self.x = self.hudGraphicsPosition:getPoint():getX()
            self:setY(self.hudGraphicsPosition:getPoint():getY())
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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


function BasicHud:paintSSO(graphics, string_, string2, offset)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        graphics:drawString(string_, self.x, self:getY(), self.hudGraphicsPosition:getAnchor())
        graphics:drawString(string2, self.x + offset, self:getY(), self.hudGraphicsPosition:getAnchor())
end


function BasicHud:paintSSOO(graphics, string_, string2, offset, offset2)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self:getColor())
        graphics:drawString(string_, self.x + offset, self:getY(), self.hudGraphicsPosition:getAnchor())
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


function BasicHud:paintString(graphics, string_)
        self.myFontProcessor:process(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        local y = self:getY() + self.offsetY
        graphics:drawString(string_, self.x, y, self.hudGraphicsPosition:getAnchor())
end

return BasicHud

