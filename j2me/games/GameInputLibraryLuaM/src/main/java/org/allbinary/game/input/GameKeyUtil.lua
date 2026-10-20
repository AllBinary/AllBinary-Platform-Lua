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

-- local Canvas = require("javax.microedition.lcdui.Canvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameKeyUtil = {}
GameKeyUtil.__index = GameKeyUtil
GameKeyUtil.className = "GameKeyUtil"

function GameKeyUtil.new()
    local self = setmetatable({}, GameKeyUtil)
    return self
end


function GameKeyUtil:isDirectionKey(key)
        if key == Canvas.UP or key == Canvas.DOWN or key == Canvas.LEFT or key == Canvas.RIGHT then
            return true
        else
            return false
        end
end


function GameKeyUtil.getInstance()
        return GameKeyUtil.instance
end

GameKeyUtil.instance = GameKeyUtil.new()

return GameKeyUtil

