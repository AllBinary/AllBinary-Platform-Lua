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

-- Java interface
local MyCanvasEventListener = {}
MyCanvasEventListener.__index = MyCanvasEventListener
MyCanvasEventListener.className = "MyCanvasEventListener"


function MyCanvasEventListener:delete(evt)
    error("abstract method delete")
end


-- throws Exception
function MyCanvasEventListener:duplicate(evt)
    error("abstract method duplicate")
end


function MyCanvasEventListener:select(evt)
    error("abstract method select")
end


function MyCanvasEventListener:rotate(evt)
    error("abstract method rotate")
end


function MyCanvasEventListener:explode(evt)
    error("abstract method explode")
end


-- throws Exception
function MyCanvasEventListener:autoExplode(evt)
    error("abstract method autoExplode")
end


-- throws Exception
function MyCanvasEventListener:center(evt)
    error("abstract method center")
end

return MyCanvasEventListener

