-- Generated Code Do Not Modify
-- package org.allbinary.logic.math

local JsType = require("jsinterop.annotations.JsType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MathUtil = {}
MathUtil.__index = MathUtil
MathUtil.className = "MathUtil"

function MathUtil:_init_fields()
    self.ACCURACY = 100
end

function MathUtil.new()
    local self = setmetatable({}, MathUtil)
    self:_init_fields()
    return self
end


function MathUtil.getInstance()
        return MathUtil.instance
end


function MathUtil:getTotalDigits(digits)
        local total = 0
        while digits > 0 do
            digits = java_idiv(digits, 10)
            total = total + 1
        end
        return total
end


function MathUtil:sqrt(value)
        if value <= 1 then
            return value
        end
        local accumulated = ((value) // (1 << (1)))
        local result = (((accumulated + (java_idiv(value, accumulated)))) // (1 << (1)))
        repeat
            accumulated = result
            result = (((accumulated + (java_idiv(value, accumulated)))) // (1 << (1)))
        until not (accumulated > result)
        return accumulated
end


function MathUtil:sqrtd(x)
        if x == 0 then
            return 0.0
        end
        if x < 0 then
            return -1.0
        end
        local result = (x + 0.0)
        for index = 0, self.ACCURACY - 1 do
            result = (result + ((x + 0.0) / result)) / 2.0
        end
        return result
end


function MathUtil:abs(value)
        return (function() if (value < 0) then return -value else return value end end)()
end


function MathUtil:abslong(value)
        return (function() if (value < 0) then return -value else return value end end)()
end


function MathUtil:min(value, value2)
        return (function() if (value <= value2) then return value else return value2 end end)()
end


function MathUtil:max(value, value2)
        return (function() if (value >= value2) then return value else return value2 end end)()
end

MathUtil.instance = MathUtil.new()

return MathUtil

