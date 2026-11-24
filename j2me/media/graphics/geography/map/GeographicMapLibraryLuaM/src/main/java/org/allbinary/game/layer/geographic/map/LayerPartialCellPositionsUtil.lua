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
-- package org.allbinary.game.layer.geographic.map

local LayerPartialCellPositionsUtil = {}
package.loaded["org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil"] = LayerPartialCellPositionsUtil

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
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")

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

-- class table LayerPartialCellPositionsUtil is declared before the requires
LayerPartialCellPositionsUtil.__index = LayerPartialCellPositionsUtil
LayerPartialCellPositionsUtil.className = "LayerPartialCellPositionsUtil"
LayerPartialCellPositionsUtil.javaClassName = "org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil"

function LayerPartialCellPositionsUtil._jinit(self)
    return self
end

function LayerPartialCellPositionsUtil.new()
    return LayerPartialCellPositionsUtil._jinit(setmetatable({}, LayerPartialCellPositionsUtil))
end


-- throws Exception
function LayerPartialCellPositionsUtil:getAll(geographicMapInterface, layerInterface, reusableList)
        reusableList:clear()
        local topLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP(), layerInterface:getYP())
        local topRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth(), layerInterface:getYP())
        local bottomLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP(), layerInterface:getYP() + layerInterface:getHeight())
        local bottomRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth(), layerInterface:getYP() + layerInterface:getHeight())
        if topLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            reusableList:add(topLeftGeographicMapCellPosition)
        end
        if topRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and topLeftGeographicMapCellPosition ~= topRightGeographicMapCellPosition then
            reusableList:add(topRightGeographicMapCellPosition)
        end
        if bottomLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomLeftGeographicMapCellPosition) then
            reusableList:add(bottomLeftGeographicMapCellPosition)
        end
        if bottomRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomRightGeographicMapCellPosition) then
            reusableList:add(bottomRightGeographicMapCellPosition)
        end
        return reusableList
end


-- throws Exception
function LayerPartialCellPositionsUtil:getAllDXY(geographicMapInterface, layerInterface, dx, dy, reusableList)
        reusableList:clear()
        local topLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + dx, layerInterface:getYP() + dy)
        local topRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth() + dx, layerInterface:getYP() + dy)
        local bottomLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + dx, layerInterface:getYP() + layerInterface:getHeight() + dy)
        local bottomRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth() + dx, layerInterface:getYP() + layerInterface:getHeight() + dy)
        if topLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            reusableList:add(topLeftGeographicMapCellPosition)
        end
        if topRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and topLeftGeographicMapCellPosition ~= topRightGeographicMapCellPosition then
            reusableList:add(topRightGeographicMapCellPosition)
        end
        if bottomLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomLeftGeographicMapCellPosition) then
            reusableList:add(bottomLeftGeographicMapCellPosition)
        end
        if bottomRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomRightGeographicMapCellPosition) then
            reusableList:add(bottomRightGeographicMapCellPosition)
        end
        return reusableList
end


function LayerPartialCellPositionsUtil.getInstance()
        return LayerPartialCellPositionsUtil.instance_f
end

LayerPartialCellPositionsUtil.instance_f = LayerPartialCellPositionsUtil.new()

return LayerPartialCellPositionsUtil

