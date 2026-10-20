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
-- package org.allbinary.game.input

local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local InputFactory = {}
InputFactory.__index = InputFactory
InputFactory.className = "InputFactory"

function InputFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.KEY_CODE_LABEL = "KeyCode: "
    self.DEVICE_ID_LABEL = "DeviceId: "
    self.MAX = SmallIntegerSingletonFactory.getInstance():getMin()
    self.inputIntegerArray = java_new_array(nil, self.MAX)
    self.NO_INPUT = Input.new(0, self.commonStrings.UNKNOWN)
end


function InputFactory.getInstance()
        if InputFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            InputFactory.instance = InputFactory.new()
        end
        return InputFactory.instance
end


function InputFactory.new()
    local self = setmetatable({}, InputFactory)
    self:_init_fields()
        local size = (self.inputIntegerArray.n or #self.inputIntegerArray)
        for index = 0, size - 1 do
            self.inputIntegerArray[index + 1] = self.NO_INPUT
        end
    return self
end


function InputFactory:add(id, input)
        self.inputIntegerArray[id + 1] = input
end


function InputFactory:getInstanceById(id)
        if id < 0 then
            id = -id
        end
        if id > (self.inputIntegerArray.n or #self.inputIntegerArray) then
            self.logUtil:putF(tostring(StringMaker.new():append("Warning id: "):appendint(id)), self, self.commonStrings.GET_INSTANCE)
            return self.NO_INPUT
        end
        return self.inputIntegerArray[id + 1]
end

InputFactory.instance = NullUtil.getInstance().NULL_OBJECT

return InputFactory

