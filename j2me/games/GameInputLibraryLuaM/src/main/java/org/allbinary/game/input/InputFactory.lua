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

local InputFactory = {}
package.loaded["org.allbinary.game.input.InputFactory"] = InputFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Input = java_lazy("org.allbinary.game.input.Input")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InputFactory is declared before the requires
InputFactory.__index = InputFactory
InputFactory.className = "InputFactory"
InputFactory.javaClassName = "org.allbinary.game.input.InputFactory"

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
        if rawequal(InputFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            InputFactory.instance_f = InputFactory.new()
        end
        return InputFactory.instance_f
end


function InputFactory._jinit(self)
    InputFactory._init_fields(self)
        local size = (self.inputIntegerArray.n or #self.inputIntegerArray)
        for index = 0, size - 1 do
            self.inputIntegerArray[index + 1] = self.NO_INPUT
        end
    return self
end

function InputFactory.new(...)
    local self = setmetatable({}, InputFactory)
    InputFactory._jinit(self, ...)
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

InputFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return InputFactory

