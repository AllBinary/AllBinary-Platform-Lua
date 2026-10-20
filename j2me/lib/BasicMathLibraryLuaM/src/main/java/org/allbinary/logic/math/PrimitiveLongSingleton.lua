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
-- package org.allbinary.logic.math

local StringMaker = require("org.allbinary.logic.string.StringMaker")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local PrimitiveLongSingleton = {}
PrimitiveLongSingleton.__index = PrimitiveLongSingleton
PrimitiveLongSingleton.className = "PrimitiveLongSingleton"

function PrimitiveLongSingleton:_init_fields()
    self.UNK = {"U", "n", "k"}
    self.NUMBER_ARRAY = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
    self.NUMBER_CHAR_ARRAY = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
    self.NUMBER_CHAR_ARRAYS = {{"0"}, {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}}
    self.ZERO = {self.NUMBER_CHAR_ARRAY[1]}
end

function PrimitiveLongSingleton.new()
    local self = setmetatable({}, PrimitiveLongSingleton)
    self:_init_fields()
    return self
end


function PrimitiveLongSingleton.getInstance()
        return PrimitiveLongSingleton.instance
end


-- throws Exception
function PrimitiveLongSingleton:getNumberFromChar(numberAsChar)
        local size = (self.NUMBER_CHAR_ARRAY.n or #self.NUMBER_CHAR_ARRAY)
        for index = 0, size - 1 do
            if self.NUMBER_CHAR_ARRAY[index + 1] == numberAsChar then
                return self.NUMBER_ARRAY[index + 1]
            end
        end
        error(java_exception("Exception", tostring(StringMaker.new():append("numberAsChar was not in array: "):appendchar(numberAsChar))), 0)
end

PrimitiveLongSingleton.instance = PrimitiveLongSingleton.new()

return PrimitiveLongSingleton

