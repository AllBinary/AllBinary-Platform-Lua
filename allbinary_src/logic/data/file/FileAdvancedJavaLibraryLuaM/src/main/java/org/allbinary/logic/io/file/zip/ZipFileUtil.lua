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
-- package org.allbinary.logic.io.file.zip

-- local ZipEntry = require("java.util.zip.ZipEntry")
-- local ZipInputStream = require("java.util.zip.ZipInputStream")
-- local ZipOutputStream = require("java.util.zip.ZipOutputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local AbFileOutputStream = require("org.allbinary.logic.io.AbFileOutputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local ZipFileUtil = {}
ZipFileUtil.__index = ZipFileUtil
ZipFileUtil.className = "ZipFileUtil"

function ZipFileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function ZipFileUtil.new()
    local self = setmetatable({}, ZipFileUtil)
    self:_init_fields()
    return self
end


function ZipFileUtil.getInstance()
        return ZipFileUtil.instance
end


function ZipFileUtil:create(outFilename, fileBasicArrayList)
        local try_ok, try_error = pcall(function()
            local zipFile = AbFile.createAbFile(outFilename)
            if zipFile:exists() then
                zipFile:delete()
            end
            zipFile:createNewFile()
            local outputStream = ZipOutputStream.new(AbFileOutputStream.createFromAbFile(zipFile))
            local streamUtil = StreamUtil.getInstance()
            local stringBuffer = StringMaker.new()
            local byteArray = java_new_array(0, 16384)
            local fileInputStream = nil
            local size = fileBasicArrayList:size()
            local current = 0
            for i = 0, size - 1 do
                local file = fileBasicArrayList:get(i)
                if file:isDirectory() then
                elseif file:isFile() then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:appendint(current)
                    stringBuffer:append(" Creating Zip File Entry: ")
                    stringBuffer:append(file:getPath())
                    self.logUtil:putF(tostring(stringBuffer), self, "create()")
                    local try_ok, try_error = pcall(function()
                        fileInputStream = AbFileInputStream.new(file)
                        outputStream:putNextEntry(ZipEntry.new(file:getPath()))
                        streamUtil:get(fileInputStream, outputStream, byteArray)
                        outputStream:closeEntry()
                        streamUtil:close(fileInputStream)
                    end)
                    if not try_ok then
                        local e = try_error
                        self.logUtil:putF("Skipping File (Probably Local): " .. tostring(file:getPath()), self, "create()")
                    end
                end
                current = current + 1
            end
            streamUtil:close(outputStream)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "create", e)
        end
end


-- throws Exception
function ZipFileUtil:unzip(path, zipFile, fileName)
        local buffer = java_new_array(0, 16384)
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            inputStream = ZipInputStream.new(AbFileInputStream.new(zipFile))
            local zipEntry = nil
            local stringBuffer = StringMaker.new()
            local fileUtil = FileUtil.getInstance()
            while ((function() zipEntry = inputStream:getNextEntry() return zipEntry end)()) ~= nil do
                local entryName = zipEntry:getName()
                if zipEntry:isDirectory() then
                else
                    local entryFile = AbFile.createAbFile(path .. entryName)
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append("ZipEntry Name: ")
                    stringBuffer:append(entryName)
                    stringBuffer:append(" isFile: ")
                    stringBuffer:appendboolean(entryFile:isFile())
                    stringBuffer:append(" isDirectory: ")
                    stringBuffer:appendboolean(entryFile:isDirectory())
                    stringBuffer:append(" getParent: ")
                    stringBuffer:append(entryFile:getParent())
                    self.logUtil:putF(tostring(stringBuffer), self, "unzip")
                    local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(entryFile)
                    fileUtil:write(inputStream, dataOutputStream, buffer)
                end
                inputStream:closeEntry()
            end
        end)
        do -- finally
            StreamUtil.getInstance():close(inputStream)
        end
        if not try_ok then error(try_error, 0) end
end

ZipFileUtil.instance = ZipFileUtil.new()

return ZipFileUtil

