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
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryEventCircularPool = require("org.allbinary.logic.util.event.AllBinaryEventCircularPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DestroyEventCircularStaticPool = {}
DestroyEventCircularStaticPool.__index = DestroyEventCircularStaticPool
DestroyEventCircularStaticPool.className = "DestroyEventCircularStaticPool"

function DestroyEventCircularStaticPool:_init_fields()
    self.EVENT_POOL = AllBinaryEventCircularPool.new(20)
end


function DestroyEventCircularStaticPool.getInstance()
        return DestroyEventCircularStaticPool.instance
end


function DestroyEventCircularStaticPool.new()
    local self = setmetatable({}, DestroyEventCircularStaticPool)
    self:_init_fields()
    return self
end


function DestroyEventCircularStaticPool:init(combatGameCanvas)
        self.EVENT_POOL:initAllBinaryEventCircularPool(DestroyEventFactory.new(combatGameCanvas))
end


-- throws Exception
function DestroyEventCircularStaticPool:getInstanceForLayer(layerInterface)
        local destroyedEvent = self.EVENT_POOL:getNextInstance()
        destroyedEvent:setLayerInterfaceForCircularStaticPool(layerInterface)
        return destroyedEvent
end

DestroyEventCircularStaticPool.instance = DestroyEventCircularStaticPool.new()

return DestroyEventCircularStaticPool

