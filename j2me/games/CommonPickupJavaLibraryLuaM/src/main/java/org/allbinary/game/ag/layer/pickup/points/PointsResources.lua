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
-- package org.allbinary.game.ag.layer.pickup.points


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PointsResources = {}
PointsResources.__index = PointsResources
PointsResources.className = "PointsResources"

function PointsResources:_init_fields()
    self.RESOURCE = "points_drop_20_by_20.png"
    self.RESOURCE_2 = "points_2_drop_20_by_20.png"
    self.RESOURCE_3 = "points_3_drop_20_by_20.png"
    self.RESOURCE_4 = "points_4_drop_20_by_20.png"
end


function PointsResources.new()
    local self = setmetatable({}, PointsResources)
    self:_init_fields()
    return self
end


function PointsResources.getInstance()
        return PointsResources.SINGLETON
end

PointsResources.SINGLETON = PointsResources.new()

return PointsResources

