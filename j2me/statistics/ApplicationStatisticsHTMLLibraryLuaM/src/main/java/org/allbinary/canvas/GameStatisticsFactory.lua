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
-- package org.allbinary.canvas

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BaseGameStatistics = require("org.allbinary.canvas.BaseGameStatistics")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local GameStatisticsFactory = {}
GameStatisticsFactory.__index = GameStatisticsFactory
GameStatisticsFactory.className = "GameStatisticsFactory"
setmetatable(GameStatisticsFactory, {__index = BaseGameStatistics})

function GameStatisticsFactory:_init_fields()
    self.stringBuffer = StringMaker.new()
end

function GameStatisticsFactory.new()
    local self = setmetatable(BaseGameStatistics.new(), GameStatisticsFactory)
    self:_init_fields()
    return self
end


function GameStatisticsFactory.getInstance()
        return GameStatisticsFactory.instance
end


function GameStatisticsFactory:add(string)
        if self.stringBuffer:length() > 12000 then
            self.stringBuffer:delete(0, self.stringBuffer:length())
            self.stringBuffer:append("Old Stats Cleared")
        end
        self.stringBuffer:append(string)
end


function GameStatisticsFactory:toString()
        return tostring(StringMaker.new():append(tostring(BaseGameStatistics)):append(tostring(self.stringBuffer)))
end
GameStatisticsFactory.__tostring = function(self) return self:toString() end

GameStatisticsFactory.instance = GameStatisticsFactory.new()

return GameStatisticsFactory

