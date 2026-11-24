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

local GraphicItemInterface = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface"] = GraphicItemInterface

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

-- local Color = require("java.awt.Color")
-- local Graphics = require("java.awt.Graphics")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local CanvasDom = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local IntegerDimension = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")
local Node = java_lazy("org.w3c.dom.Node")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local MouseEvent = require("java.awt.event.MouseEvent")
local Points = java_lazy("org.allbinary.graphics.j2me.workarea.tools.Points")

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

-- Java interface
-- class table GraphicItemInterface is declared before the requires
GraphicItemInterface.__index = GraphicItemInterface
GraphicItemInterface.className = "GraphicItemInterface"
GraphicItemInterface.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface"


function GraphicItemInterface:getName()
    error("abstract method getName")
end


function GraphicItemInterface:setColor(color)
    error("abstract method setColor")
end


function GraphicItemInterface:getTreeNode()
    error("abstract method getTreeNode")
end


function GraphicItemInterface:getPointsInterface()
    error("abstract method getPointsInterface")
end


function GraphicItemInterface:setPointsInterface(points)
    error("abstract method setPointsInterface")
end


function GraphicItemInterface:isValid()
    error("abstract method isValid")
end


function GraphicItemInterface:isActive()
    error("abstract method isActive")
end


function GraphicItemInterface:deactivate()
    error("abstract method deactivate")
end


function GraphicItemInterface:activate()
    error("abstract method activate")
end


function GraphicItemInterface:setFulcrumPoint(point)
    error("abstract method setFulcrumPoint")
end


-- throws Exception
function GraphicItemInterface:translate(x, y)
    error("abstract method translate")
end


function GraphicItemInterface:setRotate(theta)
    error("abstract method setRotate")
end


function GraphicItemInterface:addRotate(theta)
    error("abstract method addRotate")
end


function GraphicItemInterface:setAngle(angle)
    error("abstract method setAngle")
end


function GraphicItemInterface:addAngle(angle)
    error("abstract method addAngle")
end


function GraphicItemInterface:getAngle()
    error("abstract method getAngle")
end


function GraphicItemInterface:paint(g, canvasAngle, dimension, x, y)
    error("abstract method paint")
end


-- throws Exception
function GraphicItemInterface:toDom(canvasDom)
    error("abstract method toDom")
end


function GraphicItemInterface:removePoint()
    error("abstract method removePoint")
end


function GraphicItemInterface:addPoint(point)
    error("abstract method addPoint")
end


function GraphicItemInterface:mouseClicked(mouseEvent, xPixelsPerCell, yPixelsPerCell)
    error("abstract method mouseClicked")
end


function GraphicItemInterface:mouseEntered(mouseEvent)
    error("abstract method mouseEntered")
end


function GraphicItemInterface:mouseExited(mouseEvent)
    error("abstract method mouseExited")
end


function GraphicItemInterface:mousePressed(mouseEvent, xPixelsPerCell, yPixelsPerCell)
    error("abstract method mousePressed")
end


function GraphicItemInterface:mouseReleased(mouseEvent, xPixelsPerCell, yPixelsPerCell)
    error("abstract method mouseReleased")
end


function GraphicItemInterface:mouseDragged(mouseEvent, xPixelsPerCell, yPixelsPerCell)
    error("abstract method mouseDragged")
end


function GraphicItemInterface:mouseMoved(mouseEvent, xPixelsPerCell, yPixelsPerCell)
    error("abstract method mouseMoved")
end


function GraphicItemInterface:keyPressed(keyEvent)
    error("abstract method keyPressed")
end


function GraphicItemInterface:keyReleased(keyEvent)
    error("abstract method keyReleased")
end


function GraphicItemInterface:keyTyped(keyEvent)
    error("abstract method keyTyped")
end


-- throws Exception
function GraphicItemInterface:duplicate()
    error("abstract method duplicate")
end

return GraphicItemInterface

