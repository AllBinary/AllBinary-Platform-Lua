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

local Context = require("android.content.Context")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local NullUtil = require("org.allbinary.logic.NullUtil")

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

function FileStreamFactory:_init_fields()
    self.context = nil
end


function FileStreamFactory.getInstance()
        if FileStreamFactory.SINGLETON == NullUtil.getInstance().NULL_OBJECT then
            FileStreamFactory.SINGLETON = FileStreamFactory.new(ResourceUtil.getInstance():getContext())
        end
        return FileStreamFactory.SINGLETON
end


function FileStreamFactory.new(context)
    local self = setmetatable({}, FileStreamFactory)
    self:_init_fields()
        self.context = context
    return self
end


-- throws Exception
function FileStreamFactory:getFileInputStreamInstance(path, fileName)
        return AbFileInputStream.new(self:getContext():openFileInput(fileName))
end


-- throws Exception
function FileStreamFactory:getFileOutputStreamInstance(path, fileName)
        local context = self:getContext()
        context:deleteFile(fileName)
        return AbFileOutputStream.new(context:openFileOutput(fileName, 0))
end


-- throws Exception
function FileStreamFactory:delete(path, fileName)
        self:getContext():deleteFile(fileName)
end


function FileStreamFactory:getContext()
        return self.context
end

FileStreamFactory.SINGLETON = NullUtil.getInstance().NULL_OBJECT

return FileStreamFactory

