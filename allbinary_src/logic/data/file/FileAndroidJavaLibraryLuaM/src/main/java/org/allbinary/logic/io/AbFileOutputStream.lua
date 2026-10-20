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
-- local IOException = require("java.io.IOException")
-- local OutputStream = require("java.io.OutputStream")
-- local FileChannel = require("java.nio.channels.FileChannel")
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
setmetatable(AbFileOutputStream, {__index = OutputStream})

function AbFileOutputStream:_init_fields()
    self.fileOutputStream = nil
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromAbFile(file)
        return AbFileOutputStream.new(FileOutputStream.new(AbFileNativeUtil.get(file)))
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromAbFileAppend(file, append)
        return AbFileOutputStream.new(FileOutputStream.new(file:getPath()))
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromFilePath(name)
        return AbFileOutputStream.new(FileOutputStream.new(name))
end


-- throws FileNotFoundException
function AbFileOutputStream.createFromFilePathAppend(name, append)
        return AbFileOutputStream.new(FileOutputStream.new(name))
end


function AbFileOutputStream.new(fileOutputStream)
    local self = setmetatable(OutputStream.new(), AbFileOutputStream)
    self:_init_fields()
        self.fileOutputStream = fileOutputStream
    return self
end


-- throws IOException
function AbFileOutputStream:close()
        self.fileOutputStream:close()
end


function AbFileOutputStream:getChannel()
        return self.fileOutputStream:getChannel()
end


-- throws IOException
function AbFileOutputStream:write(buffer)
        self.fileOutputStream:write(buffer)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function AbFileOutputStream:write(buffer, offset, count)
        self.fileOutputStream:write(buffer, offset, count)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function AbFileOutputStream:write(b)
        self.fileOutputStream:write(b)
end

return AbFileOutputStream

