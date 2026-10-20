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
-- package org.allbinary.input.automation.actions.script.condition.processors.input

local JPanel = require("org.allbinary.input.automation.actions.script.condition.processors.input.JPanel")

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

local InputAutomationTypeJPanel = {}
InputAutomationTypeJPanel.__index = InputAutomationTypeJPanel
InputAutomationTypeJPanel.className = "InputAutomationTypeJPanel"
setmetatable(InputAutomationTypeJPanel, {__index = JPanel})

function InputAutomationTypeJPanel:_init_fields()
    self.inputAutomationTypeJComboBox = nil
    self.jLabel1 = nil
end


function InputAutomationTypeJPanel.new()
    local self = setmetatable(JPanel.new(), InputAutomationTypeJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function InputAutomationTypeJPanel:getInputAutomationTypeJComboBox()
        return self.inputAutomationTypeJComboBox
end


function InputAutomationTypeJPanel:setInputAutomationTypeJComboBox(inputAutomationTypeJComboBox)
        self.inputAutomationTypeJComboBox = inputAutomationTypeJComboBox
end


function InputAutomationTypeJPanel:initComponents()
        self.inputAutomationTypeJComboBox = JComboBox.new()
        self.jLabel1 = JLabel.new()
        self.inputAutomationTypeJComboBox:setModel(DefaultComboBoxModel.new({"DirectX", "DirectX 8", "Low Level", "Java Robot"}))
        self.jLabel1:setText("Input Type:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.inputAutomationTypeJComboBox, 0, 98, Short.MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.inputAutomationTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
end

return InputAutomationTypeJPanel

