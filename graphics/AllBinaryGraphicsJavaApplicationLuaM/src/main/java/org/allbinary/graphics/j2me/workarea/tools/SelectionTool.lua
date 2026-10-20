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
-- local HashMap = require("java.util.HashMap")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CanvasDom = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local CanvasJPanel = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel")
local IntegerDimension = require("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local RectangleCollisionPointUtil = require("org.allbinary.math.RectangleCollisionPointUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Node = require("org.w3c.dom.Node")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectionTool = {}
SelectionTool.__index = SelectionTool
SelectionTool.className = "SelectionTool"

function SelectionTool:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasJPanel = nil
    self.active = true
    self.controlIdDown = false
    self.rectColor = Color.new(math.tointeger(BasicColorFactory.getInstance().RED // 1))
    self.startPoint = PointFactory.getInstance().ZERO_ZERO
    self.endPoint = self.startPoint
end


function SelectionTool.new(canvasJPanel)
    local self = setmetatable({}, SelectionTool)
    self:_init_fields()
        self.canvasJPanel = canvasJPanel
    return self
end


function SelectionTool:setColor(color)
end


function SelectionTool:getTreeNode()
        return nil
end


function SelectionTool:getPointsInterface()
        return nil
end


function SelectionTool:setPointsInterface(points)
end


function SelectionTool:isValid()
        return true
end


function SelectionTool:isActive()
        return self.active
end


function SelectionTool:deactivate()
end


function SelectionTool:activate()
end


function SelectionTool:setFulcrumPoint(point)
end


-- throws Exception
function SelectionTool:translate(x, y)
end


function SelectionTool:setRotate(theta)
end


function SelectionTool:addRotate(theta)
end


function SelectionTool:setAngle(angle)
end


function SelectionTool:addAngle(angle)
end


function SelectionTool:getAngle()
        return 0.0
end


function SelectionTool:makeSelection()
        local xRect = self:getXRect()
        local xRect2 = math.abs(self.endPoint:getX() - self.startPoint:getX()) + xRect
        local yRect = self:getYRect()
        local yRect2 = math.abs(self.endPoint:getY() - self.startPoint:getY()) + yRect
        local hashMap = self.canvasJPanel:getGraphicItemHashMap()
        local graphicItemArray = hashMap:keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = hashMap:get(graphicItemArray[index + 1])
            if item:getName() == LinesGraphicItem.getStaticName() then
                if RectangleCollisionPointUtil.allPointsInsideCell(xRect, yRect, xRect2, yRect2, item:getPointsInterface():getPoints(), self.canvasJPanel:getXPixelsPerWorkAreaPixel(), self.canvasJPanel:getYPixelsPerWorkAreaPixel()) then
                    item:setColor(Color.YELLOW)
                    item:activate()
                elseif not self.controlIdDown then
                    item:setColor(Color.WHITE)
                    item:deactivate()
                end
            end
        end
end


function SelectionTool:getXRect()
        local xDiff = self.endPoint:getX() - self.startPoint:getX()
        local xRect = self.startPoint:getX()
        if xDiff < 0 then
            xRect = self.endPoint:getX()
        end
        return xRect
end


function SelectionTool:getYRect()
        local yDiff = self.endPoint:getY() - self.startPoint:getY()
        local yRect = self.startPoint:getY()
        if yDiff < 0 then
            yRect = self.endPoint:getY()
        end
        return yRect
end


function SelectionTool:paint(g, canvasAngle, dimension, x, y)
        g:setColor(self.rectColor)
        local xRect = self:getXRect()
        local width = math.abs(self.endPoint:getX() - self.startPoint:getX())
        local yRect = self:getYRect()
        local height = math.abs(self.endPoint:getY() - self.startPoint:getY())
        g:drawRect(xRect, yRect, width, height)
end


-- throws Exception
function SelectionTool:toDom(canvasDom)
        return nil
end


function SelectionTool:removePoint()
        return nil
end


function SelectionTool:addPoint(point)
end


function SelectionTool:getName()
        return SelectionTool.NAME
end


function SelectionTool.getStaticName()
        return SelectionTool.NAME
end


function SelectionTool:mouseClicked(mouseEvent, xPixelsPerCell, yPixelsPerCell)
end


function SelectionTool:mouseMoved(mouseEvent, xPixelsPerCell, yPixelsPerCell)
end


function SelectionTool:mouseEntered(mouseEvent)
end


function SelectionTool:mouseExited(mouseEvent)
end


function SelectionTool:mousePressed(mouseEvent, xPixelsPerCell, yPixelsPerCell)
        self.logUtil:putF(self.commonStrings.START, self, MouseStrings.getInstance().MOUSE_PRESSED)
        self.startPoint = PointFactory.getInstance():createXY(mouseEvent:getX(), mouseEvent:getY())
        self.endPoint = self.startPoint
end


function SelectionTool:mouseReleased(mouseEvent, xPixelsPerCell, yPixelsPerCell)
        self.logUtil:putF(self.commonStrings.START, self, MouseStrings.getInstance().MOUSE_RELEASED)
        self.endPoint = PointFactory.getInstance():createXY(mouseEvent:getX(), mouseEvent:getY())
        self.active = false
        self:makeSelection()
end


function SelectionTool:mouseDragged(mouseEvent, xPixelsPerCell, yPixelsPerCell)
        self.endPoint = PointFactory.getInstance():createXY(mouseEvent:getX(), mouseEvent:getY())
end


function SelectionTool:keyPressed(keyEvent)
        if keyEvent:getKeyCode() == keyEvent.VK_CONTROL then
            self.controlIdDown = true
        end
end


function SelectionTool:keyReleased(keyEvent)
        if keyEvent:getKeyCode() == keyEvent.VK_CONTROL then
            self.controlIdDown = false
        end
end


function SelectionTool:keyTyped(keyEvent)
end


-- throws Exception
function SelectionTool:duplicate()
        return nil
end

SelectionTool.NAME = "Selection Tool"

return SelectionTool

