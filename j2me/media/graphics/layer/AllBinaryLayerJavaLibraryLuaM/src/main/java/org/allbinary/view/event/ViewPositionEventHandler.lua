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
-- package org.allbinary.view.event

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
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

local ViewPositionEventHandler = {}
ViewPositionEventHandler.__index = ViewPositionEventHandler
ViewPositionEventHandler.className = "ViewPositionEventHandler"
setmetatable(ViewPositionEventHandler, {__index = BasicEventHandler})

function ViewPositionEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
end


function ViewPositionEventHandler.getInstance()
        return ViewPositionEventHandler.SINGLETON
end


function ViewPositionEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), ViewPositionEventHandler)
    self:_init_fields()
    return self
end


function ViewPositionEventHandler:addListener(layerInterface)
        if not self.list:contains(layerInterface) then
            self.list:add(layerInterface)
        end
end


function ViewPositionEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function ViewPositionEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function ViewPositionEventHandler:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local layerInterface = self.list.objectArray[index + 1]
                layerInterface:onChangeEvent(eventObject)
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
function ViewPositionEventHandler:process(eventObject, eventListenerInterface)
        local viewPositionEventListenerInterface = (eventListenerInterface)
        viewPositionEventListenerInterface:onChangeEvent(eventObject)
end

ViewPositionEventHandler.SINGLETON = ViewPositionEventHandler.new()

return ViewPositionEventHandler

