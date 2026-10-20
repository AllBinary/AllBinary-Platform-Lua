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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions

local JTreeInterfaceFactory = require("org.allbinary.input.automation.actions.script.JTreeInterfaceFactory")
local AlwaysActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptCondition")
local ColorAtActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition")
local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local TimeIntervalActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition")
local GenericProfileActionScriptJPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScriptJPanel")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local JPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericProfileActionJPanel = {}
GenericProfileActionJPanel.__index = GenericProfileActionJPanel
GenericProfileActionJPanel.className = "GenericProfileActionJPanel"
setmetatable(GenericProfileActionJPanel, {__index = JPanel})

function GenericProfileActionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.genericProfileAction = nil
    self.genericProfileActionScriptJPanel = nil
    self.blankProfileActionScriptJPanel = nil
    self.genericProfileActionScriptJScrollPane = nil
    self.ifJLabel = nil
    self.newAlwaysJButton = nil
    self.newColorAtJButton = nil
    self.newTimeIntervalJButton = nil
end


function GenericProfileActionJPanel.new()
    local self = setmetatable(JPanel.new(), GenericProfileActionJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function GenericProfileActionJPanel:updateProfileActionUI()
        self.blankProfileActionScriptJPanel:removeAll()
        local genericProfileActionScriptJPanel = GenericProfileActionScriptJPanel.new()
        JTreeInterfaceFactory.getInstance():set(genericProfileActionScriptJPanel)
        self:setGenericProfileActionScriptJPanel(genericProfileActionScriptJPanel)
        self:getGenericProfileActionScriptJPanel():setGenericProfileActionScript(self:getGenericProfileAction():getGenericProfileActionScript())
        self:getGenericProfileActionScriptJPanel():updateJTree()
        local layout = self.blankProfileActionScriptJPanel:getLayout()
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 395, Short.MAX_VALUE):addComponent(self:getGenericProfileActionScriptJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 256, Short.MAX_VALUE):addComponent(self:getGenericProfileActionScriptJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        self.logUtil:putF("Updated UI", self, "updateUI")
end


function GenericProfileActionJPanel:getGenericProfileAction()
        return self.genericProfileAction
end


function GenericProfileActionJPanel:setGenericProfileAction(genericProfileAction)
        self.genericProfileAction = genericProfileAction
end


function GenericProfileActionJPanel:getGenericProfileActionScriptJPanel()
        return self.genericProfileActionScriptJPanel
end


function GenericProfileActionJPanel:setGenericProfileActionScriptJPanel(genericProfileActionScriptJPanel)
        self.genericProfileActionScriptJPanel = genericProfileActionScriptJPanel
end


function GenericProfileActionJPanel:initComponents()
        self.genericProfileActionScriptJScrollPane = JScrollPane.new()
        self.blankProfileActionScriptJPanel = JPanel.new()
        self.ifJLabel = JLabel.new()
        self.newColorAtJButton = JButton.new()
        self.newTimeIntervalJButton = JButton.new()
        self.newAlwaysJButton = JButton.new()
        self:setMinimumSize(Dimension.new(440, 275))
        self:setPreferredSize(Dimension.new(440, 275))
        self.genericProfileActionScriptJScrollPane:setPreferredSize(Dimension.new(474, 270))
        self.blankProfileActionScriptJPanel:setMinimumSize(Dimension.new(400, 200))
        local blankProfileActionScriptJPanelLayout = GroupLayout.new(self.blankProfileActionScriptJPanel)
        self.blankProfileActionScriptJPanel:setLayout(blankProfileActionScriptJPanelLayout)
        blankProfileActionScriptJPanelLayout:setHorizontalGroup(blankProfileActionScriptJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 9996, Short.MAX_VALUE))
        blankProfileActionScriptJPanelLayout:setVerticalGroup(blankProfileActionScriptJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 9967, Short.MAX_VALUE))
        self.genericProfileActionScriptJScrollPane:setViewportView(self.blankProfileActionScriptJPanel)
        self.ifJLabel:setText("Conditions:")
        self.newColorAtJButton:setText("Color Range At")
        self.newColorAtJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newColorAtJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.newTimeIntervalJButton:setText("Time Interval")
        self.newTimeIntervalJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newTimeIntervalJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.newAlwaysJButton:setText("Always On/Off")
        self.newAlwaysJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newAlwaysJButtonActionPerformed(evt)
            end
            return o
        end)())
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.ifJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newColorAtJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newTimeIntervalJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newAlwaysJButton):addContainerGap(61, Short.MAX_VALUE)):addComponent(self.genericProfileActionScriptJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 440, Short.MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.ifJLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 14, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.newColorAtJButton):addComponent(self.newTimeIntervalJButton):addComponent(self.newAlwaysJButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.genericProfileActionScriptJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE)))
end


function GenericProfileActionJPanel:newTimeIntervalJButtonActionPerformed(evt)
        self.logUtil:putF("New Time Interval Action Condition", self, "newTimeIntervalJButtonActionPerformed")
        self:getGenericProfileAction():getGenericProfileActionScript():addCondition(TimeIntervalActionScriptCondition.new())
        self:updateProfileActionUI()
end


function GenericProfileActionJPanel:newAlwaysJButtonActionPerformed(evt)
        self.logUtil:putF("New EveryTime Action Condition", self, "newEveryTimeJButtonActionPerformed")
        self:getGenericProfileAction():getGenericProfileActionScript():addCondition(AlwaysActionScriptCondition.new())
        self:updateProfileActionUI()
end


function GenericProfileActionJPanel:newColorAtJButtonActionPerformed(evt)
        self.logUtil:putF("New Color At Action Condition", self, "newColorAtJButtonActionPerformed")
        self:getGenericProfileAction():getGenericProfileActionScript():addCondition(ColorAtActionScriptCondition.new())
        self:updateProfileActionUI()
end

return GenericProfileActionJPanel

