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

-- local MouseEvent = require("java.awt.event.MouseEvent")
-- local swing = require("javax.swing")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
-- local DefaultTreeModel = require("javax.swing.tree.DefaultTreeModel")
-- local TreePath = require("javax.swing.tree.TreePath")
local JTreeInterface = require("org.allbinary.input.automation.actions.script.JTreeInterface")
local CustomTreeNodeInterface = require("org.allbinary.input.automation.actions.script.condition.CustomTreeNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.JPanel")

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

local GenericProfileActionScriptJPanel = {}
GenericProfileActionScriptJPanel.__index = GenericProfileActionScriptJPanel
GenericProfileActionScriptJPanel.className = "GenericProfileActionScriptJPanel"
setmetatable(GenericProfileActionScriptJPanel, {__index = JPanel})

function GenericProfileActionScriptJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.defaultMutableTreeNode = DefaultMutableTreeNode.new("Root")
    self.genericProfileActionScript = nil
    self.actionScriptJTree = nil
    self.jScrollPane1 = nil
end


function GenericProfileActionScriptJPanel.new()
    local self = setmetatable(JPanel.new(), GenericProfileActionScriptJPanel)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
    return self
end


function GenericProfileActionScriptJPanel:updateJTree()
        local defaultTreeModel = DefaultTreeModel.new(self:getGenericProfileActionScript())
        self:getActionScriptJTree():setModel(defaultTreeModel)
        self:repaint()
        self.logUtil:putF("Updated UI", self, "updateJTree")
end


function GenericProfileActionScriptJPanel:getGenericProfileActionScript()
        return self.genericProfileActionScript
end


function GenericProfileActionScriptJPanel:setGenericProfileActionScript(genericProfileActionScript)
        self.genericProfileActionScript = genericProfileActionScript
end


function GenericProfileActionScriptJPanel:getActionScriptJTree()
        return self.actionScriptJTree
end


function GenericProfileActionScriptJPanel:setActionScriptJTree(actionScriptJTree)
        self.actionScriptJTree = actionScriptJTree
end


function GenericProfileActionScriptJPanel:initComponents()
        self.jScrollPane1 = JScrollPane.new()
        self.actionScriptJTree = JTree.new()
        self:setLayout(GridLayout.new(1, 0))
        self.actionScriptJTree:setPreferredSize(Dimension.new(500, 500))
        self.actionScriptJTree:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mouseClicked(evt)
                self:actionScriptJTreeMouseClicked(evt)
            end
            

            function o:mouseReleased(evt)
                self:actionScriptJTreeMouseReleased(evt)
            end
            return o
        end)())
        self.jScrollPane1:setViewportView(self.actionScriptJTree)
        self:add(self.jScrollPane1)
end


function GenericProfileActionScriptJPanel:actionScriptJTreeMouseReleased(evt)
        local button = evt:getButton()
        if button == MouseEvent.BUTTON3 then
            local treePath = self:getActionScriptJTree():getSelectionPath()
            if treePath ~= nil then
                local anyType = treePath:getLastPathComponent()
                if java_instanceof(anyType, CustomTreeNodeInterface) then
                    local customTreeNodeInterface = anyType
                    local jPopupMenu = customTreeNodeInterface:getJPopupMenu()
                    jPopupMenu:show(evt:getSource(), evt:getX(), evt:getY())
                end
            end
        end
end


function GenericProfileActionScriptJPanel:actionScriptJTreeMouseClicked(evt)
end

return GenericProfileActionScriptJPanel

