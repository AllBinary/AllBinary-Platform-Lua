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

local SpecialCharacterUtil = {}
package.loaded["org.allbinary.logic.string.SpecialCharacterUtil"] = SpecialCharacterUtil

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

local HashMap = java_lazy("java.util.HashMap")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local MathData = java_lazy("org.allbinary.logic.math.MathData")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table SpecialCharacterUtil is declared before the requires
SpecialCharacterUtil.__index = SpecialCharacterUtil
SpecialCharacterUtil.className = "SpecialCharacterUtil"
SpecialCharacterUtil.javaClassName = "org.allbinary.logic.string.SpecialCharacterUtil"

function SpecialCharacterUtil._jinit(self)
    return self
end

function SpecialCharacterUtil.new()
    return SpecialCharacterUtil._jinit(setmetatable({}, SpecialCharacterUtil))
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

