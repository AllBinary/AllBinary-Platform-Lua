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
-- package org.allbinary.logic.string.tokens

local TsUtil = require("org.allbinary.TsUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Tokenizer = {}
Tokenizer.__index = Tokenizer
Tokenizer.className = "Tokenizer"

function Tokenizer:_init_fields()
    self.sep = nil
    self.endSep = StringUtil.getInstance().EMPTY_STRING
end


function Tokenizer.new(sep)
    local self = setmetatable({}, Tokenizer)
    self:_init_fields()
        if sep == nil or TsUtil.getInstance():compareTo(sep, StringUtil.getInstance().EMPTY_STRING) == 0 then
            error(java_exception("Exception", "Sep provided is not valid"), 0)
        end
        self.sep = sep
    return self
end


function Tokenizer:setSep(sep)
        self.sep = sep
end


function Tokenizer:setEndSep(endSep)
        self.endSep = endSep
end


function Tokenizer:getInsideSep(string)
        local tokenList = BasicArrayListD.new()
        local index = 0
        local size = #string
        while index < size do
            index = ((string.find(string, self.sep, (index) + 1, true) or 0) - 1)
            if index ~= -1 then
                local end_ = ((string.find(string, self.endSep, (index + #self.sep) + 1, true) or 0) - 1)
                if end_ ~= -1 then
                    tokenList:add(string.sub(string, (index + #self.sep) + 1, end_ - (#self.endSep - 1)))
                    index = end_ + #self.endSep
                else
                end
            else
                break
            end
        end
        return tokenList
end


function Tokenizer:getTokensFromString(string, tokenVector)
        local index = 0
        local end_ = 0
        while index < #string do
            end_ = ((string.find(string, self.sep, (index) + 1, true) or 0) - 1)
            if end_ ~= -1 then
                tokenVector:add(string.sub(string, (index) + 1, end_))
                index = end_ + #self.sep
            else
                tokenVector:add(string.sub(string, (index) + 1, #string))
                break
            end
        end
        return tokenVector
end


function Tokenizer:getTokens(stringVector)
        local tokenHashtable = StdUtil.getInstance():createHashtable()
        local string = StringUtil.getInstance().EMPTY_STRING
        local end_ = 0
        local size = stringVector:size()
        for index = 0, size - 1 do
            string = stringVector.objectArray[index + 1]
            end_ = ((string.find(string, self.sep, 1, true) or 0) - 1)
            if end_ >= 0 then
                tokenHashtable:put(string.sub(string, (0) + 1, end_), string.sub(string, (end_ + 1) + 1, #string))
            end
        end
        return tokenHashtable
end

return Tokenizer

