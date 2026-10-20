-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.layer.unit

local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UnitWaypointStrings = {}
UnitWaypointStrings.__index = UnitWaypointStrings
UnitWaypointStrings.className = "UnitWaypointStrings"

function UnitWaypointStrings:_init_fields()
    self.WANDERING = "Order?"
    self.THINKING = "Thinking"
    self.THINKING_ABOUT_TARGET = "Hmmm"
    self.TARGET = "Target"
    self.KILL = "Kill!"
    self.STOP = "Stop"
    self.WAYPOINT_DESTROYED_SHORT = "Uh Oh"
    self.WAYPOINT_DESTROYED = "Waypoint Destroyed"
    self.ALL_VISITED_SHORT = "Arrived"
    self.ALL_VISITED = "All Visited"
    self.ALREADY_THERE_SHORT = "Again?"
    self.ALREADY_THERE = "Already There"
    self.NEXT_PATH_NODE = tostring(CommonLabels.getInstance().NEXT) .. " Path Node"
end

function UnitWaypointStrings.new()
    local self = setmetatable({}, UnitWaypointStrings)
    self:_init_fields()
    return self
end


function UnitWaypointStrings.getInstance()
        return UnitWaypointStrings.instance
end

UnitWaypointStrings.instance = UnitWaypointStrings.new()

return UnitWaypointStrings

