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
-- package org.allbinary.game.combat.damage

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local ViewPosition = require("org.allbinary.view.ViewPosition")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local DamageFloaters = require("org.allbinary.game.combat.damage.DamageFloaters")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnimationDamageFloaters = {}
AnimationDamageFloaters.__index = AnimationDamageFloaters
AnimationDamageFloaters.className = "AnimationDamageFloaters"
setmetatable(AnimationDamageFloaters, {__index = DamageFloaters})

function AnimationDamageFloaters:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.layerInterface = nil
    self.animationInterfaceArray = nil
    self.circularIndexUtil = nil
    self.dx = nil
    self.dy = nil
end


function AnimationDamageFloaters.new(layerInterface, animationInterfaceArray, dx, dy)
    local self = setmetatable(DamageFloaters.new(), AnimationDamageFloaters)
    self:_init_fields()
        self.animationInterfaceArray = animationInterfaceArray
        for index = (self.animationInterfaceArray.n or #self.animationInterfaceArray) - 1, 0, -1 do
            self.animationInterfaceArray[index + 1]:setFrame(self.animationInterfaceArray[index + 1]:getSize() - 1)
        end
        self.layerInterface = layerInterface
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.animationInterfaceArray.n or #self.animationInterfaceArray))
        self.dx = dx
        self.dy = dy
    return self
end


function AnimationDamageFloaters:add(damage)
        local i = self.circularIndexUtil:getIndex()
        self.animationInterfaceArray[i + 1]:setFrame(0)
        self.circularIndexUtil:next()
end


function AnimationDamageFloaters:paint(graphics)
        local try_ok, try_error = pcall(function()
            local viewPosition = self.layerInterface:getViewPosition()
            local x = viewPosition:getX()
            local y = viewPosition:getY()
            for index = 0, (self.animationInterfaceArray.n or #self.animationInterfaceArray) - 1 do
                local animationInterface = self.animationInterfaceArray[index + 1]
                if animationInterface:getFrame() < animationInterface:getAnimationSize() - 1 then
                    local delta = animationInterface:getFrame() * 20
                    animationInterface:paintXY(graphics, x + self.dx, y - delta + self.dy)
                    animationInterface:nextFrame()
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            local canvasStrings = CanvasStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, canvasStrings.PAINT, e)
        end
end

return AnimationDamageFloaters

