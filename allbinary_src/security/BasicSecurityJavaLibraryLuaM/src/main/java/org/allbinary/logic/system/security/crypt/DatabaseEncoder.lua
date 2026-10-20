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

local NullUtil = require("org.allbinary.logic.NullUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Tokenizer = require("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local DatabaseEncoder = {}
DatabaseEncoder.__index = DatabaseEncoder
DatabaseEncoder.className = "DatabaseEncoder"


function DatabaseEncoder.new()
    local self = setmetatable({}, DatabaseEncoder)
    return self
end


function DatabaseEncoder.encode(value)
        local try_ok, try_error = pcall(function()
            local array = value
            local stringBuffer = StringMaker.new()
            for index = 0, (array.n or #array) - 1 do
                stringBuffer:append(tostring(array[index + 1]))
                if index < (array.n or #array) - 1 then
                    stringBuffer:append(CommonSeps.getInstance().SPACE)
                end
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, "DatabaseEncoder", "decode", e)
            return StringUtil.getInstance().EMPTY_STRING
        end
end


function DatabaseEncoder.decode(value)
        local try_ok, try_error = pcall(function()
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().SPACE)
            local vector = tokenizer:getTokensFromString(value, BasicArrayListD.new())
            local byteVector = BasicArrayListD.new()
            local size = vector:size()
            local byteOfData = nil
            for index = 0, size - 1 do
                byteOfData = vector.objectArray[index + 1]
                byteVector:add(byteOfData)
            end
            local decode = java_new_array(0, byteVector:size())
            local decodeIndex = 0
            local aByte = nil
            for index = 0, size - 1 do
                aByte = byteVector.objectArray[index + 1]
                decode[decodeIndex + 1] = math.tointeger(aByte // 1)
                decodeIndex = decodeIndex + 1
            end
            return decode
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putSE(commonStrings.EXCEPTION, "DatabaseEncoder", "decode", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
end

return DatabaseEncoder

