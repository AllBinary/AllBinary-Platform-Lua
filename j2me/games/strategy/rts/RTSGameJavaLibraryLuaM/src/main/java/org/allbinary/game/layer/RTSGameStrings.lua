-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSGameStrings = {}
RTSGameStrings.__index = RTSGameStrings
RTSGameStrings.className = "RTSGameStrings"

function RTSGameStrings:_init_fields()
    self.DRAG_TO_SPOT = "Please Drag"
    self.NOT_YOURS = "Not Yours"
    self.NEW_UNIT = "New Unit"
    self.NEW_WAYPOINT = "New Waypoint"
    self.BUILDING = "Building"
    self.UPGRADE = "Upgrading"
    self.DOWNGRADE = "Downgrading"
    self.NO_MONEY = "Not Enough Money"
    self.SPOT_TAKEN = "Spot Taken"
    self.BUILDING_COLLISION = "Building Collision"
    self.STRUCTURE_TO_CLOSE = "Building To Close"
    self.MAP_EDGE = "Map Edge"
    self.ROAD_COLLISION = "Road Collision"
    self.SELECT_BUILD_SPOT = "Select Build Spot"
    self.BUILD_ON_PATH = "Not On Path"
    self.DRAGGABLE = "Draggable"
end

function RTSGameStrings.new()
    local self = setmetatable({}, RTSGameStrings)
    self:_init_fields()
    return self
end


function RTSGameStrings.getInstance()
        return RTSGameStrings.instance
end

RTSGameStrings.instance = RTSGameStrings.new()

return RTSGameStrings

