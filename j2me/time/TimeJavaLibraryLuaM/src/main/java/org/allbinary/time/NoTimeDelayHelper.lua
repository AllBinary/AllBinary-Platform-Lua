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
-- package org.allbinary.time

local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoTimeDelayHelper = {}
NoTimeDelayHelper.__index = NoTimeDelayHelper
NoTimeDelayHelper.className = "NoTimeDelayHelper"
setmetatable(NoTimeDelayHelper, {__index = TimeDelayHelper})


function NoTimeDelayHelper.new()
    local self = setmetatable(TimeDelayHelper.new(0), NoTimeDelayHelper)
        -- super(...) made self above
    return self
end


function NoTimeDelayHelper:isTimeTNT()
        return true
end


function NoTimeDelayHelper:isTimeSinceTNT(delay)
        return true
end


function NoTimeDelayHelper:isTime(currentTime)
        return true
end


function NoTimeDelayHelper:isTimeSince(delay, currentTime)
        return true
end

NoTimeDelayHelper.SINGLETON = NoTimeDelayHelper.new()

return NoTimeDelayHelper

