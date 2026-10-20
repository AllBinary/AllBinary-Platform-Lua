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
-- package org.allbinary.logic.java.array

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IntArrayUtil = {}
IntArrayUtil.__index = IntArrayUtil
IntArrayUtil.className = "IntArrayUtil"


function IntArrayUtil.new()
    local self = setmetatable({}, IntArrayUtil)
    return self
end


function IntArrayUtil.toString(array)
        local stringBuffer = StringMaker.new()
        for index = 0, (array.n or #array) - 1 do
            stringBuffer:appendint(array[index + 1])
            if index < (array.n or #array) then
                stringBuffer:append(", ")
            end
        end
        return tostring(stringBuffer)
end


-- Java overloaded method: Lua keeps the last definition
function IntArrayUtil.toString(array)
        local stringBuffer = StringMaker.new()
        for index = 0, (array.n or #array) - 1 do
            stringBuffer:append("{")
            for index2 = 0, (array[index + 1].n or #array[index + 1]) - 1 do
                stringBuffer:appendint(java_int(array[index + 1][index2 + 1]))
                if index2 < (array[index + 1].n or #array[index + 1]) - 1 then
                    stringBuffer:append(", ")
                end
            end
            stringBuffer:append("}")
            if index < (array.n or #array) - 1 then
                stringBuffer:append(", \n")
            end
        end
        return tostring(stringBuffer)
end


-- Java overloaded method: Lua keeps the last definition
function IntArrayUtil.toString(array)
        local stringBuffer = StringMaker.new()
        for index = 0, (array.n or #array) - 1 do
            stringBuffer:append("{")
            for index2 = 0, (array[index + 1].n or #array[index + 1]) - 1 do
                stringBuffer:append("{")
                for index3 = 0, (array[index + 1][index2 + 1].n or #array[index + 1][index2 + 1]) - 1 do
                    stringBuffer:appendint(java_int(array[index + 1][index2 + 1][index3 + 1]))
                    if index3 < (array[index + 1][index2 + 1].n or #array[index + 1][index2 + 1]) - 1 then
                        stringBuffer:append(", ")
                    end
                end
                stringBuffer:append("}")
                if index2 < (array[index + 1].n or #array[index + 1]) - 1 then
                    stringBuffer:append(", ")
                end
            end
            stringBuffer:append("}")
            if index < (array.n or #array) - 1 then
                stringBuffer:append(", \n")
            end
        end
        return tostring(stringBuffer)
end

return IntArrayUtil

