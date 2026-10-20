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

local JsType = require("jsinterop.annotations.JsType")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
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

local CircularIndexUtil = {}
CircularIndexUtil.__index = CircularIndexUtil
CircularIndexUtil.className = "CircularIndexUtil"

function CircularIndexUtil:_init_fields()
    self.index = 0
    self.lastIndex = 0
    self.size = 0
end


function CircularIndexUtil.new(index, size)
    local self = setmetatable({}, CircularIndexUtil)
    self:_init_fields()
        self:setSize(size)
        self:setIndex(index)
    return self
end


function CircularIndexUtil:next()
        if self.index >= self.lastIndex then
            self.index = 0
        else
            self.index = self.index + 1
        end
        return self.index
end


function CircularIndexUtil:previous()
        if self.index < 1 then
            self.index = self.lastIndex
        else
            self.index = self.index - 1
        end
        return self.index
end


function CircularIndexUtil:setIndex(index)
        if index > self.lastIndex then
            return
        end
        self.index = index
end


function CircularIndexUtil:getIndex()
        return self.index
end


function CircularIndexUtil.createInstance(max)
        return CircularIndexUtil.new(0, max)
end


function CircularIndexUtil.createInstanceAt(index, max)
        return CircularIndexUtil.new(index, max)
end


function CircularIndexUtil:setSize(size)
        self.size = size
        self.lastIndex = size - 1
        self.index = 0
end


function CircularIndexUtil:getSize()
        return self.size
end


function CircularIndexUtil:toString()
        return tostring(StringMaker.new():append(CommonLabels.getInstance().INDEX_LABEL):appendint(self.index):append("lastIndex: "):appendint(self.lastIndex):append("size: "):appendint(self.size))
end
CircularIndexUtil.__tostring = function(self) return self:toString() end

CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL = CircularIndexUtil.new(0, 0)

return CircularIndexUtil

