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
-- package org.allbinary.logic.visual.dhtml.html.name


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlNameMathData = {}
HtmlNameMathData.__index = HtmlNameMathData
HtmlNameMathData.className = "HtmlNameMathData"

function HtmlNameMathData:_init_fields()
    self.EQUALS = "_EQUALS_"
    self.PLUS = "_PLUS_"
    self.MINUS = "_MINUS_"
    self.DIVIDE = "_DIVIDE_"
    self.MULTIPLY = "_MULTIPLY_"
end


function HtmlNameMathData.getInstance()
        return HtmlNameMathData.instance
end


function HtmlNameMathData.new()
    local self = setmetatable({}, HtmlNameMathData)
    self:_init_fields()
    return self
end

HtmlNameMathData.instance = HtmlNameMathData.new()

return HtmlNameMathData

