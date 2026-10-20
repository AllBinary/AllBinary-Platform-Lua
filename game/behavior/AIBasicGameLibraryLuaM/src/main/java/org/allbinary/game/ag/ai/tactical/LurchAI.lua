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
-- package org.allbinary.game.ag.ai.tactical

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LurchAI = {}
LurchAI.__index = LurchAI
LurchAI.className = "LurchAI"
setmetatable(LurchAI, {__index = BasicAI})

function LurchAI:_init_fields()
    self.currentRelativeAngle = 0
    self.currentSpeed = 0
end


function LurchAI.new(ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), LurchAI)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function LurchAI:processAI(allBinaryLayerManager)
        if self.currentSpeed == -1 then
            self.currentSpeed = 5
        else
            self.currentSpeed = -1
        end
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local x = ownerLayerInterface:getXP()
        if ownerLayerInterface:getXP() - self.currentSpeed <= 0 then
            self:reverse()
            self:drop()
        end
        if ownerLayerInterface:getX2() + self.currentSpeed > DisplayInfoSingleton.getInstance():getLastWidth() then
            self:reverse()
            self:accelerate()
            self:drop()
        end
        if self.currentRelativeAngle == 0 then
            x = x + (self.currentSpeed)
        elseif self.currentRelativeAngle == 180 then
            x = x - (self.currentSpeed)
        end
        ownerLayerInterface:setPosition(x, ownerLayerInterface:getYP(), ownerLayerInterface:getZP())
        if self.currentRelativeAngle == 0 then
            BasicAI.processKeyAI(self, Canvas.KEY_NUM0)
        elseif self.currentRelativeAngle == 180 then
            BasicAI.processKeyAI(self, Canvas.KEY_POUND)
        end
end


function LurchAI:reverse()
        if self.currentRelativeAngle == 180 then
            self.currentRelativeAngle = 0
        elseif self.currentRelativeAngle == 0 then
            self.currentRelativeAngle = 180
        end
end


function LurchAI:accelerate()
        if self.currentSpeed < 20 then
            self.currentSpeed = self.currentSpeed + 1
        end
end


function LurchAI:drop()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local y = ownerLayerInterface:getYP()
        if ownerLayerInterface:getY2() + ownerLayerInterface:getHeight() > DisplayInfoSingleton.getInstance():getLastHeight() then
            y = 0
        else
            y = y + (ownerLayerInterface:getHeight() + 1)
        end
        ownerLayerInterface:setPosition(ownerLayerInterface:getXP(), y, ownerLayerInterface:getZP())
end

return LurchAI

