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
-- package org.allbinary.input.media.image

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputImageType = {}
InputImageType.__index = InputImageType
InputImageType.className = "InputImageType"

function InputImageType:_init_fields()
    self.name = nil
    self.index = nil
end


function InputImageType.new(name, index)
    local self = setmetatable({}, InputImageType)
    self:_init_fields()
        self.name = name
        self.index = index
        InputImageType.TYPE_VECTOR:add(self)
        InputImageType.hashMap:put(self:getName(), self)
    return self
end


function InputImageType:toString()
        return "ImageType: " .. self:getName()
end
InputImageType.__tostring = function(self) return self:toString() end


function InputImageType:getName()
        return self.name
end


function InputImageType.getInstance(imageTypeString)
        return InputImageType.hashMap:get(imageTypeString)
end


function InputImageType.getAllAsVector()
        return InputImageType.TYPE_VECTOR
end


function InputImageType:getIndex()
        return self.index
end

InputImageType.hashMap = StdUtil.getInstance():createHashMap()
InputImageType.TYPE_VECTOR = BasicArrayListD.new()
InputImageType.CAPTURE = InputImageType.new("Capture", 0)
InputImageType.COMPARISON = InputImageType.new("Comparison", 1)
InputImageType.MOTION = InputImageType.new("Motion", 2)

return InputImageType

