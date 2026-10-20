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
-- package org.allbinary.game.combat.destroy.event

local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local AllBinaryEventObjectFactoryInterface = require("org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DestroyEventFactory = {}
DestroyEventFactory.__index = DestroyEventFactory
DestroyEventFactory.className = "DestroyEventFactory"

function DestroyEventFactory:_init_fields()
    self.combatGameCanvas = nil
end


function DestroyEventFactory.new(combatGameCanvas)
    local self = setmetatable({}, DestroyEventFactory)
    self:_init_fields()
        self.combatGameCanvas = combatGameCanvas
    return self
end


function DestroyEventFactory:getInstance()
        return DestroyedEvent.new(self.combatGameCanvas)
end

return DestroyEventFactory

