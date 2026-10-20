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

-- local Arrays = require("java.util.Arrays")
local TsUtil = require("org.allbinary.TsUtil")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")

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

local OrderedObjectArrayPermutationUtil = {}
OrderedObjectArrayPermutationUtil.__index = OrderedObjectArrayPermutationUtil
OrderedObjectArrayPermutationUtil.className = "OrderedObjectArrayPermutationUtil"

function OrderedObjectArrayPermutationUtil:_init_fields()
    self.TOTAL_ITERATIONS_TABLE = "Total Iterations: "
    self.FINISHED = "\nFINISHED"
end


function OrderedObjectArrayPermutationUtil.getInstance()
        return OrderedObjectArrayPermutationUtil.instance
end


function OrderedObjectArrayPermutationUtil.new()
    local self = setmetatable({}, OrderedObjectArrayPermutationUtil)
    self:_init_fields()
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

OrderedObjectArrayPermutationUtil.instance = OrderedObjectArrayPermutationUtil.new()

return OrderedObjectArrayPermutationUtil

