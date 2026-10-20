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
-- package org.allbinary.logic.util.event

local JsType = require("jsinterop.annotations.JsType")
local NullUtil = require("org.allbinary.logic.NullUtil")
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

local AllBinaryEventObject = {}
AllBinaryEventObject.__index = AllBinaryEventObject
AllBinaryEventObject.className = "AllBinaryEventObject"

function AllBinaryEventObject:_init_fields()
    self.source = nil
end


function AllBinaryEventObject.new(anyType)
    local self = setmetatable({}, AllBinaryEventObject)
    self:_init_fields()
        self.source = anyType
    return self
end


function AllBinaryEventObject:getSource()
        return self.source
end


function AllBinaryEventObject:setSource(source)
        self.source = source
end

AllBinaryEventObject.NULL_EVENT = AllBinaryEventObject.new(NullUtil.getInstance().NULL_OBJECT)

return AllBinaryEventObject

