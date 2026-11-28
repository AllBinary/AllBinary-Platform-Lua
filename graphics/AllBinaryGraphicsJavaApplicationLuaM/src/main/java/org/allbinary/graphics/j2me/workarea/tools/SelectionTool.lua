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

local SelectionTool = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.SelectionTool"] = SelectionTool

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
local HashMap = java_lazy("java.util.HashMap")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local CanvasDom = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local CanvasJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel")
local IntegerDimension = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local RectangleCollisionPointUtil = java_lazy("org.allbinary.math.RectangleCollisionPointUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Node = java_lazy("org.w3c.dom.Node")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local MouseEvent = require("java.awt.event.MouseEvent")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local LinesGraphicItem = java_lazy("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local MouseStrings = java_lazy("org.allbinary.graphics.j2me.workarea.tools.MouseStrings")
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

-- class table SelectionTool is declared before the requires
SelectionTool.__index = SelectionTool
SelectionTool.className = "SelectionTool"
SelectionTool.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.SelectionTool"
SelectionTool.java_implements = " GraphicItemInterface "
SelectionTool.java_interfaces = function() return {GraphicItemInterface} end

function SelectionTool:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.canvasJPanel == nil then self.canvasJPanel = nil end
    self.active = true
    if self.controlIdDown == nil then self.controlIdDown = false end
    self.rectColor = Color.new(require("allbinary_java").number_value(BasicColorFactory.getInstance().RED, "intValue"))
    self.startPoint = PointFactory.getInstance().ZERO_ZERO
    self.endPoint = self.startPoint
end


function SelectionTool._jinit(self, canvasJPanel)
    SelectionTool._init_fields(self)
        self.canvasJPanel = canvasJPanel
    return self
end

function SelectionTool.new(...)
    local self = setmetatable({}, SelectionTool)
    SelectionTool._jinit(self, ...)
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
            if rawequal(item:getName(), LinesGraphicItem.getStaticName()) then
                if RectangleCollisionPointUtil.allPointsInsideCell(xRect, yRect, xRect2, yRect2, item:getPointsInterface():getPoints(), self.canvasJPanel:getXPixelsPerWorkAreaPixel(), self.canvasJPanel:getYPixelsPerWorkAreaPixel()) then
                    item:setColor(Color.YELLOW)
                    item:activate()
                elseif not (self.controlIdDown) then
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
        if rawequal(keyEvent:getKeyCode(), keyEvent.VK_CONTROL) then
            self.controlIdDown = true
        end
end


function SelectionTool:keyReleased(keyEvent)
        if rawequal(keyEvent:getKeyCode(), keyEvent.VK_CONTROL) then
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

