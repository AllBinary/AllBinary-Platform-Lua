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
-- package org.allbinary.time


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameTickTimeDelayHelper = {}
GameTickTimeDelayHelper.__index = GameTickTimeDelayHelper
GameTickTimeDelayHelper.className = "GameTickTimeDelayHelper"

function GameTickTimeDelayHelper:_init_fields()
    self.timeDelta = 0
    self.startTime = nil
    self.lastStartTime = nil
end


function GameTickTimeDelayHelper.new(startTime)
    local self = setmetatable({}, GameTickTimeDelayHelper)
    self:_init_fields()
        self.startTime = startTime
        self.lastStartTime = 0
    return self
end


function GameTickTimeDelayHelper:setStartTime()
        self.startTime = math.floor(os.time() * 1000)
        return self.startTime
end


function GameTickTimeDelayHelper:loop()
        if self.lastStartTime == Long.MIN_VALUE then
            self.timeDelta = 0
        else
            self.timeDelta = math.floor(os.time() * 1000) - self.lastStartTime
        end
end


function GameTickTimeDelayHelper:getTimeFromStart()
        return self.startTime - self.lastStartTime
end

return GameTickTimeDelayHelper

