-- Generated Code Do Not Modify
-- package org.allbinary.graphics.displayable

-- local Image = require("javax.microedition.lcdui.Image")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScreenRelationalUtil = {}
ScreenRelationalUtil.__index = ScreenRelationalUtil
ScreenRelationalUtil.className = "ScreenRelationalUtil"

function ScreenRelationalUtil.new()
    local self = setmetatable({}, ScreenRelationalUtil)
    return self
end


function ScreenRelationalUtil.getInstance()
        return ScreenRelationalUtil.instance
end


function ScreenRelationalUtil:getScaleImage(image)
        return self:getScaleWH(image:getWidth(), image:getHeight())
end


function ScreenRelationalUtil:getScaleWH(aWidth, aHeight)
        return self:getScaleWHA(aWidth, aHeight, 20)
end


function ScreenRelationalUtil:getScaleWHA(aWidth, aHeight, add)
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        local last = displayInfoSingleton:getLast()
        local width = (last[displayInfoSingleton.WIDTH + 1] + 0.0)
        local height = (last[displayInfoSingleton.HEIGHT + 1] + 0.0)
        local largestSize = width
        if largestSize < height then
            largestSize = height
        end
        local scale = (largestSize) / (aWidth + 0.0)
        return scale
end


function ScreenRelationalUtil:getScaledHeight(aWidth, aHeight)
        return java_int((self:getScaleWH(aWidth, aHeight) * (aHeight + 0.0)))
end


function ScreenRelationalUtil:getScaledHeightAdd(aWidth, aHeight, add)
        return java_int((self:getScaleWHA(aWidth, aHeight, add) * (aHeight + 0.0)))
end

ScreenRelationalUtil.instance = ScreenRelationalUtil.new()

return ScreenRelationalUtil

