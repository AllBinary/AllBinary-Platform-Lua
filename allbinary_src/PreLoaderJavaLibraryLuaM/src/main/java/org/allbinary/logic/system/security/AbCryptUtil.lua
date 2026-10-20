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
-- package org.allbinary.logic.system.security

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbCrypt = require("org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt")
local KeySpecFactory = require("org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory")

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

local AbCryptUtil = {}
AbCryptUtil.__index = AbCryptUtil
AbCryptUtil.className = "AbCryptUtil"

function AbCryptUtil:_init_fields()
    self.streamUtil = StreamUtil.getInstance()
end


function AbCryptUtil.getInstance()
        return AbCryptUtil.instance
end


function AbCryptUtil.new()
    local self = setmetatable({}, AbCryptUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function AbCryptUtil:decrypt(inputStream, key)
        local outputStream = nil
        local try_ok, try_error = pcall(function()
            outputStream = self.streamUtil:get(inputStream, java_byte_array_output_stream(), java_new_array(0, 16384))
            local abCrypt = AbCrypt.new(KeySpecFactory.getInstance().DESEDE)
            abCrypt:init(key)
            return abCrypt:decrypt(outputStream:toByteArray())
        end)
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
        if not try_ok then error(try_error, 0) end
end

AbCryptUtil.instance = AbCryptUtil.new()

return AbCryptUtil

