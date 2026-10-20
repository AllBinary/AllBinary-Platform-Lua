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

local DirectoryBooleanFileVisitor = require("org.allbinary.logic.io.file.directory.DirectoryBooleanFileVisitor")
local DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor = require("org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor")
local DirectoryOrIncludeFileExtensionBooleanFileVisitor = require("org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor")
local SubDirectory = require("org.allbinary.logic.io.file.directory.SubDirectory")
local VisitorFileFilter = require("org.allbinary.logic.io.file.filter.VisitorFileFilter")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileListFetcher = {}
FileListFetcher.__index = FileListFetcher
FileListFetcher.className = "FileListFetcher"

function FileListFetcher:_init_fields()
    self.subDirectory = SubDirectory.getInstance()
end

function FileListFetcher.new()
    local self = setmetatable({}, FileListFetcher)
    self:_init_fields()
    return self
end


function FileListFetcher.getInstance()
        return FileListFetcher.instance
end


function FileListFetcher:getFiles(path)
        local try_ok, try_error = pcall(function()
            local files = self.subDirectory:search(AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end


-- Java overloaded method: Lua keeps the last definition
function FileListFetcher:getFiles(path, includeExtensions)
        local try_ok, try_error = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            local size = (includeExtensions.n or #includeExtensions)
            for index = 0, size - 1 do
                includeExtensionBasicArrayList:add(includeExtensions[index + 1])
            end
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end


-- Java overloaded method: Lua keeps the last definition
function FileListFetcher:getFiles(path, includeExtension)
        local try_ok, try_error = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            includeExtensionBasicArrayList:add(includeExtension)
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end


-- Java overloaded method: Lua keeps the last definition
function FileListFetcher:getFiles(path, pathIncludes, includeExtension)
        local try_ok, try_error = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            includeExtensionBasicArrayList:add(includeExtension)
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(includeExtensionBasicArrayList, pathIncludes))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end


function FileListFetcher:getTrackedFiles(path, includeExtensions)
        local try_ok, try_error = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            local size = (includeExtensions.n or #includeExtensions)
            for index = 0, size - 1 do
                includeExtensionBasicArrayList:add(includeExtensions[index + 1])
            end
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end


-- Java overloaded method: Lua keeps the last definition
function FileListFetcher:getTrackedFiles(path, includeExtension)
        local try_ok, try_error = pcall(function()
            local includeExtensionBasicArrayList = BasicArrayListD.new()
            includeExtensionBasicArrayList:add(includeExtension)
            local visitorFileFilter = VisitorFileFilter.new(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(includeExtensionBasicArrayList))
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end


function FileListFetcher:getDirectories(path)
        local try_ok, try_error = pcall(function()
            local visitorFileFilter = VisitorFileFilter.new(DirectoryBooleanFileVisitor.new())
            local files = self.subDirectory:search(visitorFileFilter, AbFile.createAbFile(path))
            return files
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
            print("Error: " .. tostring(e) .. "\nMsg: " .. tostring(e))
        end
        return nil
end

FileListFetcher.instance = FileListFetcher.new()

return FileListFetcher

