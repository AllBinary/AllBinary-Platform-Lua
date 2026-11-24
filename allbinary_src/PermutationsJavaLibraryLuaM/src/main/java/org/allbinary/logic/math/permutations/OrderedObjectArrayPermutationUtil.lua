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

local OrderedObjectArrayPermutationUtil = {}
package.loaded["org.allbinary.logic.math.permutations.OrderedObjectArrayPermutationUtil"] = OrderedObjectArrayPermutationUtil

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

-- local Arrays = require("java.util.Arrays")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local ComparableObject = java_lazy("org.allbinary.logic.math.permutations.ComparableObject")
local ObjectPermutationVisitor = java_lazy("org.allbinary.logic.math.permutations.ObjectPermutationVisitor")

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

-- class table OrderedObjectArrayPermutationUtil is declared before the requires
OrderedObjectArrayPermutationUtil.__index = OrderedObjectArrayPermutationUtil
OrderedObjectArrayPermutationUtil.className = "OrderedObjectArrayPermutationUtil"
OrderedObjectArrayPermutationUtil.javaClassName = "org.allbinary.logic.math.permutations.OrderedObjectArrayPermutationUtil"

function OrderedObjectArrayPermutationUtil:_init_fields()
    self.TOTAL_ITERATIONS_TABLE = "Total Iterations: "
    self.FINISHED = "\nFINISHED"
end


function OrderedObjectArrayPermutationUtil.getInstance()
        return OrderedObjectArrayPermutationUtil.instance_f
end


function OrderedObjectArrayPermutationUtil._jinit(self)
    OrderedObjectArrayPermutationUtil._init_fields(self)
    return self
end

function OrderedObjectArrayPermutationUtil.new(...)
    local self = setmetatable({}, OrderedObjectArrayPermutationUtil)
    OrderedObjectArrayPermutationUtil._jinit(self, ...)
    return self
end


function OrderedObjectArrayPermutationUtil:getNext(data)
        local length = (data.n or #data)
        local i = length - 1
        local tsUtil = TsUtil.getInstance()
        while tsUtil:hashCode(data[i - 1 + 1]) >= tsUtil:hashCode(data[i + 1]) do
            i = i - 1
        end
        local j = length
        while tsUtil:hashCode(data[j - 1 + 1]) <= tsUtil:hashCode(data[i - 1 + 1]) do
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


function OrderedObjectArrayPermutationUtil:swap(data, a, b)
        local temp = data[a + 1]
        data[a + 1] = data[b + 1]
        data[b + 1] = temp
end


function OrderedObjectArrayPermutationUtil:factorial(dataLength)
        local temp = 1
        if dataLength > 1 then
            for i = 1, dataLength do
                temp = temp * (i)
            end
        end
        return temp
end


function OrderedObjectArrayPermutationUtil:generate(data, visitor)
        local iterations = self:factorial((data.n or #data))
        io.write(tostring(self.TOTAL_ITERATIONS_TABLE))
        print(iterations)
        for count = 0, iterations - 1 - 1 do
            self:getNext(data)
            visitor:visit(self)
        end
        print(self.FINISHED)
end


function OrderedObjectArrayPermutationUtil.main(args)
        local TOTAL = 7
        local data = java_new_array(nil, TOTAL)
        for i = 0, TOTAL - 1 do
            data[i + 1] = ComparableObject.new()
        end
        Arrays.sort(data)
        local permutationVisitor = ObjectPermutationVisitor.new(data)
        local ORIGINAL_DATA_LABEL = "Original Data: "
        io.write(tostring(ORIGINAL_DATA_LABEL))
        permutationVisitor:visit(data)
        OrderedObjectArrayPermutationUtil.getInstance():generate(data, permutationVisitor)
end

OrderedObjectArrayPermutationUtil.instance_f = OrderedObjectArrayPermutationUtil.new()

return OrderedObjectArrayPermutationUtil

