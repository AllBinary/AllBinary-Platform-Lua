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

-- local Control = require("javax.microedition.media.Control")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicPlayer = require("org.allbinary.media.audio.BasicPlayer")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoPlayer = {}
NoPlayer.__index = NoPlayer
NoPlayer.className = "NoPlayer"
setmetatable(NoPlayer, {__index = BasicPlayer})


function NoPlayer.new()
    local self = setmetatable(BasicPlayer.new(), NoPlayer)
    return self
end


function NoPlayer:close()
end


function NoPlayer:getContentType()
        return StringUtil.getInstance().NULL_STRING
end


function NoPlayer:getControl(controlType)
        return NullControl.new()
end


function NoPlayer:getControls()
        return java_new_array(nil, 0)
end

NoPlayer.NO_PLAYER = NoPlayer.new()

return NoPlayer

