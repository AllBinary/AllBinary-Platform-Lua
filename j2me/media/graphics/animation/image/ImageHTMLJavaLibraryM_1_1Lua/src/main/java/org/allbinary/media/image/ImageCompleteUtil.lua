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
-- package org.allbinary.media.image

-- local Image = require("javax.microedition.lcdui.Image")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local PlaynImage = require("org.microemu.device.playn.PlaynImage")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageCompleteUtil = {}
ImageCompleteUtil.__index = ImageCompleteUtil
ImageCompleteUtil.className = "ImageCompleteUtil"

function ImageCompleteUtil:_init_fields()
    self.ISREADY = "isReady"
    self.COMPLETE = "Image loading complete for: "
end

function ImageCompleteUtil.new()
    local self = setmetatable({}, ImageCompleteUtil)
    self:_init_fields()
    return self
end


function ImageCompleteUtil.getInstance()
        return ImageCompleteUtil.instance
end


-- throws Exception
function ImageCompleteUtil:waitForImage(image, name)
end


-- throws Exception
function ImageCompleteUtil:isReady(image, name, timeDelayHelper)
        local playnImage = image
        local playnCoreImage = playnImage:getImage()
        if not playnCoreImage:isReady() or playnCoreImage:width() + playnCoreImage:height() <= 0 then
            self:handleTimeout(name)
            return false
        end
        if not image:isReady() then
            image:init(image:getImage())
            if not image:isReady() then
                PreLogUtil.put("Waiting for Not Ready Image: " .. image:getName(), self, self.ISREADY)
            end
        end
        local commonStrings = CommonStrings.getInstance()
        PreLogUtil.put(self.COMPLETE .. image:getName(), self, commonStrings.SUCCESS)
        return true
end


-- throws Exception
function ImageCompleteUtil:handleTimeout(name)
end


-- throws Exception
function ImageCompleteUtil:waitForAll()
end

ImageCompleteUtil.instance = ImageCompleteUtil.new()

return ImageCompleteUtil

