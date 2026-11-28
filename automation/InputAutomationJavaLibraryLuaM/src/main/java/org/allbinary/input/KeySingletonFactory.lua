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

local KeySingletonFactory = {}
package.loaded["org.allbinary.input.KeySingletonFactory"] = KeySingletonFactory

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
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- class table KeySingletonFactory is declared before the requires
KeySingletonFactory.__index = KeySingletonFactory
KeySingletonFactory.className = "KeySingletonFactory"
KeySingletonFactory.javaClassName = "org.allbinary.input.KeySingletonFactory"

function KeySingletonFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function KeySingletonFactory._jinit(self)
    KeySingletonFactory._init_fields(self)
    return self
end

function KeySingletonFactory.new(...)
    local self = setmetatable({}, KeySingletonFactory)
    KeySingletonFactory._jinit(self, ...)
    return self
end


function KeySingletonFactory.getHashtable()
        return KeySingletonFactory.keyStringHashtable
end


function KeySingletonFactory.getInstance(index)
        return tostring(index)
end


function KeySingletonFactory.getArray()
        return KeySingletonFactory.keyArray
end

KeySingletonFactory.keyStringHashtable = StdUtil.getInstance():createHashtable()
KeySingletonFactory.keyArray = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 144, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 61440, 61441, 61442, 61443, 61444, 61445, 61446, 61447, 61448, 61449, 61450, 61451, 30, 107, 65481, 256, 240, 18, 65406, 150, 151, 512, 192, 92, 8, 65368, 161, 162, 3, 20, 514, 12, 93, 258, 513, 44, 65312, 525, 17, 28, 65485, 65489, 134, 136, 129, 133, 138, 139, 130, 135, 137, 128, 141, 132, 140, 143, 131, 142, 110, 127, 111, 515, 40, 35, 10, 61, 27, 516, 517, 24, 65488, 243, 160, 244, 156, 242, 36, 263, 155, 518, 260, 259, 261, 21, 262, 25, 241, 225, 226, 227, 224, 37, 519, 153, 157, 45, 31, 106, 29, 520, 91, 34, 33, 65487, 19, 46, 521, 257, 154, 65482, 222, 152, 39, 522, 145, 59, 108, 108, 16, 47, 32, 65480, 109, 9, 0, 523, 65483, 38, 524}


do -- Java static initializer
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local STATIC_BLOCK = "Static Block"
        local try_ok, try_error, try_value = pcall(function()
            for index = 0, (KeySingletonFactory.keyArray.n or #KeySingletonFactory.keyArray) - 1 do
                local keyAsString = KeyEvent.getKeyText(KeySingletonFactory.keyArray[index + 1])
                KeySingletonFactory.keyStringHashtable:put(keyAsString, KeySingletonFactory.keyArray[index + 1])
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            logUtil:put(commonStrings.EXCEPTION, "KeySingleFactory", STATIC_BLOCK, e)
        end
end

return KeySingletonFactory

