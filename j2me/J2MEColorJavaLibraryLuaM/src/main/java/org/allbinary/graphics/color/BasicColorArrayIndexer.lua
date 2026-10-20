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
-- package org.allbinary.graphics.color

local JsType = require("jsinterop.annotations.JsType")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicColorArrayIndexer = {}
BasicColorArrayIndexer.__index = BasicColorArrayIndexer
BasicColorArrayIndexer.className = "BasicColorArrayIndexer"

function BasicColorArrayIndexer:_init_fields()
    self.basicColorArray = nil
    self.circularIndexUtil = nil
end


function BasicColorArrayIndexer.new(basicColorArray)
    local self = setmetatable({}, BasicColorArrayIndexer)
    self:_init_fields()
        self.basicColorArray = basicColorArray
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.basicColorArray.n or #self.basicColorArray))
    return self
end


function BasicColorArrayIndexer:next()
        self.circularIndexUtil:next()
end


function BasicColorArrayIndexer:get()
        return self.basicColorArray[self.circularIndexUtil:getIndex() + 1]
end


function BasicColorArrayIndexer:getBasicColorArray()
        return self.basicColorArray
end

return BasicColorArrayIndexer

