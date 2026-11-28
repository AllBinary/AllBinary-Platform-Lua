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
-- package org.allbinary.input

local KeyUtil = {}
package.loaded["org.allbinary.input.KeyUtil"] = KeyUtil

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

-- local KeyEvent = require("java.awt.event.KeyEvent")

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

-- class table KeyUtil is declared before the requires
KeyUtil.__index = KeyUtil
KeyUtil.className = "KeyUtil"
KeyUtil.javaClassName = "org.allbinary.input.KeyUtil"


function KeyUtil._jinit(self)
    return self
end

function KeyUtil.new(...)
    local self = setmetatable({}, KeyUtil)
    KeyUtil._jinit(self, ...)
    return self
end


function KeyUtil.isNormallyDisplayed(keyCode)
        do
            local switch_value = keyCode
            if switch_value == 32 or switch_value == 44 or switch_value == 45 or switch_value == 46 or switch_value == 47 or switch_value == 48 or switch_value == 49 or switch_value == 50 or switch_value == 51 or switch_value == 52 or switch_value == 53 or switch_value == 54 or switch_value == 55 or switch_value == 56 or switch_value == 57 or switch_value == 59 or switch_value == 61 or switch_value == 65 or switch_value == 66 or switch_value == 67 or switch_value == 68 or switch_value == 69 or switch_value == 70 or switch_value == 71 or switch_value == 72 or switch_value == 73 or switch_value == 74 or switch_value == 75 or switch_value == 76 or switch_value == 77 or switch_value == 78 or switch_value == 79 or switch_value == 80 or switch_value == 81 or switch_value == 82 or switch_value == 83 or switch_value == 84 or switch_value == 85 or switch_value == 86 or switch_value == 87 or switch_value == 88 or switch_value == 89 or switch_value == 90 or switch_value == 91 or switch_value == 92 or switch_value == 93 or switch_value == 96 or switch_value == 97 or switch_value == 98 or switch_value == 99 or switch_value == 100 or switch_value == 101 or switch_value == 102 or switch_value == 103 or switch_value == 104 or switch_value == 105 or switch_value == 106 or switch_value == 107 or switch_value == 108 or switch_value == 109 or switch_value == 110 or switch_value == 111 then
                return true
            else
                return false
            end
        end
end

return KeyUtil

