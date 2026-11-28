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

local WorkAreaJTreeJPanel = {}
package.loaded["org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel"] = WorkAreaJTreeJPanel

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

-- local JTree = require("javax.swing.JTree")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
-- local TreePath = require("javax.swing.tree.TreePath")
local CanvasTreeLabel = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasTreeLabel")
local MyCanvasEvent = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventService = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService")
local MyCanvasEventSource = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource")
local MyGraphicItemEvent = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent")
local MyGraphicItemEventService = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService")
local MyGraphicItemEventSource = java_lazy("org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventSource")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local GridLayout = require("java.awt.GridLayout")
-- local MouseAdapter = require("java.awt.event.MouseAdapter")
-- local MouseEvent = require("java.awt.event.MouseEvent")
-- local JMenuItem = require("javax.swing.JMenuItem")
-- local JPanel = require("javax.swing.JPanel")
-- local JPopupMenu = require("javax.swing.JPopupMenu")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local PopupMenuEvent = require("javax.swing.event.PopupMenuEvent")
-- local PopupMenuListener = require("javax.swing.event.PopupMenuListener")

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table WorkAreaJTreeJPanel is declared before the requires
WorkAreaJTreeJPanel.__index = WorkAreaJTreeJPanel
WorkAreaJTreeJPanel.className = "WorkAreaJTreeJPanel"
WorkAreaJTreeJPanel.javaClassName = "org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel"
setmetatable(WorkAreaJTreeJPanel, {__index = JPanel})

function WorkAreaJTreeJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.rootTreeNode == nil then self.rootTreeNode = nil end
    if self.workAreaJTree == nil then self.workAreaJTree = nil end
    if self.highlightedBasicArrayList == nil then self.highlightedBasicArrayList = nil end
    if self.copyJMenuItem == nil then self.copyJMenuItem = nil end
    if self.deleteJMenuItem == nil then self.deleteJMenuItem = nil end
    if self.itemJPopupMenu == nil then self.itemJPopupMenu = nil end
    if self.itemJScrollPane1 == nil then self.itemJScrollPane1 = nil end
    if self.rotateJMenuItem == nil then self.rotateJMenuItem = nil end
    if self.workAreaPropertiesJPanel == nil then self.workAreaPropertiesJPanel = nil end
end


function WorkAreaJTreeJPanel._jinit(self, workAreaName)
    java_super_init(JPanel, self)
    WorkAreaJTreeJPanel._init_fields(self)
        self:initComponents()
        self.rootTreeNode = DefaultMutableTreeNode.new(workAreaName)
        self.workAreaPropertiesJPanel:removeAll()
        self:updateTree()
        self.highlightedBasicArrayList = BasicArrayListD.new()
    return self
end

function WorkAreaJTreeJPanel.new(...)
    local self = setmetatable({}, WorkAreaJTreeJPanel)
    WorkAreaJTreeJPanel._jinit(self, ...)
    return self
end


function WorkAreaJTreeJPanel:add(treeNode)
        self.rootTreeNode:add(treeNode)
end
java_overload(WorkAreaJTreeJPanel, "add", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MutableTreeNode")) end)


function WorkAreaJTreeJPanel:updateTree()
        self.workAreaJTree = JTree.new(self.rootTreeNode)
        self.workAreaJTree:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.workAreaJTreeMousePressed and self or java_outer_self):workAreaJTreeMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.workAreaPropertiesJPanel:removeAll()
        self.workAreaPropertiesJPanel:add(self.workAreaJTree)
end
java_overload(WorkAreaJTreeJPanel, "updateTree", 0)


function WorkAreaJTreeJPanel:getNode_j1_1(treePathArray)
        local basicArrayList = BasicArrayListD.new()
        if not rawequal(treePathArray, nil) then
            for index = 0, (treePathArray.n or #treePathArray) - 1 do
                basicArrayList:add(self:getNode(treePathArray[index + 1]))
            end
        end
        return basicArrayList
end


function WorkAreaJTreeJPanel:getNode_j1_2(treePath)
        if not rawequal(treePath, nil) then
            local obj = treePath:getPath()
            if not rawequal(obj, nil) then
                local node = obj[(obj.n or #obj) - 1 + 1]
                return node
            end
        end
        return nil
end
function WorkAreaJTreeJPanel:getNode(...)
    local count = select("#", ...)
    if count == 1 then return self:getNode_j1(...) end
    local parent = getmetatable(WorkAreaJTreeJPanel).__index
    if parent.getNode then return parent.getNode(self, ...) end
    error("No method getNode takes " .. count .. " arguments")
end
WorkAreaJTreeJPanel.getNode__jdispatcher = WorkAreaJTreeJPanel.getNode
function WorkAreaJTreeJPanel:getNode_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) then return WorkAreaJTreeJPanel.getNode_j1_1(self, ...) end
    return WorkAreaJTreeJPanel.getNode_j1_2(self, ...)
end


-- throws Exception
function WorkAreaJTreeJPanel:deselectAll()
        local size = self.highlightedBasicArrayList:size()
        self.logUtil:putF(require("allbinary_java").to_string("size: ") .. require("allbinary_java").to_string(size), self, "deselectAll")
        for index = 0, size - 1 do
            local node = self.highlightedBasicArrayList:get(index)
            MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.DESELECT, node)))
        end
        self.highlightedBasicArrayList:clear()
end
java_overload(WorkAreaJTreeJPanel, "deselectAll", 0)


-- throws Exception
function WorkAreaJTreeJPanel:selectGraphicItem(node)
        self.highlightedBasicArrayList:add(node)
        MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.SELECT, node)))
end
java_overload(WorkAreaJTreeJPanel, "selectGraphicItem", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DefaultMutableTreeNode")) end)


-- throws Exception
function WorkAreaJTreeJPanel:removeGraphicItem(node)
        MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.DELETE, node)))
end
java_overload(WorkAreaJTreeJPanel, "removeGraphicItem", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DefaultMutableTreeNode")) end)


-- throws Exception
function WorkAreaJTreeJPanel:removeCanvas(node)
        MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.DELETE, node)))
end
java_overload(WorkAreaJTreeJPanel, "removeCanvas", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DefaultMutableTreeNode")) end)


-- throws Exception
function WorkAreaJTreeJPanel:remove(treePath)
        local node = self:getNode(treePath)
        if not rawequal(node, nil) then
            if java_instanceof(node:getUserObject(), CanvasTreeLabel) then
                self:removeCanvas(node)
            else
                self:removeGraphicItem(node)
            end
        end
        local parent = node:getParent()
        parent:remove(node)
end
java_overload(WorkAreaJTreeJPanel, "remove", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TreePath")) end)


-- throws Exception
function WorkAreaJTreeJPanel:copy_j0()
        local treePath = self.workAreaJTree:getSelectionPath()
        self:copy(treePath)
        self:updateTree()
        self:expand()
        self:repaint()
end


-- throws Exception
function WorkAreaJTreeJPanel:copy_j1(treePath)
        local node = self:getNode(treePath)
        if not rawequal(node, nil) then
            if java_instanceof(node:getUserObject(), CanvasTreeLabel) then
                MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.DUPLICATE, node)))
            else
                MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.DUPLICATE, node)))
            end
        end
end
function WorkAreaJTreeJPanel:copy(...)
    local count = select("#", ...)
    if count == 0 then return self:copy_j0(...) end
    if count == 1 then return self:copy_j1(...) end
    local parent = getmetatable(WorkAreaJTreeJPanel).__index
    if parent.copy then return parent.copy(self, ...) end
    error("No method copy takes " .. count .. " arguments")
end
WorkAreaJTreeJPanel.copy__jdispatcher = WorkAreaJTreeJPanel.copy


-- throws Exception
function WorkAreaJTreeJPanel:rotate(treePath, angle)
        local node = self:getNode(treePath)
        if not rawequal(node, nil) then
            if java_instanceof(node:getUserObject(), CanvasTreeLabel) then
                MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.ROTATE, angle, node)))
            else
                MyGraphicItemEventService.fire(MyGraphicItemEvent.new(MyGraphicItemEventSource.new(MyGraphicItemEventService.ROTATE, angle, node)))
            end
        end
end
java_overload(WorkAreaJTreeJPanel, "rotate", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "TreePath")) and type(java_a2) == "number" end)


function WorkAreaJTreeJPanel:getRootTreeNode()
        return self.rootTreeNode
end
java_overload(WorkAreaJTreeJPanel, "getRootTreeNode", 0)


function WorkAreaJTreeJPanel:expand_j0()
        self.workAreaJTree:expandRow(0)
        self.workAreaJTree:expandRow(1)
end


function WorkAreaJTreeJPanel:expand_j1(treePath)
        self.workAreaJTree:expandPath(treePath)
end
function WorkAreaJTreeJPanel:expand(...)
    local count = select("#", ...)
    if count == 0 then return self:expand_j0(...) end
    if count == 1 then return self:expand_j1(...) end
    local parent = getmetatable(WorkAreaJTreeJPanel).__index
    if parent.expand then return parent.expand(self, ...) end
    error("No method expand takes " .. count .. " arguments")
end
WorkAreaJTreeJPanel.expand__jdispatcher = WorkAreaJTreeJPanel.expand


function WorkAreaJTreeJPanel:initComponents()
        self.itemJPopupMenu = JPopupMenu.new()
        self.deleteJMenuItem = JMenuItem.new()
        self.copyJMenuItem = JMenuItem.new()
        self.rotateJMenuItem = JMenuItem.new()
        self.itemJScrollPane1 = JScrollPane.new()
        self.workAreaPropertiesJPanel = JPanel.new()
        self.itemJPopupMenu:addPopupMenuListener((function()
            local java_outer_self = self
        local o = PopupMenuListener.new and PopupMenuListener.new() or setmetatable({}, {__index = PopupMenuListener})
            

            function o:popupMenuCanceled(evt)
            end
            java_overload(o, "popupMenuCanceled", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PopupMenuEvent")) end)
            

            function o:popupMenuWillBecomeInvisible(evt)
                ;(self.itemJPopupMenuPopupMenuWillBecomeInvisible and self or java_outer_self):itemJPopupMenuPopupMenuWillBecomeInvisible(evt)
            
            end
            java_overload(o, "popupMenuWillBecomeInvisible", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PopupMenuEvent")) end)
            

            function o:popupMenuWillBecomeVisible(evt)
                ;(self.itemJPopupMenuPopupMenuWillBecomeVisible and self or java_outer_self):itemJPopupMenuPopupMenuWillBecomeVisible(evt)
            
            end
            java_overload(o, "popupMenuWillBecomeVisible", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PopupMenuEvent")) end)
            return o
        end)())
        self.deleteJMenuItem:setText("Delete")
        self.deleteJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.deleteJMenuItemMousePressed and self or java_outer_self):deleteJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.itemJPopupMenu:add(self.deleteJMenuItem)
        self.copyJMenuItem:setText("Copy")
        self.copyJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.copyJMenuItemMousePressed and self or java_outer_self):copyJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.itemJPopupMenu:add(self.copyJMenuItem)
        self.rotateJMenuItem:setText("Rotate 45*")
        self.rotateJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.rotateJMenuItemMousePressed and self or java_outer_self):rotateJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.itemJPopupMenu:add(self.rotateJMenuItem)
        self:setLayout(GridLayout.new(1, 1))
        self.workAreaPropertiesJPanel:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.workAreaPropertiesJPanelMousePressed and self or java_outer_self):workAreaPropertiesJPanelMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.workAreaPropertiesJPanel:setLayout(GridLayout.new(1, 0))
        self.itemJScrollPane1:setViewportView(self.workAreaPropertiesJPanel)
        self:add(self.itemJScrollPane1)
end
java_overload(WorkAreaJTreeJPanel, "initComponents", 0)


function WorkAreaJTreeJPanel:rotateJMenuItemMousePressed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local treePath = self.workAreaJTree:getSelectionPath()
            self:rotate(treePath, 45)
            self:updateTree()
            self:expand()
            self:repaint()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "rotateJMenuItemMousePressed", e)
        end
end
java_overload(WorkAreaJTreeJPanel, "rotateJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function WorkAreaJTreeJPanel:workAreaJTreeMousePressed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local selectedTreePathArray = self.workAreaJTree:getSelectionPaths()
            local list = self:getNode(selectedTreePathArray)
            if list:size() > 0 then
                if rawequal((evt:getModifiers() & evt.BUTTON3_MASK), evt.BUTTON3_MASK) then
                    for index = 0, (selectedTreePathArray.n or #selectedTreePathArray) - 1 do
                        local defaultMutableTreeNode = list:get(index)
                        if java_instanceof(defaultMutableTreeNode:getUserObject(), CanvasTreeLabel) then
                            self.itemJPopupMenu:show(self, evt:getX(), evt:getY())
                        else
                            self.itemJPopupMenu:show(self, evt:getX(), evt:getY())
                        end
                    end
                end
                if rawequal((evt:getModifiers() & evt.BUTTON1_MASK), evt.BUTTON1_MASK) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "workAreaJTreeMousePressed", e)
        end
end
java_overload(WorkAreaJTreeJPanel, "workAreaJTreeMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function WorkAreaJTreeJPanel:itemJPopupMenuPopupMenuWillBecomeInvisible(evt)
end
java_overload(WorkAreaJTreeJPanel, "itemJPopupMenuPopupMenuWillBecomeInvisible", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PopupMenuEvent")) end)


function WorkAreaJTreeJPanel:itemJPopupMenuPopupMenuWillBecomeVisible(evt)
end
java_overload(WorkAreaJTreeJPanel, "itemJPopupMenuPopupMenuWillBecomeVisible", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PopupMenuEvent")) end)


function WorkAreaJTreeJPanel:copyJMenuItemMousePressed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self:copy()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "copyJMenuItemMousePressed", e)
        end
end
java_overload(WorkAreaJTreeJPanel, "copyJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function WorkAreaJTreeJPanel:deleteJMenuItemMousePressed(evt)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteJMenuItemMousePressed", e)
        end
end
java_overload(WorkAreaJTreeJPanel, "deleteJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function WorkAreaJTreeJPanel:workAreaPropertiesJPanelMousePressed(evt)
end
java_overload(WorkAreaJTreeJPanel, "workAreaPropertiesJPanelMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)

return WorkAreaJTreeJPanel

