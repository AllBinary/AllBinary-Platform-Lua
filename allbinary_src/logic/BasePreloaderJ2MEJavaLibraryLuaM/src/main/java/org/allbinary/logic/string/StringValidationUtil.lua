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
-- package org.allbinary.logic.string

local StringValidationUtil = {}
package.loaded["org.allbinary.logic.string.StringValidationUtil"] = StringValidationUtil

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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table StringValidationUtil is declared before the requires
StringValidationUtil.__index = StringValidationUtil
StringValidationUtil.className = "StringValidationUtil"
StringValidationUtil.javaClassName = "org.allbinary.logic.string.StringValidationUtil"

function StringValidationUtil:_init_fields()
    self.stringUtil = StringUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function StringValidationUtil.getInstance()
        return StringValidationUtil.instance_f
end


function StringValidationUtil._jinit(self)
    StringValidationUtil._init_fields(self)
    return self
end

function StringValidationUtil.new(...)
    local self = setmetatable({}, StringValidationUtil)
    StringValidationUtil._jinit(self, ...)
    return self
end


function StringValidationUtil:containsSpaces(value)
        if ((string.find(value, " ", 1, true) or 0) - 1) >= 0 then
            return true
        end
        return false
end


function StringValidationUtil:isNumber(value)
        local numberOfDecimalPoints = 0
        for index = 0, #value - 1 do
            local digit = string.sub(value, (index) + 1, (index) + 1)
            if not self:isNumberFromChar(digit) and digit ~= "." then
                return false
            end
            if digit == "." then
                numberOfDecimalPoints = numberOfDecimalPoints + 1
                if numberOfDecimalPoints > 1 then
                    return false
                end
            end
        end
        return true
end


function StringValidationUtil:isNumberFromChar(digit)
        if digit ~= "0" and digit ~= "1" and digit ~= "2" and digit ~= "3" and digit ~= "4" and digit ~= "5" and digit ~= "6" and digit ~= "7" and digit ~= "8" and digit ~= "9" then
            return false
        end
        return true
end


function StringValidationUtil:isValidRequired(value, min, max)
        if #value < min or #value > max then
            return false
        end
        return true
end


function StringValidationUtil:isValidRequiredNumber(value, min, max)
        if self:isEmpty(value) or #value < min or #value > max then
            return false
        end
        if not self:isNumber(value) then
            return false
        end
        return true
end


function StringValidationUtil:isValidNotRequired(value, min, max)
        if #value > 0 then
            if #value < min or #value > max then
                return false
            end
        end
        return true
end


function StringValidationUtil:isValidNotRequiredNumber(value, min, max)
        if #value > 0 then
            if self.tsUtil:compareTo(value, self.stringUtil.NULL_STRING) == 0 or #value < min or #value > max then
                return false
            end
            if not self:isNumber(value) then
                return false
            end
        end
        return true
end


function StringValidationUtil:isEmpty(string_)
        if self.tsUtil:compareTo(string_, self.stringUtil.NULL_STRING) ~= 0 and self.tsUtil:compareTo(string_, self.stringUtil.EMPTY_STRING) ~= 0 then
            return false
        else
            return true
        end
end

StringValidationUtil.instance_f = StringValidationUtil.new()

return StringValidationUtil

