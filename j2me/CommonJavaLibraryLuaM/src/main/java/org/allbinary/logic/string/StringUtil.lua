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

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StringUtil = {}
StringUtil.__index = StringUtil
StringUtil.className = "StringUtil"

function StringUtil:_init_fields()
    self.INIT_STRING = tostring("")
    self.NULL_STRING = "null"
    self.EMPTY_STRING = ""
    self.ONE_EMPTY_STRING_ARRAY = {self.EMPTY_STRING}
    self.stringArray = java_new_array(nil, 0)
end


function StringUtil.getInstance()
        return StringUtil.instance
end


function StringUtil.new()
    local self = setmetatable({}, StringUtil)
    self:_init_fields()
    return self
end


function StringUtil:getNonNull(string)
        if string == nil then
            return self.EMPTY_STRING
        else
            return string
        end
end


function StringUtil:getArrayInstance()
        return self.stringArray
end


function StringUtil:count(string, aChar)
        local count = 0
        local size = #string
        for index = 0, size - 1 do
            if string.sub(string, (index) + 1, (index) + 1) == aChar then
                count = count + 1
            end
        end
        return count
end


function StringUtil:toString(anyType)
        if anyType ~= nil then
            return tostring(anyType)
        else
            return self.NULL_STRING
        end
end

StringUtil.instance = StringUtil.new()

return StringUtil

