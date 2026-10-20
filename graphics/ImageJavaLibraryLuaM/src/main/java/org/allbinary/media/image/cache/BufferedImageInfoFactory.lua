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

-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BufferedImageInfoFactory = {}
BufferedImageInfoFactory.__index = BufferedImageInfoFactory
BufferedImageInfoFactory.className = "BufferedImageInfoFactory"


function BufferedImageInfoFactory.new()
    local self = setmetatable({}, BufferedImageInfoFactory)
    return self
end


function BufferedImageInfoFactory.getInstance(width, height, type)
        local stringbuffer = StringMaker.new()
        stringbuffer:appendint(width)
        stringbuffer:appendint(height)
        stringbuffer:appendint(type)
        local key = tostring(stringbuffer)
        local bufferedImageInfo = BufferedImageInfoFactory.hashMap:get(key)
        if bufferedImageInfo == nil then
            bufferedImageInfo = BufferedImageInfo.new(width, height, type)
            BufferedImageInfoFactory.hashMap:put(key, bufferedImageInfo)
        end
        return bufferedImageInfo
end

BufferedImageInfoFactory.hashMap = StdUtil.getInstance():createHashMap()

return BufferedImageInfoFactory

