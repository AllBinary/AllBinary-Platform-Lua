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
-- package org.allbinary.game.ag.layer.hud.basic

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local PrimitiveLongSingleton = require("org.allbinary.logic.math.PrimitiveLongSingleton")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local function java_chars(text)
    local chars = {}
    for index = 1, #text do chars[index] = string.sub(text, index, index) end
    return chars
end

local NumberStringHud = {}
NumberStringHud.__index = NumberStringHud
NumberStringHud.className = "NumberStringHud"
setmetatable(NumberStringHud, {__index = BasicHud})

function NumberStringHud:_init_fields()
    self.primitiveLongUtil = nil
    self.prependString = nil
    self.PREPEND_STRING = nil
    self.value = nil
    self.max = nil
    self.offset = 0
    self.valueString = nil
    self.valueTotalDigits = 0
end


function NumberStringHud.new(prependString, max, location, direction, bufferZone, basicColor)
    local self = setmetatable(BasicHud.new(location, direction, bufferZone, basicColor), NumberStringHud)
    self:_init_fields()
        -- super(...) made self above
        self.prependString = prependString
        self.PREPEND_STRING = java_chars(prependString)
        self.valueString = PrimitiveLongSingleton.getInstance().NUMBER_CHAR_ARRAYS[1]
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(max + 1)
        self.max = max
        self.value = 0
        if direction == 0 then
            error(java_exception("RuntimeException", BasicHudFactory.getInstance().DIRECTION_EXCEPTION), 0)
        end
    return self
end


function NumberStringHud:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.offset = font:stringWidth(self.prependString) + MyFontProcessor.defaultCharWidth(font)
        BasicHud.updateMeasurement(self, graphics)
end


function NumberStringHud:get()
        return self.value
end


function NumberStringHud:add(value)
        self:set(self.value + value)
end


function NumberStringHud:set(value)
        self.value = value
        if self.value > self.max then
            self.value = 0
        end
        self.valueString = self.primitiveLongUtil:getCharArray(self.value)
        self.valueTotalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
end


function NumberStringHud:reduce(value)
        self:set(self.value - value)
end


function NumberStringHud:paint(graphics)
        BasicHud.paintDX(self, graphics, self.PREPEND_STRING, 0, (self.PREPEND_STRING.n or #self.PREPEND_STRING), self.valueString, 0, self.valueTotalDigits, self.offset)
end


function NumberStringHud:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        local charArray = self.PREPEND_STRING
        local len = (self.PREPEND_STRING.n or #self.PREPEND_STRING)
        local charArray2 = self.valueString
        local len2 = self.valueTotalDigits
        self.basicSetColorUtil:setBasicColorP(graphics, self:getBasicColorP())
        graphics:drawChars(charArray, 0, len, x, y, 0)
        graphics:drawChars(charArray2, 0, len2, x - self.offset, y, 0)
end


function NumberStringHud:paintThreed(graphics)
end

return NumberStringHud

