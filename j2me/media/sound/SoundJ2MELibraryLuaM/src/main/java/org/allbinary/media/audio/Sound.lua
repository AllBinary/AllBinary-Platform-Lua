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

-- local Player = require("javax.microedition.media.Player")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SoundInterface = require("org.allbinary.media.audio.SoundInterface")
-- java.lang.Runnable has no Lua module
local Runnable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Sound = {}
Sound.__index = Sound
Sound.className = "Sound"

function Sound:_init_fields()
    self.resource = nil
    self.player = NoPlayer.NO_PLAYER
end


function Sound.new(resource)
    local self = setmetatable({}, Sound)
    self:_init_fields()
        self.resource = resource
    return self
end


function Sound:getResource()
        return self.resource
end


function Sound:getPlayerP()
        return self.player
end


function Sound:setPlayerP(player)
        self.player = player
end


-- throws Exception
function Sound:init()
end


function Sound:getDuration()
        return -1
end


function Sound:run()
        local try_ok, try_error = pcall(function()
            self.player:start()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.put(commonStrings.EXCEPTION, self, commonStrings.RUN)
        end
end

return Sound

