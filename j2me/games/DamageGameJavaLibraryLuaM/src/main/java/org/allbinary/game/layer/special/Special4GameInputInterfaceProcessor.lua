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
-- package org.allbinary.game.layer.special

local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SpecialGameInputInterfaceProcessor = require("org.allbinary.game.layer.special.SpecialGameInputInterfaceProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Special4GameInputInterfaceProcessor = {}
Special4GameInputInterfaceProcessor.__index = Special4GameInputInterfaceProcessor
Special4GameInputInterfaceProcessor.className = "Special4GameInputInterfaceProcessor"
setmetatable(Special4GameInputInterfaceProcessor, {__index = SpecialGameInputInterfaceProcessor})


function Special4GameInputInterfaceProcessor.new(collidableDestroyableDamageableLayer)
    local self = setmetatable(SpecialGameInputInterfaceProcessor.new(collidableDestroyableDamageableLayer), Special4GameInputInterfaceProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function Special4GameInputInterfaceProcessor:processEvent(allbinaryLayerManager, gameKeyEvent)
        self.specialGameInputInterface:special4(allbinaryLayerManager, gameKeyEvent)
end

return Special4GameInputInterfaceProcessor

