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
-- package org.allbinary.logic.java.bool

local BooleanFactory = {}
package.loaded["org.allbinary.logic.java.bool.BooleanFactory"] = BooleanFactory

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

-- class table BooleanFactory is declared before the requires
BooleanFactory.__index = BooleanFactory
BooleanFactory.className = "BooleanFactory"
BooleanFactory.javaClassName = "org.allbinary.logic.java.bool.BooleanFactory"

function BooleanFactory:_init_fields()
    self.TRUE = true
    self.FALSE = false
    self.TRUE_STRING = tostring(self.TRUE)
    self.FALSE_STRING = tostring(self.FALSE)
    self.YES = "yes"
    self.NO = "no"
end

function BooleanFactory._jinit(self)
    BooleanFactory._init_fields(self)
    return self
end

function BooleanFactory.new()
    return BooleanFactory._jinit(setmetatable({}, BooleanFactory))
end


function BooleanFactory.getInstance()
        return BooleanFactory.instance_f
end


function BooleanFactory:toStringb(bool)
        if bool then
            return self.TRUE_STRING
        else
            return self.FALSE_STRING
        end
end

BooleanFactory.instance_f = BooleanFactory.new()

return BooleanFactory

