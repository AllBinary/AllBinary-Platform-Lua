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
-- package org.allbinary.media.graphics.geography.map.racetrack

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
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

local RaceTracksPathPrinter = {}
RaceTracksPathPrinter.__index = RaceTracksPathPrinter
RaceTracksPathPrinter.className = "RaceTracksPathPrinter"

function RaceTracksPathPrinter.new()
    local self = setmetatable({}, RaceTracksPathPrinter)
    return self
end


function RaceTracksPathPrinter:printPath(list)
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list:get(index)
            PreLogUtil.put(tostring(StringMaker.new():append("pathList.add(cellPositionFactory.getInstance"):append(tostring(anyType)):append(");")), self, "printPath")
        end
end


function RaceTracksPathPrinter:printPaths(list)
        local size = list:size()
        for index = 0, size - 1 do
            print(tostring(StringMaker.new():append(" Path "):appendint(index):append(CommonLabels.getInstance().COLON_SEP)))
            self:printPath(list:get(index))
        end
end

return RaceTracksPathPrinter

