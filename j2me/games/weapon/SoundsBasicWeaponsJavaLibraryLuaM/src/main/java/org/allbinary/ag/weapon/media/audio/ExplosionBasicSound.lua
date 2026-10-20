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
-- package org.allbinary.ag.weapon.media.audio

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

local ExplosionBasicSound = {}
ExplosionBasicSound.__index = ExplosionBasicSound
ExplosionBasicSound.className = "ExplosionBasicSound"
setmetatable(ExplosionBasicSound, {__index = CompositeSound})


function ExplosionBasicSound.new()
    local self = setmetatable(CompositeSound.new("resource:/wav/explosion.wav"), ExplosionBasicSound)
        -- super(...) made self above
    return self
end


function ExplosionBasicSound.getInstance()
        return ExplosionBasicSound.soundInterface
end

ExplosionBasicSound.soundInterface = ExplosionBasicSound.new()

return ExplosionBasicSound

