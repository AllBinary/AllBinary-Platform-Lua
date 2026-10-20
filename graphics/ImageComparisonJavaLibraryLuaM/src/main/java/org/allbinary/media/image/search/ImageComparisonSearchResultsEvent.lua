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
-- package org.allbinary.media.image.search

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

local ImageComparisonSearchResultsEvent = {}
ImageComparisonSearchResultsEvent.__index = ImageComparisonSearchResultsEvent
ImageComparisonSearchResultsEvent.className = "ImageComparisonSearchResultsEvent"
setmetatable(ImageComparisonSearchResultsEvent, {__index = AllBinaryEventObject})

function ImageComparisonSearchResultsEvent:_init_fields()
    self.imageComparisonSearch = nil
end


function ImageComparisonSearchResultsEvent.new(anyType, imageComparisonSearch)
    local self = setmetatable(AllBinaryEventObject.new(anyType), ImageComparisonSearchResultsEvent)
    self:_init_fields()
        -- super(...) made self above
        self:setImageComparisonSearch(imageComparisonSearch)
    return self
end


function ImageComparisonSearchResultsEvent:getImageComparisonSearch()
        return self.imageComparisonSearch
end


function ImageComparisonSearchResultsEvent:setImageComparisonSearch(imageComparisonSearch)
        self.imageComparisonSearch = imageComparisonSearch
end

return ImageComparisonSearchResultsEvent

