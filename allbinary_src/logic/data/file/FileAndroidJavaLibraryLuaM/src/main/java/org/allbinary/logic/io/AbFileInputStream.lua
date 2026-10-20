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

-- local FileInputStream = require("java.io.FileInputStream")
-- local FileNotFoundException = require("java.io.FileNotFoundException")
-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local FileChannel = require("java.nio.channels.FileChannel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbFileInputStream = {}
AbFileInputStream.__index = AbFileInputStream
AbFileInputStream.className = "AbFileInputStream"
setmetatable(AbFileInputStream, {__index = InputStream})

function AbFileInputStream:_init_fields()
    self.fileInputStream = nil
end


function AbFileInputStream.new(fileInputStream)
    local self = setmetatable(InputStream.new(), AbFileInputStream)
    self:_init_fields()
        self.fileInputStream = fileInputStream
    return self
end


function AbFileInputStream:mark(readlimit)
        self.fileInputStream:mark(readlimit)
end


function AbFileInputStream:markSupported()
        return self.fileInputStream:markSupported()
end


-- throws IOException
function AbFileInputStream:reset()
        self.fileInputStream:reset()
end


-- throws IOException
function AbFileInputStream:available()
        return self.fileInputStream:available()
end


-- throws IOException
function AbFileInputStream:close()
        self.fileInputStream:close()
end


function AbFileInputStream:getChannel()
        return self.fileInputStream:getChannel()
end


-- throws IOException
function AbFileInputStream:read()
        return self.fileInputStream:read()
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function AbFileInputStream:read(b)
        return self.fileInputStream:read(b)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function AbFileInputStream:read(buffer, offset, count)
        return self.fileInputStream:read(buffer, offset, count)
end


-- throws IOException
function AbFileInputStream:skip(n)
        return self.fileInputStream:skip(n)
end

return AbFileInputStream

