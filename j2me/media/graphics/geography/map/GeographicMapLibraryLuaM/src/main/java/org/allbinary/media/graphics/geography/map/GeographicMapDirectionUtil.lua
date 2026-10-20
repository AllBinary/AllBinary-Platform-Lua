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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local CellPosition = require("org.allbinary.graphics.CellPosition")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapDirectionUtil = {}
GeographicMapDirectionUtil.__index = GeographicMapDirectionUtil
GeographicMapDirectionUtil.className = "GeographicMapDirectionUtil"

function GeographicMapDirectionUtil:_init_fields()
    self.MESSAGE = "Cell Position should have been cached!!!"
    self.ERROR = "Error: "
    self.EQUAL = " == "
end


function GeographicMapDirectionUtil.getInstance()
        return GeographicMapDirectionUtil.instance
end


function GeographicMapDirectionUtil.new()
    local self = setmetatable({}, GeographicMapDirectionUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function GeographicMapDirectionUtil:getDirectionFromCellPositionToAdjacentCellPosition(fromGeographicMapCellPosition, toGeographicMapCellPosition)
        local fromColumn = fromGeographicMapCellPosition:getColumn()
        local fromRow = fromGeographicMapCellPosition:getRow()
        local goColumn = toGeographicMapCellPosition:getColumn()
        local goRow = toGeographicMapCellPosition:getRow()
        local directionFactory = DirectionFactory.getInstance()
        if fromColumn - 1 == goColumn then
            return directionFactory.LEFT
        elseif fromColumn + 1 == goColumn then
            return directionFactory.RIGHT
        elseif fromRow - 1 == goRow then
            return directionFactory.UP
        elseif fromRow + 1 == goRow then
            return directionFactory.DOWN
        elseif fromGeographicMapCellPosition == toGeographicMapCellPosition then
            return directionFactory.NO_DIRECTION
        elseif fromRow == goRow and fromColumn == goColumn then
            error(java_exception("Exception", self.MESSAGE), 0)
        end
        return directionFactory.NOT_BORDERED_WITH
end


-- throws Exception
function GeographicMapDirectionUtil:getEightDirectionFromCellPositionToAdjacentCellPosition(fromGeographicMapCellPosition, toGeographicMapCellPosition)
        local fromColumn = fromGeographicMapCellPosition:getColumn()
        local fromRow = fromGeographicMapCellPosition:getRow()
        local goColumn = toGeographicMapCellPosition:getColumn()
        local goRow = toGeographicMapCellPosition:getRow()
        local directionFactory = DirectionFactory.getInstance()
        if fromRow == goRow then
            if fromColumn - 1 == goColumn then
                return directionFactory.LEFT
            elseif fromColumn + 1 == goColumn then
                return directionFactory.RIGHT
            end
        elseif fromRow - 1 == goRow then
            if fromColumn == goColumn then
                return directionFactory.UP
            end
            if fromColumn - 1 == goColumn then
                return directionFactory.UP_LEFT
            elseif fromColumn + 1 == goColumn then
                return directionFactory.UP_RIGHT
            end
        elseif fromRow + 1 == goRow then
            if fromColumn == goColumn then
                return directionFactory.DOWN
            end
            if fromColumn - 1 == goColumn then
                return directionFactory.DOWN_LEFT
            elseif fromColumn + 1 == goColumn then
                return directionFactory.DOWN_RIGHT
            end
        elseif fromGeographicMapCellPosition == toGeographicMapCellPosition then
            return directionFactory.NO_DIRECTION
        elseif fromRow == goRow and fromColumn == goColumn then
            error(java_exception("Exception", self.MESSAGE), 0)
        end
        return directionFactory.NOT_BORDERED_WITH
end


-- throws Exception
function GeographicMapDirectionUtil:getDirectionFromCellPositionToCellPosition(fromGeographicMapCellPosition, toGeographicMapCellPosition)
        local fromColumn = fromGeographicMapCellPosition:getColumn()
        local fromRow = fromGeographicMapCellPosition:getRow()
        local goColumn = toGeographicMapCellPosition:getColumn()
        local goRow = toGeographicMapCellPosition:getRow()
        local directionFactory = DirectionFactory.getInstance()
        if fromColumn > goColumn then
            return directionFactory.LEFT
        elseif fromColumn < goColumn then
            return directionFactory.RIGHT
        elseif fromRow > goRow then
            return directionFactory.UP
        elseif fromRow < goRow then
            return directionFactory.DOWN
        end
        local stringMaker = StringMaker.new()
        local string = tostring(stringMaker:append(CellPosition.toStringCellPosition(fromGeographicMapCellPosition)):append(" == "):append(CellPosition.toStringCellPosition(toGeographicMapCellPosition)))
        stringMaker:delete(0, stringMaker:length())
        error(java_exception("Exception", tostring(stringMaker:append("Error: "):append(string))), 0)
end


-- throws Exception
function GeographicMapDirectionUtil:getEightDirectionFromCellPositionToCellPosition(fromGeographicMapCellPosition, toGeographicMapCellPosition)
        local fromColumn = fromGeographicMapCellPosition:getColumn()
        local fromRow = fromGeographicMapCellPosition:getRow()
        local goColumn = toGeographicMapCellPosition:getColumn()
        local goRow = toGeographicMapCellPosition:getRow()
        local directionFactory = DirectionFactory.getInstance()
        if fromGeographicMapCellPosition == toGeographicMapCellPosition then
            return directionFactory.NO_DIRECTION
        elseif fromRow == goRow then
            if fromColumn > goColumn then
                return directionFactory.LEFT
            elseif fromColumn < goColumn then
                return directionFactory.RIGHT
            end
        elseif fromRow > goRow then
            if fromColumn > goColumn then
                return directionFactory.UP_LEFT
            elseif fromColumn < goColumn then
                return directionFactory.UP_RIGHT
            elseif fromColumn == goColumn then
                return directionFactory.UP
            end
        elseif fromRow < goRow then
            if fromColumn > goColumn then
                return directionFactory.DOWN_LEFT
            elseif fromColumn < goColumn then
                return directionFactory.DOWN_RIGHT
            elseif fromColumn == goColumn then
                return directionFactory.DOWN
            end
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.ERROR)
        stringBuffer:append(CellPosition.toStringCellPosition(fromGeographicMapCellPosition))
        stringBuffer:append(self.EQUAL)
        stringBuffer:append(CellPosition.toStringCellPosition(toGeographicMapCellPosition))
        error(java_exception("Exception", tostring(stringBuffer)), 0)
end

GeographicMapDirectionUtil.instance = GeographicMapDirectionUtil.new()

return GeographicMapDirectionUtil

