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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicHudFactory = {}
BasicHudFactory.__index = BasicHudFactory
BasicHudFactory.className = "BasicHudFactory"

function BasicHudFactory:_init_fields()
    self.DIRECTION_EXCEPTION = "Only Horizontal Direction is Allowed Currently"
    self.VERTICAL = 0
    self.HORIZONTAL = 1
    self.BOTTOMLEFT = 0
    self.BOTTOMRIGHT = 1
    self.TOPLEFT = 2
    self.TOPRIGHT = 3
    self.BOTTOMCENTER = 4
    self.TOPCENTER = 5
    self.ABSOLUTE = 6
end


function BasicHudFactory.getInstance()
        return BasicHudFactory.instance
end


function BasicHudFactory.new()
    local self = setmetatable({}, BasicHudFactory)
    self:_init_fields()
    return self
end

BasicHudFactory.instance = BasicHudFactory.new()

return BasicHudFactory

