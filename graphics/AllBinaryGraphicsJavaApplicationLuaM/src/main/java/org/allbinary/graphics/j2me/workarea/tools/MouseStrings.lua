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
-- package org.allbinary.graphics.j2me.workarea.tools

local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MouseStrings = {}
MouseStrings.__index = MouseStrings
MouseStrings.className = "MouseStrings"

function MouseStrings:_init_fields()
    self.MOUSE_PRESSED = "mousePressed"
    self.MOUSE_RELEASED = "mouseReleased"
    self.MOUSE_CLICKED = "mouseClicked"
    self.MOUSE_DRAGGED = "mouseDragged"
    self.MOUSE_MOVED = "mouseMoved"
    self.MOUSE_PRESSED_LABEL = "MousePressed" .. tostring(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_RELEASED_LABEL = "MouseReleased" .. tostring(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_CLICKED_LABEL = "MouseClicked" .. tostring(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_DRAGGED_LABEL = "MouseDragged" .. tostring(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_MOVED_LABEL = "MouseMoved" .. tostring(CommonSeps.getInstance().COLON_SEP)
end

function MouseStrings.new()
    local self = setmetatable({}, MouseStrings)
    self:_init_fields()
    return self
end


function MouseStrings.getInstance()
        return MouseStrings.instance
end

MouseStrings.instance = MouseStrings.new()

return MouseStrings

