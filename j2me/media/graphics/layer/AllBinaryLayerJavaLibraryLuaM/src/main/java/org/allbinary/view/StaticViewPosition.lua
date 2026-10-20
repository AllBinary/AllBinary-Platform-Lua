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
-- package org.allbinary.view

local ViewPosition = require("org.allbinary.view.ViewPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StaticViewPosition = {}
StaticViewPosition.__index = StaticViewPosition
StaticViewPosition.className = "StaticViewPosition"
setmetatable(StaticViewPosition, {__index = ViewPosition})


function StaticViewPosition.new(x, y, z)
    local self = setmetatable(ViewPosition.new(x, y, z), StaticViewPosition)
        -- super(...) made self above
    return self
end


function StaticViewPosition:getX()
        return self:getRawX()
end


function StaticViewPosition:getY()
        return self:getRawY()
end


function StaticViewPosition:getZ()
        return self:getRawZ()
end

return StaticViewPosition

