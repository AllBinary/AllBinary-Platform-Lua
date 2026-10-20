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
-- package org.allbinary.media.audio

local CompositeSound = require("org.allbinary.media.audio.CompositeSound")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Use 8hz16bitmono for most J2ME
local GameYouWinSound = {}
GameYouWinSound.__index = GameYouWinSound
GameYouWinSound.className = "GameYouWinSound"
setmetatable(GameYouWinSound, {__index = CompositeSound})


function GameYouWinSound.new()
    local self = setmetatable(CompositeSound.new("resource:/wav/youwin.wav"), GameYouWinSound)
        -- super(...) made self above
    return self
end


function GameYouWinSound.getInstance()
        return GameYouWinSound.soundInterface
end

GameYouWinSound.soundInterface = GameYouWinSound.new()

return GameYouWinSound

