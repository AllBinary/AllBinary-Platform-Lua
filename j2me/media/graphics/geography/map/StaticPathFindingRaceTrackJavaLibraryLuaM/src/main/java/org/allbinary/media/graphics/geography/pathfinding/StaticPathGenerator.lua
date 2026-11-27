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

local StaticPathGenerator = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.StaticPathGenerator"] = StaticPathGenerator

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local PathData = java_lazy("org.allbinary.media.graphics.geography.map.PathData")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local PathGeneratorInterface = require("org.allbinary.media.graphics.geography.pathfinding.PathGeneratorInterface")
local PathCacheFactory = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathCacheFactory")
local PathFindingInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")

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

-- class table StaticPathGenerator is declared before the requires
StaticPathGenerator.__index = StaticPathGenerator
StaticPathGenerator.className = "StaticPathGenerator"
StaticPathGenerator.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.StaticPathGenerator"
StaticPathGenerator.java_implements = " PathGeneratorInterface "
StaticPathGenerator.java_interfaces = function() return {PathGeneratorInterface} end

function StaticPathGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function StaticPathGenerator._jinit(self)
    StaticPathGenerator._init_fields(self)
        PreLogUtil.put("Using Static Path Finding", self, CommonStrings.getInstance().CONSTRUCTOR)
    return self
end

function StaticPathGenerator.new(...)
    local self = setmetatable({}, StaticPathGenerator)
    StaticPathGenerator._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
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
            do return "__jreturn", list end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            return BasicArrayListD.new()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return StaticPathGenerator

