-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.media.audio

local CompositeSound = require("org.allbinary.media.audio.CompositeSound")
local Sound = require("org.allbinary.media.audio.Sound")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DowngradeSound = {}
DowngradeSound.__index = DowngradeSound
DowngradeSound.className = "DowngradeSound"
setmetatable(DowngradeSound, {__index = CompositeSound})


function DowngradeSound.new()
    local self = setmetatable(CompositeSound.new("resource:/wav/downgrade.wav"), DowngradeSound)
        -- super(...) made self above
    return self
end


function DowngradeSound.getInstance()
        return DowngradeSound.soundInterface
end

DowngradeSound.soundInterface = DowngradeSound.new()

return DowngradeSound

