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
-- package org.allbinary.graphics.j2me.workarea.tools.event

local MyGraphicItemEventService = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService"] = MyGraphicItemEventService

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

local EventListener = java_lazy("java.util.EventListener")
-- local EventListenerList = require("javax.swing.event.EventListenerList")
local MyGraphicItemEvent = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent")
local MyGraphicItemEventListener = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventListener")

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

-- class table MyGraphicItemEventService is declared before the requires
MyGraphicItemEventService.__index = MyGraphicItemEventService
MyGraphicItemEventService.className = "MyGraphicItemEventService"
MyGraphicItemEventService.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService"


function MyGraphicItemEventService._jinit(self)
    return self
end

function MyGraphicItemEventService.new(...)
    local self = setmetatable({}, MyGraphicItemEventService)
    MyGraphicItemEventService._jinit(self, ...)
    return self
end


function MyGraphicItemEventService.addListener(listener)
        MyGraphicItemEventService.listenerList:add((getmetatable(listener)), listener)
end


function MyGraphicItemEventService.removeListener(listener)
        MyGraphicItemEventService.listenerList:remove((getmetatable(listener)), listener)
end


-- throws Exception
function MyGraphicItemEventService.fire(evt)
        local listeners = MyGraphicItemEventService.listenerList:getListenerList()
        for i = 0, (listeners.n or #listeners) - 1, 2 do
            if listeners[i + 1] == getmetatable(listeners[i + 1 + 1]) then
                if evt:getCommand():compareTo(MyGraphicItemEventService.SELECT) == 0 then
                    ;(listeners[i + 1 + 1]):highlight(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.DESELECT) == 0 then
                    ;(listeners[i + 1 + 1]):deselect(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.DELETE) == 0 then
                    ;(listeners[i + 1 + 1]):delete(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.DUPLICATE) == 0 then
                    ;(listeners[i + 1 + 1]):duplicate(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.ROTATE) == 0 then
                    ;(listeners[i + 1 + 1]):rotate(evt)
                end
            end
        end
end

MyGraphicItemEventService.listenerList = EventListenerList.new()
MyGraphicItemEventService.DELETE = "delete"
MyGraphicItemEventService.DESELECT = "deselect"
MyGraphicItemEventService.SELECT = "select"
MyGraphicItemEventService.DUPLICATE = "duplicate"
MyGraphicItemEventService.ROTATE = "rotate"

return MyGraphicItemEventService

