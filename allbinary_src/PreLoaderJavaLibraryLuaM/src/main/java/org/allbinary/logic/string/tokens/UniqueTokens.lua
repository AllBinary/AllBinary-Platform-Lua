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

-- local HashSet = require("java.util.HashSet")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
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

local UniqueTokens = {}
UniqueTokens.__index = UniqueTokens
UniqueTokens.className = "UniqueTokens"

function UniqueTokens:_init_fields()
    self.specialCharacters = BasicArrayListD.new()
end


function UniqueTokens.new()
    local self = setmetatable({}, UniqueTokens)
    self:_init_fields()
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


-- throws Exception
function UniqueTokens:getWhithoutDashesAndSkipNumberOnlyTokens(stringVector)
        local try_ok, try_error = pcall(function()
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
            return hashSet
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


function UniqueTokens:numberOnly(subCleaningString)
        local try_ok, try_error = pcall(function()
            math.tointeger(tonumber(subCleaningString))
            return true
        end)
        if not try_ok then
            local e = try_error
            return false
        end
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

