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
-- package org.allbinary.game.media.graphics.geography.map.racetrack

local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local PathFinderGraphVisitorFactoryBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase")
local PathFinderGraphVisitorBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathFinderGraphHackVisitorFactory = {}
PathFinderGraphHackVisitorFactory.__index = PathFinderGraphHackVisitorFactory
PathFinderGraphHackVisitorFactory.className = "PathFinderGraphHackVisitorFactory"
setmetatable(PathFinderGraphHackVisitorFactory, {__index = PathFinderGraphVisitorFactoryBase})

function PathFinderGraphHackVisitorFactory:_init_fields()
    self.edgeMinimum = nil
    self.minPathWeight = nil
    self.maxPathWeight = nil
end


function PathFinderGraphHackVisitorFactory.new(edgeMinimum, minPathWeight, maxPathWeight)
    local self = setmetatable(PathFinderGraphVisitorFactoryBase.new(), PathFinderGraphHackVisitorFactory)
    self:_init_fields()
        self.edgeMinimum = edgeMinimum
        self.minPathWeight = minPathWeight
        self.maxPathWeight = maxPathWeight
    return self
end


function PathFinderGraphHackVisitorFactory:getInstance(geographicMapInterface)
        return PathFinderGraphHackVisitor.new(geographicMapInterface, self.edgeMinimum, self.minPathWeight, self.maxPathWeight)
end

return PathFinderGraphHackVisitorFactory

