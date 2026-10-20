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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasePathFinderGraphVisitor = require("org.allbinary.game.media.graphics.geography.map.racetrack.BasePathFinderGraphVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--1.4.2
local PathFinderGraphHackVisitor = {}
PathFinderGraphHackVisitor.__index = PathFinderGraphHackVisitor
PathFinderGraphHackVisitor.className = "PathFinderGraphHackVisitor"
setmetatable(PathFinderGraphHackVisitor, {__index = BasePathFinderGraphVisitor})


function PathFinderGraphHackVisitor.new(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight)
    local self = setmetatable(BasePathFinderGraphVisitor.new(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight), PathFinderGraphHackVisitor)
        -- super(...) made self above
    return self
end


-- throws Exception
function PathFinderGraphHackVisitor:visit(graph, startPathFindingNodeList, endPathFindingNodeList)
        self:fixStart(graph, startPathFindingNodeList)
        self:fixEnd(graph, endPathFindingNodeList)
        self:fixOverPassEdges(graph)
end


-- throws Exception
function PathFinderGraphHackVisitor:fixStart(graph, startPathFindingNodeList)
end


-- throws Exception
function PathFinderGraphHackVisitor:fixEnd(graph, endPathFindingNodeList)
end


-- throws Exception
function PathFinderGraphHackVisitor:fixOverPassEdges(graph)
end


-- throws Exception
function PathFinderGraphHackVisitor:fixPath(startPathFindingNodeList, endPathFindingNodeList, pathList)
end


-- throws Exception
function PathFinderGraphHackVisitor:removeOverPassEdges(pathList)
end


function PathFinderGraphHackVisitor:isValid(graphPath)
        return false
end

return PathFinderGraphHackVisitor

