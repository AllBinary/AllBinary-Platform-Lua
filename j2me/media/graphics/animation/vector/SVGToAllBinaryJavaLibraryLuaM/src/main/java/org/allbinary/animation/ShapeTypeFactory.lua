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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShapeTypeFactory = {}
ShapeTypeFactory.__index = ShapeTypeFactory
ShapeTypeFactory.className = "ShapeTypeFactory"

function ShapeTypeFactory:_init_fields()
    self.KEY_LINE = "line"
    self.KEY_CIRCLE = "circle"
    self.KEY_RECTANGLE = "rectangle"
    self.KEY_RECT = "rect"
    self.LINE = ShapeType.new(self.KEY_LINE)
    self.CIRCLE = ShapeType.new(self.KEY_CIRCLE)
    self.RECTANGLE = ShapeType.new(self.KEY_RECTANGLE)
end

function ShapeTypeFactory.new()
    local self = setmetatable({}, ShapeTypeFactory)
    self:_init_fields()
    return self
end


function ShapeTypeFactory.getInstance()
        return ShapeTypeFactory.instance
end

ShapeTypeFactory.instance = ShapeTypeFactory.new()

return ShapeTypeFactory

