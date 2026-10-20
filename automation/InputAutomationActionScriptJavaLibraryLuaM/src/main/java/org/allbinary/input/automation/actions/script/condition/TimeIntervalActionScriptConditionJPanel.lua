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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeIntervalActionScriptConditionJPanel = {}
TimeIntervalActionScriptConditionJPanel.__index = TimeIntervalActionScriptConditionJPanel
TimeIntervalActionScriptConditionJPanel.className = "TimeIntervalActionScriptConditionJPanel"
setmetatable(TimeIntervalActionScriptConditionJPanel, {__index = JPanel})

function TimeIntervalActionScriptConditionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.timeIntervalActionScriptConditionInterface = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.okJButton = nil
    self.timeIntervalActionJButton = nil
    self.timeIntervalActionJDialog = nil
    self.timeIntervalJTextField = nil
    self.titleJLabel = nil
end


function TimeIntervalActionScriptConditionJPanel.new(timeIntervalActionScriptConditionInterface)
    local self = setmetatable(JPanel.new(), TimeIntervalActionScriptConditionJPanel)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.timeIntervalActionScriptConditionInterface = timeIntervalActionScriptConditionInterface
        self:set()
    return self
end


function TimeIntervalActionScriptConditionJPanel:set()
        self:getTimeIntervalJTextField():setText(tostring(self.timeIntervalActionScriptConditionInterface:getTimeDelayHelper().delay))
        self.timeIntervalActionScriptConditionInterface:log()
end


function TimeIntervalActionScriptConditionJPanel:update()
        self.timeIntervalActionScriptConditionInterface:getTimeDelayHelper().delay = tostring(self:getTimeIntervalJTextField():getText())
        self.timeIntervalActionScriptConditionInterface:log()
end


function TimeIntervalActionScriptConditionJPanel:getTimeIntervalJTextField()
        return self.timeIntervalJTextField
end


function TimeIntervalActionScriptConditionJPanel:setTimeIntervalJTextField(timeIntervalJTextField)
        self.timeIntervalJTextField = timeIntervalJTextField
end


function TimeIntervalActionScriptConditionJPanel:getTimeIntervalActionJDialog()
        return self.timeIntervalActionJDialog
end


function TimeIntervalActionScriptConditionJPanel:setTimeIntervalActionJDialog(timeIntervalActionJDialog)
        self.timeIntervalActionJDialog = timeIntervalActionJDialog
end


function TimeIntervalActionScriptConditionJPanel:initComponents()
        self.timeIntervalActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.okJButton = JButton.new()
        self.jLabel2 = JLabel.new()
        self.timeIntervalJTextField = JTextField.new()
        self.timeIntervalActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.timeIntervalActionJDialog:setMinimumSize(Dimension.new(250, 150))
        self.titleJLabel:setText("Time Interval Condition Options")
        self.okJButton:setText("OK")
        self.okJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel2:setText("Time (ms):")
        local timeIntervalActionJDialogLayout = GroupLayout.new(self.timeIntervalActionJDialog:getContentPane())
        self.timeIntervalActionJDialog:getContentPane():setLayout(timeIntervalActionJDialogLayout)
        timeIntervalActionJDialogLayout:setHorizontalGroup(timeIntervalActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(timeIntervalActionJDialogLayout:createSequentialGroup():addGroup(timeIntervalActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addGroup(javax.swing.GroupLayout.Alignment.LEADING, timeIntervalActionJDialogLayout:createSequentialGroup():addGap(82, 82, 82):addComponent(self.okJButton)):addGroup(javax.swing.GroupLayout.Alignment.LEADING, timeIntervalActionJDialogLayout:createSequentialGroup():addGap(32, 32, 32):addGroup(timeIntervalActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(timeIntervalActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel2):addGap(16, 16, 16):addComponent(self.timeIntervalJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 85, Short.MAX_VALUE)):addComponent(self.titleJLabel)))):addContainerGap(36, Short.MAX_VALUE)))
        timeIntervalActionJDialogLayout:setVerticalGroup(timeIntervalActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(timeIntervalActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.titleJLabel):addGap(20, 20, 20):addGroup(timeIntervalActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel2):addComponent(self.timeIntervalJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addGap(15, 15, 15):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.timeIntervalActionJButton:setText("Edit")
        self.timeIntervalActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:timeIntervalActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Time Interval:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.timeIntervalActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.timeIntervalActionJButton)))
end


function TimeIntervalActionScriptConditionJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getTimeIntervalActionJDialog():setVisible(false)
end


function TimeIntervalActionScriptConditionJPanel:timeIntervalActionJButtonActionPerformed(evt)
        self:getTimeIntervalActionJDialog():setVisible(true)
end

return TimeIntervalActionScriptConditionJPanel

