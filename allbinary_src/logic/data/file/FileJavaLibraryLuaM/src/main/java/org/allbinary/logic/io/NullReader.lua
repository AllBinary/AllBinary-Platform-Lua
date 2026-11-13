-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

-- local IOException = require("java.io.IOException")
-- local Reader = require("java.io.Reader")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullReader = {}
NullReader.__index = NullReader
NullReader.className = "NullReader"
setmetatable(NullReader, {__index = Reader})

function NullReader.new()
    local self = setmetatable(Reader.new(), NullReader)
    return self
end


-- throws IOException
function NullReader:read()
        return -1
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function NullReader:read(cbuf, off, len)
        return -1
end


-- throws IOException
function NullReader:ready()
        return false
end


-- throws IOException
function NullReader:skip(n)
        return 0
end


function NullReader:close()
end

NullReader.NULL_READER = NullReader.new()

return NullReader

