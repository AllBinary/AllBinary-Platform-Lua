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

local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DestroyedEventHandler = {}
DestroyedEventHandler.__index = DestroyedEventHandler
DestroyedEventHandler.className = "DestroyedEventHandler"
setmetatable(DestroyedEventHandler, {__index = BasicEventHandler})

function DestroyedEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
end


function DestroyedEventHandler.getInstance()
        return DestroyedEventHandler.instance
end


function DestroyedEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), DestroyedEventHandler)
    self:_init_fields()
    return self
end


function DestroyedEventHandler:addListener(collidableDestroyableDamageableLayer)
        if not self.list:contains(collidableDestroyableDamageableLayer) then
            self.list:add(collidableDestroyableDamageableLayer)
        end
end


function DestroyedEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function DestroyedEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function DestroyedEventHandler:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local collidableDestroyableDamageableLayer = self.list.objectArray[index + 1]
                collidableDestroyableDamageableLayer:onDestroyed(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
        BasicEventHandler.fireEvent(self, eventObject)
end


-- throws Exception
function DestroyedEventHandler:process(eventObject, eventListenerInterface)
        local destroyedEventListenerInterface = eventListenerInterface
        destroyedEventListenerInterface:onDestroyed(eventObject)
end

DestroyedEventHandler.instance = DestroyedEventHandler.new()

return DestroyedEventHandler

