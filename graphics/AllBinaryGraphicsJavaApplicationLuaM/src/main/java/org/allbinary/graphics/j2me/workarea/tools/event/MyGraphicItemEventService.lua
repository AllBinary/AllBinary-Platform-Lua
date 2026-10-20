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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyGraphicItemEventService = {}
MyGraphicItemEventService.__index = MyGraphicItemEventService
MyGraphicItemEventService.className = "MyGraphicItemEventService"


function MyGraphicItemEventService.new()
    local self = setmetatable({}, MyGraphicItemEventService)
    return self
end


function MyGraphicItemEventService.addListener(listener)
        MyGraphicItemEventService.listenerList:add(getmetatable(listener), listener)
end


function MyGraphicItemEventService.removeListener(listener)
        MyGraphicItemEventService.listenerList:remove(getmetatable(listener), listener)
end


-- throws Exception
function MyGraphicItemEventService.fire(evt)
        local listeners = MyGraphicItemEventService.listenerList:getListenerList()
        for i = 0, (listeners.n or #listeners) - 1, 2 do
            if listeners[i + 1] == getmetatable(listeners[i + 1 + 1]) then
                if evt:getCommand():compareTo(MyGraphicItemEventService.SELECT) == 0 then
                    (listeners[i + 1 + 1]):highlight(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.DESELECT) == 0 then
                    (listeners[i + 1 + 1]):deselect(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.DELETE) == 0 then
                    (listeners[i + 1 + 1]):delete(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.DUPLICATE) == 0 then
                    (listeners[i + 1 + 1]):duplicate(evt)
                elseif evt:getCommand():compareTo(MyGraphicItemEventService.ROTATE) == 0 then
                    (listeners[i + 1 + 1]):rotate(evt)
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

