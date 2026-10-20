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

-- local awt = require("java.awt")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local GPoint = require("org.allbinary.graphics.GPoint")
local CanvasDom = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local IntegerDimension = require("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")
local Node = require("org.w3c.dom.Node")

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
local GraphicItemInterface = {}
GraphicItemInterface.__index = GraphicItemInterface
GraphicItemInterface.className = "GraphicItemInterface"


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

