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
-- package org.allbinary.math


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

local AngleIncrementInfoFactory = {}
AngleIncrementInfoFactory.__index = AngleIncrementInfoFactory
AngleIncrementInfoFactory.className = "AngleIncrementInfoFactory"

function AngleIncrementInfoFactory:_init_fields()
    self.angleIncrementInfo = java_new_array(nil, java_int(AngleFactory.getInstance().TOTAL_ANGLE))
end

function AngleIncrementInfoFactory.new()
    local self = setmetatable({}, AngleIncrementInfoFactory)
    self:_init_fields()
    return self
end


function AngleIncrementInfoFactory.getInstance()
        return AngleIncrementInfoFactory.instance
end


function AngleIncrementInfoFactory:getAt(angleIncrement)
        local halfAngleIncrement = (((angleIncrement) // (1 << (1))))
        local angleIncrementInfo = nil
        local angleIncrementInfoCanBeNull = self.angleIncrementInfo[halfAngleIncrement + 1]
        if angleIncrementInfoCanBeNull == nil then
            angleIncrementInfo = AngleIncrementInfo.new(angleIncrement)
            self.angleIncrementInfo[halfAngleIncrement + 1] = angleIncrementInfo
            return angleIncrementInfo
        else
            angleIncrementInfo = angleIncrementInfoCanBeNull
        end
        return angleIncrementInfo
end

AngleIncrementInfoFactory.instance = AngleIncrementInfoFactory.new()

return AngleIncrementInfoFactory

