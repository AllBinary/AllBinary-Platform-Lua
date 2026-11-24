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
-- package org.allbinary.logic.math.permutations

local OrderedIntArrayPermutationUtil = {}
package.loaded["org.allbinary.logic.math.permutations.OrderedIntArrayPermutationUtil"] = OrderedIntArrayPermutationUtil

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

local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local IntPermutationVisitor = java_lazy("org.allbinary.logic.math.permutations.IntPermutationVisitor")

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

-- class table OrderedIntArrayPermutationUtil is declared before the requires
OrderedIntArrayPermutationUtil.__index = OrderedIntArrayPermutationUtil
OrderedIntArrayPermutationUtil.className = "OrderedIntArrayPermutationUtil"
OrderedIntArrayPermutationUtil.javaClassName = "org.allbinary.logic.math.permutations.OrderedIntArrayPermutationUtil"

function OrderedIntArrayPermutationUtil:_init_fields()
    self.TOTAL_ITERATIONS_TABLE = "Total Iterations: "
    self.FINISHED = "\nFINISHED"
end


function OrderedIntArrayPermutationUtil.getInstance()
        return OrderedIntArrayPermutationUtil.instance_f
end


function OrderedIntArrayPermutationUtil._jinit(self)
    OrderedIntArrayPermutationUtil._init_fields(self)
    return self
end

function OrderedIntArrayPermutationUtil.new(...)
    local self = setmetatable({}, OrderedIntArrayPermutationUtil)
    OrderedIntArrayPermutationUtil._jinit(self, ...)
    return self
end


function OrderedIntArrayPermutationUtil:getNext(data)
        local length = (data.n or #data)
        local i = length - 1
        while data[i - 1 + 1] >= data[i + 1] do
            i = i - 1
        end
        local j = length
        while data[j - 1 + 1] <= data[i - 1 + 1] do
            j = j - 1
        end
        self:swap(data, i - 1, j - 1)
        i = i + 1
        j = length
        while i < j do
            self:swap(data, i - 1, j - 1)
            i = i + 1
            j = j - 1
        end
end


function OrderedIntArrayPermutationUtil:swap(data, a, b)
        local temp = data[a + 1]
        data[a + 1] = data[b + 1]
        data[b + 1] = temp
end


function OrderedIntArrayPermutationUtil:factorial(dataLength)
        local temp = 1
        if dataLength > 1 then
            for i = 1, dataLength do
                temp = temp * (i)
            end
        end
        return temp
end


function OrderedIntArrayPermutationUtil:generate(data, visitor)
        local iterations = self:factorial((data.n or #data))
        io.write(tostring(self.TOTAL_ITERATIONS_TABLE))
        print(iterations)
        for count = 0, iterations - 1 - 1 do
            self:getNext(data)
            visitor:visit(self)
        end
        print(self.FINISHED)
end


function OrderedIntArrayPermutationUtil.main(args)
        local TOTAL = 3
        local data = java_typed_array("I", java_new_array(0, TOTAL))
        for i = 0, TOTAL - 1 do
            data[i + 1] = i
        end
        local permutationVisitor = IntPermutationVisitor.new(data)
        local ORIGINAL_DATA_LABEL = "Original Data: "
        io.write(tostring(ORIGINAL_DATA_LABEL))
        permutationVisitor:print(data, StringMaker.new())
        OrderedIntArrayPermutationUtil.getInstance():generate(data, permutationVisitor)
end

OrderedIntArrayPermutationUtil.instance_f = OrderedIntArrayPermutationUtil.new()

return OrderedIntArrayPermutationUtil

