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

local CamelCaseUtil = {}
package.loaded["org.allbinary.data.CamelCaseUtil"] = CamelCaseUtil

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Tokenizer = java_lazy("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table CamelCaseUtil is declared before the requires
CamelCaseUtil.__index = CamelCaseUtil
CamelCaseUtil.className = "CamelCaseUtil"
CamelCaseUtil.javaClassName = "org.allbinary.data.CamelCaseUtil"

function CamelCaseUtil:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
end

function CamelCaseUtil._jinit(self)
    CamelCaseUtil._init_fields(self)
    return self
end

function CamelCaseUtil.new()
    return CamelCaseUtil._jinit(setmetatable({}, CamelCaseUtil))
end


function CamelCaseUtil.getInstance()
        return CamelCaseUtil.instance_f
end


-- throws Exception
function CamelCaseUtil:getAsCamelCase(string_, stringBuilder)
        local stringValidationUtil = StringValidationUtil.getInstance()
        stringBuilder:delete(0, stringBuilder:length())
        local list = BasicArrayListD.new()
        local tokenizer = Tokenizer.new(self.commonSeps.UNDERSCORE)
        tokenizer:getTokensFromString(string_, list)
        local size = list:size()
        local word = nil
        for i = 0, size - 1 do
            word = list:get(i)
            word = (function() if stringValidationUtil:isEmpty(word) then return word else return tostring(StringMaker.new():appendchar(string.upper(string.sub(word, (0) + 1, (0) + 1))):append(string.lower(string.sub(word, (1) + 1)))) end end)()
            stringBuilder:append(word)
        end
        return tostring(stringBuilder)
end

CamelCaseUtil.instance_f = CamelCaseUtil.new()

return CamelCaseUtil

