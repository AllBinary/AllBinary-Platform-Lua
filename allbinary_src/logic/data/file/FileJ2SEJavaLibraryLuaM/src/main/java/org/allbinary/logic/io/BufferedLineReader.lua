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

local BufferedLineReader = {}
package.loaded["org.allbinary.logic.io.BufferedLineReader"] = BufferedLineReader

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

local BufferedReader = java_lazy("java.io.BufferedReader")
-- local FileReader = require("java.io.FileReader")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = java_lazy("org.allbinary.logic.io.file.AbFileNativeUtil")

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

-- class table BufferedLineReader is declared before the requires
BufferedLineReader.__index = BufferedLineReader
BufferedLineReader.className = "BufferedLineReader"
BufferedLineReader.javaClassName = "org.allbinary.logic.io.BufferedLineReader"

function BufferedLineReader:_init_fields()
    if self.tmpIn == nil then self.tmpIn = nil end
end


function BufferedLineReader._jinit(self, file)
    BufferedLineReader._init_fields(self)
        self.tmpIn = BufferedReader.new(FileReader.new(AbFileNativeUtil.get(file)))
    return self
end

function BufferedLineReader.new(...)
    local self = setmetatable({}, BufferedLineReader)
    BufferedLineReader._jinit(self, ...)
    return self
end


function BufferedLineReader:readUpToLines(readAheadIndex)
end


-- throws Exception
function BufferedLineReader:readLine()
        return self.tmpIn:readLine()
end


-- throws Exception
function BufferedLineReader:ready()
        return self.tmpIn:ready()
end


function BufferedLineReader:getSize()
        return 0
end


function BufferedLineReader:getCurrent()
        return 0
end

return BufferedLineReader

