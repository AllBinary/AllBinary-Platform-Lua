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
-- package org.allbinary.logic.java.anyType.clazz

local ClassUtil = {}
package.loaded["org.allbinary.logic.java.anyType.clazz.ClassUtil"] = ClassUtil

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

local ConstructorUtil = java_lazy("org.allbinary.logic.java.anyType.ConstructorUtil")
local InterfaceUtil = java_lazy("org.allbinary.logic.java.anyType.InterfaceUtil")
local MethodUtil = java_lazy("org.allbinary.logic.java.anyType.MethodUtil")
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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table ClassUtil is declared before the requires
ClassUtil.__index = ClassUtil
ClassUtil.className = "ClassUtil"
ClassUtil.javaClassName = "org.allbinary.logic.java.anyType.clazz.ClassUtil"


function ClassUtil._jinit(self)
    return self
end

function ClassUtil.new(...)
    local self = setmetatable({}, ClassUtil)
    ClassUtil._jinit(self, ...)
    return self
end


function ClassUtil.viewAll_j2_1(anyType, lineBreak)
        if not rawequal(anyType, nil) then
            return ClassUtil.viewAll(getmetatable(anyType), lineBreak)
        else
            return "Object Null"
        end
end


function ClassUtil.viewAll_j2_2(myClass, lineBreak)
        if not rawequal(myClass, nil) then
            local stringBuffer = StringMaker.new()
            local classes = myClass:getClasses()
            stringBuffer:append(lineBreak)
            stringBuffer:append("Class: ")
            stringBuffer:append((myClass.javaClassName or myClass.className))
            stringBuffer:append(" uses ")
            stringBuffer:appendint((classes.n or #classes))
            stringBuffer:append(" other classes")
            stringBuffer:append(lineBreak)
            stringBuffer:append(lineBreak)
            stringBuffer:append("Classes: ")
            stringBuffer:append(lineBreak)
            for index = 0, (classes.n or #classes) - 1 do
                stringBuffer:append("Class: ")
                stringBuffer:append(classes[index + 1]:getName())
                stringBuffer:append(lineBreak)
            end
            stringBuffer:append(InterfaceUtil.viewAll(myClass, lineBreak))
            stringBuffer:append(lineBreak)
            stringBuffer:append(ConstructorUtil.viewAll(myClass, lineBreak))
            stringBuffer:append(lineBreak)
            stringBuffer:append(MethodUtil.viewAll(myClass, lineBreak))
            return tostring(stringBuffer)
        else
            return "Class Null"
        end
end
function ClassUtil.viewAll(...)
    local count = select("#", ...)
    if count == 2 then return ClassUtil.viewAll_j2(...) end
    error("No method viewAll takes " .. count .. " arguments")
end
ClassUtil.viewAll__jdispatcher = ClassUtil.viewAll
function ClassUtil.viewAll_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Class")) and (java_a2 == nil or type(java_a2) == "string") then return ClassUtil.viewAll_j2_2(...) end
    return ClassUtil.viewAll_j2_1(...)
end

return ClassUtil

