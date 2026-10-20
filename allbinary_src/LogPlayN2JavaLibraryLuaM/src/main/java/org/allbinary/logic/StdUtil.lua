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
-- package org.allbinary.logic

local JsType = require("jsinterop.annotations.JsType")
local JsProperty = require("jsinterop.annotations.JsProperty")
local JsMethod = require("jsinterop.annotations.JsMethod")
local ABHashMap = require("org.allbinary.util.ABHashMap")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local ABStack = require("org.allbinary.util.ABStack")
local ABVector = require("org.allbinary.util.ABVector")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local StdUtil = {}
StdUtil.__index = StdUtil
StdUtil.className = "StdUtil"

function StdUtil:_init_fields()
    self.EMPTY_VECTOR = self:createVector()
    self.NULL_TABLE = self:createHashtable()
    self.NULL_MAP = self:createHashMap()
end

function StdUtil.new()
    local self = setmetatable({}, StdUtil)
    self:_init_fields()
    return self
end


function StdUtil.getInstance()
        return StdUtil.instance
end


function StdUtil:createStack()
        return ABStack.new()
end


function StdUtil:createVector()
        return ABVector.new()
end


function StdUtil:createHashtable()
        return ABHashtable.new()
end


function StdUtil:createHashMap()
        return ABHashMap.new()
end

StdUtil.instance = StdUtil.new()

return StdUtil

