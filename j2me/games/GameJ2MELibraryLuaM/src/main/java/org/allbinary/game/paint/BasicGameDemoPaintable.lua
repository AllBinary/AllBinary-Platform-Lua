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
-- package org.allbinary.game.paint

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local StatePaintable = require("org.allbinary.graphics.paint.StatePaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGameDemoPaintable = {}
BasicGameDemoPaintable.__index = BasicGameDemoPaintable
BasicGameDemoPaintable.className = "BasicGameDemoPaintable"
setmetatable(BasicGameDemoPaintable, {__index = StatePaintable})

function BasicGameDemoPaintable:_init_fields()
    self.mainDemoStatePaintable = nil
    self.ownershipPaintable = nil
    self.helpPaintableInterface = nil
    self.currentStatePaintable = NullPaintable.getInstance()
end


function BasicGameDemoPaintable.new(mainDemoStatePaintable, ownershipPaintable, helpPaintableInterface)
    local self = setmetatable(StatePaintable.new(), BasicGameDemoPaintable)
    self:_init_fields()
        self.mainDemoStatePaintable = mainDemoStatePaintable
        self:setCurrentStatePaintable(NullPaintable.getInstance())
        self.ownershipPaintable = ownershipPaintable
        self.helpPaintableInterface = helpPaintableInterface
    return self
end


function BasicGameDemoPaintable:setState(state)
        if state == 0 then
            self:setCurrentStatePaintable(self:getMainDemoStatePaintable())
        elseif state == 1 then
            self:setCurrentStatePaintable(self.helpPaintableInterface)
        else
            self:setCurrentStatePaintable(self.ownershipPaintable)
        end
end


function BasicGameDemoPaintable:paint(graphics)
        self:getCurrentStatePaintable():paint(graphics)
end


function BasicGameDemoPaintable:getHelpPaintableInterface()
        return self.helpPaintableInterface
end


function BasicGameDemoPaintable:setCurrentStatePaintable(currentStatePaintable)
        self.currentStatePaintable = currentStatePaintable
end


function BasicGameDemoPaintable:getCurrentStatePaintable()
        return self.currentStatePaintable
end


function BasicGameDemoPaintable:getMainDemoStatePaintable()
        return self.mainDemoStatePaintable
end

return BasicGameDemoPaintable

