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

-- local File = require("java.io.File")
-- local FileInputStream = require("java.io.FileInputStream")
-- local FileNotFoundException = require("java.io.FileNotFoundException")
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

local AbFileInputStream = {}
AbFileInputStream.__index = AbFileInputStream
AbFileInputStream.className = "AbFileInputStream"
setmetatable(AbFileInputStream, {__index = FileInputStream})


function AbFileInputStream.new(name)
    local self = setmetatable(FileInputStream.new(name), AbFileInputStream)
        -- super(...) made self above
    return self
end


-- throws FileNotFoundException
function AbFileInputStream.createFromAbFile(file)
        return AbFileInputStream.new(AbFileNativeUtil.get(file):getPath())
end


-- throws FileNotFoundException
function AbFileInputStream.createFromFile(file)
        return AbFileInputStream.new(file:getPath())
end

return AbFileInputStream

