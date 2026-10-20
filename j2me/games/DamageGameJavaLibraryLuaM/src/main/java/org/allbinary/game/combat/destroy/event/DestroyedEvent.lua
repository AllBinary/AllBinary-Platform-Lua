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
local NullGameCanvas = require("org.allbinary.game.displayable.canvas.NullGameCanvas")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DestroyedEvent = {}
DestroyedEvent.__index = DestroyedEvent
DestroyedEvent.className = "DestroyedEvent"
setmetatable(DestroyedEvent, {__index = AllBinaryEventObject})

function DestroyedEvent:_init_fields()
    self.allBinaryGameCanvas = NullGameCanvas.getInstance()
    self.allBinaryLayerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
end


function DestroyedEvent.new(combatGameCanvas)
    local self = setmetatable(AllBinaryEventObject.new(DestroyedEventHandler.getInstance()), DestroyedEvent)
    self:_init_fields()
        -- super(...) made self above
        self:setAllBinaryGameCanvas(combatGameCanvas)
    return self
end


function DestroyedEvent:getAllBinaryGameCanvas()
        return self.allBinaryGameCanvas
end


function DestroyedEvent:getLayerInterface()
        return self.allBinaryLayerInterface
end


function DestroyedEvent:setAllBinaryGameCanvas(allBinaryGameCanvas)
        self.allBinaryGameCanvas = allBinaryGameCanvas
end


function DestroyedEvent:setLayerInterfaceForCircularStaticPool(allBinaryLayerInterface)
        self.allBinaryLayerInterface = allBinaryLayerInterface
end


function DestroyedEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("DestroyedEvent: \n")
        stringBuffer:append("AllBinaryLayerInterface: ")
        stringBuffer:append(tostring(self.allBinaryLayerInterface))
        stringBuffer:append("\nAllBinaryGameCanvas: ")
        stringBuffer:append(StringUtil.getInstance():toString(self:getAllBinaryGameCanvas()))
        return tostring(stringBuffer)
end
DestroyedEvent.__tostring = function(self) return self:toString() end

return DestroyedEvent

