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
-- package org.allbinary.vector


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorInfo = {}
VectorInfo.__index = VectorInfo
VectorInfo.className = "VectorInfo"

function VectorInfo:_init_fields()
    self.width = nil
    self.height = nil
    self.points = nil
    self.totalFrames = nil
end


function VectorInfo.new(width, height, points, totalFrames)
    local self = setmetatable({}, VectorInfo)
    self:_init_fields()
        self.width = width
        self.height = height
        self.points = points
        self.totalFrames = totalFrames
    return self
end


function VectorInfo:getWidth()
        return self.width
end


function VectorInfo:setWidth(width)
        self.width = width
end


function VectorInfo:getHeight()
        return self.height
end


function VectorInfo:setHeight(height)
        self.height = height
end


function VectorInfo:getPoints()
        return self.points
end


function VectorInfo:setPoints(points)
        self.points = points
end


function VectorInfo:getTotalFrames()
        return self.totalFrames
end


function VectorInfo:setTotalFrames(totalFrames)
        self.totalFrames = totalFrames
end

return VectorInfo

