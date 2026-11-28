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

local BasicEventHandler = {}
package.loaded["org.allbinary.logic.util.event.handler.BasicEventHandler"] = BasicEventHandler

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = java_lazy("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicEventHandlerInterface = require("org.allbinary.logic.util.event.handler.BasicEventHandlerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicEventHandler is declared before the requires
BasicEventHandler.__index = BasicEventHandler
BasicEventHandler.className = "BasicEventHandler"
BasicEventHandler.javaClassName = "org.allbinary.logic.util.event.handler.BasicEventHandler"
BasicEventHandler.java_implements = " BasicEventHandlerInterface "
BasicEventHandler.java_interfaces = function() return {BasicEventHandlerInterface} end

function BasicEventHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.eventListenerInterfaceList == nil then self.eventListenerInterfaceList = nil end
end


function BasicEventHandler._jinit(self)
    BasicEventHandler._init_fields(self)
        self.eventListenerInterfaceList = BasicArrayListD.new()
    return self
end

function BasicEventHandler.new(...)
    local self = setmetatable({}, BasicEventHandler)
    BasicEventHandler._jinit(self, ...)
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
            local try_ok, try_error, try_value = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList.objectArray[index + 1]
                stringBuffer:append(LISTENER)
                stringBuffer:append(StringUtil.getInstance():toString(eventListenerInterface))
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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
        if not (self.eventListenerInterfaceList:contains(eventListenerInterface)) then
            self.eventListenerInterfaceList:add(eventListenerInterface)
        end
end


function BasicEventHandler:addListenerInterface(eventListenerInterface)
        if not (self.eventListenerInterfaceList:contains(eventListenerInterface)) then
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
            local try_ok, try_error, try_value = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList.objectArray[index + 1]
                self:process(eventObject, eventListenerInterface)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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

