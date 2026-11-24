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

local IntArrayUtil = {}
package.loaded["org.allbinary.logic.java.array.IntArrayUtil"] = IntArrayUtil

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table IntArrayUtil is declared before the requires
IntArrayUtil.__index = IntArrayUtil
IntArrayUtil.className = "IntArrayUtil"
IntArrayUtil.javaClassName = "org.allbinary.logic.java.array.IntArrayUtil"


function IntArrayUtil._jinit(self)
    return self
end

function IntArrayUtil.new(...)
    local self = setmetatable({}, IntArrayUtil)
    IntArrayUtil._jinit(self, ...)
    return self
end


function IntArrayUtil.toString_j1_1(array)
        local stringBuffer = StringMaker.new()
        for index = 0, (array.n or #array) - 1 do
            stringBuffer:appendint(array[index + 1])
            if index < (array.n or #array) then
                stringBuffer:append(", ")
            end
        end
        return tostring(stringBuffer)
end


function IntArrayUtil.toString_j1_2(array)
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


function IntArrayUtil.toString_j1_3(array)
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
function IntArrayUtil.toString(...)
    local count = select("#", ...)
    if count == 1 then return IntArrayUtil.toString_j1(...) end
    error("No method toString takes " .. count .. " arguments")
end
IntArrayUtil.toString__jdispatcher = IntArrayUtil.toString
function IntArrayUtil.toString_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and (java_a1.jt == nil or java_a1.jt == "I") and (java_a1[1] == nil or math.type(java_a1[1]) == "integer"))) then return IntArrayUtil.toString_j1_1(...) end
    if true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) then return IntArrayUtil.toString_j1_2(...) end
    return IntArrayUtil.toString_j1_3(...)
end

return IntArrayUtil

