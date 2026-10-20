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
-- package org.allbinary.input.event

local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local VirtualKeyboardEventHandler = {}
VirtualKeyboardEventHandler.__index = VirtualKeyboardEventHandler
VirtualKeyboardEventHandler.className = "VirtualKeyboardEventHandler"
setmetatable(VirtualKeyboardEventHandler, {__index = BasicEventHandler})

function VirtualKeyboardEventHandler:_init_fields()
    self.SHOW_EVENT = VirtualKeyboardEvent.new(BooleanFactory.getInstance().TRUE)
    self.HIDE_EVENT = VirtualKeyboardEvent.new(BooleanFactory.getInstance().FALSE)
end


function VirtualKeyboardEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), VirtualKeyboardEventHandler)
    self:_init_fields()
    return self
end


function VirtualKeyboardEventHandler.getInstance()
        return VirtualKeyboardEventHandler.gameKeyEventHandler
end


-- throws Exception
function VirtualKeyboardEventHandler:process(eventObject, eventListenerInterface)
        local virtualKeyboardEventListenerInterface = eventListenerInterface
        virtualKeyboardEventListenerInterface:onVirtualKeyboardEvent(eventObject)
end


function VirtualKeyboardEventHandler:open()
        local try_ok, try_error = pcall(function()
            java_sleep(120)
            self:fireEvent(self.SHOW_EVENT)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "open", e)
        end
end


-- throws Exception
function VirtualKeyboardEventHandler:close()
        local try_ok, try_error = pcall(function()
            java_sleep(120)
            self:fireEvent(self.HIDE_EVENT)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CLOSE, e)
        end
end

VirtualKeyboardEventHandler.gameKeyEventHandler = VirtualKeyboardEventHandler.new()

return VirtualKeyboardEventHandler

