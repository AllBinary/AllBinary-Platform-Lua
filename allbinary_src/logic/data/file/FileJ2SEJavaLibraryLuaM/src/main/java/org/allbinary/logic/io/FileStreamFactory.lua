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
-- package org.allbinary.logic.io

local NullUtil = require("org.allbinary.logic.NullUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileStreamFactory = {}
FileStreamFactory.__index = FileStreamFactory
FileStreamFactory.className = "FileStreamFactory"


function FileStreamFactory.getInstance()
        if FileStreamFactory.SINGLETON == NullUtil.getInstance().NULL_OBJECT then
            FileStreamFactory.SINGLETON = FileStreamFactory.new()
        end
        return FileStreamFactory.SINGLETON
end


function FileStreamFactory.new()
    local self = setmetatable({}, FileStreamFactory)
    return self
end


-- throws Exception
function FileStreamFactory:getFileInputStreamInstance(path, fileName)
        local FILEABPATH = AbPath.new(path, fileName)
        local file = AbFile.createAbFileFromAbPath(FILEABPATH)
        return AbFileInputStream.new(file)
end


-- throws Exception
function FileStreamFactory:getFileOutputStreamInstance(path, fileName)
        local FILEABPATH = AbPath.new(path, fileName)
        local file = AbFile.createAbFileFromAbPath(FILEABPATH)
        if file:exists() then
            file:delete()
            file:createNewFile()
        end
        return AbFileOutputStream.createFromAbFile(file)
end


-- throws Exception
function FileStreamFactory:delete(path, fileName)
        local FILEABPATH = AbPath.new(path, fileName)
        local file = AbFile.createAbFileFromAbPath(FILEABPATH)
        file:delete()
end

FileStreamFactory.SINGLETON = NullUtil.getInstance().NULL_OBJECT

return FileStreamFactory

