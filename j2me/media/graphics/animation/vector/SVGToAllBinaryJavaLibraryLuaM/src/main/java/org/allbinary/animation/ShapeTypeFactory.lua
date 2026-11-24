-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.animation

local ShapeTypeFactory = {}
package.loaded["org.allbinary.animation.ShapeTypeFactory"] = ShapeTypeFactory

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

local ShapeType = java_lazy("org.allbinary.animation.ShapeType")

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

-- class table ShapeTypeFactory is declared before the requires
ShapeTypeFactory.__index = ShapeTypeFactory
ShapeTypeFactory.className = "ShapeTypeFactory"
ShapeTypeFactory.javaClassName = "org.allbinary.animation.ShapeTypeFactory"

function ShapeTypeFactory:_init_fields()
    self.KEY_LINE = "line"
    self.KEY_CIRCLE = "circle"
    self.KEY_RECTANGLE = "rectangle"
    self.KEY_RECT = "rect"
    if self.LINE == nil then self.LINE = nil end
    if self.CIRCLE == nil then self.CIRCLE = nil end
    if self.RECTANGLE == nil then self.RECTANGLE = nil end
end


function ShapeTypeFactory.getInstance()
        return ShapeTypeFactory.instance_f
end


function ShapeTypeFactory._jinit(self)
    ShapeTypeFactory._init_fields(self)
        self.LINE = ShapeType.new(self.KEY_LINE)
        self.CIRCLE = ShapeType.new(self.KEY_CIRCLE)
        self.RECTANGLE = ShapeType.new(self.KEY_RECTANGLE)
    return self
end

function ShapeTypeFactory.new(...)
    local self = setmetatable({}, ShapeTypeFactory)
    ShapeTypeFactory._jinit(self, ...)
    return self
end

ShapeTypeFactory.instance_f = ShapeTypeFactory.new()

return ShapeTypeFactory

