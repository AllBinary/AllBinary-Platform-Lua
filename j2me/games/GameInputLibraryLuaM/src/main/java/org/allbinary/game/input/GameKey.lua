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
-- package org.allbinary.game.input

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Input = require("org.allbinary.game.input.Input")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameKey = {}
GameKey.__index = GameKey
GameKey.className = "GameKey"
setmetatable(GameKey, {__index = Input})


function GameKey.new(key, name)
    local self = setmetatable(Input.new(key, name), GameKey)
        -- super(...) made self above
    return self
end


function GameKey:toString()
        return tostring(StringMaker.new():append("GameKey "):append(tostring(Input)))
end
GameKey.__tostring = function(self) return self:toString() end

GameKey.NULL_GAME_KEY = GameKey.new(-1, StringUtil.getInstance().NULL_STRING)

return GameKey

