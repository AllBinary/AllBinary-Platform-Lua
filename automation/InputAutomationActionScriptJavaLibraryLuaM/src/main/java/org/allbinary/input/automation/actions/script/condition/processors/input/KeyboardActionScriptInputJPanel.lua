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

-- local swing = require("javax.swing")
local KeySingletonFactory = require("org.allbinary.input.KeySingletonFactory")
local InputRobot = require("org.allbinary.input.automation.robot.InputRobot")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local TempInputRobotNames = require("org.allbinary.input.automation.robot.TempInputRobotNames")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.input.automation.actions.script.condition.processors.input.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyboardActionScriptInputJPanel = {}
KeyboardActionScriptInputJPanel.__index = KeyboardActionScriptInputJPanel
KeyboardActionScriptInputJPanel.className = "KeyboardActionScriptInputJPanel"
setmetatable(KeyboardActionScriptInputJPanel, {__index = JPanel})

function KeyboardActionScriptInputJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.keyActionScriptInputInterface = nil
    self.addKeyJLabel = nil
    self.delayBetweenJLabel = nil
    self.delayJTextField = nil
    self.holdTimeJLabel = nil
    self.inputAutomationTypeJComboBox = nil
    self.inputTypeJLabel = nil
    self.jLabel1 = nil
    self.jPanel1 = nil
    self.keyActionJButton = nil
    self.keyActionJDialog = nil
    self.keyIntegerJComboBox = nil
    self.keyNameJComboBox = nil
    self.normalJRadioButton = nil
    self.okJButton = nil
    self.pressJRadioButton = nil
    self.releaseJRadioButton = nil
    self.sequenceJRadioButton = nil
    self.simultaneousJRadioButton = nil
    self.testJLabel = nil
    self.textJTextField = nil
    self.timeJTextField = nil
    self.titleJLabel = nil
end


function KeyboardActionScriptInputJPanel.new(keyActionScriptInputInterface)
    local self = setmetatable(JPanel.new(), KeyboardActionScriptInputJPanel)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.keyActionScriptInputInterface = keyActionScriptInputInterface
        local defaultComboBoxModel = DefaultComboBoxModel.new()
        defaultComboBoxModel:addElement(TempInputRobotNames.DX_NAME)
        defaultComboBoxModel:addElement(InputRobot.NAME)
        self.inputAutomationTypeJComboBox:setModel(defaultComboBoxModel)
        self.keyNameJComboBox:setModel(KeyNameDefaultComboBoxModelFactory.getInstance())
        self.keyIntegerJComboBox:setModel(KeyCharDefaultComboBoxModelFactory.getInstance())
        if self.keyActionScriptInputInterface:isNormal() then
            self.normalJRadioButton:setSelected(true)
            self.pressJRadioButton:setSelected(false)
            self.releaseJRadioButton:setSelected(false)
        elseif self.keyActionScriptInputInterface:isPress() then
            self.normalJRadioButton:setSelected(false)
            self.pressJRadioButton:setSelected(true)
            self.releaseJRadioButton:setSelected(false)
        elseif self.keyActionScriptInputInterface:isRelease() then
            self.normalJRadioButton:setSelected(false)
            self.pressJRadioButton:setSelected(false)
            self.releaseJRadioButton:setSelected(true)
        end
        self:set()
    return self
end


function KeyboardActionScriptInputJPanel:set()
        local inputTypeComboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        inputTypeComboBoxModel:setSelectedItem(self.keyActionScriptInputInterface:getInputRobotInterface():getName())
        self.textJTextField:setText(self.keyActionScriptInputInterface:getText())
        self.delayJTextField:setText(tostring(self.keyActionScriptInputInterface:getDelayBetweenKeys()))
        self.timeJTextField:setText(tostring(self.keyActionScriptInputInterface:getTime()))
        self.keyActionScriptInputInterface:log()
end


-- throws Exception
function KeyboardActionScriptInputJPanel:updateInputType()
        local comboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        local selectedItem = comboBoxModel:getSelectedItem()
        if not StringValidationUtil.getInstance():isEmpty(selectedItem) then
            self.keyActionScriptInputInterface:setInputRobotInterface(InputRobotFactory.getInstance():get(selectedItem))
        end
end


function KeyboardActionScriptInputJPanel:getSelectedKey()
        local comboBoxModel = self.keyNameJComboBox:getModel()
        local selectedItem = comboBoxModel:getSelectedItem()
        if not StringValidationUtil.getInstance():isEmpty(selectedItem) then
            return KeySingletonFactory.getHashtable():get(selectedItem)
        end
        return nil
end


function KeyboardActionScriptInputJPanel:updateKeys()
        local text = self.textJTextField:getText()
        self.keyActionScriptInputInterface:setText(text)
end


-- throws Exception
function KeyboardActionScriptInputJPanel:update()
        self:updateInputType()
        self:updateKeys()
        self.keyActionScriptInputInterface:setTime(math.tointeger(tostring(self.timeJTextField:getText()) // 1))
        self.keyActionScriptInputInterface:log()
end


function KeyboardActionScriptInputJPanel:getKeyActionJDialog()
        return self.keyActionJDialog
end


function KeyboardActionScriptInputJPanel:setKeyActionJDialog(keyActionJDialog)
        self.keyActionJDialog = keyActionJDialog
end


function KeyboardActionScriptInputJPanel:initComponents()
        self.keyActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.addKeyJLabel = JLabel.new()
        self.keyNameJComboBox = JComboBox.new()
        self.timeJTextField = JTextField.new()
        self.holdTimeJLabel = JLabel.new()
        self.inputAutomationTypeJComboBox = JComboBox.new()
        self.inputTypeJLabel = JLabel.new()
        self.delayJTextField = JTextField.new()
        self.delayBetweenJLabel = JLabel.new()
        self.testJLabel = JLabel.new()
        self.textJTextField = JTextField.new()
        self.pressJRadioButton = JRadioButton.new()
        self.releaseJRadioButton = JRadioButton.new()
        self.normalJRadioButton = JRadioButton.new()
        self.simultaneousJRadioButton = JRadioButton.new()
        self.sequenceJRadioButton = JRadioButton.new()
        self.jPanel1 = JPanel.new()
        self.okJButton = JButton.new()
        self.keyIntegerJComboBox = JComboBox.new()
        self.keyActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.keyActionJDialog:setMinimumSize(Dimension.new(255, 280))
        self.titleJLabel:setHorizontalAlignment(javax.swing.SwingConstants.CENTER)
        self.titleJLabel:setText("Keyboard Input Options")
        self.addKeyJLabel:setText("Add Key:")
        self.keyNameJComboBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:keyNameJComboBoxActionPerformed(evt)
            end
            return o
        end)())
        self.timeJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.holdTimeJLabel:setText("Hold Time (ms):")
        self.inputTypeJLabel:setText("Input Type:")
        self.delayJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.delayBetweenJLabel:setText("Delay Between Keys (ms):")
        self.testJLabel:setText("Text:")
        self.textJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.pressJRadioButton:setText("Press")
        self.pressJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.pressJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.pressJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:pressJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.releaseJRadioButton:setText("Release")
        self.releaseJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.releaseJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.releaseJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:releaseJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.normalJRadioButton:setSelected(true)
        self.normalJRadioButton:setText("Normal")
        self.normalJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.normalJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.normalJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:normalJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.simultaneousJRadioButton:setSelected(true)
        self.simultaneousJRadioButton:setText("Simultaneous")
        self.simultaneousJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.simultaneousJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.simultaneousJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:simultaneousJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.sequenceJRadioButton:setText("Sequence")
        self.sequenceJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.sequenceJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.sequenceJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:sequenceJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.okJButton:setText("OK")
        self.okJButton:setHorizontalTextPosition(javax.swing.SwingConstants.CENTER)
        self.okJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jPanel1:add(self.okJButton)
        self.keyIntegerJComboBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:keyIntegerJComboBoxActionPerformed(evt)
            end
            return o
        end)())
        local keyActionJDialogLayout = GroupLayout.new(self.keyActionJDialog:getContentPane())
        self.keyActionJDialog:getContentPane():setLayout(keyActionJDialogLayout)
        keyActionJDialogLayout:setHorizontalGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(keyActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(keyActionJDialogLayout:createSequentialGroup():addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false):addComponent(self.addKeyJLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.inputTypeJLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.inputAutomationTypeJComboBox, 0, 148, Short.MAX_VALUE):addComponent(self.textJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 148, Short.MAX_VALUE):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.keyNameJComboBox, 0, 101, Short.MAX_VALUE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.keyIntegerJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)))):addComponent(self.testJLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.normalJRadioButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.pressJRadioButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.releaseJRadioButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 48, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, keyActionJDialogLayout:createSequentialGroup():addComponent(self.holdTimeJLabel):addGap(22, 22, 22):addComponent(self.timeJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 113, Short.MAX_VALUE)):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.delayBetweenJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE):addComponent(self.delayJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.simultaneousJRadioButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.sequenceJRadioButton))):addContainerGap()):addComponent(self.titleJLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE):addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE))
        keyActionJDialogLayout:setVerticalGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.inputTypeJLabel):addComponent(self.inputAutomationTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.addKeyJLabel):addComponent(self.keyIntegerJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.keyNameJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.testJLabel):addComponent(self.textJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.pressJRadioButton):addComponent(self.normalJRadioButton):addComponent(self.releaseJRadioButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.holdTimeJLabel):addComponent(self.timeJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.delayBetweenJLabel):addComponent(self.delayJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.simultaneousJRadioButton):addComponent(self.sequenceJRadioButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.keyActionJButton:setText("Edit")
        self.keyActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:keyActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Key:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 49, Short.MAX_VALUE):addComponent(self.keyActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.keyActionJButton)))
end


function KeyboardActionScriptInputJPanel:prependText(integer)
        if integer ~= nil then
            local newKey = "&#" .. tostring(integer) .. ";"
            self.textJTextField:setText(newKey .. tostring(self.textJTextField:getText()))
        end
end


function KeyboardActionScriptInputJPanel:keyIntegerJComboBoxActionPerformed(evt)
        self.keyIntegerJComboBox:getSelectedIndex()
        self.keyNameJComboBox:setSelectedIndex(self.keyIntegerJComboBox:getSelectedIndex())
end


function KeyboardActionScriptInputJPanel:sequenceJRadioButtonActionPerformed(evt)
        if self.sequenceJRadioButton:isSelected() then
            self.delayJTextField:setText(CommonPhoneStrings.getInstance().ONE)
            self.simultaneousJRadioButton:setSelected(false)
        end
end


function KeyboardActionScriptInputJPanel:simultaneousJRadioButtonActionPerformed(evt)
        if self.simultaneousJRadioButton:isSelected() then
            self.delayJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
            self.sequenceJRadioButton:setSelected(false)
        end
end


function KeyboardActionScriptInputJPanel:keyNameJComboBoxActionPerformed(evt)
        local integer = self:getSelectedKey()
        self:prependText(integer)
        self.keyIntegerJComboBox:setSelectedIndex(self.keyNameJComboBox:getSelectedIndex())
end


function KeyboardActionScriptInputJPanel:okJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self:update()
            self:getKeyActionJDialog():setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okButtonActionPerformed", e)
        end
end


function KeyboardActionScriptInputJPanel:keyActionJButtonActionPerformed(evt)
        self:getKeyActionJDialog():setVisible(true)
end


function KeyboardActionScriptInputJPanel:normalJRadioButtonActionPerformed(evt)
        if self.normalJRadioButton:isSelected() then
            self.keyActionScriptInputInterface:setNormal()
            self.pressJRadioButton:setSelected(false)
            self.releaseJRadioButton:setSelected(false)
        end
end


function KeyboardActionScriptInputJPanel:releaseJRadioButtonActionPerformed(evt)
        if self.releaseJRadioButton:isSelected() then
            self.keyActionScriptInputInterface:setRelease(true)
            self.keyActionScriptInputInterface:setPress(false)
            self.pressJRadioButton:setSelected(false)
            self.normalJRadioButton:setSelected(false)
        end
end


function KeyboardActionScriptInputJPanel:pressJRadioButtonActionPerformed(evt)
        if self.pressJRadioButton:isSelected() then
            self.keyActionScriptInputInterface:setPress(true)
            self.keyActionScriptInputInterface:setRelease(false)
            self.releaseJRadioButton:setSelected(false)
            self.normalJRadioButton:setSelected(false)
        end
end

return KeyboardActionScriptInputJPanel

