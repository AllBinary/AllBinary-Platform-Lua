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
-- package org.allbinary.graphics.j2me.workarea

local WorkAreaJPanel = {}
package.loaded["org.allbinary.graphics.j2me.workarea.WorkAreaJPanel"] = WorkAreaJPanel

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

-- local Component = require("java.awt.Component")
-- local Dimension = require("java.awt.Dimension")
-- local GridBagLayout = require("java.awt.GridBagLayout")
local EventListener = java_lazy("java.util.EventListener")
local HashMap = java_lazy("java.util.HashMap")
-- local LinkedList = require("java.util.LinkedList")
-- local swing = require("javax.swing")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local DomHelper = java_lazy("org.allbinary.dom.DomHelper")
local StatusFactory = java_lazy("org.allbinary.graphics.j2me.StatusFactory")
local CanvasDom = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local CanvasJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel")
local MyCanvasEvent = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventListener = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventListener")
local MyCanvasEventService = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService")
local PropertiesJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.properties.PropertiesJPanel")
local ToolJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.tools.ToolJPanel")
local LOGGING = java_lazy("org.allbinary.log.LOGGING")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
-- local GridBagConstraints = require("java.awt.GridBagConstraints")
-- local GridLayout = require("java.awt.GridLayout")
-- local KeyAdapter = require("java.awt.event.KeyAdapter")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local JPanel = require("javax.swing.JPanel")
local WorkAreaJPanelInterface = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface")
local Runnable = require("java.lang.Runnable")
local WorkAreaDom = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaDom")
local WorkAreaJTreeJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table WorkAreaJPanel is declared before the requires
WorkAreaJPanel.__index = WorkAreaJPanel
WorkAreaJPanel.className = "WorkAreaJPanel"
WorkAreaJPanel.javaClassName = "org.allbinary.graphics.j2me.workarea.WorkAreaJPanel"
setmetatable(WorkAreaJPanel, {__index = JPanel})
WorkAreaJPanel.java_implements = " WorkAreaJPanelInterface MyCanvasEventListener EventListener Runnable "
WorkAreaJPanel.java_interfaces = function() return {WorkAreaJPanelInterface, MyCanvasEventListener, EventListener, Runnable} end

function WorkAreaJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.canvasJPanelList == nil then self.canvasJPanelList = nil end
    if self.canvasHolderJPanel == nil then self.canvasHolderJPanel = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.selectedFrame == nil then self.selectedFrame = 0 end
    if self.propertiesJPanel == nil then self.propertiesJPanel = nil end
    if self.workAreaJTreeJPanel == nil then self.workAreaJTreeJPanel = nil end
    self.isPlaying_f = false
    if self.innerJPanel == nil then self.innerJPanel = nil end
end

function WorkAreaJPanel._jinit(self, ...)
    local count = select("#", ...)
    if count == 4 then return WorkAreaJPanel._new4(self, ...)
    elseif count == 2 then return WorkAreaJPanel._new2(self, ...)
    end
    error("No constructor of WorkAreaJPanel takes " .. count .. " arguments")
end

function WorkAreaJPanel.new(...)
    local self = setmetatable({}, WorkAreaJPanel)
    WorkAreaJPanel._jinit(self, ...)
    return self
end


function WorkAreaJPanel._new4(self, name, dimension, x, y)
    java_super_init(JPanel, self)
    WorkAreaJPanel._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self:initComponents()
            self.name_f = name
            self:initMyComponents(dimension)
            self.workAreaJTreeJPanel = WorkAreaJTreeJPanel.new(self.name_f)
            local canvasJPanel = CanvasJPanel.new(self.workAreaJTreeJPanel, self:getSize(), x, y)
            self.canvasJPanelList:add(canvasJPanel)
            self.selectedFrame = 0
            self.propertiesJPanel:set(self.workAreaJTreeJPanel)
            self.canvasHolderJPanel:add(canvasJPanel)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
    return self
end


function WorkAreaJPanel._new2(self, workAreaDom, dimension)
    java_super_init(JPanel, self)
    WorkAreaJPanel._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self:initComponents()
            self.name_f = workAreaDom:getName()
            self:initMyComponents(dimension)
            local canvasNodeList = workAreaDom:getCanvasNodes()
            local numberOfFrames = canvasNodeList:size()
            for index = 0, numberOfFrames - 1 do
                local node = canvasNodeList:get(index)
                local canvasJPanel = CanvasJPanel.new(self.workAreaJTreeJPanel, self:getSize(), CanvasDom.new(node))
                self.canvasJPanelList:add(canvasJPanel)
            end
            self.selectedFrame = 0
            self.canvasHolderJPanel:add(self:getCurrentFrame())
            self.propertiesJPanel:set(self.workAreaJTreeJPanel)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.LOADINGERROR) then
                self.logUtil:put("Constructor Error", self, "WorkAreaJPanel", e)
            end
            error(e, 0)
        end
    return self
end


function WorkAreaJPanel:initMyComponents(dimension)
        self.workAreaJTreeJPanel = WorkAreaJTreeJPanel.new(self.name_f)
        self.canvasHolderJPanel = JPanel.new()
        self.canvasHolderJPanel:setSize(dimension)
        self.canvasHolderJPanel:setLayout(GridLayout.new(1, 1))
        self:setSize(dimension)
        self.canvasJPanelList = LinkedList.new()
        local gridBagLayout = GridBagLayout.new()
        local gridBagConstraints = GridBagConstraints.new()
        self.innerJPanel:setLayout(gridBagLayout)
        gridBagConstraints.gridx = 0
        gridBagConstraints.gridy = 0
        gridBagConstraints.gridwidth = 1
        gridBagConstraints.fill = GridBagConstraints.BOTH
        gridBagConstraints.weightx = .05
        gridBagConstraints.weighty = .05
        local toolJPanel = ToolJPanel.new()
        gridBagLayout:setConstraints(toolJPanel, gridBagConstraints)
        self.innerJPanel:add(toolJPanel)
        gridBagConstraints = GridBagConstraints.new()
        gridBagConstraints.gridx = 1
        gridBagConstraints.gridy = 0
        gridBagConstraints.gridwidth = 6
        gridBagConstraints.fill = GridBagConstraints.BOTH
        gridBagConstraints.weightx = 1
        gridBagConstraints.weighty = 1
        gridBagLayout:setConstraints(self.canvasHolderJPanel, gridBagConstraints)
        self.innerJPanel:add(self.canvasHolderJPanel)
        gridBagConstraints = GridBagConstraints.new()
        gridBagConstraints.gridx = 8
        gridBagConstraints.gridy = 0
        gridBagConstraints.gridwidth = GridBagConstraints.REMAINDER
        gridBagConstraints.fill = GridBagConstraints.BOTH
        gridBagConstraints.weightx = .1
        gridBagConstraints.weighty = .1
        self.propertiesJPanel = PropertiesJPanel.new()
        gridBagLayout:setConstraints(self.propertiesJPanel, gridBagConstraints)
        self.innerJPanel:add(self.propertiesJPanel)
        MyCanvasEventService.addListener(self)
end
java_overload(WorkAreaJPanel, "initMyComponents", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Dimension")) end)


function WorkAreaJPanel:getCanvasHashMap()
        local canvasJPanelHashMap = StdUtil.getInstance():createHashMap()
        local size = self.canvasJPanelList:size()
        for index = 0, size - 1 do
            local canvasJPanel = self.canvasJPanelList:get(index)
            canvasJPanelHashMap:put(canvasJPanel:getTreeNode(), index)
        end
        return canvasJPanelHashMap
end
java_overload(WorkAreaJPanel, "getCanvasHashMap", 0)


function WorkAreaJPanel:play()
        self.isPlaying_f = true
end
java_overload(WorkAreaJPanel, "play", 0)


function WorkAreaJPanel:stop()
        self.isPlaying_f = false
end
java_overload(WorkAreaJPanel, "stop", 0)


function WorkAreaJPanel:isPlaying()
        return self.isPlaying_f
end
java_overload(WorkAreaJPanel, "isPlaying", 0)


function WorkAreaJPanel:getName()
        return self.name_f
end
java_overload(WorkAreaJPanel, "getName", 0)


function WorkAreaJPanel:setName(value)
        self.name_f = value
end
java_overload(WorkAreaJPanel, "setName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function WorkAreaJPanel:disableCanvas()
        self.canvasHolderJPanel:removeAll()
end
java_overload(WorkAreaJPanel, "disableCanvas", 0)


function WorkAreaJPanel:enableCanvas()
        self.canvasHolderJPanel:add(self:getCurrentFrame())
end
java_overload(WorkAreaJPanel, "enableCanvas", 0)


function WorkAreaJPanel:deselect()
        java_super(JPanel, "setVisible", 1)(self, false)
end
java_overload(WorkAreaJPanel, "deselect", 0)


function WorkAreaJPanel:select_j0()
        java_super(JPanel, "setVisible", 1)(self, true)
        if rawequal(self.canvasHolderJPanel:getComponentCount(), 1) then
            local component = self.canvasHolderJPanel:getComponent(0)
            if not rawequal(component, nil) then
                component:repaint()
            end
        end
end


function WorkAreaJPanel:changeZoom(factor)
        local size = self.canvasJPanelList:size()
        for index = 0, size - 1 do
            local canvasJPanel = self.canvasJPanelList:get(index)
            canvasJPanel:getGrid():setZoom(canvasJPanel:getGrid():getZoom() + factor)
        end
end
java_overload(WorkAreaJPanel, "changeZoom", 1, function(java_a1) return true and type(java_a1) == "number" end)


function WorkAreaJPanel:getCurrentFrame()
        return self.canvasJPanelList:get(self.selectedFrame)
end
java_overload(WorkAreaJPanel, "getCurrentFrame", 0)


function WorkAreaJPanel:initDuplicate(newCanvasJPanel)
        if not rawequal(newCanvasJPanel, nil) then
            self.canvasJPanelList:add(newCanvasJPanel)
            self:select(self.canvasJPanelList:size() - 1)
        end
end
java_overload(WorkAreaJPanel, "initDuplicate", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CanvasJPanel")) end)


-- throws Exception
function WorkAreaJPanel:duplicate_j1_1(treeNode)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        if canvasJPanelHashMap:containsKey(treeNode) then
            local frameInteger = canvasJPanelHashMap:get(treeNode)
            local canvasJPanel = self.canvasJPanelList:get(require("allbinary_java").number_value(frameInteger, "intValue"))
            self:initDuplicate(canvasJPanel:duplicate())
        end
end


-- throws Exception
function WorkAreaJPanel:autoRotate(increments, totalAngle)
        local incrementAngle = (java_idiv(totalAngle, increments))
        for index = 1, increments - 1 do
            local canvasJPanel = self:getCurrentFrame()
            local newCanvasJPanel = canvasJPanel:duplicate()
            newCanvasJPanel:setAngle(incrementAngle * index)
            self:initDuplicate(newCanvasJPanel)
        end
end
java_overload(WorkAreaJPanel, "autoRotate", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function WorkAreaJPanel:explodeAll()
        local canvasJPanel = self:getCurrentFrame()
        canvasJPanel:explodeAll()
end
java_overload(WorkAreaJPanel, "explodeAll", 0)


-- throws Exception
function WorkAreaJPanel:autoExplode_j2(numberOfFrames, explodeType)
        for index = 1, numberOfFrames - 1 do
            local canvasJPanel = self:getCurrentFrame()
            local newCanvasJPanel = canvasJPanel:duplicate()
            newCanvasJPanel:explode(index + 1, explodeType)
            self:initDuplicate(newCanvasJPanel)
        end
end


-- throws Exception
function WorkAreaJPanel:autoMirror()
        local canvasJPanel = self:getCurrentFrame()
        local newCanvasJPanel = canvasJPanel:duplicate()
        newCanvasJPanel:mirror()
        self:initDuplicate(newCanvasJPanel)
end
java_overload(WorkAreaJPanel, "autoMirror", 0)


function WorkAreaJPanel:select_j1_1(index)
        if index < self.canvasJPanelList:size() then
            local canvasJPanel = self.canvasJPanelList:get(index)
            if not rawequal(canvasJPanel, nil) then
                self.canvasHolderJPanel:removeAll()
                self.canvasHolderJPanel:add(canvasJPanel)
                self.selectedFrame = index
                canvasJPanel:changed()
                self.canvasHolderJPanel:repaint()
                canvasJPanel:repaint()
            end
        end
end


function WorkAreaJPanel:select_j1_2(treeNode)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        local frameInteger = canvasJPanelHashMap:get(treeNode)
        if not rawequal(frameInteger, nil) then
            self:select(require("allbinary_java").number_value(frameInteger, "intValue"))
        end
end


function WorkAreaJPanel.getDocument()
        return WorkAreaJPanel.document
end


-- throws Exception
function WorkAreaJPanel:toDocument()
        WorkAreaJPanel.document = DomHelper.getInstance():createDocument()
        local workAreaNode = WorkAreaJPanel.document:createElement(WorkAreaDom.WORKAREA)
        local nameNode = WorkAreaJPanel.document:createElement(WorkAreaDom.NAME)
        local nameTextNode = WorkAreaJPanel.document:createTextNode(self.name_f)
        nameNode:appendChild(nameTextNode)
        local framesNode = WorkAreaJPanel.document:createElement(WorkAreaDom.FRAMES)
        local size = self.canvasJPanelList:size()
        for index = 0, size - 1 do
            local canvasJPanel = self.canvasJPanelList:get(index)
            framesNode:appendChild(canvasJPanel:toDom())
        end
        workAreaNode:appendChild(nameNode)
        workAreaNode:appendChild(framesNode)
        WorkAreaJPanel.document:appendChild(workAreaNode)
        return WorkAreaJPanel.document
end
java_overload(WorkAreaJPanel, "toDocument", 0)


function WorkAreaJPanel:initComponents()
        self.innerJPanel = JPanel.new()
        self:setLayout(GridLayout.new(1, 1))
        self.innerJPanel:addKeyListener((function()
            local java_outer_self = self
        local o = KeyAdapter.new and KeyAdapter.new() or setmetatable({}, {__index = KeyAdapter})
            

            function o:keyTyped(evt)
                ;(self.innerJPanelKeyTyped and self or java_outer_self):innerJPanelKeyTyped(evt)
            
            end
            java_overload(o, "keyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)
            

            function o:keyPressed(evt)
                ;(self.innerJPanelKeyPressed and self or java_outer_self):innerJPanelKeyPressed(evt)
            
            end
            java_overload(o, "keyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)
            

            function o:keyReleased(evt)
                ;(self.innerJPanelKeyReleased and self or java_outer_self):innerJPanelKeyReleased(evt)
            
            end
            java_overload(o, "keyReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)
            return o
        end)())
        self:add(self.innerJPanel)
end
java_overload(WorkAreaJPanel, "initComponents", 0)


function WorkAreaJPanel:innerJPanelKeyReleased(evt)
        StatusFactory.getInstance():setStatus("Key Pressed1")
end
java_overload(WorkAreaJPanel, "innerJPanelKeyReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function WorkAreaJPanel:innerJPanelKeyPressed(evt)
        StatusFactory.getInstance():setStatus("Key Pressed2")
end
java_overload(WorkAreaJPanel, "innerJPanelKeyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function WorkAreaJPanel:innerJPanelKeyTyped(evt)
        StatusFactory.getInstance():setStatus("Key Pressed3")
end
java_overload(WorkAreaJPanel, "innerJPanelKeyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function WorkAreaJPanel:keyPressed(keyEvent)
        self:getCurrentFrame():keyPressed(keyEvent)
end
java_overload(WorkAreaJPanel, "keyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function WorkAreaJPanel:keyReleased(keyEvent)
end
java_overload(WorkAreaJPanel, "keyReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function WorkAreaJPanel:keyTyped(keyEvent)
end
java_overload(WorkAreaJPanel, "keyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function WorkAreaJPanel:delete(evt)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        if canvasJPanelHashMap:containsKey(evt:getTreeNode()) then
            self.canvasHolderJPanel:removeAll()
            local frameInt = canvasJPanelHashMap:get(evt:getTreeNode())
            self.canvasJPanelList:remove(require("allbinary_java").number_value(frameInt, "intValue"))
            self:select(require("allbinary_java").number_value(frameInt, "intValue"))
        end
end
java_overload(WorkAreaJPanel, "delete", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyCanvasEvent")) end)


-- throws Exception
function WorkAreaJPanel:duplicate_j1_2(evt)
        self:duplicate(evt:getTreeNode())
end
function WorkAreaJPanel:duplicate(...)
    local count = select("#", ...)
    if count == 1 then return self:duplicate_j1(...) end
    local parent = getmetatable(WorkAreaJPanel).__index
    if parent.duplicate then return parent.duplicate(self, ...) end
    error("No method duplicate takes " .. count .. " arguments")
end
WorkAreaJPanel.duplicate__jdispatcher = WorkAreaJPanel.duplicate
function WorkAreaJPanel:duplicate_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "MutableTreeNode")) then return WorkAreaJPanel.duplicate_j1_1(self, ...) end
    return WorkAreaJPanel.duplicate_j1_2(self, ...)
end


function WorkAreaJPanel:select_j1_3(evt)
        self:select(evt:getTreeNode())
        StatusFactory.getInstance():setStatus("Frame Selected")
end
function WorkAreaJPanel:select(...)
    local count = select("#", ...)
    if count == 0 then return self:select_j0(...) end
    if count == 1 then return self:select_j1(...) end
    local parent = getmetatable(WorkAreaJPanel).__index
    if parent.select then return parent.select(self, ...) end
    error("No method select takes " .. count .. " arguments")
end
WorkAreaJPanel.select__jdispatcher = WorkAreaJPanel.select
function WorkAreaJPanel:select_j1(...)
    local java_a1 = ...
    if true and math.type(java_a1) == "integer" then return WorkAreaJPanel.select_j1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "MutableTreeNode")) then return WorkAreaJPanel.select_j1_2(self, ...) end
    return WorkAreaJPanel.select_j1_3(self, ...)
end


function WorkAreaJPanel:rotate(evt)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        local treeNode = evt:getTreeNode()
        local frameInt = canvasJPanelHashMap:get(evt:getTreeNode())
        local canvasJPanel = self.canvasJPanelList:get(require("allbinary_java").number_value(frameInt, "intValue"))
        if not rawequal(canvasJPanel, nil) then
            canvasJPanel:addAngle(evt:getAngle())
            self:select(require("allbinary_java").number_value(frameInt, "intValue"))
        end
        StatusFactory.getInstance():setStatus("Canvas Rotated")
end
java_overload(WorkAreaJPanel, "rotate", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyCanvasEvent")) end)


function WorkAreaJPanel:explode(evt)
        self:explodeAll()
end
java_overload(WorkAreaJPanel, "explode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyCanvasEvent")) end)


-- throws Exception
function WorkAreaJPanel:autoExplode_j1(evt)
        self:autoExplode(10, 0)
end
function WorkAreaJPanel:autoExplode(...)
    local count = select("#", ...)
    if count == 2 then return self:autoExplode_j2(...) end
    if count == 1 then return self:autoExplode_j1(...) end
    local parent = getmetatable(WorkAreaJPanel).__index
    if parent.autoExplode then return parent.autoExplode(self, ...) end
    error("No method autoExplode takes " .. count .. " arguments")
end
WorkAreaJPanel.autoExplode__jdispatcher = WorkAreaJPanel.autoExplode


-- throws Exception
function WorkAreaJPanel:center_j0()
        local canvasJPanel = self:getCurrentFrame()
        canvasJPanel:center()
end


-- throws Exception
function WorkAreaJPanel:center_j1(evt)
        self:center()
end
function WorkAreaJPanel:center(...)
    local count = select("#", ...)
    if count == 0 then return self:center_j0(...) end
    if count == 1 then return self:center_j1(...) end
    local parent = getmetatable(WorkAreaJPanel).__index
    if parent.center then return parent.center(self, ...) end
    error("No method center takes " .. count .. " arguments")
end
WorkAreaJPanel.center__jdispatcher = WorkAreaJPanel.center


function WorkAreaJPanel:run()
        local try_ok, try_error, try_value = pcall(function()
            while true do
                if self:isPlaying() then
                    local size = self.canvasJPanelList:size()
                    for index = 0, size - 1 do
                        if not (self:isPlaying()) then
                            break
                        end
                        self:select(index)
                        require("java.lang.Thread").sleep(100)
                    end
                else
                    require("java.lang.Thread").sleep(500)
                end
                require("java.lang.Thread").sleep(250)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end
java_overload(WorkAreaJPanel, "run", 0)

WorkAreaJPanel.document = nil

return WorkAreaJPanel

