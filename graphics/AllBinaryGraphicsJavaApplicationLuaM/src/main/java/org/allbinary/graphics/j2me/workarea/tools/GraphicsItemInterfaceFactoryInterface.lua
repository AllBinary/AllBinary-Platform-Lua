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

local CanvasJPanel = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel")

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
local GraphicsItemInterfaceFactoryInterface = {}
GraphicsItemInterfaceFactoryInterface.__index = GraphicsItemInterfaceFactoryInterface
GraphicsItemInterfaceFactoryInterface.className = "GraphicsItemInterfaceFactoryInterface"


function GraphicsItemInterfaceFactoryInterface:getInstance(canvasJPanel)
    error("abstract method getInstance")
end

return GraphicsItemInterfaceFactoryInterface

