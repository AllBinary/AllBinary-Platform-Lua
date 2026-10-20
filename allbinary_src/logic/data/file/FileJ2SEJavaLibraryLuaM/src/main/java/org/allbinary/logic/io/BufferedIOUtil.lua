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
-- local BufferedWriter = require("java.io.BufferedWriter")
-- local FileReader = require("java.io.FileReader")
-- local FileWriter = require("java.io.FileWriter")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = require("org.allbinary.logic.io.file.AbFileNativeUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BufferedIOUtil = {}
BufferedIOUtil.__index = BufferedIOUtil
BufferedIOUtil.className = "BufferedIOUtil"

function BufferedIOUtil.new()
    local self = setmetatable({}, BufferedIOUtil)
    return self
end


-- throws Exception
function BufferedIOUtil.copy(backupFile, backupFileBak)
        local line = StringUtil.getInstance().EMPTY_STRING
        local tmpOut = BufferedWriter.new(FileWriter.new(AbFileNativeUtil.get(backupFileBak)))
        local tmpIn = BufferedReader.new(FileReader.new(AbFileNativeUtil.get(backupFile)))
        while true do
            line = tmpIn:readLine()
            if line == nil then
                break
            end
            tmpOut:write(line, 0, #line)
            tmpOut:newLine()
        end
        tmpOut:flush()
end

return BufferedIOUtil

