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

local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local TestInputInterface = {}
TestInputInterface.__index = TestInputInterface
TestInputInterface.className = "TestInputInterface"
setmetatable(TestInputInterface, {__index = PaintableInterface})


function TestInputInterface:up()
    error("abstract method up")
end


function TestInputInterface:down()
    error("abstract method down")
end


function TestInputInterface:left()
    error("abstract method left")
end


function TestInputInterface:right()
    error("abstract method right")
end


function TestInputInterface:strafeLeft()
    error("abstract method strafeLeft")
end


function TestInputInterface:strafeRight()
    error("abstract method strafeRight")
end

return TestInputInterface

