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
-- package org.allbinary.graphics

local PointFactory = {}
package.loaded["org.allbinary.graphics.PointFactory"] = PointFactory

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
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")

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

-- class table PointFactory is declared before the requires
PointFactory.__index = PointFactory
PointFactory.className = "PointFactory"
PointFactory.javaClassName = "org.allbinary.graphics.PointFactory"

function PointFactory:_init_fields()
    self.ZERO_ZERO = self:createXYZ(0, 0, 0)
end


function PointFactory.getInstance()
        return PointFactory.instance_f
end


function PointFactory:init()
end


function PointFactory._jinit(self)
    PointFactory._init_fields(self)
    return self
end

function PointFactory.new(...)
    local self = setmetatable({}, PointFactory)
    PointFactory._jinit(self, ...)
    return self
end


function PointFactory:createXY(x, y)
        return GPoint.new(x, y, 0)
end


function PointFactory:createXYZ(x, y, z)
        return GPoint.new(x, y, z)
end

PointFactory.instance_f = PointFactory.new()

return PointFactory

