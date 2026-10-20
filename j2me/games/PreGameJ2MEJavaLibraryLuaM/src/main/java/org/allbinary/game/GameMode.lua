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
-- package org.allbinary.game

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameMode = {}
GameMode.__index = GameMode
GameMode.className = "GameMode"

function GameMode:_init_fields()
    self.name = StringUtil.getInstance().EMPTY_STRING
end


function GameMode.new(name)
    local self = setmetatable({}, GameMode)
    self:_init_fields()
        self:setName(name)
    return self
end


function GameMode:setName(name)
        self.name = name
end


function GameMode:getName()
        return self.name
end


function GameMode:toString()
        return self:getName()
end
GameMode.__tostring = function(self) return self:toString() end

GameMode.NONE = GameMode.new(StringUtil.getInstance().NULL_STRING)
GameMode.SERVER = GameMode.new("Server")
GameMode.CLIENT = GameMode.new("Client")

return GameMode

