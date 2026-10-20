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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyCanvasEventService = {}
MyCanvasEventService.__index = MyCanvasEventService
MyCanvasEventService.className = "MyCanvasEventService"


function MyCanvasEventService.new()
    local self = setmetatable({}, MyCanvasEventService)
    return self
end


function MyCanvasEventService.addListener(listener)
        MyCanvasEventService.listenerList:add(getmetatable(listener), listener)
end


function MyCanvasEventService.removeListener(listener)
        MyCanvasEventService.listenerList:remove(getmetatable(listener), listener)
end


-- throws Exception
function MyCanvasEventService.fire(evt)
        local listeners = MyCanvasEventService.listenerList:getListenerList()
        for i = 0, (listeners.n or #listeners) - 1, 2 do
            if listeners[i + 1] == getmetatable(listeners[i + 1 + 1]) then
                if evt:getCommand():compareTo(MyCanvasEventService.DELETE) == 0 then
                    (listeners[i + 1 + 1]):delete(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.DUPLICATE) == 0 then
                    (listeners[i + 1 + 1]):duplicate(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.SELECT) == 0 then
                    (listeners[i + 1 + 1]):select(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.ROTATE) == 0 then
                    (listeners[i + 1 + 1]):rotate(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.EXPLODE) == 0 then
                    (listeners[i + 1 + 1]):explode(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.AUTOEXPLODE) == 0 then
                    (listeners[i + 1 + 1]):autoExplode(evt)
                elseif evt:getCommand():compareTo(MyCanvasEventService.CENTER) == 0 then
                    (listeners[i + 1 + 1]):center(evt)
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

