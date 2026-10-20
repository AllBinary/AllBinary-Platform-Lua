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
-- package org.allbinary.graphics.color

-- local Graphics = require("javax.microedition.lcdui.Graphics")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicColorSetUtil = {}
BasicColorSetUtil.__index = BasicColorSetUtil
BasicColorSetUtil.className = "BasicColorSetUtil"


function BasicColorSetUtil.getInstance()
        return BasicColorSetUtil.instance
end


function BasicColorSetUtil.new()
    local self = setmetatable({}, BasicColorSetUtil)
    return self
end


function BasicColorSetUtil:setBasicColorP(graphics, basicColor)
        graphics:setColor(math.tointeger(basicColor // 1))
end


function BasicColorSetUtil:setBasicColorP3(graphics, basicColor, value)
        graphics:setColor(value)
end

BasicColorSetUtil.instance = BasicColorSetUtil.new()

return BasicColorSetUtil

