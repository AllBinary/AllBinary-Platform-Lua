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
-- package org.allbinary.logic.io.file

local SimpleFileUtil = {}
package.loaded["org.allbinary.logic.io.file.SimpleFileUtil"] = SimpleFileUtil

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
-- local Reader = require("java.io.Reader")
-- local Writer = require("java.io.Writer")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local NullOutputStream = java_lazy("org.allbinary.logic.io.NullOutputStream")
local NullReader = java_lazy("org.allbinary.logic.io.NullReader")
local NullWriter = java_lazy("org.allbinary.logic.io.NullWriter")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table SimpleFileUtil is declared before the requires
SimpleFileUtil.__index = SimpleFileUtil
SimpleFileUtil.className = "SimpleFileUtil"
SimpleFileUtil.javaClassName = "org.allbinary.logic.io.file.SimpleFileUtil"

function SimpleFileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NULL_WRITER = SimpleFileUtil.nullWriter()
    self.NULL_READER = SimpleFileUtil.nullReader()
    self.commonStrings = CommonStrings.getInstance()
    self.nullUtil = NullUtil.getInstance()
    self.streamUtil = StreamUtil.getInstance()
end

function SimpleFileUtil._jinit(self)
    SimpleFileUtil._init_fields(self)
    return self
end

function SimpleFileUtil.new()
    return SimpleFileUtil._jinit(setmetatable({}, SimpleFileUtil))
end


function SimpleFileUtil.getInstance()
        return SimpleFileUtil.instance_f
end


function SimpleFileUtil.nullOutputStream()
        return NullOutputStream.NULL_OUTPUT_STREAM
end


function SimpleFileUtil.nullWriter()
        return NullWriter.NULL_WRITER
end


function SimpleFileUtil.nullReader()
        return NullReader.NULL_READER
end


function SimpleFileUtil:loadFileAsList(inputStream, max, byteArray1)
        return self:loadFileAsListReturnLine(inputStream, max, byteArray1, 0)
end


function SimpleFileUtil:loadFileAsListReturnLine(inputStream, max, byteArray1, includeReturnLine)
        local stringList = BasicArrayListD.new()
        if inputStream == nil then
            return stringList
        end
        local byteArray = self.nullUtil.NULL_BYTE_ARRAY
        local try_ok, try_error, try_value = pcall(function()
            local outputStream2 = require("java.io.ByteArrayOutputStream").new(max)
            byteArray = self.streamUtil:getByteArray(inputStream, outputStream2, byteArray1)
            self.streamUtil:close(inputStream)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.streamUtil:close(inputStream)
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
        end
        if byteArray == nil then
            return stringList
        end
        local size = (byteArray.n or #byteArray)
        local index = 0
        local startIndex = 0
        local returnLine = 0
        while index < size do
            startIndex = index
            while index < size - 1 and byteArray[index + 1] ~= string.byte("\n") do
                index = index + 1
            end
            if includeReturnLine == 0 then
                if index > 0 and byteArray[index - 1 + 1] == string.byte("\r") then
                    returnLine = 1
                else
                    returnLine = 0
                end
            end
            local s = string.char(table.unpack(byteArray, startIndex, (index + includeReturnLine - returnLine - startIndex)))
            stringList:add(s)
            index = index + 1
        end
        return stringList
end


function SimpleFileUtil:createStringFromArrayOfStrings(stringArray)
        local stringMaker = StringMaker.new()
        local size = (stringArray.n or #stringArray)
        for index = 0, size - 1 do
            stringMaker:append(stringArray[index + 1])
        end
        return tostring(stringMaker)
end

SimpleFileUtil.instance_f = SimpleFileUtil.new()

return SimpleFileUtil

