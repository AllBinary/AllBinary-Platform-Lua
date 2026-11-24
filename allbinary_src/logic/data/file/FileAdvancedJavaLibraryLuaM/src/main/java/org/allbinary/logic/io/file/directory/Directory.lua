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

local Directory = {}
package.loaded["org.allbinary.logic.io.file.directory.Directory"] = Directory

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
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileFactory = java_lazy("org.allbinary.logic.io.file.FileFactory")
local FileWrapperUtil = java_lazy("org.allbinary.logic.io.file.FileWrapperUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table Directory is declared before the requires
Directory.__index = Directory
Directory.className = "Directory"
Directory.javaClassName = "org.allbinary.logic.io.file.directory.Directory"


function Directory.getInstance()
        return Directory.instance_f
end


function Directory._jinit(self)
    return self
end

function Directory.new(...)
    local self = setmetatable({}, Directory)
    Directory._jinit(self, ...)
    return self
end


function Directory:create_j1_1(directoryAbPath)
        return self:create(directoryAbPath:toFileSystemString())
end


-- throws Exception
function Directory:remove_j1_1(existingDirectoryAbPath)
        self:remove(existingDirectoryAbPath:toFileSystemString())
end


function Directory:create_j1_2(directory)
        local try_ok, try_error, try_value = pcall(function()
            local directoryFile = FileFactory.getInstance():getInstance(directory)
            if not directoryFile:isDirectory() then
                PreLogUtil.put("Creating Directories: " .. directory, self, "create")
                if not directoryFile:mkdirs() then
                    do return "__jreturn", false end
                end
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("Error Creating Directories: " .. directory, self, "create", e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function Directory:create(...)
    local count = select("#", ...)
    if count == 1 then return self:create_j1(...) end
    error("No method create takes " .. count .. " arguments")
end
Directory.create__jdispatcher = Directory.create
function Directory:create_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbPath")) then return Directory.create_j1_1(self, ...) end
    return Directory.create_j1_2(self, ...)
end


-- throws Exception
function Directory:remove_j1_2(existingDirectory)
        local existingDirectoryFile = FileFactory.getInstance():getInstance(existingDirectory)
        if existingDirectoryFile:isDirectory() then
            if (existingDirectoryFile:list().n or #existingDirectoryFile:list()) > 0 then
                error(require("java.lang.Exception").new("Did not remove category: " .. existingDirectory .. " because files exist"), 0)
            elseif existingDirectoryFile:delete() then
                PreLogUtil.put("Successfully Removed: " .. existingDirectory, "Directory", "remove")
            end
        else
            error(require("java.lang.Exception").new("Category Directory Is Missing:" .. existingDirectory), 0)
        end
end
function Directory:remove(...)
    local count = select("#", ...)
    if count == 1 then return self:remove_j1(...) end
    error("No method remove takes " .. count .. " arguments")
end
Directory.remove__jdispatcher = Directory.remove
function Directory:remove_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbPath")) then return Directory.remove_j1_1(self, ...) end
    return Directory.remove_j1_2(self, ...)
end


function Directory:search_j2_1(fileFilter, file)
        return self:search(fileFilter, file, false)
end


function Directory:search_j3_1(fileFilter, file, isRecursiveSearch)
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


function Directory:search_j1(file)
        return self:search(file, false)
end


function Directory:search_j2_2(file, isRecursiveSearch)
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


function Directory:search_j2_3(searchValue, file)
        return self:search(searchValue, file, false)
end


function Directory:search_j3_2(searchValue, file, isRecursiveSearch)
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


function Directory:search_j2_4(level, file)
        return self:search(level, file, false)
end


function Directory:search_j3_3(level, file, isRecursiveSearch)
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
function Directory:search(...)
    local count = select("#", ...)
    if count == 2 then return self:search_j2(...) end
    if count == 3 then return self:search_j3(...) end
    if count == 1 then return self:search_j1(...) end
    error("No method search takes " .. count .. " arguments")
end
Directory.search__jdispatcher = Directory.search
function Directory:search_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "FileFilter")) and (java_a2 == nil or java_is(java_a2, "AbFile")) then return Directory.search_j2_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "AbFile")) and type(java_a2) == "boolean" then return Directory.search_j2_2(self, ...) end
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "AbFile")) then return Directory.search_j2_3(self, ...) end
    return Directory.search_j2_4(self, ...)
end
function Directory:search_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "FileFilter")) and (java_a2 == nil or java_is(java_a2, "AbFile")) and type(java_a3) == "boolean" then return Directory.search_j3_1(self, ...) end
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "AbFile")) and type(java_a3) == "boolean" then return Directory.search_j3_2(self, ...) end
    return Directory.search_j3_3(self, ...)
end

Directory.instance_f = Directory.new()

return Directory

