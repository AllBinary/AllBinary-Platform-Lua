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

-- local awt = require("java.awt")
-- local EventListener = require("java.util.EventListener")
-- local HashMap = require("java.util.HashMap")
-- local LinkedList = require("java.util.LinkedList")
-- local swing = require("javax.swing")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local DomHelper = require("org.allbinary.dom.DomHelper")
local StatusFactory = require("org.allbinary.graphics.j2me.StatusFactory")
local CanvasDom = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local CanvasJPanel = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel")
local MyCanvasEvent = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventListener = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventListener")
local MyCanvasEventService = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService")
local PropertiesJPanel = require("org.allbinary.graphics.j2me.workarea.properties.PropertiesJPanel")
local ToolJPanel = require("org.allbinary.graphics.j2me.workarea.tools.ToolJPanel")
local LOGGING = require("org.allbinary.log.LOGGING")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local JPanel = require("org.allbinary.graphics.j2me.workarea.JPanel")
local WorkAreaJPanelInterface = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface")
-- java.lang.Runnable has no Lua module
local Runnable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local WorkAreaJPanel = {}
WorkAreaJPanel.__index = WorkAreaJPanel
WorkAreaJPanel.className = "WorkAreaJPanel"
setmetatable(WorkAreaJPanel, {__index = JPanel})

function WorkAreaJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.canvasJPanelList = nil
    self.canvasHolderJPanel = nil
    self.name = nil
    self.selectedFrame = 0
    self.propertiesJPanel = nil
    self.workAreaJTreeJPanel = nil
    self.isPlaying = false
    self.innerJPanel = nil
end

function WorkAreaJPanel.new(...)
    local count = select("#", ...)
    if count == 4 then return WorkAreaJPanel._new4(...)
    elseif count == 2 then return WorkAreaJPanel._new2(...)
    end
end


function WorkAreaJPanel._new4(name, dimension, x, y)
    local self = setmetatable(JPanel.new(), WorkAreaJPanel)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self:initComponents()
            self.name = name
            self:initMyComponents(dimension)
            self.workAreaJTreeJPanel = WorkAreaJTreeJPanel.new(self.name)
            local canvasJPanel = CanvasJPanel.new(self.workAreaJTreeJPanel, self:getSize(), x, y)
            self.canvasJPanelList:add(canvasJPanel)
            self.selectedFrame = 0
            self.propertiesJPanel:set(self.workAreaJTreeJPanel)
            self.canvasHolderJPanel:add(canvasJPanel)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
    return self
end


function WorkAreaJPanel._new2(workAreaDom, dimension)
    local self = setmetatable(JPanel.new(), WorkAreaJPanel)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self:initComponents()
            self.name = workAreaDom:getName()
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
            if self.LOGGING:contains(self.LOGGING.LOADINGERROR) then
                self.logUtil:put("Constructor Error", self, "WorkAreaJPanel", e)
            end
            error(e, 0)
        end
    return self
end


function WorkAreaJPanel:initMyComponents(dimension)
        self.workAreaJTreeJPanel = WorkAreaJTreeJPanel.new(self.name)
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
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH
        gridBagConstraints.weightx = .05
        gridBagConstraints.weighty = .05
        local toolJPanel = ToolJPanel.new()
        gridBagLayout:setConstraints(toolJPanel, gridBagConstraints)
        self.innerJPanel:add(toolJPanel)
        gridBagConstraints = GridBagConstraints.new()
        gridBagConstraints.gridx = 1
        gridBagConstraints.gridy = 0
        gridBagConstraints.gridwidth = 6
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH
        gridBagConstraints.weightx = 1
        gridBagConstraints.weighty = 1
        gridBagLayout:setConstraints(self.canvasHolderJPanel, gridBagConstraints)
        self.innerJPanel:add(self.canvasHolderJPanel)
        gridBagConstraints = GridBagConstraints.new()
        gridBagConstraints.gridx = 8
        gridBagConstraints.gridy = 0
        gridBagConstraints.gridwidth = java.awt.GridBagConstraints.REMAINDER
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH
        gridBagConstraints.weightx = .1
        gridBagConstraints.weighty = .1
        self.propertiesJPanel = PropertiesJPanel.new()
        gridBagLayout:setConstraints(self.propertiesJPanel, gridBagConstraints)
        self.innerJPanel:add(self.propertiesJPanel)
        MyCanvasEventService.addListener(self)
end


function WorkAreaJPanel:getCanvasHashMap()
        local canvasJPanelHashMap = StdUtil.getInstance():createHashMap()
        local size = self.canvasJPanelList:size()
        for index = 0, size - 1 do
            local canvasJPanel = self.canvasJPanelList:get(index)
            canvasJPanelHashMap:put(canvasJPanel:getTreeNode(), index)
        end
        return canvasJPanelHashMap
end


function WorkAreaJPanel:play()
        self.isPlaying = true
end


function WorkAreaJPanel:stop()
        self.isPlaying = false
end


function WorkAreaJPanel:isPlaying()
        return self.isPlaying
end


function WorkAreaJPanel:getName()
        return self.name
end


function WorkAreaJPanel:setName(value)
        self.name = value
end


function WorkAreaJPanel:disableCanvas()
        self.canvasHolderJPanel:removeAll()
end


function WorkAreaJPanel:enableCanvas()
        self.canvasHolderJPanel:add(self:getCurrentFrame())
end


function WorkAreaJPanel:deselect()
        JPanel.setVisible(self, false)
end


function WorkAreaJPanel:select()
        JPanel.setVisible(self, true)
        if self.canvasHolderJPanel:getComponentCount() == 1 then
            local component = self.canvasHolderJPanel:getComponent(0)
            if component ~= nil then
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


function WorkAreaJPanel:getCurrentFrame()
        return self.canvasJPanelList:get(self.selectedFrame)
end


function WorkAreaJPanel:initDuplicate(newCanvasJPanel)
        if newCanvasJPanel ~= nil then
            self.canvasJPanelList:add(newCanvasJPanel)
            self:select(self.canvasJPanelList:size() - 1)
        end
end


-- throws Exception
function WorkAreaJPanel:duplicate(treeNode)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        if canvasJPanelHashMap:containsKey(treeNode) then
            local frameInteger = canvasJPanelHashMap:get(treeNode)
            local canvasJPanel = self.canvasJPanelList:get(math.tointeger(frameInteger // 1))
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


function WorkAreaJPanel:explodeAll()
        local canvasJPanel = self:getCurrentFrame()
        canvasJPanel:explodeAll()
end


-- throws Exception
function WorkAreaJPanel:autoExplode(numberOfFrames, explodeType)
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


-- Java overloaded method: Lua keeps the last definition
function WorkAreaJPanel:select(index)
        if index < self.canvasJPanelList:size() then
            local canvasJPanel = self.canvasJPanelList:get(index)
            if canvasJPanel ~= nil then
                self.canvasHolderJPanel:removeAll()
                self.canvasHolderJPanel:add(canvasJPanel)
                self.selectedFrame = index
                canvasJPanel:changed()
                self.canvasHolderJPanel:repaint()
                canvasJPanel:repaint()
            end
        end
end


-- Java overloaded method: Lua keeps the last definition
function WorkAreaJPanel:select(treeNode)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        local frameInteger = canvasJPanelHashMap:get(treeNode)
        if frameInteger ~= nil then
            self:select(math.tointeger(frameInteger // 1))
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
        local nameTextNode = WorkAreaJPanel.document:createTextNode(self.name)
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


function WorkAreaJPanel:initComponents()
        self.innerJPanel = JPanel.new()
        self:setLayout(GridLayout.new(1, 1))
        self.innerJPanel:addKeyListener((function()
            local o = KeyAdapter.new and KeyAdapter.new() or setmetatable({}, {__index = KeyAdapter})
            

            function o:keyTyped(evt)
                self:innerJPanelKeyTyped(evt)
            end
            

            function o:keyPressed(evt)
                self:innerJPanelKeyPressed(evt)
            end
            

            function o:keyReleased(evt)
                self:innerJPanelKeyReleased(evt)
            end
            return o
        end)())
        self:add(self.innerJPanel)
end


function WorkAreaJPanel:innerJPanelKeyReleased(evt)
        StatusFactory.getInstance():setStatus("Key Pressed1")
end


function WorkAreaJPanel:innerJPanelKeyPressed(evt)
        StatusFactory.getInstance():setStatus("Key Pressed2")
end


function WorkAreaJPanel:innerJPanelKeyTyped(evt)
        StatusFactory.getInstance():setStatus("Key Pressed3")
end


function WorkAreaJPanel:keyPressed(keyEvent)
        self:getCurrentFrame():keyPressed(keyEvent)
end


function WorkAreaJPanel:keyReleased(keyEvent)
end


function WorkAreaJPanel:keyTyped(keyEvent)
end


function WorkAreaJPanel:delete(evt)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        if canvasJPanelHashMap:containsKey(evt:getTreeNode()) then
            self.canvasHolderJPanel:removeAll()
            local frameInt = canvasJPanelHashMap:get(evt:getTreeNode())
            self.canvasJPanelList:remove(math.tointeger(frameInt // 1))
            self:select(math.tointeger(frameInt // 1))
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function WorkAreaJPanel:duplicate(evt)
        self:duplicate(evt:getTreeNode())
end


-- Java overloaded method: Lua keeps the last definition
function WorkAreaJPanel:select(evt)
        self:select(evt:getTreeNode())
        StatusFactory.getInstance():setStatus("Frame Selected")
end


function WorkAreaJPanel:rotate(evt)
        local canvasJPanelHashMap = self:getCanvasHashMap()
        local treeNode = evt:getTreeNode()
        local frameInt = canvasJPanelHashMap:get(evt:getTreeNode())
        local canvasJPanel = self.canvasJPanelList:get(math.tointeger(frameInt // 1))
        if canvasJPanel ~= nil then
            canvasJPanel:addAngle(evt:getAngle())
            self:select(math.tointeger(frameInt // 1))
        end
        StatusFactory.getInstance():setStatus("Canvas Rotated")
end


function WorkAreaJPanel:explode(evt)
        self:explodeAll()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function WorkAreaJPanel:autoExplode(evt)
        self:autoExplode(10, 0)
end


-- throws Exception
function WorkAreaJPanel:center()
        local canvasJPanel = self:getCurrentFrame()
        canvasJPanel:center()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function WorkAreaJPanel:center(evt)
        self:center()
end


function WorkAreaJPanel:run()
        local try_ok, try_error = pcall(function()
            while true do
                if self:isPlaying() then
                    local size = self.canvasJPanelList:size()
                    for index = 0, size - 1 do
                        if not self:isPlaying() then
                            break
                        end
                        self:select(index)
                        java_sleep(100)
                    end
                else
                    java_sleep(500)
                end
                java_sleep(250)
            end
        end)
        if not try_ok then
            local e = try_error
        end
end

WorkAreaJPanel.document = nil

return WorkAreaJPanel

