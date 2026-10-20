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
-- package org.allbinary.graphics.j2me.workarea.canvas

-- local HashMap = require("java.util.HashMap")
local VectorCenterGenerator = require("org.allbinary.animation.vector.VectorCenterGenerator")
local DomHelper = require("org.allbinary.dom.DomHelper")
local GPoint = require("org.allbinary.graphics.GPoint")
local GraphicsStrings = require("org.allbinary.graphics.GraphicsStrings")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local WorkAreaJPanel = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local GraphicItemFactory = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local LinesGraphicItem = require("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local StdUtil = require("org.allbinary.logic.StdUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Node = require("org.w3c.dom.Node")

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

local CanvasDom = {}
CanvasDom.__index = CanvasDom
CanvasDom.className = "CanvasDom"

function CanvasDom:_init_fields()
    self.graphicsStrings = GraphicsStrings.getInstance()
    self.graphicItemHashMap = nil
    self.angle = nil
    self.dimension = nil
    self.grid = nil
end

function CanvasDom.new(...)
    local count = select("#", ...)
    if count == 1 then return CanvasDom._new1(...)
    elseif count == 1 then return CanvasDom._new1(...)
    end
end


function CanvasDom._new1(canvasNode)
    local self = setmetatable({}, CanvasDom)
    self:_init_fields()
        self.grid = Grid.new()
        self.grid.grid = PointFactory.getInstance():createXY(0, 0)
        self.dimension = IntegerDimension.new(0, 0)
        local name = canvasNode:getNodeName()
        if ((name < CanvasDom.FRAME and -1) or (name > CanvasDom.FRAME and 1) or 0) == 0 then
            self.graphicItemHashMap = StdUtil.getInstance():createHashMap()
            local angleNode = DomHelper.getInstance():searchNodeList(self.ROTATE, canvasNode:getChildNodes())
            local angleTextNode = angleNode:getFirstChild()
            local angle = (angleTextNode:getNodeValue() + 0.0)
            self:setAngle(angle)
            local sizeNode = DomHelper.getInstance():searchNodeList(self.SIZE, canvasNode:getChildNodes())
            local xNode = DomHelper.getInstance():searchNodeList(self.X, sizeNode:getChildNodes())
            local xTextNode = xNode:getFirstChild()
            local x = math.tointeger(xTextNode:getNodeValue() // 1)
            local yNode = DomHelper.getInstance():searchNodeList(self.Y, sizeNode:getChildNodes())
            local yTextNode = yNode:getFirstChild()
            local y = math.tointeger(yTextNode:getNodeValue() // 1)
            self:setWorkArea(x, y)
            local zoomNode = DomHelper.getInstance():searchNodeList(self.ZOOM, canvasNode:getChildNodes())
            local zoomTextNode = zoomNode:getFirstChild()
            self.grid:setZoom(math.tointeger(zoomTextNode:getNodeValue() // 1))
            local gridNode = DomHelper.getInstance():searchNodeList(self.GRID, canvasNode:getChildNodes())
            local gridSizeNode = DomHelper.getInstance():searchNodeList(self.SIZE, gridNode:getChildNodes())
            local gridXNode = DomHelper.getInstance():searchNodeList(self.X, gridSizeNode:getChildNodes())
            local gridXTextNode = gridXNode:getFirstChild()
            local gridX = math.tointeger(gridXTextNode:getNodeValue() // 1)
            local gridYNode = DomHelper.getInstance():searchNodeList(self.Y, gridSizeNode:getChildNodes())
            local gridYTextNode = gridYNode:getFirstChild()
            local gridY = math.tointeger(gridYTextNode:getNodeValue() // 1)
            self:setGrid(gridX, gridY)
            local enableNode = DomHelper.getInstance():searchNodeList(self.ENABLED, gridNode:getChildNodes())
            local enableTextNode = enableNode:getFirstChild()
            self.grid:showGrid(enableTextNode:getNodeValue())
            local possibleNode = DomHelper.getInstance():searchNodeList(self.POSSIBLE, gridNode:getChildNodes())
            local possibleTextNode = possibleNode:getFirstChild()
            self.grid.isGridPossible = possibleTextNode:getNodeValue()
            local graphicItemNodeList = DomHelper.getInstance():getChildrenWithoutTextNodes(self.GRAPHICITEMS, canvasNode:getChildNodes())
            if graphicItemNodeList ~= nil then
                self.graphicItemHashMap = GraphicItemFactory.getInstance():getInstance(graphicItemNodeList)
            end
        else
            error(java_exception("Exception", "Frame Element Not Found but Found: " .. name), 0)
        end
    return self
end


function CanvasDom._new1(canvasJPanel)
    local self = setmetatable({}, CanvasDom)
    self:_init_fields()
        self.angle = canvasJPanel:getAngle()
        self.graphicItemHashMap = canvasJPanel:getGraphicItemHashMap()
        self.dimension = canvasJPanel:getCanvasDimension()
        self.grid = Grid.new(canvasJPanel:getGrid())
        self.angle = canvasJPanel:getAngle()
    return self
end


function CanvasDom:getAngle()
        return self.angle
end


function CanvasDom:getGraphicItemHashMap()
        return self.graphicItemHashMap
end


function CanvasDom:setAngle(angle)
        self.angle = angle
end


-- throws Exception
function CanvasDom:setWorkArea(x, y)
        self:setDimension(IntegerDimension.new(x, y))
end


-- throws Exception
function CanvasDom:setGrid(gridX, gridY)
        self.grid.grid = PointFactory.getInstance():createXY(gridX, gridY)
end


function CanvasDom:getPointNode(point, pointName)
        local document = WorkAreaJPanel.getDocument()
        local pointNode = document:createElement(pointName)
        local xNode = document:createElement(self.X)
        local xTextNode = document:createTextNode(tostring(point:getX()))
        xNode:appendChild(xTextNode)
        local yNode = document:createElement(self.Y)
        local yTextNode = document:createTextNode(tostring(point:getY()))
        yNode:appendChild(yTextNode)
        pointNode:appendChild(xNode)
        pointNode:appendChild(yNode)
        return pointNode
end


-- throws Exception
function CanvasDom:toDom()
        local document = WorkAreaJPanel.getDocument()
        local frameNode = document:createElement(self.FRAME)
        local angleNode = document:createElement(self.ROTATE)
        local angleTextNode = document:createTextNode(tostring(self:getAngle()))
        angleNode:appendChild(angleTextNode)
        local sizeNode = self:getPointNode(PointFactory.getInstance():createXY(self:getDimension():getWidth(), self:getDimension():getHeight()), self.SIZE)
        local zoomNode = document:createElement(self.ZOOM)
        local zoomTextNode = document:createTextNode(tostring(self:getGrid():getZoom()))
        zoomNode:appendChild(zoomTextNode)
        local gridNode = document:createElement(self.GRID)
        local gridSizeNode = self:getPointNode(self:getGrid().grid, self.SIZE)
        gridNode:appendChild(gridSizeNode)
        local enableNode = document:createElement(self.ENABLED)
        local enableTextNode = document:createTextNode(tostring(self:getGrid():isGridOn()))
        enableNode:appendChild(enableTextNode)
        gridNode:appendChild(enableNode)
        local possibleNode = document:createElement(self.POSSIBLE)
        local possibleTextNode = document:createTextNode(tostring(self:getGrid():isGridPossible()))
        possibleNode:appendChild(possibleTextNode)
        gridNode:appendChild(possibleNode)
        local realSizeNode = document:createElement(CanvasDom.REAL_SIZE)
        local vectorCenterGenerator = VectorCenterGenerator.new()
        vectorCenterGenerator:calculate(self:getGraphicItemHashMap())
        local widthNode = document:createElement(self.graphicsStrings.WIDTH)
        local widthTextNode = document:createTextNode(tostring(vectorCenterGenerator:getWidth()))
        widthNode:appendChild(widthTextNode)
        realSizeNode:appendChild(widthNode)
        local heightNode = document:createElement(self.graphicsStrings.HEIGHT)
        local heightTextNode = document:createTextNode(tostring(vectorCenterGenerator:getHeight()))
        heightNode:appendChild(heightTextNode)
        realSizeNode:appendChild(heightNode)
        frameNode:appendChild(angleNode)
        frameNode:appendChild(sizeNode)
        frameNode:appendChild(zoomNode)
        frameNode:appendChild(gridNode)
        frameNode:appendChild(realSizeNode)
        local graphicItemNode = document:createElement(self.GRAPHICITEMS)
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = self.graphicItemHashMap:get(graphicItemArray[index + 1])
            if item:getName() == LinesGraphicItem.getStaticName() then
                if item:isValid() then
                    graphicItemNode:appendChild(item:toDom(self))
                end
            end
        end
        frameNode:appendChild(graphicItemNode)
        return frameNode
end


function CanvasDom:getDimension()
        return self.dimension
end


function CanvasDom:setDimension(dimension)
        self.dimension = dimension
end


function CanvasDom:getGrid()
        return self.grid
end

CanvasDom.FRAME = "frame"
CanvasDom.ROTATE = "rotate"
CanvasDom.SIZE = "size"
CanvasDom.X = "X"
CanvasDom.Y = "Y"
CanvasDom.ZOOM = "zoom"
CanvasDom.GRID = "grid"
CanvasDom.ENABLED = "enabled"
CanvasDom.POSSIBLE = "possible"
CanvasDom.GRAPHICITEMS = "graphicItems"
CanvasDom.REAL_SIZE = "realSize"

return CanvasDom

