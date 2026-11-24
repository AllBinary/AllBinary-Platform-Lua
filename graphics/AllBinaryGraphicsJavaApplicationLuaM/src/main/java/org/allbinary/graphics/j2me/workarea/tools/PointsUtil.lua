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

local PointsUtil = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.PointsUtil"] = PointsUtil

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

local VectorRotationGenerator = java_lazy("org.allbinary.animation.VectorRotationGenerator")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
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

-- class table PointsUtil is declared before the requires
PointsUtil.__index = PointsUtil
PointsUtil.className = "PointsUtil"
PointsUtil.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.PointsUtil"

function PointsUtil._jinit(self)
    return self
end

function PointsUtil.new()
    return PointsUtil._jinit(setmetatable({}, PointsUtil))
end


function PointsUtil.getInstance()
        return PointsUtil.instance_f
end


-- throws Exception
function PointsUtil:doTransforms(pointVector, angle, fulcrumPoint)
        return VectorRotationGenerator.getInstance():getListAtAngle(fulcrumPoint:getX(), fulcrumPoint:getY(), pointVector, AngleFactory.getInstance():getAt(math.tointeger(angle // 1)))
end

PointsUtil.instance_f = PointsUtil.new()

return PointsUtil

