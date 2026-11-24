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
-- package org.allbinary.logic.io.file.directory

local SubDirectory = {}
package.loaded["org.allbinary.logic.io.file.directory.SubDirectory"] = SubDirectory

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

-- local FileFilter = require("java.io.FileFilter")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")

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

-- class table SubDirectory is declared before the requires
SubDirectory.__index = SubDirectory
SubDirectory.className = "SubDirectory"
SubDirectory.javaClassName = "org.allbinary.logic.io.file.directory.SubDirectory"

function SubDirectory:_init_fields()
    self.directory = Directory.getInstance()
end


function SubDirectory.getInstance()
        return SubDirectory.instance_f
end


function SubDirectory._jinit(self)
    SubDirectory._init_fields(self)
    return self
end

function SubDirectory.new(...)
    local self = setmetatable({}, SubDirectory)
    SubDirectory._jinit(self, ...)
    return self
end


function SubDirectory:search_j2_1(fileFilter, file)
        return self.directory:search(fileFilter, file, true)
end


function SubDirectory:search_j1(file)
        return self.directory:search(file, true)
end


function SubDirectory:search_j2_2(searchValue, file)
        return self.directory:search(searchValue, file, true)
end


function SubDirectory:search_j2_3(level, file)
        return self.directory:search(level, file, true)
end
function SubDirectory:search(...)
    local count = select("#", ...)
    if count == 2 then return self:search_j2(...) end
    if count == 1 then return self:search_j1(...) end
    error("No method search takes " .. count .. " arguments")
end
SubDirectory.search__jdispatcher = SubDirectory.search
function SubDirectory:search_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "FileFilter")) and (java_a2 == nil or java_is(java_a2, "AbFile")) then return SubDirectory.search_j2_1(self, ...) end
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "AbFile")) then return SubDirectory.search_j2_2(self, ...) end
    return SubDirectory.search_j2_3(self, ...)
end


function SubDirectory.toString(files)
        local stringBuffer = StringMaker.new()
        local NEW_LINE = CommonSeps.getInstance().NEW_LINE
        local size = files:size()
        for index = 0, size - 1 do
            local file = files:get(index)
            stringBuffer:append(file:getPath())
            stringBuffer:append(NEW_LINE)
        end
        return tostring(stringBuffer)
end

SubDirectory.instance_f = SubDirectory.new()

return SubDirectory

