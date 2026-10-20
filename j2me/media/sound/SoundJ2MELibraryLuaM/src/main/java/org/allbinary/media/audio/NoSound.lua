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
-- package org.allbinary.media.audio

local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local NoSound = {}
NoSound.__index = NoSound
NoSound.className = "NoSound"
setmetatable(NoSound, {__index = Sound})


function NoSound.getInstance()
        return NoSound.instance
end


function NoSound.new()
    local self = setmetatable(Sound.new(StringUtil.getInstance().EMPTY_STRING), NoSound)
        -- super(...) made self above
        self:setPlayerP(NoPlayer.NO_PLAYER)
    return self
end

NoSound.instance = NoSound.new()

return NoSound

