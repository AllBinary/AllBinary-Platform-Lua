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
-- package org.allbinary.graphics


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Line = {}
Line.__index = Line
Line.className = "Line"

function Line:_init_fields()
    self.p1 = nil
    self.p2 = nil
    self.deltaX = 0.0
    self.deltaY = 0.0
end


function Line.new(p1, p2)
    local self = setmetatable({}, Line)
    self:_init_fields()
        self.p1 = PointFactory.getInstance().ZERO_ZERO
        self.p2 = self.p1
        self:setP1(p1)
        self:setP2(p2)
    return self
end


function Line:getGradient()
        return self:getDeltaY() / self:getDeltaX()
end


function Line:update()
        self.deltaX = (self:getP1():getX() + 0.0) - self:getP2():getX()
        self.deltaY = (self:getP1():getY() + 0.0) - self:getP2():getY()
end


function Line:getDeltaX()
        return self.deltaX
end


function Line:getDeltaY()
        return self.deltaY
end


function Line:getP1()
        return self.p1
end


function Line:getP2()
        return self.p2
end


function Line:setP1(p1)
        self.p1 = p1
        self:update()
end


function Line:setP2(p2)
        self.p2 = p2
        self:update()
end

return Line

