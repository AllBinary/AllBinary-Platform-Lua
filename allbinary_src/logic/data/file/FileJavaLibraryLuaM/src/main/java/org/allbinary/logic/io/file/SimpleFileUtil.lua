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

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
-- local Reader = require("java.io.Reader")
-- local Writer = require("java.io.Writer")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local NullOutputStream = require("org.allbinary.logic.io.NullOutputStream")
local NullReader = require("org.allbinary.logic.io.NullReader")
local NullWriter = require("org.allbinary.logic.io.NullWriter")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimpleFileUtil = {}
SimpleFileUtil.__index = SimpleFileUtil
SimpleFileUtil.className = "SimpleFileUtil"

function SimpleFileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NULL_WRITER = SimpleFileUtil.nullWriter()
    self.NULL_READER = SimpleFileUtil.nullReader()
    self.commonStrings = CommonStrings.getInstance()
    self.nullUtil = NullUtil.getInstance()
    self.streamUtil = StreamUtil.getInstance()
end

function SimpleFileUtil.new()
    local self = setmetatable({}, SimpleFileUtil)
    self:_init_fields()
    return self
end


function SimpleFileUtil.getInstance()
        return SimpleFileUtil.instance
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
        local try_ok, try_error = pcall(function()
            local outputStream2 = java_byte_array_output_stream()
            byteArray = self.streamUtil:getByteArray(inputStream, outputStream2, byteArray1)
            self.streamUtil:close(inputStream)
        end)
        if not try_ok then
            local e = try_error
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

SimpleFileUtil.instance = SimpleFileUtil.new()

return SimpleFileUtil

