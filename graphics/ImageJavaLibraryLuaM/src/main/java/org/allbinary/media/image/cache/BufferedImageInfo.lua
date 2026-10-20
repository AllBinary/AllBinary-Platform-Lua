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
-- package org.allbinary.media.image.cache

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BufferedImageInfo = {}
BufferedImageInfo.__index = BufferedImageInfo
BufferedImageInfo.className = "BufferedImageInfo"

function BufferedImageInfo:_init_fields()
    self.width = nil
    self.height = nil
    self.type = nil
end


function BufferedImageInfo.new(width, height, type)
    local self = setmetatable({}, BufferedImageInfo)
    self:_init_fields()
        self.width = width
        self.height = height
        self.type = type
    return self
end


function BufferedImageInfo:getWidth()
        return self.width
end


function BufferedImageInfo:setWidth(width)
        self.width = width
end


function BufferedImageInfo:getHeight()
        return self.height
end


function BufferedImageInfo:setHeight(height)
        self.height = height
end


function BufferedImageInfo:getType()
        return self.type
end


function BufferedImageInfo:setType(type)
        self.type = type
end


function BufferedImageInfo:toString()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("BufferedImageInfo -")
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self:getWidth())
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self:getHeight())
        stringBuffer:append(" Type: ")
        stringBuffer:appendint(self:getType())
        return tostring(stringBuffer)
end
BufferedImageInfo.__tostring = function(self) return self:toString() end

return BufferedImageInfo

