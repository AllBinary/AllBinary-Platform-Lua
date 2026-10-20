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

local JsType = require("jsinterop.annotations.JsType")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommonSeps = {}
CommonSeps.__index = CommonSeps
CommonSeps.className = "CommonSeps"

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

function CommonSeps.new()
    local self = setmetatable({}, CommonSeps)
    self:_init_fields()
    return self
end


function CommonSeps.getInstance()
        return CommonSeps.instance
end

CommonSeps.instance = CommonSeps.new()

return CommonSeps

