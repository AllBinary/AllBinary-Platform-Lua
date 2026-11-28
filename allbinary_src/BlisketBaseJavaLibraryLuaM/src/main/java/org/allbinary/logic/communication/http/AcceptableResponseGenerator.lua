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

local AcceptableResponseGenerator = {}
package.loaded["org.allbinary.logic.communication.http.AcceptableResponseGenerator"] = AcceptableResponseGenerator

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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AcceptableResponseUtil = java_lazy("org.allbinary.logic.communication.http.AcceptableResponseUtil")

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

-- class table AcceptableResponseGenerator is declared before the requires
AcceptableResponseGenerator.__index = AcceptableResponseGenerator
AcceptableResponseGenerator.className = "AcceptableResponseGenerator"
AcceptableResponseGenerator.javaClassName = "org.allbinary.logic.communication.http.AcceptableResponseGenerator"

function AcceptableResponseGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AcceptableResponseGenerator.getInstance()
        return AcceptableResponseGenerator.instance_f
end


function AcceptableResponseGenerator._jinit(self)
    AcceptableResponseGenerator._init_fields(self)
    return self
end

function AcceptableResponseGenerator.new(...)
    local self = setmetatable({}, AcceptableResponseGenerator)
    AcceptableResponseGenerator._jinit(self, ...)
    return self
end


-- throws Exception
function AcceptableResponseGenerator:get(httpServletRequest)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local acceptableResponseUtil = AcceptableResponseUtil.getInstance()
            local acceptable = httpServletRequest:getHeader("accept")
            local result = acceptableResponseUtil:getTagName(0)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTP) then
                self.logUtil:putF(require("allbinary_java").to_string("Request Type: ") .. require("allbinary_java").to_string(acceptable), self, commonStrings.GET)
            end
            if not rawequal(acceptable, nil) then
                local size = acceptableResponseUtil:size()
                for index = 0, size - 1 do
                    if rawequal(((acceptable < acceptableResponseUtil:get(index) and -1) or (acceptable > acceptableResponseUtil:get(index) and 1) or 0), 0) then
                        result = acceptableResponseUtil:getTagName(index)
                    end
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTP) then
                self.logUtil:putF(require("allbinary_java").to_string("Response Type: ") .. require("allbinary_java").to_string(result), self, commonStrings.GET)
            end
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AcceptableResponseGenerator.instance_f = AcceptableResponseGenerator.new()

return AcceptableResponseGenerator

