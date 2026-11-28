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

local LinesGraphicItem = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem"] = LinesGraphicItem

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
-- local Graphics2D = require("java.awt.Graphics2D")
-- local BasicStroke = require("java.awt.BasicStroke")
-- local Graphics = require("java.awt.Graphics")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local DomHelper = java_lazy("org.allbinary.dom.DomHelper")
local GameInputStrings = java_lazy("org.allbinary.game.input.GameInputStrings")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local StatusFactory = java_lazy("org.allbinary.graphics.j2me.StatusFactory")
local CanvasDom = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local IntegerDimension = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")
local BasicGraphicsPipeline = java_lazy("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local MouseEvent = require("java.awt.event.MouseEvent")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local Points = java_lazy("org.allbinary.graphics.j2me.workarea.tools.Points")
local PointsDomUtil = java_lazy("org.allbinary.graphics.j2me.workarea.tools.PointsDomUtil")
local PointsUtil = java_lazy("org.allbinary.graphics.j2me.workarea.tools.PointsUtil")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

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

-- class table LinesGraphicItem is declared before the requires
LinesGraphicItem.__index = LinesGraphicItem
LinesGraphicItem.className = "LinesGraphicItem"
LinesGraphicItem.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem"
LinesGraphicItem.java_implements = " GraphicItemInterface "
LinesGraphicItem.java_interfaces = function() return {GraphicItemInterface} end

function LinesGraphicItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    if self.treeNode == nil then self.treeNode = nil end
    if self.pointTreeNodeVector == nil then self.pointTreeNodeVector = nil end
    if self.currentMousePoint == nil then self.currentMousePoint = nil end
    if self.fulcrumPoint == nil then self.fulcrumPoint = nil end
    self.active = false
    self.theta = 0.0
    self.color = Color.new(math.tointeger(BasicColorFactory.getInstance().WHITE // 1))
    if self.points == nil then self.points = nil end
end

function LinesGraphicItem._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return LinesGraphicItem._new0(self, ...)
    elseif count == 1 then return LinesGraphicItem._new1(self, ...)
    end
    error("No constructor of LinesGraphicItem takes " .. count .. " arguments")
end

function LinesGraphicItem.new(...)
    local self = setmetatable({}, LinesGraphicItem)
    LinesGraphicItem._jinit(self, ...)
    return self
end


function LinesGraphicItem._new0(self)
    LinesGraphicItem._init_fields(self)
        self.points = Points.new()
        local try_ok, try_error, try_value = pcall(function()
            self:init()
            self.active = true
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function LinesGraphicItem._new1(self, linesNode)
    LinesGraphicItem._init_fields(self)
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
            if rawequal(index, numberOfLines - 1) then
                local pointTwoNode = DomHelper.getInstance():searchNodeList(PointsDomUtil.getInstance().POINTTWO, pointNodes)
                self:addPoint(pointTwoNode:getChildNodes())
            end
        end
        if rawequal(numberOfLines, 0) then
            error(require("java.lang.Exception").new("Lines node does not contain a line"), 0)
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
        StatusFactory.getInstance():setStatus(require("allbinary_java").to_string("Translating: ") .. require("allbinary_java").to_string(self.points:getPoints()))
        local basicGraphicsPipeline = BasicGraphicsPipeline.new(self.points:getPoints())
        basicGraphicsPipeline:translate(x, y)
        self.points = Points.new()
        self.points:addPoints(basicGraphicsPipeline:getMatrix())
end


function LinesGraphicItem:setRotate(theta)
        while theta > 2 * require("java.lang.Math").PI do
            theta = theta - (2 * require("java.lang.Math").PI)
        end
        while theta < 0.0 do
            theta = theta + (2 * require("java.lang.Math").PI)
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
function LinesGraphicItem:addPoint_j1_1(pointNodes)
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


function LinesGraphicItem:addPoint_j1_2(point)
        self.points:getPoints():add(point)
        self.logUtil:putF(tostring(point), self, "addPoint")
        self.pointTreeNodeVector:add(DefaultMutableTreeNode.new(tostring(point)))
        self.treeNode:add(self.pointTreeNodeVector:get(self.pointTreeNodeVector:size() - 1))
end
function LinesGraphicItem:addPoint(...)
    local count = select("#", ...)
    if count == 1 then return self:addPoint_j1(...) end
    error("No method addPoint takes " .. count .. " arguments")
end
LinesGraphicItem.addPoint__jdispatcher = LinesGraphicItem.addPoint
function LinesGraphicItem:addPoint_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "NodeList")) then return LinesGraphicItem.addPoint_j1_1(self, ...) end
    return LinesGraphicItem.addPoint_j1_2(self, ...)
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
            if not rawequal(point, nil) then
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
        local try_ok, try_error, try_value = pcall(function()
            local graphics = g
            graphics:setColor(self:getColor())
            graphics:setStroke(BasicStroke.new(x))
            if self:isActive() and not rawequal(self.currentMousePoint, nil) then
                self.points:getPoints():add(self.currentMousePoint)
            end
            local tempPointVector = PointsUtil.getInstance():doTransforms(self.points:getPoints(), canvasAngle, PointFactory.getInstance():createXY(dimension:getWidth(), dimension:getHeight()))
            if self:isActive() and not rawequal(self.currentMousePoint, nil) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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
        local try_ok, try_error, try_value = pcall(function()
            local mousePoint = PointFactory.getInstance():createXY(mouseEvent:getPoint().x, mouseEvent:getPoint().y)
            if rawequal((mouseEvent:getModifiers() & mouseEvent.BUTTON1_MASK), mouseEvent.BUTTON1_MASK) then
                local point = PointFactory.getInstance():createXY(mousePoint:getX() / x, mousePoint:getY() / y)
                StatusFactory.getInstance():setStatus(require("allbinary_java").to_string("Line Point Added: ") .. require("allbinary_java").to_string(tostring(point)))
                self:addPoint(point)
            elseif rawequal((mouseEvent:getModifiers() & mouseEvent.BUTTON3_MASK), mouseEvent.BUTTON3_MASK) then
                StatusFactory.getInstance():setStatus("Line Point Removed")
                self:removePoint()
            end
            self.currentMousePoint = mousePoint
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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
        local try_ok, try_error, try_value = pcall(function()
            local mousePoint = PointFactory.getInstance():createXY(mouseEvent:getPoint().x, mouseEvent:getPoint().y)
            local point = PointFactory.getInstance():createXY(mousePoint:getX() / x, mousePoint:getY() / y)
            self.currentMousePoint = point
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "mouseMoved", e)
        end
end


function LinesGraphicItem:keyPressed(keyEvent)
        local try_ok, try_error, try_value = pcall(function()
            local keyCode = keyEvent:getKeyCode()
            if rawequal(keyCode, keyEvent.VK_ESCAPE) then
                StatusFactory.getInstance():setStatus("Deactivated")
                self:deactivate()
            elseif rawequal(keyCode, keyEvent.VK_UP) then
                self:translate(0, -1)
            elseif rawequal(keyCode, keyEvent.VK_DOWN) then
                self:translate(0, 1)
            elseif rawequal(keyCode, keyEvent.VK_LEFT) then
                self:translate(-1, 0)
            elseif rawequal(keyCode, keyEvent.VK_RIGHT) then
                self:translate(1, 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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

