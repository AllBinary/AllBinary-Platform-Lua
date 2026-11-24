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

local GeographicMapDirectionUtil = {}
package.loaded["org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil"] = GeographicMapDirectionUtil

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GeographicMapDirectionUtil is declared before the requires
GeographicMapDirectionUtil.__index = GeographicMapDirectionUtil
GeographicMapDirectionUtil.className = "GeographicMapDirectionUtil"
GeographicMapDirectionUtil.javaClassName = "org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil"

function GeographicMapDirectionUtil:_init_fields()
    self.MESSAGE = "Cell Position should have been cached!!!"
    self.ERROR = "Error: "
    self.EQUAL = " == "
end


function GeographicMapDirectionUtil.getInstance()
        return GeographicMapDirectionUtil.instance_f
end


function GeographicMapDirectionUtil._jinit(self)
    GeographicMapDirectionUtil._init_fields(self)
    return self
end

function GeographicMapDirectionUtil.new(...)
    local self = setmetatable({}, GeographicMapDirectionUtil)
    GeographicMapDirectionUtil._jinit(self, ...)
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
            error(require("java.lang.Exception").new(self.MESSAGE), 0)
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
            error(require("java.lang.Exception").new(self.MESSAGE), 0)
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
        local string_ = tostring(stringMaker:append(CellPosition.toStringCellPosition(fromGeographicMapCellPosition)):append(" == "):append(CellPosition.toStringCellPosition(toGeographicMapCellPosition)))
        stringMaker:delete(0, stringMaker:length())
        error(require("java.lang.Exception").new(tostring(stringMaker:append("Error: "):append(string_))), 0)
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
        error(require("java.lang.Exception").new(tostring(stringBuffer)), 0)
end

GeographicMapDirectionUtil.instance_f = GeographicMapDirectionUtil.new()

return GeographicMapDirectionUtil

