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
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorArrayIndexer = require("org.allbinary.graphics.color.BasicColorArrayIndexer")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local CharArrayFactory = require("org.allbinary.logic.java.character.CharArrayFactory")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local ViewPosition = require("org.allbinary.view.ViewPosition")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local DamageFloaters = require("org.allbinary.game.combat.damage.DamageFloaters")

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

local PtsDamageFloaters = {}
PtsDamageFloaters.__index = PtsDamageFloaters
PtsDamageFloaters.className = "PtsDamageFloaters"
setmetatable(PtsDamageFloaters, {__index = DamageFloaters})

function PtsDamageFloaters:_init_fields()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.layerInterface = nil
    self.lastDamage = java_new_array(0, 5)
    self.lastDamageString = java_new_array("\0", 5, 0)
    self.lastDamageStringSizeArray = java_new_array(0, 5)
    self.circularIndexUtil = CircularIndexUtil.createInstance(5)
    self.primitiveLongUtil = nil
    self.myRandomFactory = MyRandomFactory.getInstance()
end


function PtsDamageFloaters.new(layerInterface)
    local self = setmetatable(DamageFloaters.new(), PtsDamageFloaters)
    self:_init_fields()
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(100000)
        self.layerInterface = layerInterface
        local CHAR_ARRAY = CharArrayFactory.getInstance():getZeroCharArray()
        for index = (self.lastDamageString.n or #self.lastDamageString) - 1, 0, -1 do
            self.lastDamageString[index + 1] = CHAR_ARRAY
        end
    return self
end


function PtsDamageFloaters:add(damage)
        local index = self.circularIndexUtil:getIndex()
        self.lastDamage[index + 1] = damage
        self.lastDamageString[index + 1] = self.primitiveLongUtil:getCharArray(self.lastDamage[index + 1])
        self.lastDamageStringSizeArray[index + 1] = self.primitiveLongUtil:getCurrentTotalDigits()
        self.circularIndexUtil:next()
end


function PtsDamageFloaters:paint(graphics)
        local viewPosition = self.layerInterface:getViewPosition()
        local x = viewPosition:getX()
        local y = viewPosition:getY()
        for index = (self.lastDamage.n or #self.lastDamage) - 1, 0, -1 do
            if self.lastDamage[index + 1] ~= 0 then
                local delta = 10 * (index + 2)
                self.basicSetColorUtil:setBasicColorP(graphics, PtsDamageFloaters.basicColorArrayIndexer:get())
                graphics:drawChars(self.lastDamageString[index + 1], 0, self.lastDamageStringSizeArray[index + 1], x - self.myRandomFactory:getNextInt(delta), y - delta, 0)
                PtsDamageFloaters.basicColorArrayIndexer:next()
            end
            self.lastDamage[index + 1] = 0
        end
end

PtsDamageFloaters.basicColorArrayIndexer = BasicColorArrayIndexer.new({BasicColorFactory.getInstance().WHITE, BasicColorFactory.getInstance().RED, BasicColorFactory.getInstance().YELLOW, BasicColorFactory.getInstance().BLUE})

return PtsDamageFloaters

