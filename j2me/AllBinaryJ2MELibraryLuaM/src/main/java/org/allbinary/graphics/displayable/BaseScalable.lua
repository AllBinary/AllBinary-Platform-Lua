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
-- package org.allbinary.graphics.displayable

local ScalableListener = require("org.allbinary.graphics.displayable.ScalableListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseScalable = {}
BaseScalable.__index = BaseScalable
BaseScalable.className = "BaseScalable"

function BaseScalable.new()
    local self = setmetatable({}, BaseScalable)
    return self
end


function BaseScalable:getRatio(ratio)
        return 1.0
end


function BaseScalable:getLeft(xOffset)
        return -1
end


function BaseScalable:getTop(yOffset)
        return -1
end


function BaseScalable:scale(ratio)
end

return BaseScalable

