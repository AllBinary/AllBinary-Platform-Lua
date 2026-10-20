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
-- package org.allbinary.input.automation.actions.script.condition

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.input.automation.actions.script.condition.JPanel")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local AlwaysActionScriptConditionJPanel = {}
AlwaysActionScriptConditionJPanel.__index = AlwaysActionScriptConditionJPanel
AlwaysActionScriptConditionJPanel.className = "AlwaysActionScriptConditionJPanel"
setmetatable(AlwaysActionScriptConditionJPanel, {__index = JPanel})

function AlwaysActionScriptConditionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.alwaysActionScriptConditionInterface = nil
    self.alwaysActionJButton = nil
    self.alwaysActionJDialog = nil
    self.alwaysJComboBox = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.okJButton = nil
    self.titleJLabel = nil
end


function AlwaysActionScriptConditionJPanel.new(alwaysActionScriptConditionInterface)
    local self = setmetatable(JPanel.new(), AlwaysActionScriptConditionJPanel)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.alwaysActionScriptConditionInterface = alwaysActionScriptConditionInterface
        self:set()
    return self
end


function AlwaysActionScriptConditionJPanel:set()
        if self.alwaysActionScriptConditionInterface:isIsOn() then
            self.alwaysJComboBox:setSelectedIndex(0)
        else
            self.alwaysJComboBox:setSelectedIndex(1)
        end
        self.alwaysActionScriptConditionInterface:log()
end


function AlwaysActionScriptConditionJPanel:update()
        if self.alwaysJComboBox:getSelectedIndex() == 0 then
            self.alwaysActionScriptConditionInterface:setIsOn(true)
        else
            self.alwaysActionScriptConditionInterface:setIsOn(false)
        end
        self.alwaysActionScriptConditionInterface:log()
end


function AlwaysActionScriptConditionJPanel:getAlwaysActionJDialog()
        return self.alwaysActionJDialog
end


function AlwaysActionScriptConditionJPanel:setAlwaysActionJDialog(alwaysActionJDialog)
        self.alwaysActionJDialog = alwaysActionJDialog
end


function AlwaysActionScriptConditionJPanel:initComponents()
        self.alwaysActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.okJButton = JButton.new()
        self.jLabel2 = JLabel.new()
        self.alwaysJComboBox = JComboBox.new()
        self.alwaysActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.alwaysActionJDialog:setMinimumSize(Dimension.new(250, 150))
        self.titleJLabel:setText("Always Condition Options")
        self.okJButton:setText("OK")
        self.okJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel2:setText("On:")
        self.alwaysJComboBox:setModel(DefaultComboBoxModel.new({"true", "false"}))
        local alwaysActionJDialogLayout = GroupLayout.new(self.alwaysActionJDialog:getContentPane())
        self.alwaysActionJDialog:getContentPane():setLayout(alwaysActionJDialogLayout)
        alwaysActionJDialogLayout:setHorizontalGroup(alwaysActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addGroup(alwaysActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addGap(47, 47, 47):addGroup(alwaysActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, alwaysActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel2):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.alwaysJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addComponent(self.titleJLabel))):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addGap(79, 79, 79):addComponent(self.okJButton))):addContainerGap(45, Short.MAX_VALUE)))
        alwaysActionJDialogLayout:setVerticalGroup(alwaysActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.titleJLabel):addGap(20, 20, 20):addGroup(alwaysActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.alwaysJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2)):addGap(15, 15, 15):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.alwaysActionJButton:setText("Edit")
        self.alwaysActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:alwaysActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Always:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 33, Short.MAX_VALUE):addComponent(self.alwaysActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.alwaysActionJButton)))
end


function AlwaysActionScriptConditionJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getAlwaysActionJDialog():setVisible(false)
end


function AlwaysActionScriptConditionJPanel:alwaysActionJButtonActionPerformed(evt)
        self:getAlwaysActionJDialog():setVisible(true)
end

return AlwaysActionScriptConditionJPanel

