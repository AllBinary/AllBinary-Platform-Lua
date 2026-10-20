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

-- local FileFilter = require("java.io.FileFilter")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileFactory = require("org.allbinary.logic.io.file.FileFactory")
local FileWrapperUtil = require("org.allbinary.logic.io.file.FileWrapperUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local Directory = {}
Directory.__index = Directory
Directory.className = "Directory"


function Directory.getInstance()
        return Directory.instance
end


function Directory.new()
    local self = setmetatable({}, Directory)
    return self
end


function Directory:create(directoryAbPath)
        return self:create(directoryAbPath:toFileSystemString())
end


-- throws Exception
function Directory:remove(existingDirectoryAbPath)
        self:remove(existingDirectoryAbPath:toFileSystemString())
end


-- Java overloaded method: Lua keeps the last definition
function Directory:create(directory)
        local try_ok, try_error = pcall(function()
            local directoryFile = FileFactory.getInstance():getInstance(directory)
            if not directoryFile:isDirectory() then
                PreLogUtil.put("Creating Directories: " .. directory, self, "create")
                if not directoryFile:mkdirs() then
                    return false
                end
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("Error Creating Directories: " .. directory, self, "create", e)
            return false
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function Directory:remove(existingDirectory)
        local existingDirectoryFile = FileFactory.getInstance():getInstance(existingDirectory)
        if existingDirectoryFile:isDirectory() then
            if (existingDirectoryFile:list().n or #existingDirectoryFile:list()) > 0 then
                error(java_exception("Exception", "Did not remove category: " .. existingDirectory .. " because files exist"), 0)
            elseif existingDirectoryFile:delete() then
                PreLogUtil.put("Successfully Removed: " .. existingDirectory, "Directory", "remove")
            end
        else
            error(java_exception("Exception", "Category Directory Is Missing:" .. existingDirectory), 0)
        end
end


function Directory:search(fileFilter, file)
        return self:search(fileFilter, file, false)
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(fileFilter, file, isRecursiveSearch)
        local fileList = BasicArrayListD.new()
        local recursiveFileList = nil
        if file:isDirectory() then
            local fileArray = file:listFilesFileFilter(fileFilter)
            if fileArray == nil then
                return fileList
            end
            local files = FileWrapperUtil.wrapFiles(fileArray)
            if files == nil then
                return fileList
            end
            local size = (files.n or #files)
            for index = 0, size - 1 do
                fileList:add(files[index + 1])
                if isRecursiveSearch then
                    recursiveFileList = self:search(fileFilter, files[index + 1], isRecursiveSearch)
                    fileList:addAllList(recursiveFileList)
                end
            end
        end
        return fileList
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(file)
        return self:search(file, false)
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(file, isRecursiveSearch)
        local fileList = BasicArrayListD.new()
        local recursiveFileList = nil
        if file:isDirectory() then
            local fileArray = file:listFiles()
            if fileArray == nil then
                return fileList
            end
            local files = FileWrapperUtil.wrapFiles(fileArray)
            if files == nil then
                return fileList
            end
            for index = 0, (files.n or #files) - 1 do
                fileList:add(files[index + 1])
                if isRecursiveSearch then
                    recursiveFileList = self:search(files[index + 1], isRecursiveSearch)
                    fileList:addAllList(recursiveFileList)
                end
            end
        end
        return fileList
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(searchValue, file)
        return self:search(searchValue, file, false)
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(searchValue, file, isRecursiveSearch)
        local fileList = BasicArrayListD.new()
        local recursiveFileList = nil
        if file:isDirectory() then
            local fileArray = file:listFiles()
            if fileArray == nil then
                return fileList
            end
            local files = FileWrapperUtil.wrapFiles(fileArray)
            if files == nil then
                return fileList
            end
            for index = 0, (files.n or #files) - 1 do
                if files[index + 1]:getPath():indexOf(searchValue) >= 0 then
                    fileList:add(files[index + 1])
                end
                if isRecursiveSearch then
                    recursiveFileList = self:search(searchValue, files[index + 1], isRecursiveSearch)
                    fileList:addAllList(recursiveFileList)
                end
            end
        end
        return fileList
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(level, file)
        return self:search(level, file, false)
end


-- Java overloaded method: Lua keeps the last definition
function Directory:search(level, file, isRecursiveSearch)
        local fileList = BasicArrayListD.new()
        local recursiveFileList = nil
        if file:isDirectory() then
            local fileArray = file:listFiles()
            if fileArray == nil then
                return fileList
            end
            local files = FileWrapperUtil.wrapFiles(fileArray)
            if files == nil then
                return fileList
            end
            for index = 0, (files.n or #files) - 1 do
                fileList:add(files[index + 1])
                if level <= 0 then
                    return fileList
                end
                recursiveFileList = self:search(level - 1, files[index + 1], isRecursiveSearch)
                fileList:addAllList(recursiveFileList)
            end
        end
        return fileList
end

Directory.instance = Directory.new()

return Directory

