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

-- local InputEvent = require("java.awt.event.InputEvent")
-- local swing = require("javax.swing")
local InputRobot = require("org.allbinary.input.automation.robot.InputRobot")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local TempInputRobotNames = require("org.allbinary.input.automation.robot.TempInputRobotNames")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local MouseActionScriptInputJPanel = {}
MouseActionScriptInputJPanel.__index = MouseActionScriptInputJPanel
MouseActionScriptInputJPanel.className = "MouseActionScriptInputJPanel"
setmetatable(MouseActionScriptInputJPanel, {__index = JPanel})

function MouseActionScriptInputJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.mouseActionScriptInputInterface = nil
    self.button1JCheckBox = nil
    self.button2JCheckBox = nil
    self.inputAutomationTypeJComboBox = nil
    self.inputTypeJLabel = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jLabel4 = nil
    self.jLabel5 = nil
    self.jLabel6 = nil
    self.mouseActionJButton = nil
    self.mouseActionJDialog = nil
    self.mouseDelayJTextField = nil
    self.mouseXJTextField = nil
    self.mouseYJTextField = nil
    self.okJButton = nil
    self.titleJLabel = nil
end


function MouseActionScriptInputJPanel.new(mouseActionScriptInputInterface)
    local self = setmetatable(JPanel.new(), MouseActionScriptInputJPanel)
    self:_init_fields()
        self.logUtil:putF(CommonLabels.getInstance().START + mouseActionScriptInputInterface, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.mouseActionScriptInputInterface = mouseActionScriptInputInterface
        local defaultComboBoxModel = DefaultComboBoxModel.new()
        defaultComboBoxModel:addElement(TempInputRobotNames.LOW_NAME)
        defaultComboBoxModel:addElement(TempInputRobotNames.SYS_NAME)
        defaultComboBoxModel:addElement(InputRobot.NAME)
        self.inputAutomationTypeJComboBox:setModel(defaultComboBoxModel)
        self:set()
    return self
end


function MouseActionScriptInputJPanel:set()
        local inputTypeComboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        inputTypeComboBoxModel:setSelectedItem(self.mouseActionScriptInputInterface:getInputRobotInterface():getName())
        if (self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON1_MASK) ~= 0 then
            self.button1JCheckBox:setSelected(true)
        else
            self.button1JCheckBox:setSelected(false)
        end
        if (self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON2_MASK) ~= 0 then
            self.button2JCheckBox:setSelected(true)
        else
            self.button2JCheckBox:setSelected(false)
        end
        self.mouseDelayJTextField:setText(tostring(self.mouseActionScriptInputInterface:getTime()))
        self.mouseXJTextField:setText(tostring(self.mouseActionScriptInputInterface:getPoint().x))
        self.mouseYJTextField:setText(tostring(self.mouseActionScriptInputInterface:getPoint().y))
        self.mouseActionScriptInputInterface:log()
end


-- throws Exception
function MouseActionScriptInputJPanel:updateInputType()
        local comboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        local selectedItem = comboBoxModel:getSelectedItem()
        if not StringValidationUtil.getInstance():isEmpty(selectedItem) then
            self.mouseActionScriptInputInterface:setInputRobotInterface(InputRobotFactory.getInstance():get(selectedItem))
        end
end


-- throws Exception
function MouseActionScriptInputJPanel:update()
        self:updateInputType()
        self.mouseActionScriptInputInterface:setTime(tostring(self.mouseDelayJTextField:getText()))
        self.logUtil:putF("Button State: " .. tostring(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
        if self.button1JCheckBox:isSelected() then
            if (self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON1_MASK) == 0 then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() | InputEvent.BUTTON1_MASK)
                self.logUtil:putF("Button 1 Selected: " .. tostring(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        else
            if (self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON1_MASK) ~= 0 then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() ~ InputEvent.BUTTON1_MASK)
                self.logUtil:putF("Button 1 Deselected: " .. tostring(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        end
        if self.button2JCheckBox:isSelected() then
            if (self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON2_MASK) == 0 then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() | InputEvent.BUTTON2_MASK)
                self.logUtil:putF("Button 2 Selected: " .. tostring(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        else
            if (self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON2_MASK) ~= 0 then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() ~ InputEvent.BUTTON2_MASK)
                self.logUtil:putF("Button 2 Deselected: " .. tostring(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        end
        local mouseXString = self.mouseXJTextField:getText()
        if not StringValidationUtil.getInstance():isEmpty(mouseXString) and StringValidationUtil.getInstance():isNumber(mouseXString) then
            self.mouseActionScriptInputInterface:getPoint().x = math.tointeger(tonumber(mouseXString))
        end
        local mouseYString = self.mouseYJTextField:getText()
        if not StringValidationUtil.getInstance():isEmpty(mouseYString) and StringValidationUtil.getInstance():isNumber(mouseYString) then
            self.mouseActionScriptInputInterface:getPoint().y = math.tointeger(tonumber(mouseYString))
        end
        self.mouseActionScriptInputInterface:log()
end


function MouseActionScriptInputJPanel:getMouseActionJDialog()
        return self.mouseActionJDialog
end


function MouseActionScriptInputJPanel:setMouseActionJDialog(mouseActionJDialog)
        self.mouseActionJDialog = mouseActionJDialog
end


function MouseActionScriptInputJPanel:initComponents()
        self.mouseActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.okJButton = JButton.new()
        self.jLabel2 = JLabel.new()
        self.jLabel3 = JLabel.new()
        self.button1JCheckBox = JCheckBox.new()
        self.button2JCheckBox = JCheckBox.new()
        self.jLabel4 = JLabel.new()
        self.mouseXJTextField = JTextField.new()
        self.jLabel5 = JLabel.new()
        self.mouseYJTextField = JTextField.new()
        self.inputTypeJLabel = JLabel.new()
        self.inputAutomationTypeJComboBox = JComboBox.new()
        self.jLabel6 = JLabel.new()
        self.mouseDelayJTextField = JTextField.new()
        self.mouseActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.mouseActionJDialog:setMinimumSize(Dimension.new(275, 185))
        self.titleJLabel:setText("Mouse Input Options")
        self.okJButton:setText("OK")
        self.okJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel2:setText("Buttons:")
        self.jLabel3:setText("Move To:")
        self.button1JCheckBox:setText(CommonPhoneStrings.getInstance().ONE)
        self.button1JCheckBox:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.button1JCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.button2JCheckBox:setText(CommonPhoneStrings.getInstance().TWO)
        self.button2JCheckBox:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.button2JCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.button2JCheckBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:button2JCheckBoxActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel4:setText("x:")
        self.mouseXJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.jLabel5:setText("y:")
        self.mouseYJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.inputTypeJLabel:setText("Input Type:")
        self.jLabel6:setText("Delay:")
        self.mouseDelayJTextField:setText("100")
        local mouseActionJDialogLayout = GroupLayout.new(self.mouseActionJDialog:getContentPane())
        self.mouseActionJDialog:getContentPane():setLayout(mouseActionJDialogLayout)
        mouseActionJDialogLayout:setHorizontalGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(mouseActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.inputTypeJLabel):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout:createSequentialGroup():addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel2):addGap(25, 25, 25)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel3):addComponent(self.jLabel6)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))):addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.mouseDelayJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 154, Short.MAX_VALUE):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addGap(45, 45, 45)):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout:createSequentialGroup():addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.inputAutomationTypeJComboBox, 0, 154, Short.MAX_VALUE)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.button1JCheckBox):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.button2JCheckBox)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addGroup(mouseActionJDialogLayout:createSequentialGroup():addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.okJButton)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel4):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 5, Short.MAX_VALUE):addComponent(self.mouseXJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE))):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel5):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.mouseYJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 62, Short.MAX_VALUE))))):addContainerGap()))
        mouseActionJDialogLayout:setVerticalGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.inputTypeJLabel):addComponent(self.inputAutomationTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE):addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.button1JCheckBox):addComponent(self.button2JCheckBox))):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel6):addComponent(self.mouseDelayJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel3):addComponent(self.jLabel4):addComponent(self.jLabel5):addComponent(self.mouseYJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.mouseXJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.mouseActionJButton:setText("Edit")
        self.mouseActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:mouseActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Mouse:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 36, Short.MAX_VALUE):addComponent(self.mouseActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.mouseActionJButton)))
end


function MouseActionScriptInputJPanel:button2JCheckBoxActionPerformed(evt)
end


function MouseActionScriptInputJPanel:okJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self:update()
            self:getMouseActionJDialog():setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okButtonActionPerformed", e)
        end
end


function MouseActionScriptInputJPanel:mouseActionJButtonActionPerformed(evt)
        self:getMouseActionJDialog():setVisible(true)
end

return MouseActionScriptInputJPanel

