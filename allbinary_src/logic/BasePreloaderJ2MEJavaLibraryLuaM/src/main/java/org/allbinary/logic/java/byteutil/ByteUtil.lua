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
-- package org.allbinary.logic.java.byteutil

local ByteUtil = {}
package.loaded["org.allbinary.logic.java.byteutil.ByteUtil"] = ByteUtil

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

-- class table ByteUtil is declared before the requires
ByteUtil.__index = ByteUtil
ByteUtil.className = "ByteUtil"
ByteUtil.javaClassName = "org.allbinary.logic.java.byteutil.ByteUtil"


function ByteUtil.getInstance()
        return ByteUtil.instance_f
end


function ByteUtil._jinit(self)
    return self
end

function ByteUtil.new(...)
    local self = setmetatable({}, ByteUtil)
    ByteUtil._jinit(self, ...)
    return self
end


function ByteUtil:xor(array, mask)
        local bytes = java_typed_array("B", java_new_array(0, (array.n or #array)))
        local size = (array.n or #array)
        local index = 0
        local currentByte = 0
        while index < size do
            currentByte = array[index + 1]
            bytes[index + 1] = (currentByte ~ mask)
            index = index + 1
        end
        return bytes
end


function ByteUtil:not_(array)
        local bytes = java_typed_array("B", java_new_array(0, (array.n or #array)))
        local size = (array.n or #array)
        local index = 0
        while index < size do
            bytes[index + 1] = ~array[index + 1]
            index = index + 1
        end
        return bytes
end


function ByteUtil:xorByte(array, index)
        local mask = 0
        if index == 0 then
            mask = 1
        end
        if index == 1 then
            mask = 2
        end
        if index == 2 then
            mask = 4
        end
        if index == 3 then
            mask = 8
        end
        if index == 4 then
            mask = 16
        end
        if index == 5 then
            mask = 32
        end
        if index == 6 then
            mask = 64
        end
        if index == 7 then
            mask = -127
        end
        return self:xor(array, mask)
end


function ByteUtil:compare(newByteArray, oldByteArray)
        if (newByteArray.n or #newByteArray) ~= (oldByteArray.n or #oldByteArray) then
            return false
        else
        end
        local size = (newByteArray.n or #newByteArray)
        for index = 0, size - 1 do
            if newByteArray[index + 1] ~= oldByteArray[index + 1] then
                return false
            end
        end
        return true
end


function ByteUtil:compareWithStats(newByteArray, newSize, oldByteArray, stats)
        if newSize ~= (oldByteArray.n or #oldByteArray) then
            stats[1] = -1
            stats[3] = newSize
            stats[4] = (oldByteArray.n or #oldByteArray)
            return false
        else
            stats[1] = newSize
        end
        stats[2] = 0
        local size = newSize
        for index = 0, size - 1 do
            if newByteArray[index + 1] ~= oldByteArray[index + 1] then
                return false
            end
            stats[2] = stats[2] + 1
        end
        return true
end

ByteUtil.instance_f = ByteUtil.new()

return ByteUtil

