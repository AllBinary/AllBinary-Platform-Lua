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

-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local AbFileLocalInputStream = require("org.allbinary.logic.io.AbFileLocalInputStream")
local AbIOSystem = require("org.allbinary.logic.io.AbIOSystem")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local FileStreamFactory = require("org.allbinary.logic.io.FileStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

--data/init/views/TestStore/template/type/genericTemplateObjectConfig.xml
local FileUtil = {}
FileUtil.__index = FileUtil
FileUtil.className = "FileUtil"

function FileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.directory = Directory.getInstance()
    self.logConfigTypeFactory = LogConfigTypeFactory.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.streamUtil = StreamUtil.getInstance()
    self.WRITE_LABEL = "Write file: "
    self.DATA_LABEL = " data: "
    self.WRITE_METHOD = "write"
end


function FileUtil.getInstance()
        return FileUtil.instance
end


function FileUtil.new()
    local self = setmetatable({}, FileUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function FileUtil:write(inputStream, file)
        local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(file)
        self:write(inputStream, dataOutputStream)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:write(inputStream, dataOutputStream)
        local try_ok, try_error = pcall(function()
            dataOutputStream = StreamUtil.getInstance():get(inputStream, dataOutputStream, java_new_array(0, 16384))
            dataOutputStream:flush()
        end)
        do -- finally
            StreamUtil.getInstance():close(dataOutputStream)
        end
        if not try_ok then error(try_error, 0) end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:write(inputStream, dataOutputStream, buffer)
        local try_ok, try_error = pcall(function()
            dataOutputStream = StreamUtil.getInstance():get(inputStream, dataOutputStream, buffer)
            dataOutputStream:flush()
        end)
        do -- finally
            StreamUtil.getInstance():close(dataOutputStream)
        end
        if not try_ok then error(try_error, 0) end
end


-- throws Exception
function FileUtil:copy(dataInputStream, dataOutputStream)
        local try_ok, try_error = pcall(function()
            dataOutputStream = StreamUtil.getInstance():get(dataInputStream, dataOutputStream, java_new_array(0, 16384))
            dataOutputStream:flush()
        end)
        do -- finally
            StreamUtil.getInstance():close(dataOutputStream)
            StreamUtil.getInstance():close(dataInputStream)
        end
        if not try_ok then error(try_error, 0) end
end


-- throws Exception
function FileUtil:fixPath(file, path, realPath, cloud)
        local beginIndex = file:getPath():indexOf(cloud) + #cloud
        local endIndex = file:getPath():indexOf(file:getName())
        local fixedPathString = tostring(realPath:toFileSystemString()) .. file:getPath():substring(beginIndex, endIndex)
        local fixedPath = AbPath.new(fixedPathString, StringUtil.getInstance().EMPTY_STRING)
        self.directory:create(fixedPath)
        local string = fixedPath:toFileSystemString()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
            self.logUtil:putF(string, self, "fixPath")
        end
        local outPath = AbPath.new(string, file:getName())
        return outPath
end


-- throws Exception
function FileUtil:copyToCloud(file, path, realPath, cloud)
        self:copyToCloud(file, path, realPath, cloud, false, false)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:copyToCloud(file, path, realPath, cloud, overwriteNewer, overwriteAll)
        local try_ok, try_error = pcall(function()
            local outPath = self:fixPath(file, path, realPath, cloud)
            local outFile = AbFile.createAbFileFromAbPath(outPath)
            if not self:copyPrepare(file, outFile, overwriteNewer, overwriteAll) then
                return
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Out File: ")
                    stringBuffer:append(outFile:getPath())
                    stringBuffer:append(" In File: ")
                    stringBuffer:append(file:getPath())
                    stringBuffer:append(" to cloud.")
                    self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyToCloud")
                end
            end
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(outFile)
            local fileInputStream = AbFileLocalInputStream.new(file)
            self:copy(fileInputStream, dataOutputStream)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILEERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Error Copying File File: ")
                stringBuffer:append(tostring(file))
                stringBuffer:append(" to cloud.")
                self.logUtil:put(tostring(stringBuffer), FileUtil.getInstance(), "copyToCloud", e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:copyToCloud(file, outFile)
        self:copyToCloud(file, outFile, false, false)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:copyToCloud(file, outFile, overwriteNewer, overwriteAll)
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if not self:copyPrepare(file, outFile, overwriteNewer, overwriteAll) then
                return
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append("Out File: ")
                    stringBuffer:append(outFile:getPath())
                    stringBuffer:append(" In File: ")
                    stringBuffer:append(file:getPath())
                    stringBuffer:append(" to cloud.")
                    self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyToCloud")
                end
            end
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(outFile)
            local fileInputStream = AbFileLocalInputStream.new(file)
            self:copy(fileInputStream, dataOutputStream)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILEERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Error Copying File File: ")
                stringBuffer:append(tostring(file))
                stringBuffer:append(" to cloud.")
                self.logUtil:put(tostring(stringBuffer), FileUtil.getInstance(), "copyToCloud", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function FileUtil:copyPrepare(fromFile, toFile, overwriteNewer, overwriteAll)
        if toFile:exists() then
            local stringBuffer = StringMaker.new()
            if overwriteAll then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append("Overwriting File: ")
                    stringBuffer:append(toFile:getPath())
                    self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyFile")
                end
                toFile:delete()
                toFile:createNewFile()
            elseif toFile:lastModified() < fromFile:lastModified() and overwriteNewer then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append("Newer by: ")
                    stringBuffer:appendlong(java_int(fromFile:lastModified() - toFile:lastModified()))
                    stringBuffer:append("ms ")
                    stringBuffer:append("Copying File: ")
                    stringBuffer:append(toFile:getPath())
                    self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyFile")
                end
                toFile:delete()
                toFile:createNewFile()
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append("File Already Exists")
                    if overwriteNewer then
                        stringBuffer:append(" And Is Not Older")
                    else
                        stringBuffer:append(" And Not A In Overwrite Mode")
                    end
                    stringBuffer:append(CommonLabels.getInstance().COLON_SEP)
                    stringBuffer:append(toFile:getPath())
                    self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyFile")
                end
                return false
            end
        else
            toFile:createNewFile()
        end
        return true
end


-- throws Exception
function FileUtil:copyFile(fromFile, toFile)
        self:copyFile(fromFile, toFile, false, false)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:copyFile(fromFile, toFile, overwriteNewer, overwriteAll)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Copying ")
                stringBuffer:appendlong(fromFile:length())
                stringBuffer:append(" bytes from File: ")
                stringBuffer:append(fromFile:getPath())
                stringBuffer:append(" to: ")
                stringBuffer:append(toFile:getPath())
                self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyFile")
            end
            if not self:copyPrepare(fromFile, toFile, overwriteNewer, overwriteAll) then
                return
            end
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(toFile)
            local fileInputStream = AbFileInputStream.new(fromFile)
            self:copy(fileInputStream, dataOutputStream)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILEERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Error Copying File fromFile: ")
                stringBuffer:append(tostring(fromFile))
                stringBuffer:append(" to: ")
                stringBuffer:append(tostring(toFile))
                self.logUtil:put(tostring(stringBuffer), FileUtil.getInstance(), "copyFile", e)
            end
            error(e, 0)
        end
end


function FileUtil.getNewDirectory(fromFile)
        local newDirectory = fromFile:getPath()
        local separatorChar = FilePathData.getInstance().PATH_START
        if AbIOSystem.getInstance():isType("com.vobject.appengine.java.io") then
            separatorChar = AbPathData.getInstance().SEPARATOR
        end
        local lastIndex = newDirectory:lastIndexOf(separatorChar)
        if lastIndex >= #newDirectory then
            newDirectory = string.sub(newDirectory, (0) + 1, #newDirectory - 1)
            lastIndex = newDirectory:lastIndexOf(separatorChar)
        end
        return string.sub(newDirectory, (lastIndex) + 1, #newDirectory)
end


-- throws Exception
function FileUtil:copyDirectoryPortion(fromDirectoryAbPath, toDirectoryAbPath, overwriteNewer, overwriteAll, current, total)
        local file = AbFile.createAbFileFromAbPath(fromDirectoryAbPath)
        if not file:isDirectory() then
            error(java_exception("Exception", "Not a directory: " .. tostring(file:getPath())), 0)
        end
        local fileList = self.directory:search(file, true)
        local size = fileList:size()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Searched: ")
        stringBuffer:append(file:getPath())
        stringBuffer:append(" Total: ")
        stringBuffer:appendint(size)
        local portion = java_idiv(size, total) + 1
        local start = portion * current
        local end_ = start + portion
        if end_ > size then
            end_ = size
        end
        stringBuffer:append(" Section: ")
        stringBuffer:appendint(start)
        stringBuffer:append(" - ")
        stringBuffer:appendint(end_)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
            self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copySomeFilesToDirectory()")
        end
        local nextFile = nil
        for index = start, end_ - 1 do
            nextFile = fileList:get(index)
            if nextFile:isDirectory() then
            else
                local path = AbPath.new(nextFile:getPath(), StringUtil.getInstance().EMPTY_STRING):getPath()
                local beginIndex = fromDirectoryAbPath:getPath():length()
                if path:indexOf(self.URLGLOBALS:getWebappPath()) < 0 then
                    beginIndex = beginIndex - (AbPath.new(self.URLGLOBALS:getWebappPath(), StringUtil.getInstance().EMPTY_STRING):getPath():length())
                end
                local newPath = tostring(toDirectoryAbPath:toFileSystemString()) .. path:substring(beginIndex)
                local toFile = AbFile.createAbFileFromAbPath(AbPath.new(newPath, StringUtil.getInstance().EMPTY_STRING))
                self:copyFile(nextFile, toFile, overwriteNewer, overwriteAll)
            end
        end
end


-- throws Exception
function FileUtil:copyDirectory(fromFile, to)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Copying Directory from: ")
                stringBuffer:append(fromFile:getPath())
                stringBuffer:append(" to: ")
                stringBuffer:append(to:getPath())
                self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyDirectory")
            end
            local newDirectory = FileUtil.getNewDirectory(fromFile)
            local newDirectoryAbPath = AbPath.new(tostring(to:getPath() + AbPathData.getInstance().SEPARATOR) .. newDirectory, StringUtil.getInstance().EMPTY_STRING)
            if not self.directory:create(newDirectoryAbPath) then
                error(java_exception("Exception", "Failed to create directory: " .. tostring(newDirectoryAbPath)), 0)
            end
            local fileArray = FileWrapperUtil.wrapFiles(fromFile:listFiles())
            local size = (fileArray.n or #fileArray)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Copying ")
                stringBuffer:appendint(size)
                stringBuffer:append(" files from: ")
                stringBuffer:append(fromFile:getPath())
                stringBuffer:append(" to: ")
                stringBuffer:append(to:getPath())
                self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), "copyDirectory")
            end
            local file = nil
            for index = 0, size - 1 do
                file = fileArray[index + 1]
                if file:isFile() then
                    self:copyFile(file, AbFile.createAbFilePathAndName(tostring(newDirectoryAbPath), file:getName()))
                elseif file:isDirectory() then
                    self:copyDirectory(file, AbFile.createAbFileFromAbPath(newDirectoryAbPath))
                else
                    error(java_exception("Exception", "File Copy Error"), 0)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILEERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Error Copying Directory fromFile: ")
                stringBuffer:append(tostring(fromFile))
                stringBuffer:append(" to: ")
                stringBuffer:append(tostring(to))
                self.logUtil:put(tostring(stringBuffer), FileUtil.getInstance(), "copyDirectory", e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:copy(fromAbPath, to)
        local COPY = "copy"
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Copying AbPaths from: ")
                stringBuffer:append(tostring(fromAbPath))
                stringBuffer:append(" to: ")
                stringBuffer:append(tostring(to))
                self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), COPY)
            end
            if fromAbPath == nil then
                error(java_exception("Exception", "Cannot Copy From A Null Location"), 0)
            end
            if to == nil then
                error(java_exception("Exception", "Cannot Copy To A Null Location"), 0)
            end
            local fromLocationFile = AbFile.createAbFileFromAbPath(fromAbPath)
            local toLocationFile = AbFile.createAbFileFromAbPath(to)
            if fromLocationFile:isFile() then
                if toLocationFile:isDirectory() then
                    local file = AbFile.createAbFileWithChild(toLocationFile, fromLocationFile:getName())
                    self:copyFile(fromLocationFile, file)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Copied file=")
                        stringBuffer:append(fromLocationFile:getName())
                        stringBuffer:append(" from: ")
                        stringBuffer:append(fromLocationFile:getPath())
                        stringBuffer:append(" to: ")
                        stringBuffer:append(toLocationFile:getPath())
                        self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), COPY)
                    end
                else
                    self:copyFile(fromLocationFile, toLocationFile)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Copied file with new name ")
                        stringBuffer:append(" from: ")
                        stringBuffer:append(fromLocationFile:getPath())
                        stringBuffer:append(" to: ")
                        stringBuffer:append(toLocationFile:getPath())
                        self.logUtil:putF(tostring(stringBuffer), FileUtil.getInstance(), COPY)
                    end
                end
            elseif fromLocationFile:isDirectory() and toLocationFile:isDirectory() then
                if fromAbPath:toFileSystemString():charAt(fromAbPath:toFileSystemString():length() - 1) == java.io.File.separatorChar then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                        self.logUtil:putF("Copying subdirectories", FileUtil.getInstance(), COPY)
                    end
                    local fileArray = FileWrapperUtil.wrapFiles(fromLocationFile:listFiles())
                    for index = 0, (fileArray.n or #fileArray) - 1 do
                        local file = fileArray[index + 1]
                        if file:isFile() then
                            local aFile = AbFile.createAbFileWithChild(toLocationFile, file:getName())
                            self:copyFile(file, aFile)
                        elseif file:isDirectory() then
                            self:copyDirectory(file, toLocationFile)
                        else
                            error(java_exception("Exception", "File Copy Error"), 0)
                        end
                    end
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                        self.logUtil:putF("Copied subdirectories", FileUtil.getInstance(), COPY)
                    end
                else
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                        self.logUtil:putF("Copyinhg directory", FileUtil.getInstance(), COPY)
                    end
                    self:copyDirectory(fromLocationFile, toLocationFile)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILE) then
                        self.logUtil:putF("Copied directory", FileUtil.getInstance(), COPY)
                    end
                end
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(self.logConfigTypeFactory.FILEERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Error Copying fromAbPath: ")
                stringBuffer:append(tostring(fromAbPath))
                stringBuffer:append(" to: ")
                stringBuffer:append(tostring(to))
                self.logUtil:put(tostring(stringBuffer), FileUtil.getInstance(), COPY, e)
            end
            error(e, 0)
        end
end


function FileUtil:shouldSkip(file, skipFiles)
        local size = (skipFiles.n or #skipFiles)
        local skipFile = nil
        for index = 0, size - 1 do
            skipFile = skipFiles[index + 1]
            if file:getPath():compareTo(skipFile) == 0 then
                return true
            end
        end
        return false
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileUtil:write(filePath, string)
        local dataOutputStream = nil
        local try_ok, try_error = pcall(function()
            PreLogUtil.put(tostring(StringMaker.new():append(self.WRITE_LABEL):append(filePath):append(self.DATA_LABEL):append(string)), self, self.WRITE_METHOD)
            local fileInputStreamFactory = FileStreamFactory.getInstance()
            local fileOutputStream = fileInputStreamFactory:getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, filePath)
            dataOutputStream = AbDataOutputStream.new(fileOutputStream)
            dataOutputStream:write({string.byte(string, 1, -1)}, 0, #string)
            dataOutputStream:flush()
        end)
        do -- finally
            StreamUtil.getInstance():close(dataOutputStream)
        end
        if not try_ok then error(try_error, 0) end
end


function FileUtil:loadFileAsList(file, max, byteArray1)
        return FileUtil2.getInstance():loadFileAsList(file, max, byteArray1)
end

FileUtil.instance = FileUtil.new()

return FileUtil

