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

local DefaultListModelHelper = require("org.allbinary.input.automation.module.DefaultListModelHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local GenericProfileActionsJPanel = {}
GenericProfileActionsJPanel.__index = GenericProfileActionsJPanel
GenericProfileActionsJPanel.className = "GenericProfileActionsJPanel"
setmetatable(GenericProfileActionsJPanel, {__index = JPanel})

function GenericProfileActionsJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.genericProfileActions = nil
    self.genericProfileActionJPanel = nil
    self.blankGenericProfileActionJPanel = nil
    self.deleteActionJButton = nil
    self.genericProfileActionsJList = nil
    self.genericProfileActionsJPanel = nil
    self.genericProfileActionsJScrollPane = nil
    self.newActionJButton = nil
    self.newProfileActionJDialog = nil
    self.newProfileActionJLabel = nil
    self.newProfileActionJTextField = nil
    self.okNewProfileActionJButton = nil
    self.saveJButton = nil
end


function GenericProfileActionsJPanel.new()
    local self = setmetatable(JPanel.new(), GenericProfileActionsJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function GenericProfileActionsJPanel:initComponents()
        self.newProfileActionJDialog = JDialog.new()
        self.newProfileActionJLabel = JLabel.new()
        self.okNewProfileActionJButton = JButton.new()
        self.newProfileActionJTextField = JTextField.new()
        self.genericProfileActionsJPanel = JPanel.new()
        self.genericProfileActionsJScrollPane = JScrollPane.new()
        self.genericProfileActionsJList = JList.new()
        self.newActionJButton = JButton.new()
        self.deleteActionJButton = JButton.new()
        self.saveJButton = JButton.new()
        self.blankGenericProfileActionJPanel = JPanel.new()
        self.newProfileActionJDialog:setMinimumSize(Dimension.new(250, 150))
        self.newProfileActionJDialog:setResizable(false)
        self.newProfileActionJLabel:setText("New Action Name")
        self.okNewProfileActionJButton:setText("Ok")
        self.okNewProfileActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okNewProfileActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        local newProfileActionJDialogLayout = GroupLayout.new(self.newProfileActionJDialog:getContentPane())
        self.newProfileActionJDialog:getContentPane():setLayout(newProfileActionJDialogLayout)
        newProfileActionJDialogLayout:setHorizontalGroup(newProfileActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGroup(newProfileActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGap(93, 93, 93):addComponent(self.okNewProfileActionJButton)):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGap(75, 75, 75):addComponent(self.newProfileActionJLabel)):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGap(29, 29, 29):addComponent(self.newProfileActionJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE))):addContainerGap(34, Short.MAX_VALUE)))
        newProfileActionJDialogLayout:setVerticalGroup(newProfileActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, newProfileActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.newProfileActionJLabel):addGap(21, 21, 21):addComponent(self.newProfileActionJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 20, Short.MAX_VALUE):addComponent(self.okNewProfileActionJButton):addContainerGap()))
        self.genericProfileActionsJPanel:setPreferredSize(Dimension.new(10000, 10000))
        self.genericProfileActionsJList:addListSelectionListener((function()
            local o = ListSelectionListener.new and ListSelectionListener.new() or setmetatable({}, {__index = ListSelectionListener})
            

            function o:valueChanged(evt)
                self:genericProfileActionsJListValueChanged(evt)
            end
            return o
        end)())
        self.genericProfileActionsJScrollPane:setViewportView(self.genericProfileActionsJList)
        self.newActionJButton:setText("New")
        self.newActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.deleteActionJButton:setText("Delete")
        self.deleteActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:deleteActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.saveJButton:setText("Save")
        self.saveJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:saveJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.blankGenericProfileActionJPanel:setMinimumSize(Dimension.new(500, 300))
        local blankGenericProfileActionJPanelLayout = GroupLayout.new(self.blankGenericProfileActionJPanel)
        self.blankGenericProfileActionJPanel:setLayout(blankGenericProfileActionJPanelLayout)
        blankGenericProfileActionJPanelLayout:setHorizontalGroup(blankGenericProfileActionJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 500, Short.MAX_VALUE))
        blankGenericProfileActionJPanelLayout:setVerticalGroup(blankGenericProfileActionJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 296, Short.MAX_VALUE))
        local genericProfileActionsJPanelLayout = GroupLayout.new(self.genericProfileActionsJPanel)
        self.genericProfileActionsJPanel:setLayout(genericProfileActionsJPanelLayout)
        genericProfileActionsJPanelLayout:setHorizontalGroup(genericProfileActionsJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(genericProfileActionsJPanelLayout:createSequentialGroup():addComponent(self.genericProfileActionsJScrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.blankGenericProfileActionJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)):addGroup(genericProfileActionsJPanelLayout:createSequentialGroup():addComponent(self.newActionJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.deleteActionJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.saveJButton):addContainerGap()))
        genericProfileActionsJPanelLayout:setVerticalGroup(genericProfileActionsJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(genericProfileActionsJPanelLayout:createSequentialGroup():addGroup(genericProfileActionsJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.newActionJButton):addComponent(self.deleteActionJButton):addComponent(self.saveJButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(genericProfileActionsJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false):addComponent(self.blankGenericProfileActionJPanel, 0, 296, Short.MAX_VALUE):addComponent(self.genericProfileActionsJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 296, Short.MAX_VALUE)):addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 596, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 336, javax.swing.GroupLayout.PREFERRED_SIZE))
end


function GenericProfileActionsJPanel:setModel()
        local defaultListModelHelper = self:getGenericProfileActions():getDefaultListModelHelper()
        if defaultListModelHelper:getListModel():getSize() > 0 then
            self.genericProfileActionsJList:setModel(defaultListModelHelper:getListModel())
        end
end


function GenericProfileActionsJPanel:saveJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self:getGenericProfileActions():save()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "saveJButtonActionPerformed", e)
        end
end


function GenericProfileActionsJPanel:updateProfileActionUI(profileActionNameString)
        self.blankGenericProfileActionJPanel:removeAll()
        if profileActionNameString ~= nil then
            local genericProfileAction = self:getGenericProfileActions():getAction(profileActionNameString)
            self:setGenericProfileActionJPanel(GenericProfileActionJPanel.new())
            self:getGenericProfileActionJPanel():setGenericProfileAction(genericProfileAction)
            self:getGenericProfileActionJPanel():updateProfileActionUI()
            local layout = self.blankGenericProfileActionJPanel:getLayout()
            layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 395, Short.MAX_VALUE):addComponent(self:getGenericProfileActionJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 256, Short.MAX_VALUE):addComponent(self:getGenericProfileActionJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            self.logUtil:putF("Setting Configuration Profile Actions JPanel", self, "genericProfileActionsJListValueChanged")
        end
end


function GenericProfileActionsJPanel:genericProfileActionsJListValueChanged(evt)
        local try_ok, try_error = pcall(function()
            local profileActionNameString = self.genericProfileActionsJList:getSelectedValue()
            self:updateProfileActionUI(profileActionNameString)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "genericProfileActionsJListValueChanged", e)
        end
end


function GenericProfileActionsJPanel:okNewProfileActionJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            local newActionName = self.newProfileActionJTextField:getText()
            self:getGenericProfileActions():add(newActionName)
            self:setModel()
            self.genericProfileActionsJList:setSelectedValue(newActionName, true)
            self.newProfileActionJDialog:setVisible(false)
            self:updateProfileActionUI(newActionName)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okNewProfileActionJButtonActionPerformed", e)
        end
end


function GenericProfileActionsJPanel:deleteActionJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            local anyType = self.genericProfileActionsJList:getSelectedValues()
            for index = 0, (anyType.n or #anyType) - 1 do
                local nextSelectedValueString = anyType[index + 1]
                self:getGenericProfileActions():remove(nextSelectedValueString)
            end
            self:selectFirstElement()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteActionJButtonActionPerformed", e)
        end
end


-- throws Exception
function GenericProfileActionsJPanel:selectFirstElement()
        self:setModel()
        if self.genericProfileActionsJList:getModel():getSize() > 0 then
            self.genericProfileActionsJList:setSelectedValue(self.genericProfileActionsJList:getModel():getElementAt(0), true)
            self:updateProfileActionUI(self.genericProfileActionsJList:getModel():getElementAt(0))
        else
            self.blankGenericProfileActionJPanel:removeAll()
            self.blankGenericProfileActionJPanel:repaint()
        end
end


function GenericProfileActionsJPanel:getGenericProfileActionJPanel()
        return self.genericProfileActionJPanel
end


function GenericProfileActionsJPanel:setGenericProfileActionJPanel(genericProfileActionJPanel)
        self.genericProfileActionJPanel = genericProfileActionJPanel
end


function GenericProfileActionsJPanel:getGenericProfileActions()
        return self.genericProfileActions
end


function GenericProfileActionsJPanel:setGenericProfileActions(genericProfileActions)
        self.genericProfileActions = genericProfileActions
end


function GenericProfileActionsJPanel:newActionJButtonActionPerformed(evt)
        self.newProfileActionJDialog:setVisible(true)
end

return GenericProfileActionsJPanel

