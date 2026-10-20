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

-- local awt = require("java.awt")
-- local HashMap = require("java.util.HashMap")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local VectorExplosionGenerator = require("org.allbinary.animation.VectorExplosionGenerator")
local VectorMirrorGenerator = require("org.allbinary.animation.VectorMirrorGenerator")
local VectorCenterGenerator = require("org.allbinary.animation.vector.VectorCenterGenerator")
local GameInputStrings = require("org.allbinary.game.input.GameInputStrings")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local GraphicsException = require("org.allbinary.graphics.j2me.GraphicsException")
local StatusFactory = require("org.allbinary.graphics.j2me.StatusFactory")
local WorkAreaJTreeJPanel = require("org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel")
local GraphicItemFactory = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local LinesGraphicItem = require("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local MouseStrings = require("org.allbinary.graphics.j2me.workarea.tools.MouseStrings")
local Points = require("org.allbinary.graphics.j2me.workarea.tools.Points")
local ToolFactory = require("org.allbinary.graphics.j2me.workarea.tools.ToolFactory")
local MyGraphicItemEvent = require("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent")
local MyGraphicItemEventListener = require("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventListener")
local MyGraphicItemEventService = require("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService")
local RandomRotationFactory = require("org.allbinary.graphics.pipeline.RandomRotationFactory")
local LOGGING = require("org.allbinary.log.LOGGING")
local StdUtil = require("org.allbinary.logic.StdUtil")
local GuiLog = require("org.allbinary.logic.communication.log.GuiLog")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Node = require("org.w3c.dom.Node")
local JPanel = require("org.allbinary.graphics.j2me.workarea.canvas.JPanel")
local MouseListener = require("org.allbinary.graphics.j2me.workarea.canvas.MouseListener")
local MouseMotionListener = require("org.allbinary.graphics.j2me.workarea.canvas.MouseMotionListener")
local KeyListener = require("org.allbinary.graphics.j2me.workarea.canvas.KeyListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CanvasJPanel = {}
CanvasJPanel.__index = CanvasJPanel
CanvasJPanel.className = "CanvasJPanel"
setmetatable(CanvasJPanel, {__index = JPanel})

function CanvasJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.guiLog = GuiLog.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.selectedTool = nil
    self.graphicItemHashMap = nil
    self.canvasDimension = nil
    self.angle = 0.0
    self.canvasTreeNode = nil
    self.frameLabel = nil
    self.workAreaJTreeJPanel = nil
    self.grid = nil
end

function CanvasJPanel.new(...)
    local count = select("#", ...)
    if count == 4 then return CanvasJPanel._new4(...)
    elseif count == 3 then return CanvasJPanel._new3(...)
    end
end


function CanvasJPanel._new4(workAreaJTreeJPanel, dimension, x, y)
    local self = setmetatable(JPanel.new(), CanvasJPanel)
    self:_init_fields()
        self.grid = Grid.new()
        local try_ok, try_error = pcall(function()
            self.workAreaJTreeJPanel = workAreaJTreeJPanel
            self:initComponents()
            self:initMyComponents()
            self:setSize(dimension)
            self:setCanvasSize(x, y)
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.GRAPHICSCREATION) then
                self.guiLog:put("Constructor Error", self, "contructor", e)
            end
        end
    return self
end


function CanvasJPanel._new3(workAreaJTreeJPanel, dimension, canvasDom)
    local self = setmetatable(JPanel.new(), CanvasJPanel)
    self:_init_fields()
        self.grid = Grid.new(canvasDom:getGrid())
        local try_ok, try_error = pcall(function()
            self.workAreaJTreeJPanel = workAreaJTreeJPanel
            self:initComponents()
            self:initMyComponents()
            self:setSize(dimension)
            self:setCanvasSize(canvasDom:getDimension():getWidth(), canvasDom:getDimension():getHeight())
            self.graphicItemHashMap = canvasDom:getGraphicItemHashMap()
            local graphicItemArray = self.graphicItemHashMap:keySet():toArray()
            local size = (graphicItemArray.n or #graphicItemArray)
            for index = 0, size - 1 do
                local graphicItemTreeNode = graphicItemArray[index + 1]
                self.canvasTreeNode:add(graphicItemTreeNode)
            end
            self:repaint()
            self:setAngle(canvasDom:getAngle())
            self.workAreaJTreeJPanel:updateTree()
            self.workAreaJTreeJPanel:expand()
            self.workAreaJTreeJPanel:repaint()
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.GRAPHICSCREATION) then
                self.guiLog:put("Constructor Error", self, "contructor", e)
            end
        end
    return self
end


-- throws Exception
function CanvasJPanel:initMyComponents()
        self.frameLabel = CanvasTreeLabel.new("FrameLabel" .. tostring(CanvasJPanel.frame))
        self.canvasTreeNode = DefaultMutableTreeNode.new(self.frameLabel)
        CanvasJPanel.frame = CanvasJPanel.frame + 1
        self.workAreaJTreeJPanel:add(self:getTreeNode())
        self.graphicItemHashMap = StdUtil.getInstance():createHashMap()
        self.grid.grid = PointFactory.getInstance():createXY(0, 0)
        self:setCanvasDimension(IntegerDimension.new(0, 0))
        self.selectedTool = nil
        self:addKeyListener(self)
        self:addMouseListener(self)
        self:addMouseMotionListener(self)
        MyGraphicItemEventService.addListener(self)
end


function CanvasJPanel:getTreeNode()
        return self.canvasTreeNode
end


function CanvasJPanel:initComponents()
        self:setLayout(GridLayout.new(1, 1))
end


-- throws Exception
function CanvasJPanel:setCanvasSize(x, y)
        self.grid.isGridPossible = true
        if x <= 0 then
            self.grid.isGridPossible = false
            error(GraphicsException.new("X Size Error: " .. tostring(x), self, "setWorkAreaSize"), 0)
        end
        if y <= 0 then
            self.grid.isGridPossible = false
            error(GraphicsException.new("Y Size Error: " .. tostring(y), self, "setWorkAreaSize"), 0)
        end
        if x > self:getWidth() then
            self.grid.isGridPossible = false
        end
        if y > self:getHeight() then
            self.grid.isGridPossible = false
        end
        self:setCanvasDimension(IntegerDimension.new(x, y))
        self.grid.isChanged = true
end


function CanvasJPanel:setGrid(point)
        self:setGrid(point:getX(), point:getY())
end


-- Java overloaded method: Lua keeps the last definition
function CanvasJPanel:setGrid(xSize, ySize)
        local try_ok, try_error = pcall(function()
            if xSize >= self:getCanvasDimension():getWidth() / 2 or xSize < 1 then
                error(GraphicsException.new("X Size Error: " .. tostring(xSize) .. " WorkArea X: " .. tostring(self:getCanvasDimension():getWidth()), self, "setGrid"), 0)
            end
            if ySize >= self:getCanvasDimension():getHeight() / 2 or ySize < 1 then
                error(GraphicsException.new("Y Size Error" .. tostring(ySize) .. " WorkArea Y: " .. tostring(self:getCanvasDimension():getHeight()), self, "setGrid"), 0)
            end
            self.grid.grid = PointFactory.getInstance():createXY(xSize, ySize)
            self.grid.isChanged = true
        end)
        if not try_ok then
            local e = try_error
        end
end


-- throws Exception
function CanvasJPanel:setDefaultGrid()
        local xPixelsPerWorkAreaPixel = self:getWidth() / self:getCanvasDimension():getWidth()
        local yPixelsPerWorkAreaPixel = self:getHeight() / self:getCanvasDimension():getHeight()
        self:setGrid(1, 1)
        self.grid.isChanged = true
end


function CanvasJPanel:getAngle()
        return self.angle
end


function CanvasJPanel:setAngle(angle)
        self.angle = angle
end


function CanvasJPanel:addAngle(angle)
        self:setAngle(self.angle + angle)
end


function CanvasJPanel:explodeAll()
        local newPoints = BasicArrayListD.new()
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local graphicItemNode = graphicItemArray[index + 1]
            local graphicItem = self:getGraphicItemHashMap():get(graphicItemNode)
            if graphicItem:getName() == LinesGraphicItem.getStaticName() then
                while graphicItem:getPointsInterface():getSize() > 2 do
                    local newGraphicItem = GraphicItemFactory.getInstance():getInstance(graphicItem:getName()):getInstance(self)
                    local pointOne = GPoint.getInstance(graphicItem:removePoint())
                    local pointTwo = GPoint.getInstance(graphicItem:removePoint())
                    if pointOne ~= nil and pointTwo ~= nil then
                        newGraphicItem:addPoint(pointOne)
                        newGraphicItem:addPoint(pointTwo)
                    end
                    newPoints:add(newGraphicItem)
                end
            end
        end
        local size2 = newPoints:size()
        for index = 0, size2 - 1 do
            local newGraphicItem = newPoints:get(index)
            self.canvasTreeNode:add(newGraphicItem:getTreeNode())
            self:getGraphicItemHashMap():put(newGraphicItem:getTreeNode(), newGraphicItem)
        end
        self.workAreaJTreeJPanel:updateTree()
        self.workAreaJTreeJPanel:expand()
        self.workAreaJTreeJPanel:repaint()
end


-- throws Exception
function CanvasJPanel:explode(howMuch, explosionType)
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = self:getGraphicItemHashMap():get(graphicItemArray[index + 1])
            local basicArrayList = VectorExplosionGenerator.getInstance():createList(item:getPointsInterface():getPoints(), howMuch, VectorExplosionGenerator.getInstance().RANDOM)
            local newPoints = Points.new()
            newPoints:addPoints(basicArrayList)
            item:setPointsInterface(newPoints)
            local angleDelta = RandomRotationFactory.getInstance():getNextRandomAngle(howMuch)
            item:setAngle(angleDelta)
        end
        self:repaint()
end


-- throws Exception
function CanvasJPanel:mirror()
        local width = self:getCanvasDimension():getWidth()
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = self:getGraphicItemHashMap():get(graphicItemArray[index + 1])
            local basicArrayList = VectorMirrorGenerator.getInstance():getInstance(item:getPointsInterface():getPoints(), width)
            local newPoints = Points.new()
            newPoints:addPoints(basicArrayList)
            item:setPointsInterface(newPoints)
        end
        self:repaint()
end


-- throws Exception
function CanvasJPanel:center()
        VectorCenterGenerator.new():transform(self:getGraphicItemHashMap())
        self:repaint()
end


function CanvasJPanel:setNewTool()
        local try_ok, try_error = pcall(function()
            StatusFactory.getInstance():setStatus("Tool Selected")
            self.selectedTool = ToolFactory.getInstance():getSelectedToolFactory():getInstance(self)
            local newNode = self.selectedTool:getTreeNode()
            self:getGraphicItemHashMap():put(newNode, self.selectedTool)
            self.canvasTreeNode:add(newNode)
            if self:getSelectedTool() == nil then
                error(GraphicsException.new("No Tool Selected", self, "setSelectedTool"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
        end
end


-- throws Exception
function CanvasJPanel:duplicateGraphicItem(graphicItem)
        local graphicItemClone = graphicItem:duplicate()
        self:getGraphicItemHashMap():put(graphicItemClone:getTreeNode(), graphicItemClone)
        self.canvasTreeNode:add(graphicItemClone:getTreeNode())
end


-- throws Exception
function CanvasJPanel:duplicateGraphicItemHashMap(hashMap)
        local mutableTreeNodeArray = hashMap:keySet():toArray()
        local size = (mutableTreeNodeArray.n or #mutableTreeNodeArray)
        for index = 0, size - 1 do
            local treeNode = mutableTreeNodeArray[index + 1]
            local graphicItem = hashMap:get(treeNode)
            self:duplicateGraphicItem(graphicItem)
        end
end


function CanvasJPanel:getGraphicItemHashMap()
        return self.graphicItemHashMap
end


function CanvasJPanel:getXPixelsPerWorkAreaPixel()
        local x = self:getGrid().grid:getX() * (self:getWidth() - 10) / self:getCanvasDimension():getWidth()
        if self:getGrid():getZoom() == 1 then
            return 1
        else
            return x
        end
end


function CanvasJPanel:getYPixelsPerWorkAreaPixel()
        local y = self:getGrid().grid:getY() * (self:getHeight() - 10) / self:getCanvasDimension():getHeight()
        if self:getGrid():getZoom() == 1 then
            return 1
        else
            return y
        end
end


function CanvasJPanel:getSelectedTool()
        return self.selectedTool
end


function CanvasJPanel:drawItems(graphics)
        local angleDouble = self.angle
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = self:getGraphicItemHashMap():get(graphicItemArray[index + 1])
            item:paint(graphics, angleDouble, self:getCanvasDimension(), self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        end
end


function CanvasJPanel:drawGrid(graphics)
        local xAdjust = (self:getWidth() % self:getXPixelsPerWorkAreaPixel()) / 2
        local yAdjust = (self:getHeight() % self:getYPixelsPerWorkAreaPixel()) / 2
        local xLeft = xAdjust
        local yUpper = yAdjust
        local xRight = self:getWidth() - xAdjust
        local yLower = self:getHeight() - yAdjust
        graphics:setColor(CanvasJPanel.gridColor)
        for value = yAdjust, self:getHeight() - yAdjust, self:getYPixelsPerWorkAreaPixel() do
            graphics:drawLine(xLeft, value, xRight, value)
        end
        for value = xAdjust, self:getWidth() - xAdjust, self:getYPixelsPerWorkAreaPixel() do
            graphics:drawLine(value, yUpper, value, yLower)
        end
end


function CanvasJPanel:paint(graphics)
        local try_ok, try_error = pcall(function()
            if self:getGrid().isChanged then
                graphics:setColor(CanvasJPanel.backgroundColor)
                graphics:fillRect(0, 0, self:getWidth(), self:getHeight())
                if self:getGrid():getZoom() > 2 and self:getGrid().isGridOn and self:getGrid().isGridPossible then
                    self:setDefaultGrid()
                    self:drawGrid(graphics)
                end
                self:drawItems(graphics)
                graphics:drawString(tostring(self:getAngle()), self:getWidth() - 75, self:getHeight() - 15)
                self.grid.isChanged = false
            end
        end)
        if not try_ok then
            local e = try_error
        end
end


function CanvasJPanel:repaint()
        if self.grid ~= nil then
            self.grid.isChanged = true
        end
        JPanel.repaint(self)
end


-- throws Exception
function CanvasJPanel:toDom()
        return CanvasDom.new(self):toDom()
end


function CanvasJPanel:changed()
        self.grid.isChanged = true
end


function CanvasJPanel:mouseClicked(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(MouseStrings.getInstance().MOUSE_CLICKED_LABEL + self:logMouseEvent(mouseEvent))
        if self:getSelectedTool() ~= nil and self:getSelectedTool():isActive() then
            local graphicItem = self:getSelectedTool()
            graphicItem:mouseClicked(mouseEvent, self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        else
            self:setNewTool()
            local graphicItem = self:getSelectedTool()
            if graphicItem ~= nil then
                graphicItem:mouseClicked(mouseEvent, self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
            end
        end
        self.grid.isChanged = true
        self:repaint()
        self.workAreaJTreeJPanel:updateTree()
        self.workAreaJTreeJPanel:expand()
        self.workAreaJTreeJPanel:repaint()
end


function CanvasJPanel:mouseEntered(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(self:logMouseEvent(mouseEvent))
end


function CanvasJPanel:mouseExited(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(self:logMouseEvent(mouseEvent))
end


function CanvasJPanel:mousePressed(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(MouseStrings.getInstance().MOUSE_PRESSED_LABEL + self:logMouseEvent(mouseEvent))
        if self:getSelectedTool() ~= nil then
            local graphicItem = self:getSelectedTool()
            graphicItem:mousePressed(mouseEvent, self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        end
        self:requestFocus()
        self.grid.isChanged = true
        self:repaint()
end


function CanvasJPanel:mouseReleased(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(MouseStrings.getInstance().MOUSE_RELEASED_LABEL + self:logMouseEvent(mouseEvent))
        local graphicItem = self:getSelectedTool()
        if graphicItem ~= nil then
            graphicItem:mouseReleased(mouseEvent, self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        end
        self:requestFocus()
        self.grid.isChanged = true
        self:repaint()
end


function CanvasJPanel:mouseDragged(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(MouseStrings.getInstance().MOUSE_DRAGGED_LABEL + self:logMouseEvent(mouseEvent))
        local graphicItem = self:getSelectedTool()
        if graphicItem ~= nil then
            graphicItem:mouseDragged(mouseEvent, self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        end
        self:requestFocus()
        self.grid.isChanged = true
        self:repaint()
end


function CanvasJPanel:mouseMoved(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(MouseStrings.getInstance().MOUSE_MOVED_LABEL + self:logMouseEvent(mouseEvent))
        if self:getSelectedTool() ~= nil and self:getSelectedTool():isActive() then
            local graphicItem = self:getSelectedTool()
            graphicItem:mouseMoved(mouseEvent, self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        end
        self:requestFocus()
        self.grid.isChanged = true
        self:repaint()
end


function CanvasJPanel:logMouseEvent(mouseEvent)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(PositionStrings.getInstance().X_LABEL)
        stringBuffer:appendint(java_int(mouseEvent:getX() / self:getXPixelsPerWorkAreaPixel()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(PositionStrings.getInstance().Y_LABEL)
        stringBuffer:appendint(java_int(mouseEvent:getY() / self:getYPixelsPerWorkAreaPixel()))
        return tostring(stringBuffer)
end


function CanvasJPanel:keyPressed(keyEvent)
        StatusFactory.getInstance():setStatus("Key Pressed")
        local try_ok, try_error = pcall(function()
            local graphicItemArray = self.graphicItemHashMap:keySet():toArray()
            local size = (graphicItemArray.n or #graphicItemArray)
            for index = 0, size - 1 do
                local graphicItemInterface = self.graphicItemHashMap:get(graphicItemArray[index + 1])
                local keyCode = keyEvent:getKeyCode()
                if graphicItemInterface:isActive() then
                    if keyCode == keyEvent.VK_UP then
                        graphicItemInterface:translate(0, -1)
                    elseif keyCode == keyEvent.VK_DOWN then
                        graphicItemInterface:translate(0, 1)
                    elseif keyCode == keyEvent.VK_LEFT then
                        graphicItemInterface:translate(-1, 0)
                    elseif keyCode == keyEvent.VK_RIGHT then
                        graphicItemInterface:translate(1, 0)
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, self.gameInputStrings.KEY_PRESSED, e)
        end
        if self:getSelectedTool() ~= nil and self:getSelectedTool():isActive() then
            StatusFactory.getInstance():setStatus("Key Pressed for Tool")
            local graphicItem = self:getSelectedTool()
            graphicItem:keyPressed(keyEvent)
        else
            self:setNewTool()
        end
        self.grid.isChanged = true
        self:repaint()
end


function CanvasJPanel:keyReleased(keyEvent)
end


function CanvasJPanel:keyTyped(keyEvent)
end


function CanvasJPanel:delete(evt)
        self:getGraphicItemHashMap():remove(evt:getTreeNode())
        self.workAreaJTreeJPanel:updateTree()
        self.workAreaJTreeJPanel:expand()
        self.workAreaJTreeJPanel:repaint()
end


function CanvasJPanel:deselect(evt)
        local graphicItemInterface = self:getGraphicItemHashMap():get(evt:getTreeNode())
        if graphicItemInterface ~= nil then
            graphicItemInterface:setColor(Color.WHITE)
            graphicItemInterface:deactivate()
            self.workAreaJTreeJPanel:repaint()
        end
end


function CanvasJPanel:highlight(evt)
        local graphicItemInterface = self:getGraphicItemHashMap():get(evt:getTreeNode())
        if graphicItemInterface ~= nil then
            graphicItemInterface:setColor(Color.YELLOW)
            graphicItemInterface:activate()
            self.workAreaJTreeJPanel:repaint()
        end
end


-- throws Exception
function CanvasJPanel:duplicate()
        local newCanvasJPanel = CanvasJPanel.new(self.workAreaJTreeJPanel, self:getSize(), self:getCanvasDimension():getWidth(), self:getCanvasDimension():getHeight())
        newCanvasJPanel:setGrid(self:getGrid():getGrid())
        newCanvasJPanel:setAngle(self:getAngle())
        newCanvasJPanel:duplicateGraphicItemHashMap(self:getGraphicItemHashMap())
        self.workAreaJTreeJPanel:updateTree()
        self.workAreaJTreeJPanel:expand()
        self.workAreaJTreeJPanel:repaint()
        return newCanvasJPanel
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function CanvasJPanel:duplicate(event)
        local treeNode = event:getTreeNode()
        local graphicItem = self:getGraphicItemHashMap():get(treeNode)
        if graphicItem ~= nil then
            self:duplicateGraphicItem(graphicItem)
            self.workAreaJTreeJPanel:updateTree()
            self.workAreaJTreeJPanel:expand()
            self.workAreaJTreeJPanel:repaint()
        end
end


function CanvasJPanel:rotate(event)
        local treeNode = event:getTreeNode()
        local graphicItem = self:getGraphicItemHashMap():get(treeNode)
        if graphicItem ~= nil then
            graphicItem:addAngle(event:getAngle())
        end
end


function CanvasJPanel:getCanvasDimension()
        return self.canvasDimension
end


function CanvasJPanel:setCanvasDimension(canvasDimension)
        self.canvasDimension = canvasDimension
end


function CanvasJPanel:getGrid()
        return self.grid
end

CanvasJPanel.frame = 0
CanvasJPanel.gridColor = Color.new(math.tointeger(BasicColorFactory.getInstance().WHITE // 1))
CanvasJPanel.backgroundColor = Color.new(math.tointeger(BasicColorFactory.getInstance().CLEAR_COLOR // 1))

return CanvasJPanel

