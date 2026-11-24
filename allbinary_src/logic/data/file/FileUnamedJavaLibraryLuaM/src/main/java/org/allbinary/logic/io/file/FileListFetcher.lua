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
-- package org.allbinary.logic.io.file

local FileListFetcher = {}
package.loaded["org.allbinary.logic.io.file.FileListFetcher"] = FileListFetcher

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

local DirectoryBooleanFileVisitor = java_lazy("org.allbinary.logic.io.file.directory.DirectoryBooleanFileVisitor")
local DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor = java_lazy("org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor")
local DirectoryOrIncludeFileExtensionBooleanFileVisitor = java_lazy("org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor")
local SubDirectory = java_lazy("org.allbinary.logic.io.file.directory.SubDirectory")
local VisitorFileFilter = java_lazy("org.allbinary.logic.io.file.filter.VisitorFileFilter")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table FileListFetcher is declared before the requires
FileListFetcher.__index = FileListFetcher
FileListFetcher.className = "FileListFetcher"
FileListFetcher.javaClassName = "org.allbinary.logic.io.file.FileListFetcher"

function FileListFetcher:_init_fields()
    self.subDirectory = SubDirectory.getInstance()
end

function FileListFetcher._jinit(self)
    FileListFetcher._init_fields(self)
    return self
end

function FileListFetcher.new()
    return FileListFetcher._jinit(setmetatable({}, FileListFetcher))
end


function FileListFetcher.getInstance()
        return FileListFetcher.instance_f
end


function FileListFetcher:getFiles_j1(path)
        local try_ok, try_error, try_value = pcall(function()
            local files = self.subDirectory:search(AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end


function FileListFetcher:getFiles_j2_1(path, includeExtensions)
        local try_ok, try_error, try_value = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            local size = (includeExtensions.n or #includeExtensions)
            for index = 0, size - 1 do
                includeExtensionBasicArrayList:add(includeExtensions[index + 1])
            end
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end


function FileListFetcher:getFiles_j2_2(path, includeExtension)
        local try_ok, try_error, try_value = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            includeExtensionBasicArrayList:add(includeExtension)
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end


function FileListFetcher:getFiles_j3(path, pathIncludes, includeExtension)
        local try_ok, try_error, try_value = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            includeExtensionBasicArrayList:add(includeExtension)
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(includeExtensionBasicArrayList, pathIncludes))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end
function FileListFetcher:getFiles(...)
    local count = select("#", ...)
    if count == 1 then return self:getFiles_j1(...) end
    if count == 2 then return self:getFiles_j2(...) end
    if count == 3 then return self:getFiles_j3(...) end
    error("No method getFiles takes " .. count .. " arguments")
end
FileListFetcher.getFiles__jdispatcher = FileListFetcher.getFiles
function FileListFetcher:getFiles_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "string"))) then return FileListFetcher.getFiles_j2_1(self, ...) end
    return FileListFetcher.getFiles_j2_2(self, ...)
end


function FileListFetcher:getTrackedFiles_j2_1(path, includeExtensions)
        local try_ok, try_error, try_value = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            local size = (includeExtensions.n or #includeExtensions)
            for index = 0, size - 1 do
                includeExtensionBasicArrayList:add(includeExtensions[index + 1])
            end
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end


function FileListFetcher:getTrackedFiles_j2_2(path, includeExtension)
        local try_ok, try_error, try_value = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            includeExtensionBasicArrayList:add(includeExtension)
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end
function FileListFetcher:getTrackedFiles(...)
    local count = select("#", ...)
    if count == 2 then return self:getTrackedFiles_j2(...) end
    error("No method getTrackedFiles takes " .. count .. " arguments")
end
FileListFetcher.getTrackedFiles__jdispatcher = FileListFetcher.getTrackedFiles
function FileListFetcher:getTrackedFiles_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "string"))) then return FileListFetcher.getTrackedFiles_j2_1(self, ...) end
    return FileListFetcher.getTrackedFiles_j2_2(self, ...)
end


function FileListFetcher:getDirectories(path)
        local try_ok, try_error, try_value = pcall(function()
            local visitorFileFilter = VisitorFileFilter.new(DirectoryBooleanFileVisitor.new())
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            do return "__jreturn", files end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end

FileListFetcher.instance_f = FileListFetcher.new()

return FileListFetcher

