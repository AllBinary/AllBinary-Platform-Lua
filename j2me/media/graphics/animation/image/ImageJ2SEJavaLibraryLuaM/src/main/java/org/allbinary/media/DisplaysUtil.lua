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
-- package org.allbinary.media

local DisplaysUtil = {}
package.loaded["org.allbinary.media.DisplaysUtil"] = DisplaysUtil

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

-- local Dimension = require("java.awt.Dimension")
-- local DisplayMode = require("java.awt.DisplayMode")
-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local GraphicsEnvironment = require("java.awt.GraphicsEnvironment")
-- local Toolkit = require("java.awt.Toolkit")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table DisplaysUtil is declared before the requires
DisplaysUtil.__index = DisplaysUtil
DisplaysUtil.className = "DisplaysUtil"
DisplaysUtil.javaClassName = "org.allbinary.media.DisplaysUtil"

function DisplaysUtil._jinit(self)
    return self
end

function DisplaysUtil.new()
    return DisplaysUtil._jinit(setmetatable({}, DisplaysUtil))
end


function DisplaysUtil.getInstance()
        return DisplaysUtil.instance_f
end


function DisplaysUtil:getPrimaryScreenSize()
        local dimension = Toolkit.getDefaultToolkit():getScreenSize()
        return Rectangle.new(PointFactory.getInstance().ZERO_ZERO, dimension.width, dimension.height)
end


function DisplaysUtil:getScreenSizesAsRectangleArray()
        local graphicsEnvironment = GraphicsEnvironment.getLocalGraphicsEnvironment()
        local graphicsDeviceArray = graphicsEnvironment:getScreenDevices()
        local graphicsDevice = nil
        local displayMode = nil
        local rectangle = nil
        local size = (graphicsDeviceArray.n or #graphicsDeviceArray)
        local rectangleArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            graphicsDevice = graphicsDeviceArray[index + 1]
            displayMode = graphicsDevice:getDisplayMode()
            rectangle = Rectangle.new(PointFactory.getInstance().ZERO_ZERO, displayMode:getWidth(), displayMode:getHeight())
            rectangleArray[index + 1] = rectangle
        end
        return rectangleArray
end

DisplaysUtil.instance_f = DisplaysUtil.new()

return DisplaysUtil

