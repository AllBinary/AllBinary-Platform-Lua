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

local JPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ActionScriptItemJPanel = {}
ActionScriptItemJPanel.__index = ActionScriptItemJPanel
ActionScriptItemJPanel.className = "ActionScriptItemJPanel"
setmetatable(ActionScriptItemJPanel, {__index = JPanel})

function ActionScriptItemJPanel:_init_fields()
    self.childActionScriptConditionJPanel = nil
    self.newActionScriptConditionJPanel = nil
    self.newActionScriptInputJPanel = nil
    self.removeJPanel = nil
    self.scriptItemJPanel = nil
end


function ActionScriptItemJPanel.new()
    local self = setmetatable(JPanel.new(), ActionScriptItemJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function ActionScriptItemJPanel:getNewActionScriptInputJPanel()
        return self.newActionScriptInputJPanel
end


function ActionScriptItemJPanel:setNewActionScriptInputJPanel(newActionScriptInputJPanel)
        self.newActionScriptInputJPanel = newActionScriptInputJPanel
end


function ActionScriptItemJPanel:getRemoveJPanel()
        return self.removeJPanel
end


function ActionScriptItemJPanel:setRemoveJPanel(removeJPanel)
        self.removeJPanel = removeJPanel
end


function ActionScriptItemJPanel:getScriptItemJPanel()
        return self.scriptItemJPanel
end


function ActionScriptItemJPanel:setScriptItemJPanel(scriptItemJPanel)
        self.scriptItemJPanel = scriptItemJPanel
end


function ActionScriptItemJPanel:getNewActionScriptConditionJPanel()
        return self.newActionScriptConditionJPanel
end


function ActionScriptItemJPanel:setNewActionScriptConditionJPanel(newActionScriptConditionJPanel)
        self.newActionScriptConditionJPanel = newActionScriptConditionJPanel
end


function ActionScriptItemJPanel:getChildActionScriptConditionJPanel()
        return self.childActionScriptConditionJPanel
end


function ActionScriptItemJPanel:setChildActionScriptConditionJPanel(childActionScriptConditionJPanel)
        self.childActionScriptConditionJPanel = childActionScriptConditionJPanel
end


function ActionScriptItemJPanel:initComponents()
        self.newActionScriptInputJPanel = JPanel.new()
        self.childActionScriptConditionJPanel = JPanel.new()
        self.newActionScriptConditionJPanel = JPanel.new()
        self.scriptItemJPanel = JPanel.new()
        self.removeJPanel = JPanel.new()
        self.newActionScriptInputJPanel:setLayout(GridLayout.new(1, 0))
        local childActionScriptConditionJPanelLayout = GroupLayout.new(self.childActionScriptConditionJPanel)
        self.childActionScriptConditionJPanel:setLayout(childActionScriptConditionJPanelLayout)
        childActionScriptConditionJPanelLayout:setHorizontalGroup(childActionScriptConditionJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 229, Short.MAX_VALUE))
        childActionScriptConditionJPanelLayout:setVerticalGroup(childActionScriptConditionJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 8, Short.MAX_VALUE))
        self.newActionScriptConditionJPanel:setLayout(GridLayout.new(1, 0))
        self.scriptItemJPanel:setLayout(GridLayout.new(1, 1))
        self.removeJPanel:setLayout(GridLayout.new(1, 1))
        self.removeJPanel:setMinimumSize(Dimension.new(30, 20))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.scriptItemJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.removeJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 56, Short.MAX_VALUE)):addComponent(self.newActionScriptInputJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE):addComponent(self.newActionScriptConditionJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE):addComponent(self.childActionScriptConditionJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.scriptItemJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE):addComponent(self.removeJPanel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.childActionScriptConditionJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newActionScriptConditionJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newActionScriptInputJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))
end

return ActionScriptItemJPanel

