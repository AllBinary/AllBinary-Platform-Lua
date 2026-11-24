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
-- package org.allbinary.logic.system.security.crypt

local DatabaseEncoder = {}
package.loaded["org.allbinary.logic.system.security.crypt.DatabaseEncoder"] = DatabaseEncoder

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Tokenizer = java_lazy("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table DatabaseEncoder is declared before the requires
DatabaseEncoder.__index = DatabaseEncoder
DatabaseEncoder.className = "DatabaseEncoder"
DatabaseEncoder.javaClassName = "org.allbinary.logic.system.security.crypt.DatabaseEncoder"


function DatabaseEncoder._jinit(self)
    return self
end

function DatabaseEncoder.new(...)
    local self = setmetatable({}, DatabaseEncoder)
    DatabaseEncoder._jinit(self, ...)
    return self
end


function DatabaseEncoder.encode(value)
        local try_ok, try_error, try_value = pcall(function()
            local array = value
            local stringBuffer = StringMaker.new()
            for index = 0, (array.n or #array) - 1 do
                stringBuffer:append(tostring(array[index + 1]))
                if index < (array.n or #array) - 1 then
                    stringBuffer:append(CommonSeps.getInstance().SPACE)
                end
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, "DatabaseEncoder", "decode", e)
            return StringUtil.getInstance().EMPTY_STRING
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function DatabaseEncoder.decode(value)
        local try_ok, try_error, try_value = pcall(function()
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().SPACE)
            local vector = tokenizer:getTokensFromString(value, BasicArrayListD.new())
            local size = vector:size()
            local decode = java_typed_array("B", java_new_array(0, size))
            local byteOfData = nil
            for index = 0, size - 1 do
                byteOfData = vector.objectArray[index + 1]
                decode[index + 1] = require("java.lang.Byte").parseByte(byteOfData)
            end
            do return "__jreturn", decode end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putSE(commonStrings.EXCEPTION, "DatabaseEncoder", "decode", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return DatabaseEncoder

