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

local Visitor = {}
package.loaded["org.allbinary.logic.util.visitor.Visitor"] = Visitor

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local VisitorInterface = require("org.allbinary.logic.util.visitor.VisitorInterface")

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

-- class table Visitor is declared before the requires
Visitor.__index = Visitor
Visitor.className = "Visitor"
Visitor.javaClassName = "org.allbinary.logic.util.visitor.Visitor"
Visitor.java_implements = " VisitorInterface "
Visitor.java_interfaces = function() return {VisitorInterface} end

function Visitor:_init_fields()
    self.nullUtil = NullUtil.getInstance()
end

function Visitor._jinit(self)
    Visitor._init_fields(self)
    return self
end

function Visitor.new()
    return Visitor._jinit(setmetatable({}, Visitor))
end


function Visitor:visit(anyType)
        return self.nullUtil.NULL_OBJECT
end


function Visitor.getInstance()
        return Visitor.instance_f
end

Visitor.instance_f = Visitor.new()

return Visitor

