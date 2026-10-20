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
-- package org.allbinary.media.graphics.geography.map

local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
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

local GeographicMapEventHandler = {}
GeographicMapEventHandler.__index = GeographicMapEventHandler
GeographicMapEventHandler.className = "GeographicMapEventHandler"
setmetatable(GeographicMapEventHandler, {__index = BasicEventHandler})

function GeographicMapEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
end


function GeographicMapEventHandler.getInstance()
        return GeographicMapEventHandler.instance
end


function GeographicMapEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), GeographicMapEventHandler)
    self:_init_fields()
    return self
end


function GeographicMapEventHandler:addListener(gameLayer)
        if not self.list:contains(gameLayer) then
            self.list:add(gameLayer)
        end
end


function GeographicMapEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function GeographicMapEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


function GeographicMapEventHandler:fireEvent()
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local gameLayer = self.list:get(index)
                gameLayer:move()
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
end

GeographicMapEventHandler.instance = GeographicMapEventHandler.new()

return GeographicMapEventHandler

