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

local BasicColorUtil = {}
BasicColorUtil.__index = BasicColorUtil
BasicColorUtil.className = "BasicColorUtil"

function BasicColorUtil:_init_fields()
    self.ZERO_ARRAY = java_new_array(nil, 0)
    self.ALPHA = 0xFF000000
    self.isAlpha = true
    self.ffOpaque = true
end

function BasicColorUtil.new()
    local self = setmetatable({}, BasicColorUtil)
    self:_init_fields()
    return self
end


function BasicColorUtil.getInstance()
        return BasicColorUtil.instance
end


function BasicColorUtil:getRGB(red, green, blue)
        local value = 0
        if self.isAlpha then
            if self.ffOpaque then
                value = self.ALPHA
            end
        end
        value = (red << 16) | value
        value = (green << 8) | value
        value = blue | value
        return value
end


function BasicColorUtil:getARGB(alphaValue, r, g, b)
        return ((alphaValue << 24) & self.ALPHA) + ((r << 16) & 0x00FF0000) + ((g << 8) & 0x0000FF00) + (b & 0x000000FF)
end


function BasicColorUtil:get(alphaValue, color)
        return ((alphaValue << 24) & self.ALPHA) + color
end


function BasicColorUtil:invert(color)
        return (0xFFFFFF - color) | self.ALPHA
end

BasicColorUtil.instance = BasicColorUtil.new()

return BasicColorUtil

