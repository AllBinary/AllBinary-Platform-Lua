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

local BooleanUtil = {}
package.loaded["org.allbinary.logic.java.bool.BooleanUtil"] = BooleanUtil

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

-- class table BooleanUtil is declared before the requires
BooleanUtil.__index = BooleanUtil
BooleanUtil.className = "BooleanUtil"
BooleanUtil.javaClassName = "org.allbinary.logic.java.bool.BooleanUtil"

function BooleanUtil:_init_fields()
    self.tsUtil = TsUtil.getInstance()
end


function BooleanUtil.getInstance()
        return BooleanUtil.instance_f
end


function BooleanUtil._jinit(self)
    BooleanUtil._init_fields(self)
    return self
end

function BooleanUtil.new(...)
    local self = setmetatable({}, BooleanUtil)
    BooleanUtil._jinit(self, ...)
    return self
end


-- throws Exception
function BooleanUtil:getFromString(booleanString)
        local stringValidationUtil = StringValidationUtil.getInstance()
        local booleanFactory = BooleanFactory.getInstance()
        if stringValidationUtil:isEmpty(booleanString) then
            return false
        end
        local booleanStringLowerCase = string.lower(booleanString)
        if self.tsUtil:compareTo(booleanStringLowerCase, booleanFactory.TRUE_STRING) == 0 then
            return true
        elseif self.tsUtil:compareTo(booleanStringLowerCase, booleanFactory.FALSE_STRING) == 0 then
            return false
        else
            error(require("java.lang.Exception").new("Invalid booleanString - Must be true or false"), 0)
        end
end


-- throws Exception
function BooleanUtil:isStringBoolean(booleanString)
        local booleanFactory = BooleanFactory.getInstance()
        local booleanStringLowerCase = string.lower(booleanString)
        if ((booleanStringLowerCase < booleanFactory.TRUE_STRING and -1) or (booleanStringLowerCase > booleanFactory.TRUE_STRING and 1) or 0) == 0 or ((booleanStringLowerCase < booleanFactory.FALSE_STRING and -1) or (booleanStringLowerCase > booleanFactory.FALSE_STRING and 1) or 0) == 0 then
            return true
        end
        return false
end


function BooleanUtil:toStringFromBooleanArray(booleanArray)
        local stringMaker = StringMaker.new()
        local size = (booleanArray.n or #booleanArray)
        for index = 0, size - 1 do
            stringMaker:appendboolean(booleanArray[index + 1])
        end
        return tostring(stringMaker)
end

BooleanUtil.instance_f = BooleanUtil.new()

return BooleanUtil

