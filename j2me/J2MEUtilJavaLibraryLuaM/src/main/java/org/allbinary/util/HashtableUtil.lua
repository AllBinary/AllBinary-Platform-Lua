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
-- package org.allbinary.util

-- local Enumeration = require("java.util.Enumeration")
local JsType = require("jsinterop.annotations.JsType")

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

local HashtableUtil = {}
HashtableUtil.__index = HashtableUtil
HashtableUtil.className = "HashtableUtil"

function HashtableUtil:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
end

function HashtableUtil.new()
    local self = setmetatable({}, HashtableUtil)
    self:_init_fields()
    return self
end


function HashtableUtil.getInstance()
        return HashtableUtil.instance
end


function HashtableUtil:putAll(fromHashtable, hashtable)
        local enumeration = fromHashtable:keys()
        local keyCanBeNull = nil
        local valueCanBeNull = nil
        while self.enumerationUtil:hasMoreElements(enumeration) do
            keyCanBeNull = self.enumerationUtil:nextElement(enumeration)
            valueCanBeNull = hashtable:get(keyCanBeNull)
            if valueCanBeNull == nil then
            else
                hashtable:put(keyCanBeNull, valueCanBeNull)
            end
        end
end


function HashtableUtil:getKeysAsArray(hashtable)
        local objectArray = java_new_array(nil, hashtable:size())
        local index = 0
        local enumeration = hashtable:keys()
        while self.enumerationUtil:hasMoreElements(enumeration) do
            objectArray[(function() local value = index index = value + 1 return value end)() + 1] = self.enumerationUtil:nextElement(enumeration)
        end
        return objectArray
end


function HashtableUtil:getKeysAsList(hashtable)
        local list = BasicArrayListS.new(hashtable:size())
        local enumeration = hashtable:keys()
        while self.enumerationUtil:hasMoreElements(enumeration) do
            list:add(self.enumerationUtil:nextElement(enumeration))
        end
        return list
end

HashtableUtil.instance = HashtableUtil.new()

return HashtableUtil

