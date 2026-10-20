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

local PlayerType = {}
PlayerType.__index = PlayerType
PlayerType.className = "PlayerType"

function PlayerType:_init_fields()
    self.id = nil
    self.name = StringUtil.getInstance().EMPTY_STRING
end


function PlayerType.new(name, value)
    local self = setmetatable({}, PlayerType)
    self:_init_fields()
        self.name = name
        self.id = value
    return self
end


function PlayerType:getId()
        return self.id
end


function PlayerType:getName()
        return self.name
end


function PlayerType:toString()
        return self:getName()
end
PlayerType.__tostring = function(self) return self:toString() end

return PlayerType

