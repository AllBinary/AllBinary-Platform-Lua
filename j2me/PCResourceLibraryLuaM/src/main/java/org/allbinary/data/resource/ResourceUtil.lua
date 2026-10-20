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
-- package org.allbinary.data.resource

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local FileInputStream = require("java.io.FileInputStream")
-- local InputStream = require("java.io.InputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

--J2SE - PC
local ResourceUtil = {}
ResourceUtil.__index = ResourceUtil
ResourceUtil.className = "ResourceUtil"

function ResourceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.path = StringUtil.getInstance().EMPTY_STRING
    self.ext = StringUtil.getInstance().EMPTY_STRING
end


function ResourceUtil.getInstance()
        return ResourceUtil.instance
end


function ResourceUtil.new()
    local self = setmetatable({}, ResourceUtil)
    self:_init_fields()
    return self
end


function ResourceUtil:setLoadingPaths(path, ext)
        self.path = path
        self.ext = ext
end


function ResourceUtil:setClassLoader(classLoader)
end


-- throws Exception
function ResourceUtil:getResourceAsStream(resource)
        local inputStream = self:getResourceAsStreamAtStart(resource, 2)
        if inputStream == nil then
            inputStream = self:getResourceAsStreamAtStart(resource, 1)
            if inputStream == nil then
                error(java_exception("Exception", tostring(StringMaker.new():append("Unable to obtain: "):append(resource))), 0)
            end
        end
        return inputStream
end


-- throws Exception
function ResourceUtil:getResourceAsStreamAtStart(resource, startIndex)
        local inputStream = FileInputStream.new(tostring(StringMaker.new():append(self.path):append(resource):append(self.ext)))
        if inputStream ~= nil then
            local byteArray = java_new_array(0, inputStream:available())
            StreamUtil.getInstance():getByteArray(inputStream, java_byte_array_output_stream(), byteArray)
            return ByteArrayInputStream.new(byteArray)
        end
        return inputStream
end


function ResourceUtil:addResource(resource, value)
end

ResourceUtil.instance = ResourceUtil.new()

return ResourceUtil

