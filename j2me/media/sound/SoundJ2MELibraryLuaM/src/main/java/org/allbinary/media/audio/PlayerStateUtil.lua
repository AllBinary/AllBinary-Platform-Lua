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

-- local Player = require("javax.microedition.media.Player")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerStateUtil = {}
PlayerStateUtil.__index = PlayerStateUtil
PlayerStateUtil.className = "PlayerStateUtil"

function PlayerStateUtil:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.UNREALIZED = "UNREALIZED"
    self.REALIZED = "REALIZED"
    self.PREFETCHED = "PREFETCHED"
    self.STARTED = "STARTED"
    self.CLOSED = "CLOSED"
end

function PlayerStateUtil.new()
    local self = setmetatable({}, PlayerStateUtil)
    self:_init_fields()
    return self
end


function PlayerStateUtil.getInstance()
        return PlayerStateUtil.instance
end


function PlayerStateUtil:convert(state)
        if state == Player.UNREALIZED then
            return self.UNREALIZED
        elseif state == Player.REALIZED then
            return self.REALIZED
        elseif state == Player.PREFETCHED then
            return self.PREFETCHED
        elseif state == Player.STARTED then
            return self.STARTED
        elseif state == Player.CLOSED then
            return self.CLOSED
        end
        return self.commonStrings.UNKNOWN
end

PlayerStateUtil.instance = PlayerStateUtil.new()

return PlayerStateUtil

