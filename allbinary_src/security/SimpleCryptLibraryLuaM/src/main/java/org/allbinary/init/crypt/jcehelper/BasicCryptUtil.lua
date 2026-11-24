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

local BasicCryptUtil = {}
package.loaded["org.allbinary.init.crypt.jcehelper.BasicCryptUtil"] = BasicCryptUtil

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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptInterface = java_lazy("org.allbinary.init.crypt.jcehelper.CryptInterface")

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

-- class table BasicCryptUtil is declared before the requires
BasicCryptUtil.__index = BasicCryptUtil
BasicCryptUtil.className = "BasicCryptUtil"
BasicCryptUtil.javaClassName = "org.allbinary.init.crypt.jcehelper.BasicCryptUtil"

function BasicCryptUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.XML_START = "<?xml"
end

function BasicCryptUtil._jinit(self)
    BasicCryptUtil._init_fields(self)
    return self
end

function BasicCryptUtil.new()
    return BasicCryptUtil._jinit(setmetatable({}, BasicCryptUtil))
end


function BasicCryptUtil.getInstance()
        return BasicCryptUtil.instance_f
end


-- throws Exception
function BasicCryptUtil:getDecryptedInputStream(inputStream, cryptInterface)
        local buffer = require("java.io.ByteArrayOutputStream").new()
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

BasicCryptUtil.instance_f = BasicCryptUtil.new()

return BasicCryptUtil

