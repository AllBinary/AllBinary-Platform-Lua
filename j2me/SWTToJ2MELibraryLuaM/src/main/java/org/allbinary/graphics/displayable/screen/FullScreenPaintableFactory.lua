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
-- package org.allbinary.graphics.displayable.screen

local FullScreenPaintable = require("org.allbinary.game.paint.FullScreenPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FullScreenPaintableFactory = {}
FullScreenPaintableFactory.__index = FullScreenPaintableFactory
FullScreenPaintableFactory.className = "FullScreenPaintableFactory"

function FullScreenPaintableFactory:_init_fields()
    self.paintable = FullScreenPaintable.getInstance()
end

function FullScreenPaintableFactory.new()
    local self = setmetatable({}, FullScreenPaintableFactory)
    self:_init_fields()
    return self
end


function FullScreenPaintableFactory.getInstance()
        return FullScreenPaintableFactory.instance
end

FullScreenPaintableFactory.instance = FullScreenPaintableFactory.new()

return FullScreenPaintableFactory

