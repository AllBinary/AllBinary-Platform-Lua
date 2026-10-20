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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local TestInputInterface = require("org.allbinary.game.input.TestInputInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TestInputExample = {}
TestInputExample.__index = TestInputExample
TestInputExample.className = "TestInputExample"

function TestInputExample:_init_fields()
    self.testValue = 0
end

function TestInputExample.new()
    local self = setmetatable({}, TestInputExample)
    self:_init_fields()
    return self
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

