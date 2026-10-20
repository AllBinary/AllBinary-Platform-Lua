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
-- package org.allbinary.logic.util.event.handler

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicEventHandlerInterface = require("org.allbinary.logic.util.event.handler.BasicEventHandlerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicEventHandler = {}
BasicEventHandler.__index = BasicEventHandler
BasicEventHandler.className = "BasicEventHandler"

function BasicEventHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.eventListenerInterfaceList = nil
end


function BasicEventHandler.new()
    local self = setmetatable({}, BasicEventHandler)
    self:_init_fields()
        self.eventListenerInterfaceList = BasicArrayListD.new()
    return self
end


function BasicEventHandler:toString()
        local stringBuffer = StringMaker.new()
        local LISTENER = " Listener: "
        stringBuffer:append("Total Listeners: ")
        stringBuffer:appendint(self.eventListenerInterfaceList:size())
        local eventListenerInterface = nil
        local index = 0
        while index < self.eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList.objectArray[index + 1]
                stringBuffer:append(LISTENER)
                stringBuffer:append(StringUtil.getInstance():toString(eventListenerInterface))
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
BasicEventHandler.__tostring = function(self) return self:toString() end


function BasicEventHandler:removeAllListeners()
        self.eventListenerInterfaceList = BasicArrayListD.new()
end


function BasicEventHandler:addListenerSingleThreaded(eventListenerInterface)
        if not self.eventListenerInterfaceList:contains(eventListenerInterface) then
            self.eventListenerInterfaceList:add(eventListenerInterface)
        end
end


function BasicEventHandler:addListenerInterface(eventListenerInterface)
        if not self.eventListenerInterfaceList:contains(eventListenerInterface) then
            self.eventListenerInterfaceList:add(eventListenerInterface)
        end
end


function BasicEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        self.eventListenerInterfaceList:remove(eventListenerInterface)
end


function BasicEventHandler:removeListener(eventListenerInterface)
        self.eventListenerInterfaceList:remove(eventListenerInterface)
end


-- throws Exception
function BasicEventHandler:fireEvent(eventObject)
        local index = 0
        local eventListenerInterface = nil
        while index < self.eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList.objectArray[index + 1]
                self:process(eventObject, eventListenerInterface)
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
function BasicEventHandler:process(eventObject, eventListenerInterface)
        eventListenerInterface:onEvent(eventObject)
end


function BasicEventHandler:getEventListenerInterfaceListP()
        return self.eventListenerInterfaceList
end

BasicEventHandler.PERFORMANCE_MESSAGE = "Use Custom onEvent Methods for needed optimization"

return BasicEventHandler

