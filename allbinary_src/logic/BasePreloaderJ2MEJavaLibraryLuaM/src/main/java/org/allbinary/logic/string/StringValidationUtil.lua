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

local TsUtil = require("org.allbinary.TsUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StringValidationUtil = {}
StringValidationUtil.__index = StringValidationUtil
StringValidationUtil.className = "StringValidationUtil"

function StringValidationUtil:_init_fields()
    self.stringUtil = StringUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function StringValidationUtil.getInstance()
        return StringValidationUtil.instance
end


function StringValidationUtil.new()
    local self = setmetatable({}, StringValidationUtil)
    self:_init_fields()
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
        if value == nil or #value < min or #value > max then
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
        if value ~= nil then
            if #value < min or #value > max then
                return false
            end
        end
        return true
end


function StringValidationUtil:isValidNotRequiredNumber(value, min, max)
        if value ~= nil then
            if self.tsUtil:compareTo(value, self.stringUtil.NULL_STRING) == 0 or #value < min or #value > max then
                return false
            end
            if not self:isNumber(value) then
                return false
            end
        end
        return true
end


function StringValidationUtil:isEmpty(string)
        if string ~= nil and self.tsUtil:compareTo(string, self.stringUtil.NULL_STRING) ~= 0 and self.tsUtil:compareTo(string, self.stringUtil.EMPTY_STRING) ~= 0 then
            return false
        else
            return true
        end
end

StringValidationUtil.instance = StringValidationUtil.new()

return StringValidationUtil

