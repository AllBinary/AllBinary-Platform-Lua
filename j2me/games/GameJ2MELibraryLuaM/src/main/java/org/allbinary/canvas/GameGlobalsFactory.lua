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
-- package org.allbinary.canvas

local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameGlobalsFactory = {}
GameGlobalsFactory.__index = GameGlobalsFactory
GameGlobalsFactory.className = "GameGlobalsFactory"

function GameGlobalsFactory:_init_fields()
    self.newCanvas = true
    self.newDisplaybleTime = java_int(Integer.MIN_VALUE)
    self.point = PointFactory.getInstance().ZERO_ZERO
end

function GameGlobalsFactory.new()
    local self = setmetatable({}, GameGlobalsFactory)
    self:_init_fields()
    return self
end


function GameGlobalsFactory.getInstance()
        return GameGlobalsFactory.instance
end

GameGlobalsFactory.instance = GameGlobalsFactory.new()

return GameGlobalsFactory

