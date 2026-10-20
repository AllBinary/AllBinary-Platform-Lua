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

-- local DataInputStream = require("java.io.DataInputStream")
-- local InputStream = require("java.io.InputStream")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbDataInputStream = {}
AbDataInputStream.__index = AbDataInputStream
AbDataInputStream.className = "AbDataInputStream"
setmetatable(AbDataInputStream, {__index = DataInputStream})


function AbDataInputStream.new(out)
    local self = setmetatable(DataInputStream.new(out), AbDataInputStream)
        -- super(...) made self above
    return self
end

return AbDataInputStream

