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
-- package org.allbinary.string

local CommonSeps = {}
package.loaded["org.allbinary.string.CommonSeps"] = CommonSeps

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")

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

-- class table CommonSeps is declared before the requires
CommonSeps.__index = CommonSeps
CommonSeps.className = "CommonSeps"
CommonSeps.javaClassName = "org.allbinary.string.CommonSeps"

function CommonSeps:_init_fields()
    self.NEW_LINE = "\n"
    self.SEMICOLON = ";"
    self.EQUALS = "="
    self.SPACE = " "
    self.COMMA = ","
    self.COLON = ":"
    self.PERIOD = "."
    self.UNDERSCORE = "_"
    self.COLON_SEP = tostring(StringMaker.new():append(self.COLON):append(self.SPACE))
    self.COMMA_SEP = tostring(StringMaker.new():append(self.COMMA):append(self.SPACE))
    self.PARENTHESIS_OPEN = "("
    self.PARENTHESIS_CLOSE = ")"
    self.BRACE_OPEN = "{"
    self.BRACE_CLOSE = "}"
    self.BRACKET_OPEN = "["
    self.BRACKET_CLOSE = "]"
    self.DASH = "-"
    self.PERCENT = "%"
    self.AMPERSAND = "&"
    self.FORWARD_SLASH = "/"
    self.BACK_SLASH = "\\"
    self.QUESTION = "?"
    self.QUOTE = "\""
    self.QUOTE_END = "\","
    self.COMMENT = "//"
    self.INDENT = "    "
end

function CommonSeps._jinit(self)
    CommonSeps._init_fields(self)
    return self
end

function CommonSeps.new()
    return CommonSeps._jinit(setmetatable({}, CommonSeps))
end


function CommonSeps.getInstance()
        return CommonSeps.instance_f
end

CommonSeps.instance_f = CommonSeps.new()

return CommonSeps

