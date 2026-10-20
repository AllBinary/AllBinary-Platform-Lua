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

-- local FileNotFoundException = require("java.io.FileNotFoundException")
-- local FileOutputStream = require("java.io.FileOutputStream")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = require("org.allbinary.logic.io.file.AbFileNativeUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbFileOutputStream = {}
AbFileOutputStream.__index = AbFileOutputStream
AbFileOutputStream.className = "AbFileOutputStream"
setmetatable(AbFileOutputStream, {__index = FileOutputStream})


-- throws FileNotFoundException
function AbFileOutputStream.createFromAbFile(file)
        return AbFileOutputStream.new(file:getPath(), false)
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromAbFileAppend(file, append)
        return AbFileOutputStream.new(file:getPath(), append)
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromFilePath(name)
        return AbFileOutputStream.new(name, false)
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromFilePathAppend(name, append)
        return AbFileOutputStream.new(name, append)
end


function AbFileOutputStream.new(name, append)
    local self = setmetatable(FileOutputStream.new(name, append), AbFileOutputStream)
        -- super(...) made self above
    return self
end

return AbFileOutputStream

