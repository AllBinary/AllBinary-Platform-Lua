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

local NullUtil = require("org.allbinary.logic.NullUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local CommonLabels = require("org.allbinary.string.CommonLabels")

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

local PathFindingNode = {}
PathFindingNode.__index = PathFindingNode
PathFindingNode.className = "PathFindingNode"

function PathFindingNode:_init_fields()
    self.parent = NullUtil.getInstance().NULL_OBJECT
    self.geographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


function PathFindingNode.new(parent, geographicMapCellPosition)
    local self = setmetatable({}, PathFindingNode)
    self:_init_fields()
        self.parent = parent
        self:setGeographicMapCellPositionP(geographicMapCellPosition)
        if self.geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            error(java_exception("Exception", "No GeographicMapCellPosition"), 0)
        end
    return self
end


function PathFindingNode:getParentP()
        return self.parent
end


function PathFindingNode:setGeographicMapCellPositionP(geographicMapCellPosition)
        self.geographicMapCellPosition = geographicMapCellPosition
end


function PathFindingNode:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(CommonLabels.getInstance().COLON_SEP)
        stringBuffer:append(" Path: ")
        stringBuffer:append(tostring(self.geographicMapCellPosition))
        local pathFindingNode = self:getParentP()
        while pathFindingNode ~= nil do
            stringBuffer:append(tostring(pathFindingNode.geographicMapCellPosition))
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            pathFindingNode = pathFindingNode:getParentP()
        end
        return tostring(stringBuffer)
end
PathFindingNode.__tostring = function(self) return self:toString() end

return PathFindingNode

