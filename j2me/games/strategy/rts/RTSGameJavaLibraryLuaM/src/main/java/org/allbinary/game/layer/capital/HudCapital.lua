-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.game.layer.capital

local NumberStringHud = require("org.allbinary.game.ag.layer.hud.basic.NumberStringHud")
local Capital = require("org.allbinary.game.layer.capital.Capital")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HudCapital = {}
HudCapital.__index = HudCapital
HudCapital.className = "HudCapital"
setmetatable(HudCapital, {__index = Capital})

function HudCapital:_init_fields()
    self.capitalGraphic = nil
end


function HudCapital.new(moneyGraphic)
    local self = setmetatable(Capital.new(), HudCapital)
    self:_init_fields()
        self.capitalGraphic = moneyGraphic
    return self
end


function HudCapital:removeMoney(points)
        Capital.removeMoney(self, points)
        self.capitalGraphic:reduce(points)
end


function HudCapital:getTotalMoney()
        return self.capitalGraphic:get()
end


function HudCapital:addMoney(points)
        Capital.addMoney(self, points)
        self.capitalGraphic:add(points)
end

return HudCapital

