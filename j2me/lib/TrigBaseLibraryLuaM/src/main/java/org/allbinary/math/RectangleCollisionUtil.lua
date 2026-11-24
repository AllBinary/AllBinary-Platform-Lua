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

local RectangleCollisionUtil = {}
package.loaded["org.allbinary.math.RectangleCollisionUtil"] = RectangleCollisionUtil

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")

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

-- class table RectangleCollisionUtil is declared before the requires
RectangleCollisionUtil.__index = RectangleCollisionUtil
RectangleCollisionUtil.className = "RectangleCollisionUtil"
RectangleCollisionUtil.javaClassName = "org.allbinary.math.RectangleCollisionUtil"


function RectangleCollisionUtil.getInstance()
        return RectangleCollisionUtil.instance_f
end


function RectangleCollisionUtil._jinit(self)
    return self
end

function RectangleCollisionUtil.new(...)
    local self = setmetatable({}, RectangleCollisionUtil)
    RectangleCollisionUtil._jinit(self, ...)
    return self
end


function RectangleCollisionUtil:isCollision(rectX1, rectY1, rectX2, rectY2, rect2X1, rect2Y1, rect2X2, rect2Y2)
        if rect2X1 >= rectX2 or rect2Y1 >= rectY2 or rect2X2 <= rectX1 or rect2Y2 <= rectY1 then
            return false
        else
            return true
        end
end


function RectangleCollisionUtil:isInside(rectX1, rectY1, rectX2, rectY2, x, y)
        if x >= rectX2 or y >= rectY2 or x <= rectX1 or y <= rectY1 then
            return false
        else
            return true
        end
end

RectangleCollisionUtil.instance_f = RectangleCollisionUtil.new()

return RectangleCollisionUtil

