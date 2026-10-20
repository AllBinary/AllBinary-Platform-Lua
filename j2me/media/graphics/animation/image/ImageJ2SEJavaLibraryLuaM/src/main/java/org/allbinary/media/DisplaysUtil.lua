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

-- local Dimension = require("java.awt.Dimension")
-- local DisplayMode = require("java.awt.DisplayMode")
-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local GraphicsEnvironment = require("java.awt.GraphicsEnvironment")
-- local Toolkit = require("java.awt.Toolkit")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DisplaysUtil = {}
DisplaysUtil.__index = DisplaysUtil
DisplaysUtil.className = "DisplaysUtil"

function DisplaysUtil.new()
    local self = setmetatable({}, DisplaysUtil)
    return self
end


function DisplaysUtil.getInstance()
        return DisplaysUtil.instance
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

DisplaysUtil.instance = DisplaysUtil.new()

return DisplaysUtil

