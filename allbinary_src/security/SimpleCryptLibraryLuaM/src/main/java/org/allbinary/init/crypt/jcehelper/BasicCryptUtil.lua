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
-- package org.allbinary.init.crypt.jcehelper

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
local TsUtil = require("org.allbinary.TsUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

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

local BasicCryptUtil = {}
BasicCryptUtil.__index = BasicCryptUtil
BasicCryptUtil.className = "BasicCryptUtil"

function BasicCryptUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.XML_START = "<?xml"
end

function BasicCryptUtil.new()
    local self = setmetatable({}, BasicCryptUtil)
    self:_init_fields()
    return self
end


function BasicCryptUtil.getInstance()
        return BasicCryptUtil.instance
end


-- throws Exception
function BasicCryptUtil:getDecryptedInputStream(inputStream, cryptInterface)
        local buffer = java_byte_array_output_stream()
        local ch = 0
        while true do
            ch = inputStream:read()
            if ch == -1 then
                break
            end
            buffer:write(ch)
        end
        local decrypted = cryptInterface:decrypt(buffer:toByteArray())
        local decryptedString = string.char(table.unpack(decrypted))
        local index = ((string.find(decryptedString, self.XML_START, 1, true) or 0) - 1)
        if index > 0 then
            decryptedString = string.sub(decryptedString, (index) + 1)
        end
        return ByteArrayInputStream.new(self.tsUtil:getByteArray(decryptedString))
end

BasicCryptUtil.instance = BasicCryptUtil.new()

return BasicCryptUtil

