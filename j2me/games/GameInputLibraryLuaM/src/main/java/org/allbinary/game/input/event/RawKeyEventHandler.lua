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
-- package org.allbinary.game.input.event

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local RawKeyEventHandler = {}
RawKeyEventHandler.__index = RawKeyEventHandler
RawKeyEventHandler.className = "RawKeyEventHandler"

function RawKeyEventHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.eventListenerInterfaceList = nil
end


function RawKeyEventHandler.getInstance()
        return RawKeyEventHandler.instance
end


function RawKeyEventHandler.new()
    local self = setmetatable({}, RawKeyEventHandler)
    self:_init_fields()
        self.eventListenerInterfaceList = BasicArrayListD.new()
    return self
end


function RawKeyEventHandler:removeAllListeners()
        self.eventListenerInterfaceList = BasicArrayListD.new()
end


function RawKeyEventHandler:addListeners(vector)
        local eventListenerInterface = nil
        local size = vector:size()
        for index = 0, size - 1 do
            eventListenerInterface = vector:get(index)
            self:addListener(eventListenerInterface)
        end
end


function RawKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        if not self.eventListenerInterfaceList:contains(eventListenerInterface) then
            self.eventListenerInterfaceList:add(eventListenerInterface)
        end
end


function RawKeyEventHandler:addListener(eventListenerInterface)
        if not self.eventListenerInterfaceList:contains(eventListenerInterface) then
            self.eventListenerInterfaceList:add(eventListenerInterface)
        end
end


function RawKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        self.eventListenerInterfaceList:remove(eventListenerInterface)
end


function RawKeyEventHandler:removeListener(eventListenerInterface)
        self.eventListenerInterfaceList:remove(eventListenerInterface)
end


-- throws Exception
function RawKeyEventHandler:fireEvent(keyCode, deviceId, repeated)
        local eventListenerInterface = nil
        local index = 0
        while index < self.eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList:get(index)
                self:process(keyCode, deviceId, repeated, eventListenerInterface)
            end)
            if not try_ok then
                local e = try_error
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            index = index + 1
        end
end


-- throws Exception
function RawKeyEventHandler:process(keyCode, deviceId, repeated, eventListenerInterface)
        eventListenerInterface:onEventRaw(keyCode, deviceId, repeated)
end


function RawKeyEventHandler:getEventListenerInterfaceListP()
        return self.eventListenerInterfaceList
end


function RawKeyEventHandler:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(RawKeyEventHandler.TOTAL_LISTENERS)
        stringBuffer:appendint(self.eventListenerInterfaceList:size())
        local eventListenerInterface = nil
        local index = 0
        while index < self.eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList:get(index)
                stringBuffer:append(RawKeyEventHandler.LISTENER_LABEL)
                stringBuffer:append(tostring(eventListenerInterface))
            end)
            if not try_ok then
                local e = try_error
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.TOSTRING, e)
            end
            index = index + 1
        end
        return tostring(stringBuffer)
end
RawKeyEventHandler.__tostring = function(self) return self:toString() end

RawKeyEventHandler.instance = RawKeyEventHandler.new()
RawKeyEventHandler.TOTAL_LISTENERS = "Total Listeners: "
RawKeyEventHandler.LISTENER_LABEL = " Listener: "

return RawKeyEventHandler

