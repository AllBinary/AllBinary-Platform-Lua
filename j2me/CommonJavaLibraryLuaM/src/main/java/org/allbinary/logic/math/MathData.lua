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
-- package org.allbinary.logic.math

local MathData = {}
package.loaded["org.allbinary.logic.math.MathData"] = MathData

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

local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table MathData is declared before the requires
MathData.__index = MathData
MathData.className = "MathData"
MathData.javaClassName = "org.allbinary.logic.math.MathData"

function MathData:_init_fields()
    if self.EQUALS == nil then self.EQUALS = nil end
    self.PLUS = "+"
    self.GREATER_THAN = ">"
    if self.MINUS == nil then self.MINUS = nil end
    if self.DIVIDE == nil then self.DIVIDE = nil end
    if self.MULTIPLY == nil then self.MULTIPLY = nil end
end


function MathData.getInstance()
        return MathData.instance_f
end


function MathData._jinit(self)
    MathData._init_fields(self)
        local commonSeps = CommonSeps.getInstance()
        self.EQUALS = commonSeps.EQUALS
        self.MINUS = commonSeps.DASH
        self.DIVIDE = commonSeps.FORWARD_SLASH
        self.MULTIPLY = CommonPhoneStrings.getInstance().STAR
    return self
end

function MathData.new(...)
    local self = setmetatable({}, MathData)
    MathData._jinit(self, ...)
    return self
end

MathData.instance_f = MathData.new()

return MathData

