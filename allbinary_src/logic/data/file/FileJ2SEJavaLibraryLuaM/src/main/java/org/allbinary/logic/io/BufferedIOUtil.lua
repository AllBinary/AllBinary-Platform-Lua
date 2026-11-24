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

local BufferedIOUtil = {}
package.loaded["org.allbinary.logic.io.BufferedIOUtil"] = BufferedIOUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local BufferedReader = require("java.io.BufferedReader")
-- local BufferedWriter = require("java.io.BufferedWriter")
-- local FileReader = require("java.io.FileReader")
-- local FileWriter = require("java.io.FileWriter")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = java_lazy("org.allbinary.logic.io.file.AbFileNativeUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BufferedIOUtil is declared before the requires
BufferedIOUtil.__index = BufferedIOUtil
BufferedIOUtil.className = "BufferedIOUtil"
BufferedIOUtil.javaClassName = "org.allbinary.logic.io.BufferedIOUtil"

function BufferedIOUtil._jinit(self)
    return self
end

function BufferedIOUtil.new()
    return BufferedIOUtil._jinit(setmetatable({}, BufferedIOUtil))
end


-- throws Exception
function BufferedIOUtil.copy(backupFile, backupFileBak)
        local line = StringUtil.getInstance().EMPTY_STRING
        local tmpOut = BufferedWriter.new(FileWriter.new(AbFileNativeUtil.get(backupFileBak)))
        local tmpIn = BufferedReader.new(FileReader.new(AbFileNativeUtil.get(backupFile)))
        while tmpIn:ready() do
            line = tmpIn:readLine()
            tmpOut:write(line, 0, #line)
            tmpOut:newLine()
        end
        tmpOut:flush()
end

return BufferedIOUtil

