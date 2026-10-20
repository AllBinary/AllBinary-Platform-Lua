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
-- package org.allbinary.input

local NullUtil = require("org.allbinary.logic.NullUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinarySensorManager = {}
AllBinarySensorManager.__index = AllBinarySensorManager
AllBinarySensorManager.className = "AllBinarySensorManager"

function AllBinarySensorManager:_init_fields()
    self.ORIENTATION_SENSOR_INPUT = "Orientation Sensor Input"
    self.ORIENTATION_TYPE = "Orientation Type"
    self.list = BasicArrayListD.new()
end


function AllBinarySensorManager.getInstance()
        if AllBinarySensorManager.instance == NullUtil.getInstance().NULL_OBJECT then
            AllBinarySensorManager.instance = AllBinarySensorManager.new()
        end
        return AllBinarySensorManager.instance
end


function AllBinarySensorManager.new()
    local self = setmetatable({}, AllBinarySensorManager)
    self:_init_fields()
    return self
end


function AllBinarySensorManager:init()
end


function AllBinarySensorManager:getSensorNamesList()
        return self.list
end


function AllBinarySensorManager:shutdown()
end

AllBinarySensorManager.instance = NullUtil.getInstance().NULL_OBJECT

return AllBinarySensorManager

