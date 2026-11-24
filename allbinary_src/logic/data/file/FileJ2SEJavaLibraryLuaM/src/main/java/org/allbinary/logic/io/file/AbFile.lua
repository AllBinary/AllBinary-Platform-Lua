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

local AbFile = {}
package.loaded["org.allbinary.logic.io.file.AbFile"] = AbFile

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
-- local FilenameFilter = require("java.io.FilenameFilter")
-- local IOException = require("java.io.IOException")
-- local URI = require("java.net.URI")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbFileInterface = require("org.allbinary.logic.io.file.AbFileInterface")

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

-- class table AbFile is declared before the requires
AbFile.__index = AbFile
AbFile.className = "AbFile"
AbFile.javaClassName = "org.allbinary.logic.io.file.AbFile"
AbFile.java_implements = " AbFileInterface "
AbFile.java_interfaces = function() return {AbFileInterface} end

function AbFile:_init_fields()
    if self.file == nil then self.file = nil end
end


-- throws Exception
function AbFile.createAbFileWithChild(file, childPathName)
        return AbFile.new(File.new(file:getFile(), childPathName))
end


-- throws Exception
function AbFile.createAbFile(filePath)
        return AbFile.new(File.new(AbPath.new(filePath, StringUtil.getInstance().EMPTY_STRING):toFileSystemString()))
end


-- throws Exception
function AbFile.createAbFilePathAndName(filePath, fileName)
        return AbFile.new(File.new(AbPath.new(filePath, StringUtil.getInstance().EMPTY_STRING):toFileSystemString(), fileName))
end


function AbFile.createAbFileFromAbPath(abPath)
        return AbFile.new(File.new(abPath:toFileSystemString()))
end


function AbFile.createAbFileFromRawPath(filePath)
        return AbFile.new(File.new(filePath))
end


function AbFile._jinit(self, file)
    AbFile._init_fields(self)
        self.file = file
    return self
end

function AbFile.new(...)
    local self = setmetatable({}, AbFile)
    AbFile._jinit(self, ...)
    return self
end


function AbFile:getFile()
        return self.file
end


function AbFile:getName()
        return self.file:getName()
end


function AbFile:getParent()
        return self.file:getParent()
end


function AbFile:getParentFile()
        return self.file:getParentFile()
end


function AbFile:getPath()
        return self.file:getPath()
end


function AbFile:isAbsolute()
        return self.file:isAbsolute()
end


function AbFile:getAbsolutePath()
        return self.file:getAbsolutePath()
end


function AbFile:getAbsoluteFile()
        return self.file:getAbsoluteFile()
end


-- throws IOException
function AbFile:getCanonicalPath()
        return self.file:getCanonicalPath()
end


-- throws IOException
function AbFile:getCanonicalFile()
        return self.file:getCanonicalFile()
end


function AbFile:toURI()
        return self.file:toURI()
end


function AbFile:canRead()
        return self.file:canRead()
end


function AbFile:canWrite()
        return self.file:canWrite()
end


function AbFile:exists()
        return self.file:exists()
end


function AbFile:isDirectory()
        return self.file:isDirectory()
end


function AbFile:isFile()
        return self.file:isFile()
end


function AbFile:isHidden()
        return self.file:isHidden()
end


function AbFile:lastModified()
        return self.file:lastModified()
end


function AbFile:length()
        return self.file:length()
end


-- throws IOException
function AbFile:createNewFile()
        return self.file:createNewFile()
end


-- throws IOException
function AbFile:delete()
        return self.file:delete()
end


function AbFile:deleteOnExit()
        self.file:deleteOnExit()
end


function AbFile:list()
        return self.file:list()
end


function AbFile:listWithFilter(filter)
        return self.file:list(filter)
end


function AbFile:listFiles()
        return self.file:listFiles()
end


function AbFile:listFilesFileNameFilter(filter)
        return self.file:listFiles(filter)
end


function AbFile:listFilesFileFilter(filter)
        return self.file:listFiles(filter)
end


function AbFile:mkdir()
        return self.file:mkdir()
end


function AbFile:mkdirs()
        return self.file:mkdirs()
end


function AbFile:renameTo(dest)
        return self.file:renameTo(dest:getFile())
end


function AbFile:setLastModified(time)
        return self.file:setLastModified(time)
end


function AbFile:setReadOnly()
        return self.file:setReadOnly()
end


function AbFile:setWritable_j2(writable, ownerOnly)
        return self.file:setExecutable(writable, ownerOnly)
end


function AbFile:setWritable_j1(writable)
        return self.file:setWritable(writable)
end
function AbFile:setWritable(...)
    local count = select("#", ...)
    if count == 2 then return self:setWritable_j2(...) end
    if count == 1 then return self:setWritable_j1(...) end
    error("No method setWritable takes " .. count .. " arguments")
end
AbFile.setWritable__jdispatcher = AbFile.setWritable


function AbFile:setReadable_j2(readable, ownerOnly)
        return self.file:setReadable(readable, ownerOnly)
end


function AbFile:setReadable_j1(readable)
        return self.file:setReadable(readable)
end
function AbFile:setReadable(...)
    local count = select("#", ...)
    if count == 2 then return self:setReadable_j2(...) end
    if count == 1 then return self:setReadable_j1(...) end
    error("No method setReadable takes " .. count .. " arguments")
end
AbFile.setReadable__jdispatcher = AbFile.setReadable


function AbFile:setExecutable_j2(executable, ownerOnly)
        return self.file:setExecutable(executable, ownerOnly)
end


function AbFile:setExecutable_j1(executable)
        return self.file:setExecutable(executable)
end
function AbFile:setExecutable(...)
    local count = select("#", ...)
    if count == 2 then return self:setExecutable_j2(...) end
    if count == 1 then return self:setExecutable_j1(...) end
    error("No method setExecutable takes " .. count .. " arguments")
end
AbFile.setExecutable__jdispatcher = AbFile.setExecutable


function AbFile:canExecute()
        return self.file:canExecute()
end


function AbFile:getTotalSpace()
        return self.file:getTotalSpace()
end


function AbFile:getFreeSpace()
        return self.file:getFreeSpace()
end


function AbFile:getUsableSpace()
        return self.file:getUsableSpace()
end


function AbFile:compareTo(pathname)
        return self.file:compareTo(pathname)
end


function AbFile:equals(obj)
        return TsUtil.getInstance():equalsNotstring(self.file, obj)
end
AbFile.__eq = function(self, other) return self:equals(other) end


function AbFile:hashCode()
        return self.file:hashCode()
end


function AbFile:toString()
        return tostring(self.file)
end
AbFile.__tostring = function(self) return self:toString() end

AbFile.NULL_FILE = AbFile.createAbFileFromRawPath(StringUtil.getInstance().EMPTY_STRING)

return AbFile

