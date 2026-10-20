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
-- package org.allbinary.input.motion


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllMotionRecognizer = {}
AllMotionRecognizer.__index = AllMotionRecognizer
AllMotionRecognizer.className = "AllMotionRecognizer"

function AllMotionRecognizer:_init_fields()
    self.id = nil
end


function AllMotionRecognizer.new()
    local self = setmetatable({}, AllMotionRecognizer)
    self:_init_fields()
        self.id = (function() local value = AllMotionRecognizer.index AllMotionRecognizer.index = value + 1 return value end)()
    return self
end


-- throws Exception
function AllMotionRecognizer:processStartMotionEvent(x, y, deviceId, modifiers)
end


-- throws Exception
function AllMotionRecognizer:processEndMotionEvent(x, y, deviceId, modifiers)
end


-- throws Exception
function AllMotionRecognizer:processDraggedMotionEvent(x, y, deviceId, modifiers)
end


-- throws Exception
function AllMotionRecognizer:processMovedMotionEvent(x, y, deviceId, modifiers)
end


-- throws Exception
function AllMotionRecognizer:processScrolledMotionEvent(x, y, deviceId, modifiers)
end


function AllMotionRecognizer:getId()
        return self.id
end

AllMotionRecognizer.index = 0

return AllMotionRecognizer

