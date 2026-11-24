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

local PathFindingNode = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.PathFindingNode"] = PathFindingNode

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

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

-- class table PathFindingNode is declared before the requires
PathFindingNode.__index = PathFindingNode
PathFindingNode.className = "PathFindingNode"
PathFindingNode.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.PathFindingNode"

function PathFindingNode:_init_fields()
    self.parent = NullUtil.getInstance().NULL_OBJECT
    self.geographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


function PathFindingNode._jinit(self, parent, geographicMapCellPosition)
    PathFindingNode._init_fields(self)
        self.parent = parent
        self:setGeographicMapCellPositionP(geographicMapCellPosition)
        if self.geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            error(require("java.lang.Exception").new("No GeographicMapCellPosition"), 0)
        end
    return self
end

function PathFindingNode.new(...)
    local self = setmetatable({}, PathFindingNode)
    PathFindingNode._jinit(self, ...)
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
        stringBuffer:append((getmetatable(self).javaClassName or getmetatable(self).className))
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

