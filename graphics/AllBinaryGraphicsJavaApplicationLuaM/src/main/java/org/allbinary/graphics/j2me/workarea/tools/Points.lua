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
-- package org.allbinary.graphics.j2me.workarea.tools

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PointsInterface = require("org.allbinary.graphics.j2me.workarea.tools.PointsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Points = {}
Points.__index = Points
Points.className = "Points"

function Points:_init_fields()
    self.pointVector = nil
end


function Points.new()
    local self = setmetatable({}, Points)
    self:_init_fields()
        self.pointVector = BasicArrayListD.new()
    return self
end


function Points:init()
        self.pointVector:clear()
end


function Points:getPoints()
        return self.pointVector
end


function Points:addPoints(vector)
        self.pointVector:addAll2(vector)
end


function Points:isValid()
        if self.pointVector:size() > 1 then
            return true
        else
            return false
        end
end


function Points:getSize()
        return self.pointVector:size()
end

return Points

