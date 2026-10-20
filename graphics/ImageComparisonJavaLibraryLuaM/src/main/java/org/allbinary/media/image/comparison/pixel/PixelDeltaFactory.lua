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
local PointFactory = require("org.allbinary.graphics.PointFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local CacheInterfaceFactory = require("org.allbinary.logic.util.cache.CacheInterfaceFactory")
local CachePolicyFactory = require("org.allbinary.logic.util.cache.CachePolicyFactory")
local CacheTypeFactory = require("org.allbinary.logic.util.cache.CacheTypeFactory")
local ColorDelta = require("org.allbinary.media.image.comparison.color.ColorDelta")
local ColorDeltaFactory = require("org.allbinary.media.image.comparison.color.ColorDeltaFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PixelDeltaFactory = {}
PixelDeltaFactory.__index = PixelDeltaFactory
PixelDeltaFactory.className = "PixelDeltaFactory"

function PixelDeltaFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PixelDeltaFactory.new()
    local self = setmetatable({}, PixelDeltaFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function PixelDeltaFactory.getInstance(x, y, rgb1, rgb2)
        local point = PointFactory.getInstance():createXY(x, y)
        local colorDelta = ColorDeltaFactory.getInstance(rgb1, rgb2)
        local pixelDelta = PixelDeltaFactory.cacheInterface:get(PixelDelta.getKey(point, colorDelta))
        if pixelDelta == nil then
            pixelDelta = PixelDelta.new(point, colorDelta)
        end
        return pixelDelta
end

PixelDeltaFactory.cacheInterface = nil


do -- Java static initializer
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local STATIC_BLOCK = "Static Block"
        local instance = "PixelDeltaFactory"
        local try_ok, try_error = pcall(function()
            logUtil:putF(commonStrings.START, instance, STATIC_BLOCK)
            PixelDeltaFactory.cacheInterface = CacheInterfaceFactory.getInstance(CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().THIRTY_MINUTES_TEN_THOUSAND_MAX)
            logUtil:putF(commonStrings.END, instance, STATIC_BLOCK)
        end)
        if not try_ok then
            local e = try_error
            logUtil:put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e)
        end
end

return PixelDeltaFactory

