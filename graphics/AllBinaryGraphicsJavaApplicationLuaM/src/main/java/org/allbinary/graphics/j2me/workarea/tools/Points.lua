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
-- package org.allbinary.graphics.j2me.workarea.tools

local Points = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.Points"] = Points

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
local PointsInterface = require("org.allbinary.graphics.j2me.workarea.tools.PointsInterface")

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

-- class table Points is declared before the requires
Points.__index = Points
Points.className = "Points"
Points.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.Points"
Points.java_implements = " PointsInterface "
Points.java_interfaces = function() return {PointsInterface} end

function Points:_init_fields()
    if self.pointVector == nil then self.pointVector = nil end
end


function Points._jinit(self)
    Points._init_fields(self)
        self.pointVector = BasicArrayListD.new()
    return self
end

function Points.new(...)
    local self = setmetatable({}, Points)
    Points._jinit(self, ...)
    return self
end


function Points:init()
        self.pointVector:clear()
end


function Points:getPoints()
        return self.pointVector
end


function Points:addPoints(vector)
        self.pointVector:addAll2(vector)
end


function Points:isValid()
        if self.pointVector:size() > 1 then
            return true
        else
            return false
        end
end


function Points:getSize()
        return self.pointVector:size()
end

return Points

