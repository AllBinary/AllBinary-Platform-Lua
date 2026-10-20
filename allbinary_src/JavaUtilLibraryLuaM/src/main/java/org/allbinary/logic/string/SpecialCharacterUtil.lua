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
-- package org.allbinary.logic.string

-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local MathData = require("org.allbinary.logic.math.MathData")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpecialCharacterUtil = {}
SpecialCharacterUtil.__index = SpecialCharacterUtil
SpecialCharacterUtil.className = "SpecialCharacterUtil"

function SpecialCharacterUtil.new()
    local self = setmetatable({}, SpecialCharacterUtil)
    return self
end


function SpecialCharacterUtil.getHashMap()
        local commonSeps = CommonSeps.getInstance()
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        local stringUtil = StringUtil.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put("!", stringUtil.EMPTY_STRING)
        hashMap:put("@", stringUtil.EMPTY_STRING)
        hashMap:put(commonPhoneStrings.POUND, stringUtil.EMPTY_STRING)
        hashMap:put("$", stringUtil.EMPTY_STRING)
        hashMap:put("%", stringUtil.EMPTY_STRING)
        hashMap:put("^", stringUtil.EMPTY_STRING)
        hashMap:put(commonSeps.AMPERSAND, stringUtil.EMPTY_STRING)
        hashMap:put(commonPhoneStrings.STAR, stringUtil.EMPTY_STRING)
        hashMap:put(commonSeps.PARENTHESIS_OPEN, stringUtil.EMPTY_STRING)
        hashMap:put(commonSeps.PARENTHESIS_CLOSE, stringUtil.EMPTY_STRING)
        hashMap:put(commonSeps.DASH, stringUtil.EMPTY_STRING)
        hashMap:put(commonSeps.UNDERSCORE, stringUtil.EMPTY_STRING)
        hashMap:put(MathData.getInstance().PLUS, stringUtil.EMPTY_STRING)
        hashMap:put(commonSeps.EQUALS, stringUtil.EMPTY_STRING)
        hashMap:put("\\", stringUtil.EMPTY_STRING)
        hashMap:put("|", stringUtil.EMPTY_STRING)
        hashMap:put(AbPathData.getInstance().EXTENSION_SEP, stringUtil.EMPTY_STRING)
        hashMap:put(",", stringUtil.EMPTY_STRING)
        hashMap:put("<", stringUtil.EMPTY_STRING)
        hashMap:put(">", stringUtil.EMPTY_STRING)
        hashMap:put("?", stringUtil.EMPTY_STRING)
        hashMap:put(AbPathData.getInstance().SEPARATOR, stringUtil.EMPTY_STRING)
        hashMap:put("~", stringUtil.EMPTY_STRING)
        hashMap:put("`", stringUtil.EMPTY_STRING)
        return hashMap
end

return SpecialCharacterUtil

