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
-- package org.allbinary.media.graphics.geography.map.racetrack

local GameFeature = require("org.allbinary.game.configuration.feature.GameFeature")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackGameFeature = {}
RaceTrackGameFeature.__index = RaceTrackGameFeature
RaceTrackGameFeature.className = "RaceTrackGameFeature"
setmetatable(RaceTrackGameFeature, {__index = GameFeature})


function RaceTrackGameFeature.new(name)
    local self = setmetatable(GameFeature.new(name), RaceTrackGameFeature)
        -- super(...) made self above
    return self
end

RaceTrackGameFeature.MINI_MAP = RaceTrackGameFeature.new("Mini Map")
RaceTrackGameFeature.AUTO_FINISH_AI = RaceTrackGameFeature.new("Auto Finish AI")

return RaceTrackGameFeature

