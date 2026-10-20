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

-- local swing = require("javax.swing")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
-- local TreePath = require("javax.swing.tree.TreePath")
local CanvasTreeLabel = require("org.allbinary.graphics.j2me.workarea.canvas.CanvasTreeLabel")
local MyCanvasEvent = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventService = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService")
local MyCanvasEventSource = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource")
local MyGraphicItemEvent = require("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent")
local MyGraphicItemEventService = require("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService")
local MyGraphicItemEventSource = require("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventSource")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local JPanel = require("org.allbinary.graphics.j2me.workarea.JPanel")

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local WorkAreaJTreeJPanel = {}
WorkAreaJTreeJPanel.__index = WorkAreaJTreeJPanel
WorkAreaJTreeJPanel.className = "WorkAreaJTreeJPanel"
setmetatable(WorkAreaJTreeJPanel, {__index = JPanel})

function WorkAreaJTreeJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.rootTreeNode = nil
    self.workAreaJTree = nil
    self.highlightedBasicArrayList = nil
    self.copyJMenuItem = nil
    self.deleteJMenuItem = nil
    self.itemJPopupMenu = nil
    self.itemJScrollPane1 = nil
    self.rotateJMenuItem = nil
    self.workAreaPropertiesJPanel = nil
end


function WorkAreaJTreeJPanel.new(workAreaName)
    local self = setmetatable(JPanel.new(), WorkAreaJTreeJPanel)
    self:_init_fields()
        self:initComponents()
        self.rootTreeNode = DefaultMutableTreeNode.new(workAreaName)
        self.workAreaPropertiesJPanel:removeAll()
        self:updateTree()
        self.highlightedBasicArrayList = BasicArrayListD.new()
    return self
end


function WorkAreaJTreeJPanel:add(treeNode)
        self.rootTreeNode:add(treeNode)
end


function WorkAreaJTreeJPanel:updateTree()
        self.workAreaJTree = JTree.new(self.rootTreeNode)
        self.workAreaJTree:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:workAreaJTreeMousePressed(evt)
            end
            return o
        end)())
        self.workAreaPropertiesJPanel:removeAll()
        self.workAreaPropertiesJPanel:add(self.workAreaJTree)
end


function WorkAreaJTreeJPanel:getNode(treePathArray)
        local basicArrayList = BasicArrayListD.new()
        if treePathArray ~= nil then
            for index = 0, (treePathArray.n or #treePathArray) - 1 do
                basicArrayList:add(self:getNode(treePathArray[index + 1]))
            end
        end
        return basicArrayList
end


-- Java overloaded method: Lua keeps the last definition
function WorkAreaJTreeJPanel:getNode(treePath)
        if treePath ~= nil then
            local obj = treePath:getPath()
            if obj ~= nil then
                local node = obj[(obj.n or #obj) - 1 + 1]
                return node
            end
        end
        return nil
end


-- throws Exception
function WorkAreaJTreeJPanel:deselectAll()
        local size = self.highlightedBasicArrayList:size()
        self.logUtil:putF("size: " .. tostring(size), self, "deselectAll")
        for index = 0, size - 1 do
            local node = self.highlightedBasicArrayList:get(index)
            MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.DESELECT, node)))
        end
        self.highlightedBasicArrayList:clear()
end


-- throws Exception
function WorkAreaJTreeJPanel:selectGraphicItem(node)
        self.highlightedBasicArrayList:add(node)
        MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.SELECT, node)))
end


-- throws Exception
function WorkAreaJTreeJPanel:removeGraphicItem(node)
        MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.DELETE, node)))
end


-- throws Exception
function WorkAreaJTreeJPanel:removeCanvas(node)
        MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.DELETE, node)))
end


-- throws Exception
function WorkAreaJTreeJPanel:remove(treePath)
        local node = self:getNode(treePath)
        if node ~= nil then
            if java_instanceof(node:getUserObject(), CanvasTreeLabel) then
                self:removeCanvas(node)
            else
                self:removeGraphicItem(node)
            end
        end
        local parent = node:getParent()
        parent:remove(node)
end


-- throws Exception
function WorkAreaJTreeJPanel:copy()
        local treePath = self.workAreaJTree:getSelectionPath()
        self:copy(treePath)
        self:updateTree()
        self:expand()
        self:repaint()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function WorkAreaJTreeJPanel:copy(treePath)
        local node = self:getNode(treePath)
        if node ~= nil then
            if java_instanceof(node:getUserObject(), CanvasTreeLabel) then
                MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.DUPLICATE, node)))
            else
                MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.DUPLICATE, node)))
            end
        end
end


-- throws Exception
function WorkAreaJTreeJPanel:rotate(treePath, angle)
        local node = self:getNode(treePath)
        if node ~= nil then
            if java_instanceof(node:getUserObject(), CanvasTreeLabel) then
                MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.ROTATE, angle, node)))
            else
                MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.ROTATE, angle, node)))
            end
        end
end


function WorkAreaJTreeJPanel:getRootTreeNode()
        return self.rootTreeNode
end


function WorkAreaJTreeJPanel:expand()
        self.workAreaJTree:expandRow(0)
        self.workAreaJTree:expandRow(1)
end


-- Java overloaded method: Lua keeps the last definition
function WorkAreaJTreeJPanel:expand(treePath)
        self.workAreaJTree:expandPath(treePath)
end


function WorkAreaJTreeJPanel:initComponents()
        self.itemJPopupMenu = JPopupMenu.new()
        self.deleteJMenuItem = JMenuItem.new()
        self.copyJMenuItem = JMenuItem.new()
        self.rotateJMenuItem = JMenuItem.new()
        self.itemJScrollPane1 = JScrollPane.new()
        self.workAreaPropertiesJPanel = JPanel.new()
        self.itemJPopupMenu:addPopupMenuListener((function()
            local o = PopupMenuListener.new and PopupMenuListener.new() or setmetatable({}, {__index = PopupMenuListener})
            

            function o:popupMenuCanceled(evt)
            end
            

            function o:popupMenuWillBecomeInvisible(evt)
                self:itemJPopupMenuPopupMenuWillBecomeInvisible(evt)
            end
            

            function o:popupMenuWillBecomeVisible(evt)
                self:itemJPopupMenuPopupMenuWillBecomeVisible(evt)
            end
            return o
        end)())
        self.deleteJMenuItem:setText("Delete")
        self.deleteJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:deleteJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.itemJPopupMenu:add(self.deleteJMenuItem)
        self.copyJMenuItem:setText("Copy")
        self.copyJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:copyJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.itemJPopupMenu:add(self.copyJMenuItem)
        self.rotateJMenuItem:setText("Rotate 45*")
        self.rotateJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:rotateJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.itemJPopupMenu:add(self.rotateJMenuItem)
        self:setLayout(GridLayout.new(1, 1))
        self.workAreaPropertiesJPanel:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:workAreaPropertiesJPanelMousePressed(evt)
            end
            return o
        end)())
        self.workAreaPropertiesJPanel:setLayout(GridLayout.new(1, 0))
        self.itemJScrollPane1:setViewportView(self.workAreaPropertiesJPanel)
        self:add(self.itemJScrollPane1)
end


function WorkAreaJTreeJPanel:rotateJMenuItemMousePressed(evt)
        local try_ok, try_error = pcall(function()
            local treePath = self.workAreaJTree:getSelectionPath()
            self:rotate(treePath, 45)
            self:updateTree()
            self:expand()
            self:repaint()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "rotateJMenuItemMousePressed", e)
        end
end


function WorkAreaJTreeJPanel:workAreaJTreeMousePressed(evt)
        local try_ok, try_error = pcall(function()
            local selectedTreePathArray = self.workAreaJTree:getSelectionPaths()
            local list = self:getNode(selectedTreePathArray)
            if list:size() > 0 then
                if (evt:getModifiers() & evt.BUTTON3_MASK) == evt.BUTTON3_MASK then
                    for index = 0, (selectedTreePathArray.n or #selectedTreePathArray) - 1 do
                        local defaultMutableTreeNode = list:get(index)
                        if java_instanceof(defaultMutableTreeNode:getUserObject(), CanvasTreeLabel) then
                            self.itemJPopupMenu:show(self, evt:getX(), evt:getY())
                        else
                            self.itemJPopupMenu:show(self, evt:getX(), evt:getY())
                        end
                    end
                end
                if (evt:getModifiers() & evt.BUTTON1_MASK) == evt.BUTTON1_MASK then
                    self:deselectAll()
                    for index = 0, (selectedTreePathArray.n or #selectedTreePathArray) - 1 do
                        local defaultMutableTreeNode = list:get(index)
                        if java_instanceof(defaultMutableTreeNode:getUserObject(), CanvasTreeLabel) then
                            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.SELECT, defaultMutableTreeNode)))
                        else
                            self:selectGraphicItem(defaultMutableTreeNode)
                        end
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "workAreaJTreeMousePressed", e)
        end
end


function WorkAreaJTreeJPanel:itemJPopupMenuPopupMenuWillBecomeInvisible(evt)
end


function WorkAreaJTreeJPanel:itemJPopupMenuPopupMenuWillBecomeVisible(evt)
end


function WorkAreaJTreeJPanel:copyJMenuItemMousePressed(evt)
        local try_ok, try_error = pcall(function()
            self:copy()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "copyJMenuItemMousePressed", e)
        end
end


function WorkAreaJTreeJPanel:deleteJMenuItemMousePressed(evt)
        local try_ok, try_error = pcall(function()
            local selectedTreePathArray = self.workAreaJTree:getSelectionPaths()
            for index = 0, (selectedTreePathArray.n or #selectedTreePathArray) - 1 do
                local treePath = selectedTreePathArray[index + 1]
                self:remove(treePath)
                self:updateTree()
                self:expand()
                self:repaint()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteJMenuItemMousePressed", e)
        end
end


function WorkAreaJTreeJPanel:workAreaPropertiesJPanelMousePressed(evt)
end

return WorkAreaJTreeJPanel

