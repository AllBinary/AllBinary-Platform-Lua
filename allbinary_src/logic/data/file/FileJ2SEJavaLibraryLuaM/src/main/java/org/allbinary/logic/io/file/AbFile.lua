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

-- local File = require("java.io.File")
-- local FileFilter = require("java.io.FileFilter")
-- local FilenameFilter = require("java.io.FilenameFilter")
-- local IOException = require("java.io.IOException")
-- local URI = require("java.net.URI")
local TsUtil = require("org.allbinary.TsUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbFileInterface = require("org.allbinary.logic.io.file.AbFileInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbFile = {}
AbFile.__index = AbFile
AbFile.className = "AbFile"

function AbFile:_init_fields()
    self.file = nil
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


function AbFile.new(file)
    local self = setmetatable({}, AbFile)
    self:_init_fields()
        self.file = file
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


function AbFile:setWritable(writable, ownerOnly)
        return self.file:setExecutable(writable, ownerOnly)
end


-- Java overloaded method: Lua keeps the last definition
function AbFile:setWritable(writable)
        return self.file:setWritable(writable)
end


function AbFile:setReadable(readable, ownerOnly)
        return self.file:setReadable(readable, ownerOnly)
end


-- Java overloaded method: Lua keeps the last definition
function AbFile:setReadable(readable)
        return self.file:setReadable(readable)
end


function AbFile:setExecutable(executable, ownerOnly)
        return self.file:setExecutable(executable, ownerOnly)
end


-- Java overloaded method: Lua keeps the last definition
function AbFile:setExecutable(executable)
        return self.file:setExecutable(executable)
end


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

