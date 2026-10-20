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
-- package org.allbinary.game.ag.layer.weapon.mine

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerFactoryInterface = require("org.allbinary.layer.AllBinaryLayerFactoryInterface")
local ViewPositionFactoryInterface = require("org.allbinary.view.ViewPositionFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MineLayerFactory = {}
MineLayerFactory.__index = MineLayerFactory
MineLayerFactory.className = "MineLayerFactory"

function MineLayerFactory:_init_fields()
    self.viewPositionFactoryInterface = nil
end


function MineLayerFactory.new(viewPositionFactoryInterface)
    local self = setmetatable({}, MineLayerFactory)
    self:_init_fields()
        self.viewPositionFactoryInterface = viewPositionFactoryInterface
    return self
end


-- throws Exception
function MineLayerFactory:getInstance()
        return MineLayer.new(self.viewPositionFactoryInterface:getInstance())
end

return MineLayerFactory

