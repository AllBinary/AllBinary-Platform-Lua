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
-- local OutputStream = require("java.io.OutputStream")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullOutputStream = {}
NullOutputStream.__index = NullOutputStream
NullOutputStream.className = "NullOutputStream"
setmetatable(NullOutputStream, {__index = OutputStream})

function NullOutputStream.new()
    local self = setmetatable(OutputStream.new(), NullOutputStream)
    return self
end


-- throws IOException
function NullOutputStream:write(b)
end


-- throws IOException
-- Java overloaded method: Lua keeps the last definition
function NullOutputStream:write(b, off, len)
end


function NullOutputStream:close()
end

NullOutputStream.NULL_OUTPUT_STREAM = NullOutputStream.new()

return NullOutputStream

