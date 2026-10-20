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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileFactory = {}
FileFactory.__index = FileFactory
FileFactory.className = "FileFactory"

function FileFactory.new()
    local self = setmetatable({}, FileFactory)
    return self
end


function FileFactory.getInstance()
        return FileFactory.instance
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileFactory:getInstance(filePath)
        return AbFile.createAbFileFromRawPath(filePath)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileFactory:getInstance(file, childFilePath)
        return AbFile.createAbFileWithChild(file, childFilePath)
end


-- throws Exception
function FileFactory:isFile(path)
        local file = AbFile.createAbFile(path)
        if file:exists() then
            return true
        else
            return false
        end
end

FileFactory.instance = FileFactory.new()

return FileFactory

