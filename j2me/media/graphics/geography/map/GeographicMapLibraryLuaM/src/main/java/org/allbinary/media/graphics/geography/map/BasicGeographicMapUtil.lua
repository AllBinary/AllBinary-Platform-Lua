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

local Layer = require("org.allbinary.layer.Layer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local BasicGeographicMapUtil = {}
BasicGeographicMapUtil.__index = BasicGeographicMapUtil
BasicGeographicMapUtil.className = "BasicGeographicMapUtil"

function BasicGeographicMapUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function BasicGeographicMapUtil.new()
    local self = setmetatable({}, BasicGeographicMapUtil)
    self:_init_fields()
    return self
end


function BasicGeographicMapUtil.getInstance()
        return BasicGeographicMapUtil.instance
end


-- throws Exception
function BasicGeographicMapUtil:getBorderingRow(direction, oldGeographicMapCellPosition)
        local LOCATION_CHANGE = 1
        do
            local switch_value = direction
            if switch_value == 0 then
                return oldGeographicMapCellPosition:getRow()
            elseif switch_value == 1 then
                return oldGeographicMapCellPosition:getRow()
            elseif switch_value == 2 then
                return oldGeographicMapCellPosition:getRow() + LOCATION_CHANGE
            elseif switch_value == 3 then
                return oldGeographicMapCellPosition:getRow() - LOCATION_CHANGE
            else
                error(java_exception("Exception", "Only Four Directions"), 0)
            end
        end
end


-- throws Exception
function BasicGeographicMapUtil:getBorderingColumn(direction, oldGeographicMapCellPosition)
        local LOCATION_CHANGE = 1
        do
            local switch_value = direction
            if switch_value == 0 then
                return oldGeographicMapCellPosition:getColumn() - LOCATION_CHANGE
            elseif switch_value == 1 then
                return oldGeographicMapCellPosition:getColumn() + LOCATION_CHANGE
            elseif switch_value == 2 then
                return oldGeographicMapCellPosition:getColumn()
            elseif switch_value == 3 then
                return oldGeographicMapCellPosition:getColumn()
            else
                error(java_exception("Exception", "Only Four Directions"), 0)
            end
        end
end


-- throws Exception
function BasicGeographicMapUtil:isSameCellPosition(fromGeographicMapCellPosition, toGeographicMapCellPosition)
        local fromColumn = fromGeographicMapCellPosition:getColumn()
        local fromRow = fromGeographicMapCellPosition:getRow()
        local goColumn = toGeographicMapCellPosition:getColumn()
        local goRow = toGeographicMapCellPosition:getRow()
        if fromColumn == goColumn and fromRow == goRow then
            return true
        else
            return false
        end
end


function BasicGeographicMapUtil:createAllBinaryTiledLayerArray(geographicMapInterfaceArray)
        local tiledLayerArray = java_new_array(nil, (geographicMapInterfaceArray.n or #geographicMapInterfaceArray))
        return self:getAllBinaryTiledLayerArray(geographicMapInterfaceArray, tiledLayerArray, 0)
end


function BasicGeographicMapUtil:getAllBinaryTiledLayerArray(geographicMapInterfaceArray, tiledLayerArray, startIndex)
        local geographicMapInterface = nil
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        local count = 0
        do
            local index = size + startIndex
            while (function() index = index - 1 return index end)() >= startIndex do
            geographicMapInterface = geographicMapInterfaceArray[index + 1]
            tiledLayerArray[(function() local value = count count = value + 1 return value end)() + 1] = geographicMapInterface:getAllBinaryTiledLayer()
            end
        end
        return tiledLayerArray
end


function BasicGeographicMapUtil:move(geographicMapInterfaceArray, dx, dy)
        local geographicMapInterface = nil
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            geographicMapInterface = geographicMapInterfaceArray[index + 1]
            geographicMapInterface:getAllBinaryTiledLayer():moveDXY(dx, dy)
            end
        end
end


function BasicGeographicMapUtil:setPosition(geographicMapInterfaceArray, x, y)
        local geographicMapInterface = nil
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            geographicMapInterface = geographicMapInterfaceArray[index + 1]
            geographicMapInterface:getAllBinaryTiledLayer():setPosition(x, y, geographicMapInterface:getAllBinaryTiledLayer():getZP())
            end
        end
end

BasicGeographicMapUtil.instance = BasicGeographicMapUtil.new()

return BasicGeographicMapUtil

