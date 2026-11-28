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
-- package org.allbinary.game.input

local TestInputExample = {}
package.loaded["org.allbinary.game.input.TestInputExample"] = TestInputExample

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local TestInputInterface = require("org.allbinary.game.input.TestInputInterface")

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

-- class table TestInputExample is declared before the requires
TestInputExample.__index = TestInputExample
TestInputExample.className = "TestInputExample"
TestInputExample.javaClassName = "org.allbinary.game.input.TestInputExample"
TestInputExample.java_implements = " TestInputInterface "
TestInputExample.java_interfaces = function() return {TestInputInterface} end

function TestInputExample:_init_fields()
    if self.testValue == nil then self.testValue = 0 end
end

function TestInputExample._jinit(self)
    TestInputExample._init_fields(self)
    return self
end

function TestInputExample.new()
    return TestInputExample._jinit(setmetatable({}, TestInputExample))
end


function TestInputExample:up()
end


function TestInputExample:down()
end


function TestInputExample:left()
        self.testValue = self.testValue + 1
end


function TestInputExample:right()
        self.testValue = self.testValue - 1
end


function TestInputExample:strafeLeft()
end


function TestInputExample:strafeRight()
end


function TestInputExample:paint(graphics)
end


function TestInputExample:paintThreed(graphics)
end

return TestInputExample

