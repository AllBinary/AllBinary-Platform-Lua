-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- local FileInputStream = require("java.io.FileInputStream")
-- local InputStream = require("java.io.InputStream")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

--FileJ2SE should be the same as J2SEForJ2ME
local AbFileSystem = {}
AbFileSystem.__index = AbFileSystem
AbFileSystem.className = "AbFileSystem"

function AbFileSystem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function AbFileSystem.new()
    local self = setmetatable({}, AbFileSystem)
    self:_init_fields()
    return self
end


function AbFileSystem.getInstance()
        return AbFileSystem.instance
end


function AbFileSystem:isDirectoryOrFile(path)
        local file = File.new(path)
        return file:isDirectory() or file:isFile()
end


function AbFileSystem:isDirectory(path)
        return File.new(path):isDirectory()
end


function AbFileSystem:getFilesAsStringArrayForPath(currentDirPath)
        local file = File.new(currentDirPath)
        if file:exists() then
            return file:list()
        else
            return StringUtil.getInstance():getArrayInstance()
        end
end


function AbFileSystem:readAsString(fileName)
        local bytes = java_new_array(0, 1000000)
        return self:readAsString(fileName, bytes)
end


-- Java overloaded method: Lua keeps the last definition
function AbFileSystem:readAsString(fileName, bytes)
        local closeable = NullUtil.getInstance().NULL_OBJECT
        local try_ok, try_error = pcall(function()
            local idFile = FileInputStream.new(fileName)
            closeable = idFile
            local size = idFile:read(bytes)
            if size > 0 then
                return string.char(table.unpack(bytes, 0, size))
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "readAsString", e)
        end
        do -- finally
            self:close(closeable)
        end
        return StringUtil.getInstance().EMPTY_STRING
end


function AbFileSystem:close(closeable)
        local try_ok, try_error = pcall(function()
            if closeable ~= nil then
                local inputStream = (closeable)
                inputStream:close()
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CLOSE, e)
            return false
        end
end

AbFileSystem.instance = AbFileSystem.new()

return AbFileSystem

