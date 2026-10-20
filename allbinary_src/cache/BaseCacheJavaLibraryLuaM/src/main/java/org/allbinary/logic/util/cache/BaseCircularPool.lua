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
-- package org.allbinary.logic.util.cache

local JsType = require("jsinterop.annotations.JsType")
local NullUtil = require("org.allbinary.logic.NullUtil")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseCircularPool = {}
BaseCircularPool.__index = BaseCircularPool
BaseCircularPool.className = "BaseCircularPool"

function BaseCircularPool:_init_fields()
    self.circularIndexUtil = CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL
    self.OBJECT_ARRAY = NullUtil.getInstance().NULL_OBJECT_ARRAY
end

function BaseCircularPool.new()
    local self = setmetatable({}, BaseCircularPool)
    self:_init_fields()
    return self
end


-- throws Exception
function BaseCircularPool:getNextInstance()
        local anyType = self.OBJECT_ARRAY[self.circularIndexUtil:getIndex() + 1]
        self.circularIndexUtil:next()
        return anyType
end


function BaseCircularPool:init(allBinaryObjectFactoryInterface)
        self.circularIndexUtil:setIndex(0)
        local size = self.circularIndexUtil:getSize()
        for index = 0, size - 1 do
            self.OBJECT_ARRAY[index + 1] = allBinaryObjectFactoryInterface:getInstance()
        end
end


-- throws Exception
function BaseCircularPool:getInstance(index)
        return self.OBJECT_ARRAY[index + 1]
end

return BaseCircularPool

