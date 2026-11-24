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

local UnitWaypointStrings = {}
package.loaded["org.allbinary.game.layer.unit.UnitWaypointStrings"] = UnitWaypointStrings

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table UnitWaypointStrings is declared before the requires
UnitWaypointStrings.__index = UnitWaypointStrings
UnitWaypointStrings.className = "UnitWaypointStrings"
UnitWaypointStrings.javaClassName = "org.allbinary.game.layer.unit.UnitWaypointStrings"

function UnitWaypointStrings:_init_fields()
    self.PATHING = "Pathing"
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
    self._ALL_VISITED_SHORT = " Arrived"
    self._ALREADY_THERE_SHORT = " Again?"
    self.VISITED_MOST_OF_THE_PATH = " visited most of the path"
    self.RETURNING_AS_WAYPOINT_PATH_LIST = " returning as waypointPathsList was runningWaypointPathList"
end

function UnitWaypointStrings._jinit(self)
    UnitWaypointStrings._init_fields(self)
    return self
end

function UnitWaypointStrings.new()
    return UnitWaypointStrings._jinit(setmetatable({}, UnitWaypointStrings))
end


function UnitWaypointStrings.getInstance()
        return UnitWaypointStrings.instance_f
end

UnitWaypointStrings.instance_f = UnitWaypointStrings.new()

return UnitWaypointStrings

