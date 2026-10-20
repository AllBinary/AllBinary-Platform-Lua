-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer.item

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local CostLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.CostLayerInterfaceFactoryInterface")
local TechEventListenerInterface = require("org.allbinary.game.rts.technology.event.TechEventListenerInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Animation = require("org.allbinary.animation.Animation")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local NullUtil = require("org.allbinary.logic.NullUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerCostAnimation = {}
RTSLayerCostAnimation.__index = RTSLayerCostAnimation
RTSLayerCostAnimation.className = "RTSLayerCostAnimation"
setmetatable(RTSLayerCostAnimation, {__index = Animation})

function RTSLayerCostAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000)
    self.DOLLAR = "$"
    self.image = nil
    self.layerInterfaceFactoryInterface = nil
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.costString = NullUtil.getInstance().NULL_CHAR_ARRAY
    self.len = 0
    self.adjustedCostX = 0
    self.fontHeight = 0
end


function RTSLayerCostAnimation.new(image, layerInterfaceFactoryInterface)
    local self = setmetatable(Animation.new(), RTSLayerCostAnimation)
    self:_init_fields()
        self.image = image
        self.layerInterfaceFactoryInterface = layerInterfaceFactoryInterface
        self:update()
    return self
end


function RTSLayerCostAnimation:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.adjustedCostX = font:stringWidth(self.DOLLAR)
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function RTSLayerCostAnimation:onEvent(event)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function RTSLayerCostAnimation:onTechEvent(event)
        local try_ok, try_error = pcall(function()
            self:update()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "onTechEvent", e)
        end
end


-- throws Exception
function RTSLayerCostAnimation:update()
        self.len = 0
        self.costString = self.primitiveLongUtil:getCharArray(self.layerInterfaceFactoryInterface:getCost())
        self.len = self.primitiveLongUtil:getCurrentTotalDigits()
end


function RTSLayerCostAnimation:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        Animation.paintXY(self, graphics, x, y)
        local adjustedCostY = self.image:getHeight() - self.fontHeight
        local xa = x + 2
        graphics:drawString(self.DOLLAR, xa, y + adjustedCostY, 0)
        graphics:drawChars(self.costString, 0, self.len, x + self.adjustedCostX, y + adjustedCostY, 0)
end

return RTSLayerCostAnimation

