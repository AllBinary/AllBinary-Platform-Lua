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

-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local EventObject = require("org.allbinary.graphics.j2me.workarea.canvas.event.EventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyCanvasEvent = {}
MyCanvasEvent.__index = MyCanvasEvent
MyCanvasEvent.className = "MyCanvasEvent"
setmetatable(MyCanvasEvent, {__index = EventObject})


function MyCanvasEvent.new(source)
    local self = setmetatable(EventObject.new(source), MyCanvasEvent)
        -- super(...) made self above
    return self
end


function MyCanvasEvent:getSource()
        return EventObject.getSource(self)
end


function MyCanvasEvent:toString()
        return tostring(EventObject)
end
MyCanvasEvent.__tostring = function(self) return self:toString() end


function MyCanvasEvent:getCommand()
        local myEventSource = self:getSource()
        return myEventSource:getCommand()
end


function MyCanvasEvent:getTreeNode()
        local myEventSource = self:getSource()
        return myEventSource:getTreeNode()
end


function MyCanvasEvent:getAngle()
        local myEventSource = self:getSource()
        return myEventSource:getAngle()
end

return MyCanvasEvent

