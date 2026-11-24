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

local ColorUtil = {}
package.loaded["org.allbinary.graphics.color.ColorUtil"] = ColorUtil

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

-- local Color = require("java.awt.Color")

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

-- class table ColorUtil is declared before the requires
ColorUtil.__index = ColorUtil
ColorUtil.className = "ColorUtil"
ColorUtil.javaClassName = "org.allbinary.graphics.color.ColorUtil"

function ColorUtil._jinit(self)
    return self
end

function ColorUtil.new()
    return ColorUtil._jinit(setmetatable({}, ColorUtil))
end


function ColorUtil.getInstance()
        return ColorUtil.instance_f
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

ColorUtil.instance_f = ColorUtil.new()

return ColorUtil

