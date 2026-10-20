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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local InputImageIOInterfaceFactory = require("org.allbinary.input.media.image.InputImageIOInterfaceFactory")
local InputImageType = require("org.allbinary.input.media.image.InputImageType")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ImageIOInterface = require("org.allbinary.media.image.io.ImageIOInterface")
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

local ImageActionScriptOutputProcessor = {}
ImageActionScriptOutputProcessor.__index = ImageActionScriptOutputProcessor
ImageActionScriptOutputProcessor.className = "ImageActionScriptOutputProcessor"

function ImageActionScriptOutputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageActionScriptOutputProcessor.new()
    local self = setmetatable({}, ImageActionScriptOutputProcessor)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageActionScriptOutputProcessor.process(imageActionScriptOutputInterface, frame)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        logUtil:putF("Start - Processing at: " .. tostring(imageActionScriptOutputInterface), "ImageActionScriptOutputProcessor", commonStrings.PROCESS)
        local imageTypes = imageActionScriptOutputInterface:getImageTypes()
        local vector = imageTypes:getVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local imageType = vector:get(index)
            local imageIOInterface = InputImageIOInterfaceFactory.getInstance(imageType)
            imageIOInterface:save(frame)
        end
end

return ImageActionScriptOutputProcessor

