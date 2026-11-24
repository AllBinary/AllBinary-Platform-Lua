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
-- package org.allbinary.graphics.j2me.workarea.canvas.event

local MyCanvasEventService = {}
package.loaded["org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService"] = MyCanvasEventService

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
local MyCanvasEvent = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventListener = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventListener")

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

-- class table MyCanvasEventService is declared before the requires
MyCanvasEventService.__index = MyCanvasEventService
MyCanvasEventService.className = "MyCanvasEventService"
MyCanvasEventService.javaClassName = "org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService"


function MyCanvasEventService._jinit(self)
    return self
end

function MyCanvasEventService.new(...)
    local self = setmetatable({}, MyCanvasEventService)
    MyCanvasEventService._jinit(self, ...)
    return self
end


function MyCanvasEventService.addListener(listener)
        MyCanvasEventService.listenerList:add((getmetatable(listener)), listener)
end


function MyCanvasEventService.removeListener(listener)
        MyCanvasEventService.listenerList:remove((getmetatable(listener)), listener)
end


-- throws Exception
function MyCanvasEventService.fire(evt)
        local listeners = MyCanvasEventService.listenerList:getListenerList()
        for i = 0, (listeners.n or #listeners) - 1, 2 do
            if listeners[i + 1] == getmetatable(listeners[i + 1 + 1]) then
                if evt:getCommand():compareTo(MyCanvasEventService.DELETE) == 0 then
                    ;(listeners[i + 1 + 1]):delete(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.DUPLICATE) == 0 then
                    ;(listeners[i + 1 + 1]):duplicate(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.SELECT) == 0 then
                    ;(listeners[i + 1 + 1]):select(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.ROTATE) == 0 then
                    ;(listeners[i + 1 + 1]):rotate(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.EXPLODE) == 0 then
                    ;(listeners[i + 1 + 1]):explode(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.AUTOEXPLODE) == 0 then
                    ;(listeners[i + 1 + 1]):autoExplode(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.CENTER) == 0 then
                    ;(listeners[i + 1 + 1]):center(evt)
                end
            end
        end
end

MyCanvasEventService.listenerList = EventListenerList.new()
MyCanvasEventService.DELETE = "delete"
MyCanvasEventService.DUPLICATE = "duplicate"
MyCanvasEventService.SELECT = "select"
MyCanvasEventService.ROTATE = "rotate"
MyCanvasEventService.EXPLODE = "explode"
MyCanvasEventService.AUTOEXPLODE = "autoExplode"
MyCanvasEventService.CENTER = "center"

return MyCanvasEventService

