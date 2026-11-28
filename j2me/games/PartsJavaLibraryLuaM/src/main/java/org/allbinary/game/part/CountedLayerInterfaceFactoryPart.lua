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
-- package org.allbinary.game.part

local CountedLayerInterfaceFactoryPart = {}
package.loaded["org.allbinary.game.part.CountedLayerInterfaceFactoryPart"] = CountedLayerInterfaceFactoryPart

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

local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local CountedPickedUpLayerInterfaceFactory = java_lazy("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PrimitiveLongUtil = java_lazy("org.allbinary.logic.math.PrimitiveLongUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local PartInterface = require("org.allbinary.game.part.PartInterface")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CountedLayerInterfaceFactoryPart is declared before the requires
CountedLayerInterfaceFactoryPart.__index = CountedLayerInterfaceFactoryPart
CountedLayerInterfaceFactoryPart.className = "CountedLayerInterfaceFactoryPart"
CountedLayerInterfaceFactoryPart.javaClassName = "org.allbinary.game.part.CountedLayerInterfaceFactoryPart"
CountedLayerInterfaceFactoryPart.java_implements = " PartInterface UpdateMyFontInterface "
CountedLayerInterfaceFactoryPart.java_interfaces = function() return {PartInterface, UpdateMyFontInterface} end

function CountedLayerInterfaceFactoryPart:_init_fields()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
    if self.total == nil then self.total = 0 end
    self.totalString = NullUtil.getInstance().NULL_CHAR_ARRAY
    if self.xOffset == nil then self.xOffset = 0 end
    self.countedPickedUpLayerInterfaceFactory = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
end


function CountedLayerInterfaceFactoryPart._jinit(self, total, countedPickedUpLayerInterfaceFactory)
    CountedLayerInterfaceFactoryPart._init_fields(self)
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(1000)
        self:init(total, countedPickedUpLayerInterfaceFactory)
    return self
end

function CountedLayerInterfaceFactoryPart.new(...)
    local self = setmetatable({}, CountedLayerInterfaceFactoryPart)
    CountedLayerInterfaceFactoryPart._jinit(self, ...)
    return self
end


function CountedLayerInterfaceFactoryPart:updateMeasurement(graphics)
        local font = graphics:getFont()
        self:setXOffset(font:charsWidth(self.totalString, 0, self.primitiveLongUtil:getCurrentTotalDigits()) + (((font:getSize()) // (1 << (1)))))
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function CountedLayerInterfaceFactoryPart:init(total, countedPickedUpLayerInterfaceFactory)
        self:setCountedPickedUpLayerInterfaceFactory(countedPickedUpLayerInterfaceFactory)
        self.total = total
end


-- throws Exception
function CountedLayerInterfaceFactoryPart:getInstance(hashtable, x, y, z)
        if self.total > 0 then
            self:setTotal(self.total - 1)
            return self:getCountedPickedUpLayerInterfaceFactory():getNextInstance(hashtable, x, y, z)
        else
            error(require("java.lang.Exception").new("No more left. Could use a listener to automatically remove"), 0)
        end
end


function CountedLayerInterfaceFactoryPart:getTotal()
        return self.total
end


function CountedLayerInterfaceFactoryPart:setTotal(total)
        self.total = total
        self.totalString = self.primitiveLongUtil:getCharArray(total)
        self.myFontProcessor = self.updateMyFontProcessor
end


function CountedLayerInterfaceFactoryPart:paint(graphics)
        self.myFontProcessor:process(graphics)
end


function CountedLayerInterfaceFactoryPart:paintThreed(graphics)
end


function CountedLayerInterfaceFactoryPart:getAnimationInterface()
        return self.animationInterface
end


function CountedLayerInterfaceFactoryPart:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end


function CountedLayerInterfaceFactoryPart:getXOffset()
        return self.xOffset
end


function CountedLayerInterfaceFactoryPart:setXOffset(totalStringWidth)
        self.xOffset = totalStringWidth
end


function CountedLayerInterfaceFactoryPart:getTotalString()
        return self.totalString
end


function CountedLayerInterfaceFactoryPart:getCountedPickedUpLayerInterfaceFactory()
        return self.countedPickedUpLayerInterfaceFactory
end


function CountedLayerInterfaceFactoryPart:setCountedPickedUpLayerInterfaceFactory(countedPickedUpLayerInterfaceFactory)
        self.countedPickedUpLayerInterfaceFactory = countedPickedUpLayerInterfaceFactory
end

CountedLayerInterfaceFactoryPart.NULL_COUNTED_LAYER_INTERFACE_FACTORY = CountedLayerInterfaceFactoryPart.new(0, CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY)

return CountedLayerInterfaceFactoryPart

