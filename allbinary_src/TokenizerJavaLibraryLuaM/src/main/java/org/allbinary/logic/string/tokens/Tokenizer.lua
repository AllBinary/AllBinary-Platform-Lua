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

local Tokenizer = {}
package.loaded["org.allbinary.logic.string.tokens.Tokenizer"] = Tokenizer

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table Tokenizer is declared before the requires
Tokenizer.__index = Tokenizer
Tokenizer.className = "Tokenizer"
Tokenizer.javaClassName = "org.allbinary.logic.string.tokens.Tokenizer"

function Tokenizer:_init_fields()
    if self.sep == nil then self.sep = nil end
    self.endSep = StringUtil.getInstance().EMPTY_STRING
end


function Tokenizer._jinit(self, sep)
    Tokenizer._init_fields(self)
        if rawequal(TsUtil.getInstance():compareTo(sep, StringUtil.getInstance().EMPTY_STRING), 0) then
            error(require("java.lang.Exception").new("Sep provided is not valid"), 0)
        end
        self.sep = sep
    return self
end

function Tokenizer.new(...)
    local self = setmetatable({}, Tokenizer)
    Tokenizer._jinit(self, ...)
    return self
end


function Tokenizer:setSep(sep)
        self.sep = sep
end


function Tokenizer:setEndSep(endSep)
        self.endSep = endSep
end


function Tokenizer:getInsideSep(string_)
        local tokenList = BasicArrayListD.new()
        local index = 0
        local size = #string_
        while index < size do
            index = ((string.find(string_, self.sep, (index) + 1, true) or 0) - 1)
            if not rawequal(index, -1) then
                local end_ = ((string.find(string_, self.endSep, (index + #self.sep) + 1, true) or 0) - 1)
                if not rawequal(end_, -1) then
                    tokenList:add(string.sub(string_, (index + #self.sep) + 1, end_ - (#self.endSep - 1)))
                    index = end_ + #self.endSep
                else
                end
            else
                break
            end
        end
        return tokenList
end


function Tokenizer:getTokensFromString(string_, tokenVector)
        local index = 0
        local end_ = 0
        while index < #string_ do
            end_ = ((string.find(string_, self.sep, (index) + 1, true) or 0) - 1)
            if not rawequal(end_, -1) then
                tokenVector:add(string.sub(string_, (index) + 1, end_))
                index = end_ + #self.sep
            else
                tokenVector:add(string.sub(string_, (index) + 1, #string_))
                break
            end
        end
        return tokenVector
end


function Tokenizer:getTokens(stringVector)
        local tokenHashtable = StdUtil.getInstance():createHashtable()
        local string_ = StringUtil.getInstance().EMPTY_STRING
        local end_ = 0
        local size = stringVector:size()
        for index = 0, size - 1 do
            string_ = stringVector.objectArray[index + 1]
            end_ = ((string.find(string_, self.sep, 1, true) or 0) - 1)
            if end_ >= 0 then
                tokenHashtable:put(string.sub(string_, (0) + 1, end_), string.sub(string_, (end_ + 1) + 1, #string_))
            end
        end
        return tokenHashtable
end

return Tokenizer

