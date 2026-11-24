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
-- package org.allbinary.logic.communication.http

local HttpData = {}
package.loaded["org.allbinary.logic.communication.http.HttpData"] = HttpData

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

-- class table HttpData is declared before the requires
HttpData.__index = HttpData
HttpData.className = "HttpData"
HttpData.javaClassName = "org.allbinary.logic.communication.http.HttpData"

function HttpData:_init_fields()
    if self.EQUALS == nil then self.EQUALS = nil end
    if self.PARAM_SEP == nil then self.PARAM_SEP = nil end
    if self.URL_PARAM_SEP == nil then self.URL_PARAM_SEP = nil end
    self.URL_LABEL = "Url: "
end


function HttpData.getInstance()
        return HttpData.instance_f
end


function HttpData._jinit(self)
    HttpData._init_fields(self)
        local commonSeps = CommonSeps.getInstance()
        self.EQUALS = commonSeps.EQUALS
        self.PARAM_SEP = commonSeps.AMPERSAND
        self.URL_PARAM_SEP = commonSeps.QUESTION
    return self
end

function HttpData.new(...)
    local self = setmetatable({}, HttpData)
    HttpData._jinit(self, ...)
    return self
end

HttpData.instance_f = HttpData.new()

return HttpData

