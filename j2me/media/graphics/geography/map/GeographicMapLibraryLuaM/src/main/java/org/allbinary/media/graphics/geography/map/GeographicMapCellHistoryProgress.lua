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
-- package org.allbinary.media.graphics.geography.map

local NullUtil = require("org.allbinary.logic.NullUtil")
local GeographicMapCellHistoryProgressBase = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistoryProgressBase")

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

local GeographicMapCellHistoryProgress = {}
GeographicMapCellHistoryProgress.__index = GeographicMapCellHistoryProgress
GeographicMapCellHistoryProgress.className = "GeographicMapCellHistoryProgress"
setmetatable(GeographicMapCellHistoryProgress, {__index = GeographicMapCellHistoryProgressBase})

function GeographicMapCellHistoryProgress:_init_fields()
    self.totalVisitedArray = NullUtil.getInstance().NULL_INT_ARRAY
    self.geographicMapCellHistoryArray = GeographicMapCellHistory.NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY
end


function GeographicMapCellHistoryProgress.new(geographicMapCellHistoryArray)
    local self = setmetatable(GeographicMapCellHistoryProgressBase.new(), GeographicMapCellHistoryProgress)
    self:_init_fields()
        self.geographicMapCellHistoryArray = geographicMapCellHistoryArray
        self:init()
    return self
end


function GeographicMapCellHistoryProgress:init()
        self.totalVisitedArray = java_new_array(0, (self.geographicMapCellHistoryArray.n or #self.geographicMapCellHistoryArray))
end


function GeographicMapCellHistoryProgress:isAnyProgress()
        local isProgressing = false
        local size = (self.geographicMapCellHistoryArray.n or #self.geographicMapCellHistoryArray)
        local currentTotalVisited = 0
        local totalVisited = 0
        for index = 0, size - 1 do
            totalVisited = self.geographicMapCellHistoryArray[index + 1]:getTotalVisited()
            currentTotalVisited = self.totalVisitedArray[index + 1]
            if currentTotalVisited < totalVisited then
                isProgressing = true
                self.totalVisitedArray[index + 1] = totalVisited
            end
        end
        return isProgressing
end

return GeographicMapCellHistoryProgress

