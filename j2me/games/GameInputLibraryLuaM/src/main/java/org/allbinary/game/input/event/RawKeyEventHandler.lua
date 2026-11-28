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

local RawKeyEventHandler = {}
package.loaded["org.allbinary.game.input.event.RawKeyEventHandler"] = RawKeyEventHandler

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
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local RawKeyEventListener = java_lazy("org.allbinary.game.input.event.RawKeyEventListener")

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

-- class table RawKeyEventHandler is declared before the requires
RawKeyEventHandler.__index = RawKeyEventHandler
RawKeyEventHandler.className = "RawKeyEventHandler"
RawKeyEventHandler.javaClassName = "org.allbinary.game.input.event.RawKeyEventHandler"

function RawKeyEventHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.eventListenerInterfaceList == nil then self.eventListenerInterfaceList = nil end
end


function RawKeyEventHandler.getInstance()
        return RawKeyEventHandler.instance_f
end


function RawKeyEventHandler._jinit(self)
    RawKeyEventHandler._init_fields(self)
        self.eventListenerInterfaceList = BasicArrayListD.new()
    return self
end

function RawKeyEventHandler.new(...)
    local self = setmetatable({}, RawKeyEventHandler)
    RawKeyEventHandler._jinit(self, ...)
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
        if not (self.eventListenerInterfaceList:contains(eventListenerInterface)) then
            self.eventListenerInterfaceList:add(eventListenerInterface)
        end
end


function RawKeyEventHandler:addListener(eventListenerInterface)
        if not (self.eventListenerInterfaceList:contains(eventListenerInterface)) then
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
            local try_ok, try_error, try_value = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList:get(index)
                self:process(keyCode, deviceId, repeated, eventListenerInterface)
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
            local try_ok, try_error, try_value = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList:get(index)
                stringBuffer:append(RawKeyEventHandler.LISTENER_LABEL)
                stringBuffer:append(tostring(eventListenerInterface))
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
RawKeyEventHandler.__tostring = function(self) return self:toString() end

RawKeyEventHandler.instance_f = RawKeyEventHandler.new()
RawKeyEventHandler.TOTAL_LISTENERS = "Total Listeners: "
RawKeyEventHandler.LISTENER_LABEL = " Listener: "

return RawKeyEventHandler

