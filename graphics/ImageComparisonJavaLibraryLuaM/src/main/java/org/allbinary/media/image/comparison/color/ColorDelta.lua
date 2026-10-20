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
-- package org.allbinary.media.image.comparison.color

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorDelta = {}
ColorDelta.__index = ColorDelta
ColorDelta.className = "ColorDelta"

function ColorDelta:_init_fields()
    self.rgb1 = 0
    self.rgb2 = 0
    self.key = nil
end


function ColorDelta.new(rgb1, rgb2)
    local self = setmetatable({}, ColorDelta)
    self:_init_fields()
        self:setRgb1(rgb1)
        self:setRgb2(rgb2)
        self.key = ColorDelta.getKey(rgb1, rgb2)
    return self
end


function ColorDelta:getKey()
        return self.key
end


-- Java overloaded method: Lua keeps the last definition
function ColorDelta.getKey(rgb1, rgb2)
        return tostring(StringMaker.new():append(tostring(rgb1)):append(CommonSeps.getInstance().UNDERSCORE):append(tostring(rgb2)))
end


function ColorDelta:getRgb1()
        return self.rgb1
end


function ColorDelta:setRgb1(rgb1)
        self.rgb1 = rgb1
end


function ColorDelta:getRgb2()
        return self.rgb2
end


function ColorDelta:setRgb2(rgb2)
        self.rgb2 = rgb2
end


function ColorDelta:toString()
        return tostring(StringMaker.new():append("ColorDelta: "):append(StringUtil.getInstance():toString(self:getKey())):append(" RGB1: "):appendint(self:getRgb1()):append(" RGB2: "):appendint(self:getRgb2()))
end
ColorDelta.__tostring = function(self) return self:toString() end

return ColorDelta

