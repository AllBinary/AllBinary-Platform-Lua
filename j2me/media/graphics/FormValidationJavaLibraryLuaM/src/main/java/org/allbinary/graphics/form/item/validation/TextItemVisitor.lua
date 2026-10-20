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
-- package org.allbinary.graphics.form.item.validation

local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TextItemVisitor = {}
TextItemVisitor.__index = TextItemVisitor
TextItemVisitor.className = "TextItemVisitor"
setmetatable(TextItemVisitor, {__index = Visitor})


function TextItemVisitor.new()
    local self = setmetatable(Visitor.new(), TextItemVisitor)
    return self
end


function TextItemVisitor:visit(anyType)
        local value = anyType
        if #value < 2 then
            return BooleanFactory.getInstance().TRUE
        else
            return BooleanFactory.getInstance().FALSE
        end
end

return TextItemVisitor

