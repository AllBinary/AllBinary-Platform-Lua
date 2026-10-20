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
-- package org.allbinary.input.media.image.capture

-- local BufferedImage = require("java.awt.image.BufferedImage")
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

local CapturedImageWorkerResultsEvent = {}
CapturedImageWorkerResultsEvent.__index = CapturedImageWorkerResultsEvent
CapturedImageWorkerResultsEvent.className = "CapturedImageWorkerResultsEvent"
setmetatable(CapturedImageWorkerResultsEvent, {__index = AllBinaryEventObject})

function CapturedImageWorkerResultsEvent:_init_fields()
    self.frame = nil
    self.bufferedImage = nil
end


function CapturedImageWorkerResultsEvent.new(anyType, frame, bufferedImage)
    local self = setmetatable(AllBinaryEventObject.new(anyType), CapturedImageWorkerResultsEvent)
    self:_init_fields()
        -- super(...) made self above
        self.frame = frame
        self:setBufferedImage(bufferedImage)
    return self
end


function CapturedImageWorkerResultsEvent:getBufferedImage()
        return self.bufferedImage
end


function CapturedImageWorkerResultsEvent:setBufferedImage(bufferedImage)
        self.bufferedImage = bufferedImage
end


function CapturedImageWorkerResultsEvent:getFrame()
        return self.frame
end

return CapturedImageWorkerResultsEvent

