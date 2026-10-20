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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageActionScriptOutputData = {}
ImageActionScriptOutputData.__index = ImageActionScriptOutputData
ImageActionScriptOutputData.className = "ImageActionScriptOutputData"


function ImageActionScriptOutputData.new()
    local self = setmetatable({}, ImageActionScriptOutputData)
    return self
end

ImageActionScriptOutputData.NAME = "IMAGE_ACTION_OUTPUT_NAME"
ImageActionScriptOutputData.SAVE = "SAVE_IMAGE_ACTION_OUTPUT_NAME"
ImageActionScriptOutputData.DISPLAY = "DISPLAY_IMAGE_ACTION_OUTPUT_NAME"
ImageActionScriptOutputData.TYPE = "TYPE_IMAGE_ACTION_OUTPUT_NAME"
ImageActionScriptOutputData.TYPES = "TYPES_IMAGE_ACTION_OUTPUT_NAME"

return ImageActionScriptOutputData

