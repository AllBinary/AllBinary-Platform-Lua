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

local AbCryptUtil = {}
package.loaded["org.allbinary.logic.system.security.AbCryptUtil"] = AbCryptUtil

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
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbCrypt = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt")
local KeySpecFactory = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table AbCryptUtil is declared before the requires
AbCryptUtil.__index = AbCryptUtil
AbCryptUtil.className = "AbCryptUtil"
AbCryptUtil.javaClassName = "org.allbinary.logic.system.security.AbCryptUtil"

function AbCryptUtil:_init_fields()
    self.streamUtil = StreamUtil.getInstance()
end


function AbCryptUtil.getInstance()
        return AbCryptUtil.instance_f
end


function AbCryptUtil._jinit(self)
    AbCryptUtil._init_fields(self)
    return self
end

function AbCryptUtil.new(...)
    local self = setmetatable({}, AbCryptUtil)
    AbCryptUtil._jinit(self, ...)
    return self
end


-- throws Exception
function AbCryptUtil:decrypt(inputStream, key)
        local outputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            outputStream = self.streamUtil:get(inputStream, require("java.io.ByteArrayOutputStream").new(), java_typed_array("B", java_new_array(0, 16384)))
            local abCrypt = AbCrypt.new(KeySpecFactory.getInstance().DESEDE)
            abCrypt:init(key)
            do return "__jreturn", abCrypt:decrypt(outputStream:toByteArray()) end
        end)
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
        if not try_ok then error(try_error, 0) end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AbCryptUtil.instance_f = AbCryptUtil.new()

return AbCryptUtil

