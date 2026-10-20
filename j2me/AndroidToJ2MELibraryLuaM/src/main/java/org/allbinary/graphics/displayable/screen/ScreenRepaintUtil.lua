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
-- package org.allbinary.graphics.displayable.screen

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Displayable = require("javax.microedition.lcdui.Displayable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScreenRepaintUtil = {}
ScreenRepaintUtil.__index = ScreenRepaintUtil
ScreenRepaintUtil.className = "ScreenRepaintUtil"

function ScreenRepaintUtil.new()
    local self = setmetatable({}, ScreenRepaintUtil)
    return self
end


function ScreenRepaintUtil.repaint(displayable)
        local canvas = displayable
        canvas:repaint()
end

return ScreenRepaintUtil

