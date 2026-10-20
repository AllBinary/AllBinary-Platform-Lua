-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.unit

local GameInputProcessor = require("org.allbinary.game.input.GameInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UnitGameInputProcessor = {}
UnitGameInputProcessor.__index = UnitGameInputProcessor
UnitGameInputProcessor.className = "UnitGameInputProcessor"
setmetatable(UnitGameInputProcessor, {__index = GameInputProcessor})

function UnitGameInputProcessor:_init_fields()
    self.unitLayer = nil
end


function UnitGameInputProcessor.new(unitLayer)
    local self = setmetatable(GameInputProcessor.new(), UnitGameInputProcessor)
    self:_init_fields()
        self.unitLayer = unitLayer
    return self
end

return UnitGameInputProcessor

