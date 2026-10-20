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
-- package org.allbinary.media.image.comparison

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageComparisonResultsEvent = {}
ImageComparisonResultsEvent.__index = ImageComparisonResultsEvent
ImageComparisonResultsEvent.className = "ImageComparisonResultsEvent"
setmetatable(ImageComparisonResultsEvent, {__index = AllBinaryEventObject})

function ImageComparisonResultsEvent:_init_fields()
    self.imageComparisonResult = nil
end


function ImageComparisonResultsEvent.new(anyType, imageComparisonInfo)
    local self = setmetatable(AllBinaryEventObject.new(anyType), ImageComparisonResultsEvent)
    self:_init_fields()
        -- super(...) made self above
        self:setImageComparisonResult(imageComparisonInfo)
    return self
end


function ImageComparisonResultsEvent:getImageComparisonResult()
        return self.imageComparisonResult
end


function ImageComparisonResultsEvent:setImageComparisonResult(imageComparisonResult)
        self.imageComparisonResult = imageComparisonResult
end

return ImageComparisonResultsEvent

