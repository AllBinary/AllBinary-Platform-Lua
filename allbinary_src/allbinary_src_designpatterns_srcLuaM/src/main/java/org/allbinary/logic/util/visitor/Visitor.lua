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
-- package org.allbinary.logic.util.visitor

local NullUtil = require("org.allbinary.logic.NullUtil")
local VisitorInterface = require("org.allbinary.logic.util.visitor.VisitorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Visitor = {}
Visitor.__index = Visitor
Visitor.className = "Visitor"

function Visitor:_init_fields()
    self.nullUtil = NullUtil.getInstance()
end

function Visitor.new()
    local self = setmetatable({}, Visitor)
    self:_init_fields()
    return self
end


function Visitor:visit(anyType)
        return self.nullUtil.NULL_OBJECT
end


function Visitor.getInstance()
        return Visitor.instance
end

Visitor.instance = Visitor.new()

return Visitor

