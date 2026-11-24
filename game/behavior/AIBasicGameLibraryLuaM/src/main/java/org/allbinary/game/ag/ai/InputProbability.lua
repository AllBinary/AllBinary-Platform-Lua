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
-- package org.allbinary.game.ag.ai

local InputProbability = {}
package.loaded["org.allbinary.game.ag.ai.InputProbability"] = InputProbability

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- class table InputProbability is declared before the requires
InputProbability.__index = InputProbability
InputProbability.className = "InputProbability"
InputProbability.javaClassName = "org.allbinary.game.ag.ai.InputProbability"

function InputProbability:_init_fields()
    if self.likelyhoodIntegerArray == nil then self.likelyhoodIntegerArray = nil end
    if self.repeatLikelyhoodIntegerArray == nil then self.repeatLikelyhoodIntegerArray = nil end
    if self.max == nil then self.max = nil end
    if self.timeDelayHelper == nil then self.timeDelayHelper = nil end
end


function InputProbability._jinit(self, likelyhoodIntegerArray, repeatLikelyhoodIntegerArray, max, timeDelayHelper)
    InputProbability._init_fields(self)
        self.likelyhoodIntegerArray = likelyhoodIntegerArray
        self.repeatLikelyhoodIntegerArray = repeatLikelyhoodIntegerArray
        self.max = max
        self.timeDelayHelper = timeDelayHelper
    return self
end

function InputProbability.new(...)
    local self = setmetatable({}, InputProbability)
    InputProbability._jinit(self, ...)
    return self
end


function InputProbability:getLikelyhoodIntegerArray()
        return self.likelyhoodIntegerArray
end


function InputProbability:getRepeatLikelyhoodIntegerArray()
        return self.repeatLikelyhoodIntegerArray
end


function InputProbability:getMax()
        return self.max
end


function InputProbability:getTimeDelayHelper()
        return self.timeDelayHelper
end


function InputProbability:toHashtable()
        local hashtable = StdUtil.getInstance():createHashtable()
        hashtable:put(InputProbability.INPUT_PROBABILITY, self)
        return hashtable
end

InputProbability.INPUT_PROBABILITY = SmallIntegerSingletonFactory.getInstance():getAt(0)

return InputProbability

