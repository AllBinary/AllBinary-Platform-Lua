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
-- package org.allbinary.logic.io.file.filter

local VisitorFileFilter = {}
package.loaded["org.allbinary.logic.io.file.filter.VisitorFileFilter"] = VisitorFileFilter

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

local File = java_lazy("java.io.File")
-- local FileFilter = require("java.io.FileFilter")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileWrapperUtil = java_lazy("org.allbinary.logic.io.file.FileWrapperUtil")
local VisitorInterface = java_lazy("org.allbinary.logic.util.visitor.VisitorInterface")

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

-- class table VisitorFileFilter is declared before the requires
VisitorFileFilter.__index = VisitorFileFilter
VisitorFileFilter.className = "VisitorFileFilter"
VisitorFileFilter.javaClassName = "org.allbinary.logic.io.file.filter.VisitorFileFilter"
VisitorFileFilter.java_implements = " FileFilter "
VisitorFileFilter.java_interfaces = function() return {FileFilter} end

function VisitorFileFilter:_init_fields()
    if self.booleanVisitorInterface == nil then self.booleanVisitorInterface = nil end
end


function VisitorFileFilter._jinit(self, booleanVisitorInterface)
    VisitorFileFilter._init_fields(self)
        self.booleanVisitorInterface = booleanVisitorInterface
    return self
end

function VisitorFileFilter.new(...)
    local self = setmetatable({}, VisitorFileFilter)
    VisitorFileFilter._jinit(self, ...)
    return self
end


function VisitorFileFilter:accept_j1_1(file)
        local abFile = FileWrapperUtil.wrapFile(file)
        local isFileAcceptable = (self.booleanVisitorInterface:visit(abFile))
        return isFileAcceptable or file:isDirectory()
end


function VisitorFileFilter:accept_j1_2(file)
        local isFileAcceptable = (self.booleanVisitorInterface:visit(file))
        return isFileAcceptable or file:isDirectory()
end
function VisitorFileFilter:accept(...)
    local count = select("#", ...)
    if count == 1 then return self:accept_j1(...) end
    error("No method accept takes " .. count .. " arguments")
end
VisitorFileFilter.accept__jdispatcher = VisitorFileFilter.accept
function VisitorFileFilter:accept_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "File")) then return VisitorFileFilter.accept_j1_1(self, ...) end
    return VisitorFileFilter.accept_j1_2(self, ...)
end

return VisitorFileFilter

