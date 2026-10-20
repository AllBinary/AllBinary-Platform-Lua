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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Capital = {}
Capital.__index = Capital
Capital.className = "Capital"

function Capital:_init_fields()
    self.value = 0
end


function Capital.new()
    local self = setmetatable({}, Capital)
    self:_init_fields()
    return self
end


function Capital:getTotalMoney()
        return self.value
end


function Capital:removeMoney(points)
        self.value = self.value - (points)
end


function Capital:addMoney(points)
        self.value = self.value + (points)
end

return Capital

