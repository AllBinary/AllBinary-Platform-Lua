-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local JsType = require("jsinterop.annotations.JsType")
-- local Enumeration = require("java.util.Enumeration")
local JsMethod = require("jsinterop.annotations.JsMethod")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ArkTs does not have this.  So this is for the ArkTs build.
local EnumerationUtil = {}
EnumerationUtil.__index = EnumerationUtil
EnumerationUtil.className = "EnumerationUtil"

function EnumerationUtil.new()
    local self = setmetatable({}, EnumerationUtil)
    return self
end


function EnumerationUtil.getInstance()
        return EnumerationUtil.instance
end


function EnumerationUtil:hasMoreElements(enumeration)
        return enumeration:hasMoreElements()
end


function EnumerationUtil:nextElement(enumeration)
        return enumeration:nextElement()
end


function EnumerationUtil:getAsArray(enumeration)
        local basicArrayList = BasicArrayListD.new()
        while self:hasMoreElements(enumeration) do
            basicArrayList:add(self:nextElement(enumeration))
        end
        return basicArrayList:toArray()
end

EnumerationUtil.instance = EnumerationUtil.new()

return EnumerationUtil

