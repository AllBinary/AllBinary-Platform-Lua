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

local UniqueTokens = {}
package.loaded["org.allbinary.logic.string.tokens.UniqueTokens"] = UniqueTokens

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

local HashSet = java_lazy("java.util.HashSet")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
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

-- class table UniqueTokens is declared before the requires
UniqueTokens.__index = UniqueTokens
UniqueTokens.className = "UniqueTokens"
UniqueTokens.javaClassName = "org.allbinary.logic.string.tokens.UniqueTokens"

function UniqueTokens:_init_fields()
    self.specialCharacters = BasicArrayListD.new()
end


function UniqueTokens._jinit(self)
    UniqueTokens._init_fields(self)
        self.specialCharacters:add("!")
        self.specialCharacters:add("@")
        self.specialCharacters:add(CommonPhoneStrings.getInstance().POUND)
        self.specialCharacters:add("$")
        self.specialCharacters:add("%")
        self.specialCharacters:add("^")
        self.specialCharacters:add(CommonSeps.getInstance().AMPERSAND)
        self.specialCharacters:add(CommonPhoneStrings.getInstance().STAR)
        self.specialCharacters:add("(")
        self.specialCharacters:add(")")
        self.specialCharacters:add("-")
        self.specialCharacters:add("_")
        self.specialCharacters:add("+")
        self.specialCharacters:add("=")
        self.specialCharacters:add("\\")
        self.specialCharacters:add("|")
        self.specialCharacters:add(AbPathData.getInstance().EXTENSION_SEP)
        self.specialCharacters:add(",")
        self.specialCharacters:add("<")
        self.specialCharacters:add(">")
        self.specialCharacters:add("?")
        self.specialCharacters:add("/")
        self.specialCharacters:add("~")
        self.specialCharacters:add("`")
    return self
end

function UniqueTokens.new(...)
    local self = setmetatable({}, UniqueTokens)
    UniqueTokens._jinit(self, ...)
    return self
end


-- throws Exception
function UniqueTokens:getWhithoutDashesAndSkipNumberOnlyTokens(stringVector)
        local try_ok, try_error, try_value = pcall(function()
            local hashSet = HashSet.new()
            local index = 0
            local commonSeps = CommonSeps.getInstance()
            while index < stringVector:size() do
                local keywords = stringVector:get(index)
                local tokenizer = Tokenizer.new(commonSeps.COMMA)
                local keywordVector = tokenizer:getTokensFromString(keywords, BasicArrayListD.new())
                for forIndex = 0, keywordVector:size() - 1 do
                    local cleanString = keywordVector:get(forIndex)
                    cleanString = string.match(cleanString, "^%s*(.-)%s*$")
                    if ((string.find(cleanString, "-", 1, true) or 0) - 1) ~= -1 then
                        cleanString = Replace.new("-", commonSeps.SPACE):all(cleanString)
                    end
                    hashSet:add(cleanString)
                    if ((string.find(cleanString, " ", 1, true) or 0) - 1) ~= -1 then
                        local spaceTokenizer = Tokenizer.new(commonSeps.SPACE)
                        local subKeywordVector = spaceTokenizer:getTokensFromString(cleanString, BasicArrayListD.new())
                        for spaceIndex = 0, subKeywordVector:size() - 1 do
                            local subCleanString = subKeywordVector:get(spaceIndex)
                            if not self:isSpecialCharacter(subCleanString) and not self:numberOnly(subCleanString) then
                                hashSet:add(subCleanString)
                            end
                        end
                    end
                end
                index = index + 1
            end
            do return "__jreturn", hashSet end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function UniqueTokens:numberOnly(subCleaningString)
        local try_ok, try_error, try_value = pcall(function()
            math.tointeger(tonumber(subCleaningString))
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function UniqueTokens:isSpecialCharacter(subCleaningString)
        for index = 0, self.specialCharacters:size() - 1 do
            if ((subCleaningString < self.specialCharacters:get(index) and -1) or (subCleaningString > self.specialCharacters:get(index) and 1) or 0) == 0 then
                return true
            end
        end
        return false
end

return UniqueTokens

