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

local AbFile = require("org.allbinary.logic.io.file.AbFile")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DataOutputStreamFactory = {}
DataOutputStreamFactory.__index = DataOutputStreamFactory
DataOutputStreamFactory.className = "DataOutputStreamFactory"

function DataOutputStreamFactory.new()
    local self = setmetatable({}, DataOutputStreamFactory)
    return self
end


function DataOutputStreamFactory.getInstance()
        return DataOutputStreamFactory.instance
end


-- throws Exception
function DataOutputStreamFactory:getInstanceForAbFile(file)
        local idFileOutputStream = AbFileOutputStream.createFromAbFile(file)
        local idOutData = AbDataOutputStream.new(idFileOutputStream)
        return idOutData
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function DataOutputStreamFactory:getInstance(filePath, fileName)
        local fileStreamFactory = FileStreamFactory.getInstance()
        local fileOutputStream = fileStreamFactory:getFileOutputStreamInstance(filePath, fileName)
        local idOutData = AbDataOutputStream.new(fileOutputStream)
        return idOutData
end

DataOutputStreamFactory.instance = DataOutputStreamFactory.new()

return DataOutputStreamFactory

