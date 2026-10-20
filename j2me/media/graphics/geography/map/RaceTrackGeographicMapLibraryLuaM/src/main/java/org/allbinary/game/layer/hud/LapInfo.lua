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
-- package org.allbinary.game.layer.hud

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LapInfo = {}
LapInfo.__index = LapInfo
LapInfo.className = "LapInfo"

function LapInfo:_init_fields()
    self.numberOfLaps = nil
    self.totalLaps = nil
end


function LapInfo.new(totalLaps)
    local self = setmetatable({}, LapInfo)
    self:_init_fields()
        self.totalLaps = totalLaps
        self.numberOfLaps = 1
    return self
end


function LapInfo:add()
        self.numberOfLaps = self.numberOfLaps + 1
end


function LapInfo:getCurrentLap()
        return self.numberOfLaps
end


function LapInfo:getTotalLaps()
        return self.totalLaps
end


function LapInfo:isDone()
        if self.numberOfLaps >= self.totalLaps then
            return true
        end
        return false
end


function LapInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("isDone: ")
        stringBuffer:appendboolean(self:isDone())
        stringBuffer:append(" CurrentLap: ")
        stringBuffer:appendint(self:getCurrentLap())
        stringBuffer:append(" Total Laps: ")
        stringBuffer:appendint(self:getTotalLaps())
        return tostring(stringBuffer)
end
LapInfo.__tostring = function(self) return self:toString() end

LapInfo.NULL_LAP_INFO = LapInfo.new(-1)

return LapInfo

