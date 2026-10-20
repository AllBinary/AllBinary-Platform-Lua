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
-- package org.allbinary.game.score

-- local Command = require("javax.microedition.lcdui.Command")
local HighScoreCommandsBaseFactory = require("org.allbinary.game.score.HighScoreCommandsBaseFactory")

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

local HighScoreCommandsFactory = {}
HighScoreCommandsFactory.__index = HighScoreCommandsFactory
HighScoreCommandsFactory.className = "HighScoreCommandsFactory"
setmetatable(HighScoreCommandsFactory, {__index = HighScoreCommandsBaseFactory})


function HighScoreCommandsFactory.getInstance()
        return HighScoreCommandsFactory.instance
end


function HighScoreCommandsFactory.new()
    local self = setmetatable(HighScoreCommandsBaseFactory.new({HighScoreCommands.getInstance().PERSONAL, HighScoreCommands.getInstance().WORLD}), HighScoreCommandsFactory)
        -- super(...) made self above
    return self
end

HighScoreCommandsFactory.instance = HighScoreCommandsFactory.new()

return HighScoreCommandsFactory

