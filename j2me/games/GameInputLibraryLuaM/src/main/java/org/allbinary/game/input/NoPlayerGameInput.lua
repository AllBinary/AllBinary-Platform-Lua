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

local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoPlayerGameInput = {}
NoPlayerGameInput.__index = NoPlayerGameInput
NoPlayerGameInput.className = "NoPlayerGameInput"
setmetatable(NoPlayerGameInput, {__index = PlayerGameInput})


function NoPlayerGameInput.getInstance()
        return NoPlayerGameInput.SINGLETON
end


function NoPlayerGameInput.new()
    local self = setmetatable(PlayerGameInput.new(BasicArrayListD.new(), BasicArrayListD.new(), -1), NoPlayerGameInput)
        -- super(...) made self above
    return self
end


function NoPlayerGameInput:onDownGameKeyEvent(gameKeyEvent)
end


function NoPlayerGameInput:onUpGameKeyEvent(gameKeyEvent)
end

NoPlayerGameInput.SINGLETON = NoPlayerGameInput.new()

return NoPlayerGameInput

