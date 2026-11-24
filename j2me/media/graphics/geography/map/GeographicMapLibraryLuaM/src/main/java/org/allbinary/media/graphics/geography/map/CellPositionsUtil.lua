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

local CellPositionsUtil = {}
package.loaded["org.allbinary.media.graphics.geography.map.CellPositionsUtil"] = CellPositionsUtil

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
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")

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

-- class table CellPositionsUtil is declared before the requires
CellPositionsUtil.__index = CellPositionsUtil
CellPositionsUtil.className = "CellPositionsUtil"
CellPositionsUtil.javaClassName = "org.allbinary.media.graphics.geography.map.CellPositionsUtil"

function CellPositionsUtil:_init_fields()
    self.reusableSingleThreadedSurroundingList = BasicArrayListS.new(8)
    self.surroundArray = {{jt = "I", -1, -1}, {jt = "I", 0, -1}, {jt = "I", 1, -1}, {jt = "I", -1, 1}, {jt = "I", 0, 1}, {jt = "I", 1, 1}, {jt = "I", 1, 0}, {jt = "I", -1, 0}}
end

function CellPositionsUtil._jinit(self)
    CellPositionsUtil._init_fields(self)
    return self
end

function CellPositionsUtil.new()
    return CellPositionsUtil._jinit(setmetatable({}, CellPositionsUtil))
end


function CellPositionsUtil.getInstance()
        return CellPositionsUtil.instance_f
end


-- throws Exception
function CellPositionsUtil:getAll(geographicMapInterface, topRightGeographicMapCellPosition, columns, rows, reusableList)
        reusableList:clear()
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local lastColumn = topRightGeographicMapCellPosition:getColumn() + columns
        local lastRow = topRightGeographicMapCellPosition:getRow() + rows
        if (columns > 1 and lastColumn > geographicMapInterface:getAllBinaryTiledLayer():getColumns()) or (rows > 1 and lastRow > geographicMapInterface:getAllBinaryTiledLayer():getRows()) then
            return reusableList
        end
        for rowIndex = 0, rows - 1 do
            for columnIndex = 0, columns - 1 do
                local geographicMapCellPosition = geographicMapCellPositionFactory:getAt(topRightGeographicMapCellPosition:getColumn() + columnIndex, topRightGeographicMapCellPosition:getRow() + rowIndex)
                reusableList:add(geographicMapCellPosition)
            end
        end
        return reusableList
end


-- throws Exception
function CellPositionsUtil:getAllSurrounding(geographicMapInterface, occupyList, reusableList)
        reusableList:clear()
        for index = occupyList:size() - 1, 0, -1 do
            local layerGeographicMapCellPosition = occupyList:get(index)
            local surroundingGeographicMapCellPositionList = self:getAllSurroundingAt(geographicMapInterface, layerGeographicMapCellPosition, self.reusableSingleThreadedSurroundingList)
            for index2 = surroundingGeographicMapCellPositionList:size() - 1, 0, -1 do
                local geographicMapCellPosition = surroundingGeographicMapCellPositionList:get(index2)
                if not reusableList:contains(geographicMapCellPosition) and not occupyList:contains(geographicMapCellPosition) then
                    reusableList:add(geographicMapCellPosition)
                end
            end
        end
        return reusableList
end


-- throws Exception
function CellPositionsUtil:getAllSurroundingAt(geographicMapInterface, layerGeographicMapCellPosition, reusableSurroundingList)
        reusableSurroundingList:clear()
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local row = 0
        local column = 0
        for index = 0, 8 - 1 do
            column = layerGeographicMapCellPosition:getColumn() + self.surroundArray[index + 1][1]
            row = layerGeographicMapCellPosition:getRow() + self.surroundArray[index + 1][2]
            if tiledLayer:isOnTileLayer(column, row) then
                local geographicMapCellPosition = geographicMapCellPositionFactory:getAt(column, row)
                reusableSurroundingList:add(geographicMapCellPosition)
            end
        end
        return reusableSurroundingList
end

CellPositionsUtil.instance_f = CellPositionsUtil.new()

return CellPositionsUtil

