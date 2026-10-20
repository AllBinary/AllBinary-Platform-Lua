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
-- package org.allbinary.animation.image

-- local Image = require("javax.microedition.lcdui.Image")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ImageScaleUtil = require("org.allbinary.media.image.ImageScaleUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ScaleBaseProcessor = require("org.allbinary.animation.image.ScaleBaseProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScaleProcessor = {}
ScaleProcessor.__index = ScaleProcessor
ScaleProcessor.className = "ScaleProcessor"
setmetatable(ScaleProcessor, {__index = ScaleBaseProcessor})

function ScaleProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageScaleUtil = ImageScaleUtil.getInstance()
end

function ScaleProcessor.new()
    local self = setmetatable(ScaleBaseProcessor.new(), ScaleProcessor)
    self:_init_fields()
    return self
end


function ScaleProcessor.getInstance()
        return ScaleProcessor.instanceC
end


function ScaleProcessor:update(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY)
        local try_ok, try_error = pcall(function()
            self.imageScaleUtil:scale2(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end

ScaleProcessor.instanceC = ScaleProcessor.new()

return ScaleProcessor

