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
-- package org.allbinary.data

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Tokenizer = require("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CamelCaseUtil = {}
CamelCaseUtil.__index = CamelCaseUtil
CamelCaseUtil.className = "CamelCaseUtil"

function CamelCaseUtil:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
end

function CamelCaseUtil.new()
    local self = setmetatable({}, CamelCaseUtil)
    self:_init_fields()
    return self
end


function CamelCaseUtil.getInstance()
        return CamelCaseUtil.instance
end


-- throws Exception
function CamelCaseUtil:getAsCamelCase(string, stringBuilder)
        if string == nil then
            return StringUtil.getInstance().EMPTY_STRING
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        stringBuilder:delete(0, stringBuilder:length())
        local list = BasicArrayListD.new()
        local tokenizer = Tokenizer.new(self.commonSeps.UNDERSCORE)
        tokenizer:getTokensFromString(string, list)
        local size = list:size()
        local word = nil
        for i = 0, size - 1 do
            word = list:get(i)
            word = (function() if stringValidationUtil:isEmpty(word) then return word else return tostring(StringMaker.new():appendchar(string.upper(string.sub(word, (0) + 1, (0) + 1))):append(string.lower(string.sub(word, (1) + 1)))) end end)()
            stringBuilder:append(word)
        end
        return tostring(stringBuilder)
end

CamelCaseUtil.instance = CamelCaseUtil.new()

return CamelCaseUtil

