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

local HtmlNameMathData = {}
package.loaded["org.allbinary.logic.visual.dhtml.html.name.HtmlNameMathData"] = HtmlNameMathData

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

-- class table HtmlNameMathData is declared before the requires
HtmlNameMathData.__index = HtmlNameMathData
HtmlNameMathData.className = "HtmlNameMathData"
HtmlNameMathData.javaClassName = "org.allbinary.logic.visual.dhtml.html.name.HtmlNameMathData"

function HtmlNameMathData:_init_fields()
    self.EQUALS = "_EQUALS_"
    self.PLUS = "_PLUS_"
    self.MINUS = "_MINUS_"
    self.DIVIDE = "_DIVIDE_"
    self.MULTIPLY = "_MULTIPLY_"
end


function HtmlNameMathData.getInstance()
        return HtmlNameMathData.instance_f
end


function HtmlNameMathData._jinit(self)
    HtmlNameMathData._init_fields(self)
    return self
end

function HtmlNameMathData.new(...)
    local self = setmetatable({}, HtmlNameMathData)
    HtmlNameMathData._jinit(self, ...)
    return self
end

HtmlNameMathData.instance_f = HtmlNameMathData.new()

return HtmlNameMathData

