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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions.script

local GenericProfileActionScriptJPanel = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScriptJPanel"] = GenericProfileActionScriptJPanel

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

-- local MouseEvent = require("java.awt.event.MouseEvent")
-- local JPopupMenu = require("javax.swing.JPopupMenu")
-- local JComponent = require("javax.swing.JComponent")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local DefaultTreeModel = require("javax.swing.tree.DefaultTreeModel")
-- local TreePath = require("javax.swing.tree.TreePath")
local JTreeInterface = java_lazy("org.allbinary.input.automation.actions.script.JTreeInterface")
local CustomTreeNodeInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.CustomTreeNodeInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local GridLayout = require("java.awt.GridLayout")
-- local MouseAdapter = require("java.awt.event.MouseAdapter")
-- local JPanel = require("javax.swing.JPanel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local JTree = require("javax.swing.JTree")
local GenericProfileActionScript = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript")

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

-- class table GenericProfileActionScriptJPanel is declared before the requires
GenericProfileActionScriptJPanel.__index = GenericProfileActionScriptJPanel
GenericProfileActionScriptJPanel.className = "GenericProfileActionScriptJPanel"
GenericProfileActionScriptJPanel.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScriptJPanel"
setmetatable(GenericProfileActionScriptJPanel, {__index = JPanel})
GenericProfileActionScriptJPanel.java_implements = " JTreeInterface "
GenericProfileActionScriptJPanel.java_interfaces = function() return {JTreeInterface} end

function GenericProfileActionScriptJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.defaultMutableTreeNode = DefaultMutableTreeNode.new("Root")
    if self.genericProfileActionScript == nil then self.genericProfileActionScript = nil end
    if self.actionScriptJTree == nil then self.actionScriptJTree = nil end
    if self.jScrollPane1 == nil then self.jScrollPane1 = nil end
end


function GenericProfileActionScriptJPanel._jinit(self)
    java_super_init(JPanel, self)
    GenericProfileActionScriptJPanel._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
    return self
end

function GenericProfileActionScriptJPanel.new(...)
    local self = setmetatable({}, GenericProfileActionScriptJPanel)
    GenericProfileActionScriptJPanel._jinit(self, ...)
    return self
end


function GenericProfileActionScriptJPanel:updateJTree()
        local defaultTreeModel = DefaultTreeModel.new(self:getGenericProfileActionScript())
        self:getActionScriptJTree():setModel(defaultTreeModel)
        self:repaint()
        self.logUtil:putF("Updated UI", self, "updateJTree")
end
java_overload(GenericProfileActionScriptJPanel, "updateJTree", 0)


function GenericProfileActionScriptJPanel:getGenericProfileActionScript()
        return self.genericProfileActionScript
end
java_overload(GenericProfileActionScriptJPanel, "getGenericProfileActionScript", 0)


function GenericProfileActionScriptJPanel:setGenericProfileActionScript(genericProfileActionScript)
        self.genericProfileActionScript = genericProfileActionScript
end
java_overload(GenericProfileActionScriptJPanel, "setGenericProfileActionScript", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfileActionScript")) end)


function GenericProfileActionScriptJPanel:getActionScriptJTree()
        return self.actionScriptJTree
end
java_overload(GenericProfileActionScriptJPanel, "getActionScriptJTree", 0)


function GenericProfileActionScriptJPanel:setActionScriptJTree(actionScriptJTree)
        self.actionScriptJTree = actionScriptJTree
end
java_overload(GenericProfileActionScriptJPanel, "setActionScriptJTree", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTree")) end)


function GenericProfileActionScriptJPanel:initComponents()
        self.jScrollPane1 = JScrollPane.new()
        self.actionScriptJTree = JTree.new()
        self:setLayout(GridLayout.new(1, 0))
        self.actionScriptJTree:setPreferredSize(Dimension.new(500, 500))
        self.actionScriptJTree:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mouseClicked(evt)
                ;(self.actionScriptJTreeMouseClicked and self or java_outer_self):actionScriptJTreeMouseClicked(evt)
            
            end
            java_overload(o, "mouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            

            function o:mouseReleased(evt)
                ;(self.actionScriptJTreeMouseReleased and self or java_outer_self):actionScriptJTreeMouseReleased(evt)
            
            end
            java_overload(o, "mouseReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.jScrollPane1:setViewportView(self.actionScriptJTree)
        self:add(self.jScrollPane1)
end
java_overload(GenericProfileActionScriptJPanel, "initComponents", 0)


function GenericProfileActionScriptJPanel:actionScriptJTreeMouseReleased(evt)
        local button = evt:getButton()
        if rawequal(button, MouseEvent.BUTTON3) then
            local treePath = self:getActionScriptJTree():getSelectionPath()
            if not rawequal(treePath, nil) then
                local anyType = treePath:getLastPathComponent()
                if java_instanceof(anyType, CustomTreeNodeInterface) then
                    local customTreeNodeInterface = anyType
                    local jPopupMenu = customTreeNodeInterface:getJPopupMenu()
                    jPopupMenu:show(evt:getSource(), evt:getX(), evt:getY())
                end
            end
        end
end
java_overload(GenericProfileActionScriptJPanel, "actionScriptJTreeMouseReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function GenericProfileActionScriptJPanel:actionScriptJTreeMouseClicked(evt)
end
java_overload(GenericProfileActionScriptJPanel, "actionScriptJTreeMouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)

return GenericProfileActionScriptJPanel

