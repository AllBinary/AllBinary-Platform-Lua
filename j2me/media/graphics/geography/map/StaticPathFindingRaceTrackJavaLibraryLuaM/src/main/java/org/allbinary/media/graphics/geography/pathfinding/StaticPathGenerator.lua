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
-- package org.allbinary.media.graphics.geography.pathfinding

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local PathData = require("org.allbinary.media.graphics.geography.map.PathData")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local PathGeneratorInterface = require("org.allbinary.media.graphics.geography.pathfinding.PathGeneratorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StaticPathGenerator = {}
StaticPathGenerator.__index = StaticPathGenerator
StaticPathGenerator.className = "StaticPathGenerator"

function StaticPathGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function StaticPathGenerator.new()
    local self = setmetatable({}, StaticPathGenerator)
    self:_init_fields()
        PreLogUtil.put("Using Static Path Finding", self, CommonStrings.getInstance().CONSTRUCTOR)
    return self
end


-- throws Exception
function StaticPathGenerator:init(geographicMapInterface, totalPaths)
end


-- throws Exception
function StaticPathGenerator:getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList(geographicMapCellPositionFactory, pathList)
        local list = BasicArrayListD.new()
        local size = pathList:size()
        local basicGeographicMapCellPosition = nil
        local geographicMapCellPosition = nil
        for index = 0, size - 1 do
            basicGeographicMapCellPosition = pathList:get(index)
            geographicMapCellPosition = geographicMapCellPositionFactory:getAt(basicGeographicMapCellPosition:getColumn(), basicGeographicMapCellPosition:getRow())
            list:add(geographicMapCellPosition)
        end
        return list
end


-- throws Exception
function StaticPathGenerator:createList(geographicMapInterface, geographicMapCellHistory, pathFindingInfo, totalPaths)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local pathCacheFactory = PathCacheFactory.getInstance()
            local mapIdInteger = geographicMapInterface:getAllBinaryTiledLayer():getDataId()
            local list = pathCacheFactory:getOrCreate(mapIdInteger)
            if list == self.basicArrayListUtil:getImmutableInstance() then
                list = BasicArrayListD.new()
                local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
                local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
                local id = PathData.getInstance().OFFSET + math.tointeger(mapIdInteger // 1)
                local basicList = pathCacheFactory:getOrCreate(smallIntegerSingletonFactory:getAt(id))
                local size = basicList:size()
                local pathList = nil
                for index = 0, size - 1 do
                    pathList = self:getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList(geographicMapCellPositionFactory, basicList:get(index))
                    list:add(pathList)
                end
                pathCacheFactory:add(mapIdInteger, list)
                pathCacheFactory:remove(smallIntegerSingletonFactory:getAt(id))
            end
            self.logUtil:putF(tostring(StringMaker.new():append("Using Cached Path(s): "):append(StringUtil.getInstance():toString(list))), self, commonStrings.GET_INSTANCE)
            return list
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            return BasicArrayListD.new()
        end
end

return StaticPathGenerator

