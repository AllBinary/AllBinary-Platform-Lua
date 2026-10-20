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

-- local BufferedReader = require("java.io.BufferedReader")
-- local FileReader = require("java.io.FileReader")
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

local BufferedLineReader = {}
BufferedLineReader.__index = BufferedLineReader
BufferedLineReader.className = "BufferedLineReader"

function BufferedLineReader:_init_fields()
    self.tmpIn = nil
end


function BufferedLineReader.new(file)
    local self = setmetatable({}, BufferedLineReader)
    self:_init_fields()
        self.tmpIn = BufferedReader.new(FileReader.new(AbFileNativeUtil.get(file)))
    return self
end


function BufferedLineReader:readUpToLines(readAheadIndex)
end


-- throws Exception
function BufferedLineReader:readLine()
        return self.tmpIn:readLine()
end


function BufferedLineReader:getSize()
        return 0
end


function BufferedLineReader:getCurrent()
        return 0
end

return BufferedLineReader

