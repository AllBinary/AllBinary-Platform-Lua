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
-- package org.allbinary.thread

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local ARunnable = require("org.allbinary.thread.ARunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullRunnable = {}
NullRunnable.__index = NullRunnable
NullRunnable.className = "NullRunnable"
setmetatable(NullRunnable, {__index = ARunnable})


function NullRunnable.getInstance()
        return NullRunnable.instance
end


function NullRunnable.new()
    local self = setmetatable(ARunnable.new(), NullRunnable)
    return self
end

NullRunnable.instance = NullRunnable.new()

return NullRunnable

