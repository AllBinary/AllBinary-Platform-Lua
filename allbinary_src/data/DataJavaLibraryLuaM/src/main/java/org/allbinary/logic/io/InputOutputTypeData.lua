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
-- package org.allbinary.logic.io

local InputOutputTypeData = {}
package.loaded["org.allbinary.logic.io.InputOutputTypeData"] = InputOutputTypeData

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

-- class table InputOutputTypeData is declared before the requires
InputOutputTypeData.__index = InputOutputTypeData
InputOutputTypeData.className = "InputOutputTypeData"
InputOutputTypeData.javaClassName = "org.allbinary.logic.io.InputOutputTypeData"

function InputOutputTypeData:_init_fields()
    self.NAME = "INPUT_OUTPUT_TYPE_NAME"
    self.FILE = "INPUT_OUTPUT_TYPE_FILE"
    self.RESPONSE = "INPUT_OUTPUT_TYPE_RESPONSE"
    self.DB = "INPUT_OUTPUT_TYPE_DB"
    self.JSP = "jsp"
    self.JSP_FRAGMENT = "jspf"
    self.PHP = "php"
    self.ASP = "asp"
    self.PL = "pl"
    self.DEFAULT = self.JSP
    self.DEFAULT_FRAGMENT = self.JSP_FRAGMENT
end


function InputOutputTypeData.getInstance()
        return InputOutputTypeData.instance_f
end


function InputOutputTypeData._jinit(self)
    InputOutputTypeData._init_fields(self)
    return self
end

function InputOutputTypeData.new(...)
    local self = setmetatable({}, InputOutputTypeData)
    InputOutputTypeData._jinit(self, ...)
    return self
end

InputOutputTypeData.instance_f = InputOutputTypeData.new()

return InputOutputTypeData

