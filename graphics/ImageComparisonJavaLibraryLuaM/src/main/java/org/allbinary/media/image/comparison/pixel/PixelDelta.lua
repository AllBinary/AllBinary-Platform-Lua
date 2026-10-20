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
-- package org.allbinary.media.image.comparison.pixel

local GPoint = require("org.allbinary.graphics.GPoint")
local TsUtil = require("org.allbinary.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")
local ColorDelta = require("org.allbinary.media.image.comparison.color.ColorDelta")
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

local PixelDelta = {}
PixelDelta.__index = PixelDelta
PixelDelta.className = "PixelDelta"

function PixelDelta:_init_fields()
    self.point = nil
    self.colorDelta = nil
    self.key = nil
end


function PixelDelta.new(point, colorDelta)
    local self = setmetatable({}, PixelDelta)
    self:_init_fields()
        self:setPoint(point)
        self:setColorDelta(colorDelta)
        self.key = PixelDelta.getKey(self:getPoint(), self:getColorDelta())
    return self
end


function PixelDelta:getKey()
        return self.key
end


-- Java overloaded method: Lua keeps the last definition
function PixelDelta.getKey(point, colorDelta)
        return tostring(StringMaker.new():appendint(java_int(TsUtil.getInstance():hashCode(point))):append(CommonSeps.getInstance().UNDERSCORE):append(tostring(colorDelta:getKey())))
end


function PixelDelta:getPoint()
        return self.point
end


function PixelDelta:setPoint(point)
        self.point = point
end


function PixelDelta:getColorDelta()
        return self.colorDelta
end


function PixelDelta:setColorDelta(colorDelta)
        self.colorDelta = colorDelta
end


function PixelDelta:toString()
        return tostring(StringMaker.new():append("PixelDelta: Point: "):append(tostring(self.point)):append(CommonSeps.getInstance().SPACE):append(tostring(self.colorDelta)))
end
PixelDelta.__tostring = function(self) return self:toString() end

return PixelDelta

