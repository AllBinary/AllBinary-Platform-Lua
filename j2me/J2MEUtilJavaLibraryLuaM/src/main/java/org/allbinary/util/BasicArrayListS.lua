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
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local BasicArrayListS = {}
BasicArrayListS.__index = BasicArrayListS
BasicArrayListS.className = "BasicArrayListS"
setmetatable(BasicArrayListS, {__index = BasicArrayList})


function BasicArrayListS.new(size)
    local self = setmetatable(BasicArrayList.new(NullUtil.getInstance().NULL_OBJECT_ARRAY), BasicArrayListS)
        -- super(...) made self above
        if size < 0 then
            error(java_exception("IllegalArgumentException", tostring(StringMaker.new():append("Init Size Exception: "):appendint(size))), 0)
        end
        self.objectArray = java_new_array(nil, size)
    return self
end

return BasicArrayListS

