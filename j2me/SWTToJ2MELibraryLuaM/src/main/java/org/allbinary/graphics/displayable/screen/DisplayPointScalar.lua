-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.graphics.displayable.screen

local DisplayPointScalar = {}
package.loaded["org.allbinary.graphics.displayable.screen.DisplayPointScalar"] = DisplayPointScalar

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
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")

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

-- class table DisplayPointScalar is declared before the requires
DisplayPointScalar.__index = DisplayPointScalar
DisplayPointScalar.className = "DisplayPointScalar"
DisplayPointScalar.javaClassName = "org.allbinary.graphics.displayable.screen.DisplayPointScalar"


function DisplayPointScalar.getInstance()
        return DisplayPointScalar.instance_f
end


function DisplayPointScalar._jinit(self)
    return self
end

function DisplayPointScalar.new(...)
    local self = setmetatable({}, DisplayPointScalar)
    DisplayPointScalar._jinit(self, ...)
    return self
end


function DisplayPointScalar:processX(value)
        return value
end


function DisplayPointScalar:processY(value)
        return value
end


function DisplayPointScalar:process(point)
        return point
end

DisplayPointScalar.instance_f = DisplayPointScalar.new()

return DisplayPointScalar

