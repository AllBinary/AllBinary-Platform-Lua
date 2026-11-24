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
-- package org.allbinary.math

local RectangleCollisionPointUtil = {}
package.loaded["org.allbinary.math.RectangleCollisionPointUtil"] = RectangleCollisionPointUtil

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

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table RectangleCollisionPointUtil is declared before the requires
RectangleCollisionPointUtil.__index = RectangleCollisionPointUtil
RectangleCollisionPointUtil.className = "RectangleCollisionPointUtil"
RectangleCollisionPointUtil.javaClassName = "org.allbinary.math.RectangleCollisionPointUtil"


function RectangleCollisionPointUtil._jinit(self)
    return self
end

function RectangleCollisionPointUtil.new(...)
    local self = setmetatable({}, RectangleCollisionPointUtil)
    RectangleCollisionPointUtil._jinit(self, ...)
    return self
end


function RectangleCollisionPointUtil.allPointsInside(rectX1, rectY1, rectX2, rectY2, list)
        local rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
        local point = nil
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            point = list.objectArray[index + 1]
            if not rectangleCollisionUtil:isInside(rectX1, rectY1, rectX2, rectY2, point:getX(), point:getY()) then
                return false
            end
            end
        end
        return true
end


function RectangleCollisionPointUtil.allPointsInsideCell(rectX1, rectY1, rectX2, rectY2, list, xCellSize, yCellSize)
        local rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
        local point = nil
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            point = list.objectArray[index + 1]
            if not rectangleCollisionUtil:isInside(rectX1, rectY1, rectX2, rectY2, point:getX() * xCellSize, point:getY() * yCellSize) then
                return false
            end
            end
        end
        return true
end

return RectangleCollisionPointUtil

