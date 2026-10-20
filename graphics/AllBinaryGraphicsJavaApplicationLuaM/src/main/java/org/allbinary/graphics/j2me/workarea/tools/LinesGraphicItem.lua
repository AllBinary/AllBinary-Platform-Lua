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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local DomHelper = require("org.allbinary.dom.DomHelper")
local GameInputStrings = require("org.allbinary.game.input.GameInputStrings")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local StatusFactory = require("org.allbinary.graphics.j2me.StatusFactory")
local CanvasDom = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local IntegerDimension = require("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")
local BasicGraphicsPipeline = require("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LinesGraphicItem = {}
LinesGraphicItem.__index = LinesGraphicItem
LinesGraphicItem.className = "LinesGraphicItem"

function LinesGraphicItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.treeNode = nil
    self.pointTreeNodeVector = nil
    self.currentMousePoint = nil
    self.fulcrumPoint = nil
    self.active = false
    self.theta = 0.0
    self.color = Color.new(math.tointeger(BasicColorFactory.getInstance().WHITE // 1))
    self.points = nil
end

function LinesGraphicItem.new(...)
    local count = select("#", ...)
    if count == 0 then return LinesGraphicItem._new0(...)
    elseif count == 1 then return LinesGraphicItem._new1(...)
    end
end


function LinesGraphicItem._new0()
    local self = setmetatable({}, LinesGraphicItem)
    self:_init_fields()
        self.points = Points.new()
        local try_ok, try_error = pcall(function()
            self:init()
            self.active = true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function LinesGraphicItem._new1(linesNode)
    local self = setmetatable({}, LinesGraphicItem)
    self:_init_fields()
        self.points = Points.new()
        self:init()
        self.active = false
        local lineNodes = DomHelper.getInstance():getWithoutTextNodes(linesNode:getChildNodes())
        local numberOfLines = lineNodes:size()
        for index = 0, numberOfLines - 1 do
            local lineNode = lineNodes:get(index)
            local pointNodes = DomHelper.getInstance():getWithoutTextNodes(lineNode:getChildNodes())
            local pointOneNode = DomHelper.getInstance():searchNodeList(PointsDomUtil.getInstance().POINTONE, pointNodes)
            self:addPoint(pointOneNode:getChildNodes())
            if index == numberOfLines - 1 then
                local pointTwoNode = DomHelper.getInstance():searchNodeList(PointsDomUtil.getInstance().POINTTWO, pointNodes)
                self:addPoint(pointTwoNode:getChildNodes())
            end
        end
        if numberOfLines == 0 then
            error(java_exception("Exception", "Lines node does not contain a line"), 0)
        end
    return self
end


-- throws Exception
function LinesGraphicItem:init()
        self.treeNode = DefaultMutableTreeNode.new(PointsDomUtil.getInstance().LINES + LinesGraphicItem.item)
        LinesGraphicItem.item = LinesGraphicItem.item + 1
        self.points:init()
        self.pointTreeNodeVector = BasicArrayListD.new()
        self.fulcrumPoint = PointFactory.getInstance():createXY(0, 0)
end


-- throws Exception
function LinesGraphicItem:translate(x, y)
        StatusFactory.getInstance():setStatus("Translating: " .. tostring(self.points:getPoints()))
        local basicGraphicsPipeline = BasicGraphicsPipeline.new(self.points:getPoints())
        basicGraphicsPipeline:translate(x, y)
        self.points = Points.new()
        self.points:addPoints(basicGraphicsPipeline:getMatrix())
end


function LinesGraphicItem:setRotate(theta)
        while theta > 2 * Math.PI do
            theta = theta - (2 * Math.PI)
        end
        while theta < 0.0 do
            theta = theta + (2 * Math.PI)
        end
        self.theta = theta
end


function LinesGraphicItem:addRotate(theta)
        self:setRotate(self.theta + theta)
end


function LinesGraphicItem:setAngle(angle)
        self:setRotate(math.rad(angle))
end


function LinesGraphicItem:addAngle(angle)
        self:setRotate(self.theta + math.rad(angle))
end


function LinesGraphicItem:getTreeNode()
        return self.treeNode
end


function LinesGraphicItem:getName()
        return LinesGraphicItem.NAME
end


function LinesGraphicItem.getStaticName()
        return LinesGraphicItem.NAME
end


-- throws Exception
function LinesGraphicItem:addPoint(pointNodes)
        local list = DomHelper.getInstance():getWithoutTextNodes(pointNodes)
        local xNode = DomHelper.getInstance():searchNodeList(PositionStrings.getInstance().X, list)
        local xTextNode = xNode:getFirstChild()
        local xInteger = xTextNode:getNodeValue()
        local yNode = DomHelper.getInstance():searchNodeList(PositionStrings.getInstance().Y, list)
        local yTextNode = yNode:getFirstChild()
        local yInteger = yTextNode:getNodeValue()
        local point = PointFactory.getInstance():createXY(math.tointeger(xInteger // 1), math.tointeger(yInteger // 1))
        self:addPoint(point)
end


-- Java overloaded method: Lua keeps the last definition
function LinesGraphicItem:addPoint(point)
        self.points:getPoints():add(point)
        self.logUtil:putF(tostring(point), self, "addPoint")
        self.pointTreeNodeVector:add(DefaultMutableTreeNode.new(tostring(point)))
        self.treeNode:add(self.pointTreeNodeVector:get(self.pointTreeNodeVector:size() - 1))
end


function LinesGraphicItem:removePoint()
        local point = nil
        if self.points:getSize() > 0 then
            local lastPoint = self.points:getSize() - 1
            point = self.points:getPoints():removeAt(lastPoint)
            local index = self.pointTreeNodeVector:size() - 1
            if index > 0 then
                self.treeNode:remove(self.pointTreeNodeVector:get(index))
                self.pointTreeNodeVector:remove(index)
            end
        end
        return point
end


function LinesGraphicItem:isActive()
        return self.active
end


function LinesGraphicItem:deactivate()
        self.active = false
end


function LinesGraphicItem:activate()
        self.active = true
end


-- throws Exception
function LinesGraphicItem:duplicatePoints(list)
        local size = list:size()
        for index = 0, size - 1 do
            local point = list:get(index)
            if point ~= nil then
                self.points:getPoints():add(PointFactory.getInstance():createXY(point:getX(), point:getY()))
                self.pointTreeNodeVector:add(DefaultMutableTreeNode.new(tostring(point)))
                self.treeNode:add(self.pointTreeNodeVector:get(self.pointTreeNodeVector:size() - 1))
            end
        end
end


-- throws Exception
function LinesGraphicItem:duplicate()
        local linesGraphicItem = LinesGraphicItem.new()
        linesGraphicItem:duplicatePoints(self.points:getPoints())
        linesGraphicItem:deactivate()
        return linesGraphicItem
end


function LinesGraphicItem:getAngle()
        return math.deg(self.theta)
end


function LinesGraphicItem:setFulcrumPoint(point)
        self.fulcrumPoint = point
end


function LinesGraphicItem:paint(g, canvasAngle, dimension, x, y)
        local try_ok, try_error = pcall(function()
            local graphics = g
            graphics:setColor(self:getColor())
            graphics:setStroke(BasicStroke.new(x))
            if self:isActive() and self.currentMousePoint ~= nil then
                self.points:getPoints():add(self.currentMousePoint)
            end
            local tempPointVector = PointsUtil.getInstance():doTransforms(self.points:getPoints(), canvasAngle, PointFactory.getInstance():createXY(dimension:getWidth(), dimension:getHeight()))
            if self:isActive() and self.currentMousePoint ~= nil then
                self.currentMousePoint = self.points:getPoints():removeAt(self.points:getSize() - 1)
            end
            local size = tempPointVector:size()
            local firstPoint = nil
            if size > 0 then
                firstPoint = tempPointVector:get(0)
            end
            for index = 1, size - 1 do
                local secondPoint = tempPointVector:get(index)
                graphics:drawLine((firstPoint:getX() * x) - (java_idiv(x, 4)), (firstPoint:getY() * y) - (java_idiv(y, 4)), (secondPoint:getX() * x) - (java_idiv(x, 4)), (secondPoint:getY() * y) - (java_idiv(y, 4)))
                firstPoint = secondPoint
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "mouseMoved", e)
        end
end


-- throws Exception
function LinesGraphicItem:toDom(canvasDom)
        return PointsDomUtil.getInstance():toDom(canvasDom, self.points:getPoints())
end


function LinesGraphicItem:isValid()
        return self.points:isValid()
end


function LinesGraphicItem:getPointsInterface()
        return self.points
end


function LinesGraphicItem:setPointsInterface(points)
        self.points = points
end


function LinesGraphicItem:getColor()
        return self.color
end


function LinesGraphicItem:setColor(color)
        self.color = color
end


function LinesGraphicItem:mouseClicked(mouseEvent, x, y)
        local try_ok, try_error = pcall(function()
            local mousePoint = PointFactory.getInstance():createXY(mouseEvent:getPoint().x, mouseEvent:getPoint().y)
            if (mouseEvent:getModifiers() & mouseEvent.BUTTON1_MASK) == mouseEvent.BUTTON1_MASK then
                local point = PointFactory.getInstance():createXY(mousePoint:getX() / x, mousePoint:getY() / y)
                StatusFactory.getInstance():setStatus("Line Point Added: " .. tostring(point))
                self:addPoint(point)
            elseif (mouseEvent:getModifiers() & mouseEvent.BUTTON3_MASK) == mouseEvent.BUTTON3_MASK then
                StatusFactory.getInstance():setStatus("Line Point Removed")
                self:removePoint()
            end
            self.currentMousePoint = mousePoint
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "mouseMoved", e)
        end
end


function LinesGraphicItem:mouseEntered(mouseEvent)
end


function LinesGraphicItem:mouseExited(mouseEvent)
end


function LinesGraphicItem:mousePressed(mouseEvent, xPixelsPerCell, yPixelsPerCell)
end


function LinesGraphicItem:mouseReleased(mouseEvent, xPixelsPerCell, yPixelsPerCell)
end


function LinesGraphicItem:mouseDragged(mouseEvent, xPixelsPerCell, yPixelsPerCell)
end


function LinesGraphicItem:mouseMoved(mouseEvent, x, y)
        local try_ok, try_error = pcall(function()
            local mousePoint = PointFactory.getInstance():createXY(mouseEvent:getPoint().x, mouseEvent:getPoint().y)
            local point = PointFactory.getInstance():createXY(mousePoint:getX() / x, mousePoint:getY() / y)
            self.currentMousePoint = point
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "mouseMoved", e)
        end
end


function LinesGraphicItem:keyPressed(keyEvent)
        local try_ok, try_error = pcall(function()
            local keyCode = keyEvent:getKeyCode()
            if keyCode == keyEvent.VK_ESCAPE then
                StatusFactory.getInstance():setStatus("Deactivated")
                self:deactivate()
            elseif keyCode == keyEvent.VK_UP then
                self:translate(0, -1)
            elseif keyCode == keyEvent.VK_DOWN then
                self:translate(0, 1)
            elseif keyCode == keyEvent.VK_LEFT then
                self:translate(-1, 0)
            elseif keyCode == keyEvent.VK_RIGHT then
                self:translate(1, 0)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.KEY_PRESSED, e)
        end
end


function LinesGraphicItem:keyReleased(keyEvent)
end


function LinesGraphicItem:keyTyped(keyEvent)
end

LinesGraphicItem.RECT = "rect"
LinesGraphicItem.ARC = "arc"
LinesGraphicItem.STRING = "string"
LinesGraphicItem.CHAR = "char"
LinesGraphicItem.IMAGE = "image"
LinesGraphicItem.item = 0
LinesGraphicItem.NAME = "Line Tool"

return LinesGraphicItem

