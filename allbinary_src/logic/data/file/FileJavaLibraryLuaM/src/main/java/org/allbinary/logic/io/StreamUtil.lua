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

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local Closeable = require("java.io.Closeable")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StreamUtil = {}
StreamUtil.__index = StreamUtil
StreamUtil.className = "StreamUtil"

function StreamUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StreamUtil.getInstance()
        return StreamUtil.instance
end


function StreamUtil.new()
    local self = setmetatable({}, StreamUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function StreamUtil:get(inputStream, outputStream, buffer)
        local len = 0
        while true do
            len = inputStream:read(buffer, 0, (buffer.n or #buffer))
            if len ~= -1 then
            else
                break
            end
            outputStream:write(buffer, 0, len)
        end
        return outputStream
end


-- throws Exception
function StreamUtil:getByteArray(inputStream, outputStream2, byteArray)
        local outputStream = outputStream2
        local try_ok, try_error = pcall(function()
            self:get(inputStream, outputStream, byteArray)
            return outputStream:toByteArray()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            self:close(outputStream)
        end
end


function StreamUtil:close(closeable)
        local try_ok, try_error = pcall(function()
            if closeable ~= nil then
                closeable:close()
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CLOSE, e)
            return false
        end
end

StreamUtil.instance = StreamUtil.new()

return StreamUtil

