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

local CanvasDom = {}
package.loaded["org.allbinary.graphics.j2me.workarea.canvas.CanvasDom"] = CanvasDom

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

local HashMap = java_lazy("java.util.HashMap")
local VectorCenterGenerator = java_lazy("org.allbinary.animation.vector.VectorCenterGenerator")
local DomHelper = java_lazy("org.allbinary.dom.DomHelper")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local GraphicsStrings = java_lazy("org.allbinary.graphics.GraphicsStrings")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local WorkAreaJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local GraphicItemFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory")
local GraphicItemInterface = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local LinesGraphicItem = java_lazy("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Node = java_lazy("org.w3c.dom.Node")
local Document = java_lazy("org.w3c.dom.Document")
local CanvasJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel")
local Grid = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.Grid")
local IntegerDimension = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension")

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

-- class table CanvasDom is declared before the requires
CanvasDom.__index = CanvasDom
CanvasDom.className = "CanvasDom"
CanvasDom.javaClassName = "org.allbinary.graphics.j2me.workarea.canvas.CanvasDom"

function CanvasDom:_init_fields()
    self.graphicsStrings = GraphicsStrings.getInstance()
    if self.graphicItemHashMap == nil then self.graphicItemHashMap = nil end
    if self.angle == nil then self.angle = 0.0 end
    if self.dimension == nil then self.dimension = nil end
    if self.grid == nil then self.grid = nil end
end

function CanvasDom._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return CanvasDom._new1(self, ...)
    end
    error("No constructor of CanvasDom takes " .. count .. " arguments")
end

function CanvasDom.new(...)
    local self = setmetatable({}, CanvasDom)
    CanvasDom._jinit(self, ...)
    return self
end

function CanvasDom._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return CanvasDom._new1_1(self, ...) end
    return CanvasDom._new1_2(self, ...)
end


function CanvasDom._new1_1(self, canvasNode)
    CanvasDom._init_fields(self)
        self.grid = Grid.new()
        self.grid.grid = PointFactory.getInstance():createXY(0, 0)
        self.dimension = IntegerDimension.new(0, 0)
        local name = canvasNode:getNodeName()
        if rawequal(((name < CanvasDom.FRAME and -1) or (name > CanvasDom.FRAME and 1) or 0), 0) then
            self.graphicItemHashMap = StdUtil.getInstance():createHashMap()
            local angleNode = DomHelper.getInstance():searchNodeList(CanvasDom.ROTATE, canvasNode:getChildNodes())
            local angleTextNode = angleNode:getFirstChild()
            local angle = (angleTextNode:getNodeValue() + 0.0)
            self:setAngle(angle)
            local sizeNode = DomHelper.getInstance():searchNodeList(CanvasDom.SIZE, canvasNode:getChildNodes())
            local xNode = DomHelper.getInstance():searchNodeList(CanvasDom.X, sizeNode:getChildNodes())
            local xTextNode = xNode:getFirstChild()
            local x = math.tointeger(xTextNode:getNodeValue() // 1)
            local yNode = DomHelper.getInstance():searchNodeList(CanvasDom.Y, sizeNode:getChildNodes())
            local yTextNode = yNode:getFirstChild()
            local y = math.tointeger(yTextNode:getNodeValue() // 1)
            self:setWorkArea(x, y)
            local zoomNode = DomHelper.getInstance():searchNodeList(CanvasDom.ZOOM, canvasNode:getChildNodes())
            local zoomTextNode = zoomNode:getFirstChild()
            self.grid:setZoom(math.tointeger(zoomTextNode:getNodeValue() // 1))
            local gridNode = DomHelper.getInstance():searchNodeList(CanvasDom.GRID, canvasNode:getChildNodes())
            local gridSizeNode = DomHelper.getInstance():searchNodeList(CanvasDom.SIZE, gridNode:getChildNodes())
            local gridXNode = DomHelper.getInstance():searchNodeList(CanvasDom.X, gridSizeNode:getChildNodes())
            local gridXTextNode = gridXNode:getFirstChild()
            local gridX = math.tointeger(gridXTextNode:getNodeValue() // 1)
            local gridYNode = DomHelper.getInstance():searchNodeList(CanvasDom.Y, gridSizeNode:getChildNodes())
            local gridYTextNode = gridYNode:getFirstChild()
            local gridY = math.tointeger(gridYTextNode:getNodeValue() // 1)
            self:setGrid(gridX, gridY)
            local enableNode = DomHelper.getInstance():searchNodeList(CanvasDom.ENABLED, gridNode:getChildNodes())
            local enableTextNode = enableNode:getFirstChild()
            self.grid:showGrid(enableTextNode:getNodeValue())
            local possibleNode = DomHelper.getInstance():searchNodeList(CanvasDom.POSSIBLE, gridNode:getChildNodes())
            local possibleTextNode = possibleNode:getFirstChild()
            self.grid.isGridPossible_f = possibleTextNode:getNodeValue()
            local graphicItemNodeList = DomHelper.getInstance():getChildrenWithoutTextNodes(CanvasDom.GRAPHICITEMS, canvasNode:getChildNodes())
            if not rawequal(graphicItemNodeList, nil) then
                self.graphicItemHashMap = GraphicItemFactory.getInstance():getInstance(graphicItemNodeList)
            end
        else
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("Frame Element Not Found but Found: ") .. require("allbinary_java").to_string(name)), 0)
        end
    return self
end


function CanvasDom._new1_2(self, canvasJPanel)
    CanvasDom._init_fields(self)
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
        local xNode = document:createElement(CanvasDom.X)
        local xTextNode = document:createTextNode(tostring(point:getX()))
        xNode:appendChild(xTextNode)
        local yNode = document:createElement(CanvasDom.Y)
        local yTextNode = document:createTextNode(tostring(point:getY()))
        yNode:appendChild(yTextNode)
        pointNode:appendChild(xNode)
        pointNode:appendChild(yNode)
        return pointNode
end


-- throws Exception
function CanvasDom:toDom()
        local document = WorkAreaJPanel.getDocument()
        local frameNode = document:createElement(CanvasDom.FRAME)
        local angleNode = document:createElement(CanvasDom.ROTATE)
        local angleTextNode = document:createTextNode(tostring(self:getAngle()))
        angleNode:appendChild(angleTextNode)
        local sizeNode = self:getPointNode(PointFactory.getInstance():createXY(self:getDimension():getWidth(), self:getDimension():getHeight()), CanvasDom.SIZE)
        local zoomNode = document:createElement(CanvasDom.ZOOM)
        local zoomTextNode = document:createTextNode(tostring(self:getGrid():getZoom()))
        zoomNode:appendChild(zoomTextNode)
        local gridNode = document:createElement(CanvasDom.GRID)
        local gridSizeNode = self:getPointNode(self:getGrid().grid, CanvasDom.SIZE)
        gridNode:appendChild(gridSizeNode)
        local enableNode = document:createElement(CanvasDom.ENABLED)
        local enableTextNode = document:createTextNode(tostring(self:getGrid():isGridOn()))
        enableNode:appendChild(enableTextNode)
        gridNode:appendChild(enableNode)
        local possibleNode = document:createElement(CanvasDom.POSSIBLE)
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
        local graphicItemNode = document:createElement(CanvasDom.GRAPHICITEMS)
        local graphicItemArray = self:getGraphicItemHashMap():keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = self.graphicItemHashMap:get(graphicItemArray[index + 1])
            if rawequal(item:getName(), LinesGraphicItem.getStaticName()) then
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

