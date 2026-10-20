-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

-- local awt = require("java.awt")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorUtil = {}
ColorUtil.__index = ColorUtil
ColorUtil.className = "ColorUtil"

function ColorUtil.new()
    local self = setmetatable({}, ColorUtil)
    return self
end


function ColorUtil.getInstance()
        return ColorUtil.instance
end


function ColorUtil:isGreyishOrWhiteLike(color)
        if math.abs(color:getRed() - color:getGreen()) > 20 or math.abs(color:getRed() - color:getBlue()) > 20 or math.abs(color:getGreen() - color:getBlue()) > 20 then
            return false
        end
        return true
end


function ColorUtil:isDark(color)
        if color:getRed() < 0x77 and color:getRed() < 0x77 and color:getRed() < 0x77 then
            return true
        end
        return false
end

ColorUtil.instance = ColorUtil.new()

return ColorUtil

