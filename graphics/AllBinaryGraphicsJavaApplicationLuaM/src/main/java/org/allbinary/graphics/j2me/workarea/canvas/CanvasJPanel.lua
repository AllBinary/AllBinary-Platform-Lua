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

local CanvasJPanel = {}
package.loaded["org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel"] = CanvasJPanel

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
-- local Dimension = require("java.awt.Dimension")
-- local Graphics = require("java.awt.Graphics")
local HashMap = java_lazy("java.util.HashMap")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local VectorExplosionGenerator = java_lazy("org.allbinary.animation.VectorExplosionGenerator")
local VectorMirrorGenerator = java_lazy("org.allbinary.animation.VectorMirrorGenerator")
local VectorCenterGenerator = java_lazy("org.allbinary.animation.vector.VectorCenterGenerator")
local GameInputStrings = java_lazy("org.allbinary.game.input.GameInputStrings")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local GraphicsException = java_lazy("org.allbinary.graphics.j2me.GraphicsException")
local StatusFactory = java_lazy("org.allbinary.graphics.j2me.StatusFactory")
local WorkAreaJTreeJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel")
local GraphicItemFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory")
local GraphicItemInterface = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local LinesGraphicItem = java_lazy("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local MouseStrings = java_lazy("org.allbinary.graphics.j2me.workarea.tools.MouseStrings")
local Points = java_lazy("org.allbinary.graphics.j2me.workarea.tools.Points")
local ToolFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.ToolFactory")
local MyGraphicItemEvent = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent")
local MyGraphicItemEventListener = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventListener")
local MyGraphicItemEventService = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService")
local RandomRotationFactory = java_lazy("org.allbinary.graphics.pipeline.RandomRotationFactory")
local LOGGING = java_lazy("org.allbinary.log.LOGGING")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local GuiLog = java_lazy("org.allbinary.logic.communication.log.GuiLog")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Node = java_lazy("org.w3c.dom.Node")
-- local GridLayout = require("java.awt.GridLayout")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local KeyListener = require("java.awt.event.KeyListener")
-- local MouseEvent = require("java.awt.event.MouseEvent")
-- local MouseListener = require("java.awt.event.MouseListener")
-- local MouseMotionListener = require("java.awt.event.MouseMotionListener")
-- local JPanel = require("javax.swing.JPanel")
local CanvasDom = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local CanvasTreeLabel = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasTreeLabel")
local Grid = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.Grid")
local IntegerDimension = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table CanvasJPanel is declared before the requires
CanvasJPanel.__index = CanvasJPanel
CanvasJPanel.className = "CanvasJPanel"
CanvasJPanel.javaClassName = "org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel"
setmetatable(CanvasJPanel, {__index = JPanel})
CanvasJPanel.java_implements = " MouseListener MouseMotionListener KeyListener MyGraphicItemEventListener "
CanvasJPanel.java_interfaces = function() return {MouseListener, MouseMotionListener, KeyListener, MyGraphicItemEventListener} end

function CanvasJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.guiLog = GuiLog.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.selectedTool = nil
    if self.graphicItemHashMap == nil then self.graphicItemHashMap = nil end
    if self.canvasDimension == nil then self.canvasDimension = nil end
    self.angle = 0.0
    if self.canvasTreeNode == nil then self.canvasTreeNode = nil end
    if self.frameLabel == nil then self.frameLabel = nil end
    if self.workAreaJTreeJPanel == nil then self.workAreaJTreeJPanel = nil end
    if self.grid == nil then self.grid = nil end
end

function CanvasJPanel._jinit(self, ...)
    local count = select("#", ...)
    if count == 4 then return CanvasJPanel._new4(self, ...)
    elseif count == 3 then return CanvasJPanel._new3(self, ...)
    end
    error("No constructor of CanvasJPanel takes " .. count .. " arguments")
end

function CanvasJPanel.new(...)
    local self = setmetatable({}, CanvasJPanel)
    CanvasJPanel._jinit(self, ...)
    return self
end


function CanvasJPanel._new4(self, workAreaJTreeJPanel, dimension, x, y)
    java_super_init(JPanel, self)
    CanvasJPanel._init_fields(self)
        self.grid = Grid.new()
        local try_ok, try_error, try_value = pcall(function()
            self.workAreaJTreeJPanel = workAreaJTreeJPanel
            self:initComponents()
            self:initMyComponents()
            self:setSize(dimension)
            self:setCanvasSize(x, y)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.GRAPHICSCREATION) then
                self.guiLog:put("Constructor Error", self, "contructor", e)
            end
        end
    return self
end


function CanvasJPanel._new3(self, workAreaJTreeJPanel, dimension, canvasDom)
    java_super_init(JPanel, self)
    CanvasJPanel._init_fields(self)
        self.grid = Grid.new(canvasDom:getGrid())
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.GRAPHICSCREATION) then
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
java_overload(CanvasJPanel, "initMyComponents", 0)


function CanvasJPanel:getTreeNode()
        return self.canvasTreeNode
end
java_overload(CanvasJPanel, "getTreeNode", 0)


function CanvasJPanel:initComponents()
        self:setLayout(GridLayout.new(1, 1))
end
java_overload(CanvasJPanel, "initComponents", 0)


-- throws Exception
function CanvasJPanel:setCanvasSize(x, y)
        self.grid.isGridPossible_f = true
        if x <= 0 then
            self.grid.isGridPossible_f = false
            error(GraphicsException.new("X Size Error: " .. tostring(x), self, "setWorkAreaSize"), 0)
        end
        if y <= 0 then
            self.grid.isGridPossible_f = false
            error(GraphicsException.new("Y Size Error: " .. tostring(y), self, "setWorkAreaSize"), 0)
        end
        if x > self:getWidth() then
            self.grid.isGridPossible_f = false
        end
        if y > self:getHeight() then
            self.grid.isGridPossible_f = false
        end
        self:setCanvasDimension(IntegerDimension.new(x, y))
        self.grid.isChanged = true
end
java_overload(CanvasJPanel, "setCanvasSize", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function CanvasJPanel:setGrid_j1(point)
        self:setGrid(point:getX(), point:getY())
end


function CanvasJPanel:setGrid_j2(xSize, ySize)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end
function CanvasJPanel:setGrid(...)
    local count = select("#", ...)
    if count == 1 then return self:setGrid_j1(...) end
    if count == 2 then return self:setGrid_j2(...) end
    error("No method setGrid takes " .. count .. " arguments")
end
CanvasJPanel.setGrid__jdispatcher = CanvasJPanel.setGrid


-- throws Exception
function CanvasJPanel:setDefaultGrid()
        local xPixelsPerWorkAreaPixel = self:getWidth() / self:getCanvasDimension():getWidth()
        local yPixelsPerWorkAreaPixel = self:getHeight() / self:getCanvasDimension():getHeight()
        self:setGrid(1, 1)
        self.grid.isChanged = true
end
java_overload(CanvasJPanel, "setDefaultGrid", 0)


function CanvasJPanel:getAngle()
        return self.angle
end
java_overload(CanvasJPanel, "getAngle", 0)


function CanvasJPanel:setAngle(angle)
        self.angle = angle
end
java_overload(CanvasJPanel, "setAngle", 1, function(java_a1) return true and type(java_a1) == "number" end)


function CanvasJPanel:addAngle(angle)
        self:setAngle(self.angle + angle)
end
java_overload(CanvasJPanel, "addAngle", 1, function(java_a1) return true and type(java_a1) == "number" end)


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
java_overload(CanvasJPanel, "explodeAll", 0)


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
java_overload(CanvasJPanel, "explode", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


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
java_overload(CanvasJPanel, "mirror", 0)


-- throws Exception
function CanvasJPanel:center()
        VectorCenterGenerator.new():transform(self:getGraphicItemHashMap())
        self:repaint()
end
java_overload(CanvasJPanel, "center", 0)


function CanvasJPanel:setNewTool()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end
java_overload(CanvasJPanel, "setNewTool", 0)


-- throws Exception
function CanvasJPanel:duplicateGraphicItem(graphicItem)
        local graphicItemClone = graphicItem:duplicate()
        self:getGraphicItemHashMap():put(graphicItemClone:getTreeNode(), graphicItemClone)
        self.canvasTreeNode:add(graphicItemClone:getTreeNode())
end
java_overload(CanvasJPanel, "duplicateGraphicItem", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GraphicItemInterface")) end)


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
java_overload(CanvasJPanel, "duplicateGraphicItemHashMap", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function CanvasJPanel:getGraphicItemHashMap()
        return self.graphicItemHashMap
end
java_overload(CanvasJPanel, "getGraphicItemHashMap", 0)


function CanvasJPanel:getXPixelsPerWorkAreaPixel()
        local x = self:getGrid().grid:getX() * (self:getWidth() - 10) / self:getCanvasDimension():getWidth()
        if self:getGrid():getZoom() == 1 then
            return 1
        else
            return x
        end
end
java_overload(CanvasJPanel, "getXPixelsPerWorkAreaPixel", 0)


function CanvasJPanel:getYPixelsPerWorkAreaPixel()
        local y = self:getGrid().grid:getY() * (self:getHeight() - 10) / self:getCanvasDimension():getHeight()
        if self:getGrid():getZoom() == 1 then
            return 1
        else
            return y
        end
end
java_overload(CanvasJPanel, "getYPixelsPerWorkAreaPixel", 0)


function CanvasJPanel:getSelectedTool()
        return self.selectedTool
end
java_overload(CanvasJPanel, "getSelectedTool", 0)


function CanvasJPanel:drawItems(graphics)
        local angleDouble = self.angle
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = self:getGraphicItemHashMap():get(graphicItemArray[index + 1])
            item:paint(graphics, angleDouble, self:getCanvasDimension(), self:getXPixelsPerWorkAreaPixel(), self:getYPixelsPerWorkAreaPixel())
        end
end
java_overload(CanvasJPanel, "drawItems", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


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
java_overload(CanvasJPanel, "drawGrid", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function CanvasJPanel:paint(graphics)
        local try_ok, try_error, try_value = pcall(function()
            if self:getGrid().isChanged then
                graphics:setColor(CanvasJPanel.backgroundColor)
                graphics:fillRect(0, 0, self:getWidth(), self:getHeight())
                if self:getGrid():getZoom() > 2 and self:getGrid().isGridOn_f and self:getGrid().isGridPossible_f then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end
java_overload(CanvasJPanel, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function CanvasJPanel:repaint()
        if self.grid ~= nil then
            self.grid.isChanged = true
        end
        java_super(JPanel, "repaint", 0)(self)
end
java_overload(CanvasJPanel, "repaint", 0)


-- throws Exception
function CanvasJPanel:toDom()
        return CanvasDom.new(self):toDom()
end
java_overload(CanvasJPanel, "toDom", 0)


function CanvasJPanel:changed()
        self.grid.isChanged = true
end
java_overload(CanvasJPanel, "changed", 0)


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
java_overload(CanvasJPanel, "mouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function CanvasJPanel:mouseEntered(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(self:logMouseEvent(mouseEvent))
end
java_overload(CanvasJPanel, "mouseEntered", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function CanvasJPanel:mouseExited(mouseEvent)
        StatusFactory.getInstance():setStatusNoLog(self:logMouseEvent(mouseEvent))
end
java_overload(CanvasJPanel, "mouseExited", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


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
java_overload(CanvasJPanel, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


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
java_overload(CanvasJPanel, "mouseReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


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
java_overload(CanvasJPanel, "mouseDragged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


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
java_overload(CanvasJPanel, "mouseMoved", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function CanvasJPanel:logMouseEvent(mouseEvent)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(PositionStrings.getInstance().X_LABEL)
        stringBuffer:appendint(java_int(mouseEvent:getX() / self:getXPixelsPerWorkAreaPixel()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(PositionStrings.getInstance().Y_LABEL)
        stringBuffer:appendint(java_int(mouseEvent:getY() / self:getYPixelsPerWorkAreaPixel()))
        return tostring(stringBuffer)
end
java_overload(CanvasJPanel, "logMouseEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function CanvasJPanel:keyPressed(keyEvent)
        StatusFactory.getInstance():setStatus("Key Pressed")
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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
java_overload(CanvasJPanel, "keyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function CanvasJPanel:keyReleased(keyEvent)
end
java_overload(CanvasJPanel, "keyReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function CanvasJPanel:keyTyped(keyEvent)
end
java_overload(CanvasJPanel, "keyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function CanvasJPanel:delete(evt)
        self:getGraphicItemHashMap():remove(evt:getTreeNode())
        self.workAreaJTreeJPanel:updateTree()
        self.workAreaJTreeJPanel:expand()
        self.workAreaJTreeJPanel:repaint()
end
java_overload(CanvasJPanel, "delete", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyGraphicItemEvent")) end)


function CanvasJPanel:deselect(evt)
        local graphicItemInterface = self:getGraphicItemHashMap():get(evt:getTreeNode())
        if graphicItemInterface ~= nil then
            graphicItemInterface:setColor(Color.WHITE)
            graphicItemInterface:deactivate()
            self.workAreaJTreeJPanel:repaint()
        end
end
java_overload(CanvasJPanel, "deselect", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyGraphicItemEvent")) end)


function CanvasJPanel:highlight(evt)
        local graphicItemInterface = self:getGraphicItemHashMap():get(evt:getTreeNode())
        if graphicItemInterface ~= nil then
            graphicItemInterface:setColor(Color.YELLOW)
            graphicItemInterface:activate()
            self.workAreaJTreeJPanel:repaint()
        end
end
java_overload(CanvasJPanel, "highlight", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyGraphicItemEvent")) end)


-- throws Exception
function CanvasJPanel:duplicate_j0()
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
function CanvasJPanel:duplicate_j1(event)
        local treeNode = event:getTreeNode()
        local graphicItem = self:getGraphicItemHashMap():get(treeNode)
        if graphicItem ~= nil then
            self:duplicateGraphicItem(graphicItem)
            self.workAreaJTreeJPanel:updateTree()
            self.workAreaJTreeJPanel:expand()
            self.workAreaJTreeJPanel:repaint()
        end
end
function CanvasJPanel:duplicate(...)
    local count = select("#", ...)
    if count == 0 then return self:duplicate_j0(...) end
    if count == 1 then return self:duplicate_j1(...) end
    error("No method duplicate takes " .. count .. " arguments")
end
CanvasJPanel.duplicate__jdispatcher = CanvasJPanel.duplicate


function CanvasJPanel:rotate(event)
        local treeNode = event:getTreeNode()
        local graphicItem = self:getGraphicItemHashMap():get(treeNode)
        if graphicItem ~= nil then
            graphicItem:addAngle(event:getAngle())
        end
end
java_overload(CanvasJPanel, "rotate", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyGraphicItemEvent")) end)


function CanvasJPanel:getCanvasDimension()
        return self.canvasDimension
end
java_overload(CanvasJPanel, "getCanvasDimension", 0)


function CanvasJPanel:setCanvasDimension(canvasDimension)
        self.canvasDimension = canvasDimension
end
java_overload(CanvasJPanel, "setCanvasDimension", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "IntegerDimension")) end)


function CanvasJPanel:getGrid()
        return self.grid
end
java_overload(CanvasJPanel, "getGrid", 0)

CanvasJPanel.frame = 0
CanvasJPanel.gridColor = Color.new(math.tointeger(BasicColorFactory.getInstance().WHITE // 1))
CanvasJPanel.backgroundColor = Color.new(math.tointeger(BasicColorFactory.getInstance().CLEAR_COLOR // 1))

return CanvasJPanel

