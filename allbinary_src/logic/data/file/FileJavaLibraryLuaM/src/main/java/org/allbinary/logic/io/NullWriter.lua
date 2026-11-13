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
-- local Writer = require("java.io.Writer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullWriter = {}
NullWriter.__index = NullWriter
NullWriter.className = "NullWriter"
setmetatable(NullWriter, {__index = Writer})

function NullWriter.new()
    local self = setmetatable(Writer.new(), NullWriter)
    return self
end


-- throws IOException
function NullWriter:write(c)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function NullWriter:write(cbuf, off, len)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function NullWriter:write(str)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function NullWriter:write(str, off, len)
end


-- throws IOException
function NullWriter:flush()
end


-- throws IOException
function NullWriter:close()
end

NullWriter.NULL_WRITER = NullWriter.new()

return NullWriter

