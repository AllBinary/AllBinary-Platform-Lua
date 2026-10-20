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
-- package org.allbinary.input.automation.module.generic.configuration

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local GenericProfile = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileDataWorkerType = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")
local GenericProfiles = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles")
local GenericProfileActions = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions")
local GenericProfileActionsJPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.input.automation.module.generic.configuration.JPanel")
local GenericModuleConfigurationInterface = require("org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericModuleConfigurationJPanel = {}
GenericModuleConfigurationJPanel.__index = GenericModuleConfigurationJPanel
GenericModuleConfigurationJPanel.className = "GenericModuleConfigurationJPanel"
setmetatable(GenericModuleConfigurationJPanel, {__index = JPanel})

function GenericModuleConfigurationJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.genericProfiles = nil
    self.selectedGenericProfile = nil
    self.blankGenericProfileActionsJPanel = nil
    self.buttonGroup2 = nil
    self.captureComparisonJCheckBox = nil
    self.captureMotionAnalysisJCheckBox = nil
    self.deleteProfileJButton = nil
    self.genericJTabbedPane = nil
    self.genericProfilesJList = nil
    self.genericProfilesJPanel = nil
    self.genericProfilesJScrollPane = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jPanel1 = nil
    self.newProfileJButton = nil
    self.newProfileJDialog = nil
    self.newProfileNameJLabel = nil
    self.newProfileNameJTextField = nil
    self.okNewProfileJButton = nil
    self.savedCaptureJRadioButton = nil
    self.screenCaptureJRadioButton = nil
end


function GenericModuleConfigurationJPanel.new()
    local self = setmetatable(JPanel.new(), GenericModuleConfigurationJPanel)
    self:_init_fields()
        self:initComponents()
        self:setGenericProfiles(GenericProfiles.new(GenericProfiles.DEFAULT_FILE))
        self:selectFirstElement()
    return self
end


function GenericModuleConfigurationJPanel:initComponents()
        self.newProfileJDialog = JDialog.new()
        self.okNewProfileJButton = JButton.new()
        self.newProfileNameJLabel = JLabel.new()
        self.newProfileNameJTextField = JTextField.new()
        self.buttonGroup2 = ButtonGroup.new()
        self.genericJTabbedPane = JTabbedPane.new()
        self.genericProfilesJPanel = JPanel.new()
        self.genericProfilesJScrollPane = JScrollPane.new()
        self.genericProfilesJList = JList.new()
        self.newProfileJButton = JButton.new()
        self.deleteProfileJButton = JButton.new()
        self.jPanel1 = JPanel.new()
        self.screenCaptureJRadioButton = JRadioButton.new()
        self.jLabel1 = JLabel.new()
        self.jLabel2 = JLabel.new()
        self.savedCaptureJRadioButton = JRadioButton.new()
        self.captureMotionAnalysisJCheckBox = JCheckBox.new()
        self.captureComparisonJCheckBox = JCheckBox.new()
        self.jLabel3 = JLabel.new()
        self.blankGenericProfileActionsJPanel = JPanel.new()
        self.newProfileJDialog:setMinimumSize(Dimension.new(250, 150))
        self.newProfileJDialog:setResizable(false)
        self.okNewProfileJButton:setText("Ok")
        self.okNewProfileJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okNewProfileJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.newProfileNameJLabel:setText("New Profile Name")
        local newProfileJDialogLayout = GroupLayout.new(self.newProfileJDialog:getContentPane())
        self.newProfileJDialog:getContentPane():setLayout(newProfileJDialogLayout)
        newProfileJDialogLayout:setHorizontalGroup(newProfileJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(newProfileJDialogLayout:createSequentialGroup():addGroup(newProfileJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(80, 80, 80):addComponent(self.newProfileNameJLabel)):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(30, 30, 30):addComponent(self.newProfileNameJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(100, 100, 100):addComponent(self.okNewProfileJButton))):addContainerGap(35, Short.MAX_VALUE)))
        newProfileJDialogLayout:setVerticalGroup(newProfileJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(10, 10, 10):addComponent(self.newProfileNameJLabel):addGap(16, 16, 16):addComponent(self.newProfileNameJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addGap(20, 20, 20):addComponent(self.okNewProfileJButton)))
        self:setLayout(GridLayout.new(1, 0))
        self:setMinimumSize(Dimension.new(400, 300))
        self:setPreferredSize(Dimension.new(700, 700))
        self.genericJTabbedPane:setToolTipText(self.stringUtil.EMPTY_STRING)
        self.genericJTabbedPane:setMinimumSize(Dimension.new(800, 600))
        self.genericProfilesJPanel:setMinimumSize(Dimension.new(400, 300))
        self.genericProfilesJPanel:setPreferredSize(Dimension.new(0, 0))
        self.genericProfilesJList:addListSelectionListener((function()
            local o = ListSelectionListener.new and ListSelectionListener.new() or setmetatable({}, {__index = ListSelectionListener})
            

            function o:valueChanged(evt)
                self:genericProfilesJListValueChanged(evt)
            end
            return o
        end)())
        self.genericProfilesJScrollPane:setViewportView(self.genericProfilesJList)
        self.newProfileJButton:setText("New")
        self.newProfileJButton:setToolTipText("Creates a new profile")
        self.newProfileJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newProfileJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.deleteProfileJButton:setText("Delete")
        self.deleteProfileJButton:setToolTipText("Deletes the selected profile")
        self.deleteProfileJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:deleteProfileJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jPanel1:setPreferredSize(Dimension.new(1000, 100))
        self.screenCaptureJRadioButton:setText("Screen Captures")
        self.screenCaptureJRadioButton:setToolTipText("Records the screen into memory for logical processing")
        self.screenCaptureJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.screenCaptureJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.screenCaptureJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:screenCaptureJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Profile Options")
        self.jLabel2:setText("Process From:")
        self.savedCaptureJRadioButton:setText("Saved Images")
        self.savedCaptureJRadioButton:setToolTipText("Loads images from files for logical processing.  Usually for debugging your profile actions")
        self.savedCaptureJRadioButton:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.savedCaptureJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.savedCaptureJRadioButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:savedCaptureJRadioButtonActionPerformed(evt)
            end
            return o
        end)())
        self.captureMotionAnalysisJCheckBox:setText("Motion Analysis")
        self.captureMotionAnalysisJCheckBox:setToolTipText("Uses image comparison and contraints to locate moving objects")
        self.captureMotionAnalysisJCheckBox:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.captureMotionAnalysisJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.captureMotionAnalysisJCheckBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:captureMotionAnalysisJCheckBoxActionPerformed(evt)
            end
            return o
        end)())
        self.captureComparisonJCheckBox:setText("Comparison")
        self.captureComparisonJCheckBox:setToolTipText("Compares the last two input images for multi image logic")
        self.captureComparisonJCheckBox:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.captureComparisonJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.captureComparisonJCheckBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:captureComparisonJCheckBoxActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel3:setText("Image Processing:")
        self.jLabel3:setToolTipText("Turns on/off various extended image processing")
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.screenCaptureJRadioButton):addComponent(self.jLabel1):addComponent(self.jLabel2):addComponent(self.savedCaptureJRadioButton):addComponent(self.captureMotionAnalysisJCheckBox):addComponent(self.captureComparisonJCheckBox):addComponent(self.jLabel3)):addContainerGap(22, Short.MAX_VALUE)))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel2):addGap(7, 7, 7):addComponent(self.screenCaptureJRadioButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.savedCaptureJRadioButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel3):addGap(7, 7, 7):addComponent(self.captureComparisonJCheckBox):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.captureMotionAnalysisJCheckBox):addContainerGap(106, Short.MAX_VALUE)))
        local genericProfilesJPanelLayout = GroupLayout.new(self.genericProfilesJPanel)
        self.genericProfilesJPanel:setLayout(genericProfilesJPanelLayout)
        genericProfilesJPanelLayout:setHorizontalGroup(genericProfilesJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addGroup(genericProfilesJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addComponent(self.newProfileJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.deleteProfileJButton)):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addComponent(self.genericProfilesJScrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 119, Short.MAX_VALUE))):addContainerGap()))
        genericProfilesJPanelLayout:setVerticalGroup(genericProfilesJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addGroup(genericProfilesJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.newProfileJButton):addComponent(self.deleteProfileJButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(genericProfilesJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE):addComponent(self.genericProfilesJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE))))
        self.genericJTabbedPane:addTab("Profiles", self.genericProfilesJPanel)
        local blankGenericProfileActionsJPanelLayout = GroupLayout.new(self.blankGenericProfileActionsJPanel)
        self.blankGenericProfileActionsJPanel:setLayout(blankGenericProfileActionsJPanelLayout)
        blankGenericProfileActionsJPanelLayout:setHorizontalGroup(blankGenericProfileActionsJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 395, Short.MAX_VALUE))
        blankGenericProfileActionsJPanelLayout:setVerticalGroup(blankGenericProfileActionsJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 275, Short.MAX_VALUE))
        self.genericJTabbedPane:addTab("Actions", self.blankGenericProfileActionsJPanel)
        self:add(self.genericJTabbedPane)
end


function GenericModuleConfigurationJPanel:savedCaptureJRadioButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            if self.savedCaptureJRadioButton:isSelected() then
                self.logUtil:putF("Selected", self, "savedCaptureJRadioButtonActionPerformed")
                self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.SAVED_CAPTURE)
                self:getSelectedGenericProfile():remove(GenericProfileDataWorkerType.SCREEN_CAPTURE)
                self.screenCaptureJRadioButton:setSelected(false)
                self:getGenericProfiles():save()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "savedCaptureJRadioButtonActionPerformed", e)
        end
end


function GenericModuleConfigurationJPanel:screenCaptureJRadioButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            if self.screenCaptureJRadioButton:isSelected() then
                self.logUtil:putF("Selected", self, "screenCaptureJRadioButtonActionPerformed")
                self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.SCREEN_CAPTURE)
                self:getSelectedGenericProfile():remove(GenericProfileDataWorkerType.SAVED_CAPTURE)
                self.savedCaptureJRadioButton:setSelected(false)
                self:getGenericProfiles():save()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "screenCaptureJRadioButtonActionPerformed", e)
        end
end


function GenericModuleConfigurationJPanel:captureMotionAnalysisJCheckBoxActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            if self.captureMotionAnalysisJCheckBox:isSelected() then
                self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.MOTION)
            else
                self:getSelectedGenericProfile():remove(GenericProfileDataWorkerType.MOTION)
            end
            self:getGenericProfiles():save()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "captureComparisonJCheckBoxActionPerformed", e)
        end
end


function GenericModuleConfigurationJPanel:captureComparisonJCheckBoxActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            if self.captureComparisonJCheckBox:isSelected() then
                self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.COMPARISON)
            else
                self:getSelectedGenericProfile():remove(GenericProfileDataWorkerType.COMPARISON)
            end
            self:getGenericProfiles():save()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "captureComparisonJCheckBoxActionPerformed", e)
        end
end


-- throws Exception
function GenericModuleConfigurationJPanel:updateProfileUI(profileNameString)
        self:getBlankGenericProfileActionsJPanel():removeAll()
        if profileNameString ~= nil then
            local genericProfileActionsJPanel = GenericProfileActionsJPanel.new()
            self:setSelectedGenericProfile(self:getGenericProfiles():get(profileNameString))
            self:getSelectedGenericProfile():setGenericProfileActions(GenericProfileActions.new(genericProfileActionsJPanel, profileNameString))
            genericProfileActionsJPanel:setGenericProfileActions(self:getSelectedGenericProfile():getGenericProfileActions())
            genericProfileActionsJPanel:selectFirstElement()
            local layout = self:getBlankGenericProfileActionsJPanel():getLayout()
            layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 395, Short.MAX_VALUE):addComponent(genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 256, Short.MAX_VALUE):addComponent(genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            self:updateProfileOptions()
            self.logUtil:putF("Setting Configuration Profile JPanel", self, "updateProfileUI")
        else
            self.logUtil:putF("Null Configuration Profile", self, "updateProfileUI")
        end
end


-- throws Exception
function GenericModuleConfigurationJPanel:selectFirstElement()
        self.genericProfilesJList:setModel(self:getGenericProfiles():getDefaultListModelHelper():getListModel())
        if self.genericProfilesJList:getModel():getSize() > 0 then
            self.genericProfilesJList:setSelectedValue(self.genericProfilesJList:getModel():getElementAt(0), true)
            self:updateProfileUI(self.genericProfilesJList:getModel():getElementAt(0))
        end
end


-- throws Exception
function GenericModuleConfigurationJPanel:updateProfileOptions()
        self.logUtil:putF(self.commonStrings.START, self, "updateProfileOptions")
        local genericProfile = self:getSelectedGenericProfile()
        local vector = genericProfile:getGenericProfileDataWorkerTypeVector()
        self.screenCaptureJRadioButton:setSelected(false)
        self.savedCaptureJRadioButton:setSelected(false)
        self.captureComparisonJCheckBox:setSelected(false)
        self.captureMotionAnalysisJCheckBox:setSelected(false)
        local size = vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = vector:get(index)
            self.logUtil:putF(genericProfile:getName() .. " has GenericProfileDataWorkerType: " .. tostring(genericProfileDataWorkerType), self, "updateProfileOptions")
            if genericProfileDataWorkerType == GenericProfileDataWorkerType.SCREEN_CAPTURE then
                self.logUtil:putF("Screen Capture Selected", self, "updateProfileOptions")
                self.screenCaptureJRadioButton:setSelected(true)
            elseif genericProfileDataWorkerType == GenericProfileDataWorkerType.SAVED_CAPTURE then
                self.logUtil:putF("Saved Capture Selected", self, "updateProfileOptions")
                self.savedCaptureJRadioButton:setSelected(true)
            elseif genericProfileDataWorkerType == GenericProfileDataWorkerType.COMPARISON then
                self.logUtil:putF("Checking Comparison Box", self, "updateProfileOptions")
                self.captureComparisonJCheckBox:setSelected(true)
            elseif genericProfileDataWorkerType == GenericProfileDataWorkerType.MOTION then
                self.logUtil:putF("Checking Motion Box", self, "updateProfileOptions")
                self.captureMotionAnalysisJCheckBox:setSelected(true)
            end
        end
        if not self.screenCaptureJRadioButton:isSelected() and not self.savedCaptureJRadioButton:isSelected() then
            self.screenCaptureJRadioButton:setSelected(true)
            self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.SCREEN_CAPTURE)
        end
        self.logUtil:putF(self.commonStrings.END, self, "updateProfileOptions")
end


function GenericModuleConfigurationJPanel:getBlankGenericProfileActionsJPanel()
        return self.blankGenericProfileActionsJPanel
end


function GenericModuleConfigurationJPanel:setBlankGenericProfileActionsJPanel(blankGenericProfileActionsJPanel)
        self.blankGenericProfileActionsJPanel = blankGenericProfileActionsJPanel
end


function GenericModuleConfigurationJPanel:getGenericProfiles()
        return self.genericProfiles
end


function GenericModuleConfigurationJPanel:setGenericProfiles(genericProfiles)
        self.genericProfiles = genericProfiles
end


function GenericModuleConfigurationJPanel:getSelectedGenericProfile()
        return self.selectedGenericProfile
end


function GenericModuleConfigurationJPanel:setSelectedGenericProfile(selectedGenericProfile)
        self.selectedGenericProfile = selectedGenericProfile
end


function GenericModuleConfigurationJPanel:genericProfilesJListValueChanged(evt)
        local try_ok, try_error = pcall(function()
            local profileNameString = self.genericProfilesJList:getSelectedValue()
            self:updateProfileUI(profileNameString)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "genericProfilesJListValueChanged", e)
        end
end


function GenericModuleConfigurationJPanel:deleteProfileJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            local anyType = self.genericProfilesJList:getSelectedValues()
            for index = 0, (anyType.n or #anyType) - 1 do
                local nextSelectedValueString = anyType[index + 1]
                self:getGenericProfiles():remove(nextSelectedValueString)
            end
            self:selectFirstElement()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteProfileJButtonActionPerformed", e)
        end
end


function GenericModuleConfigurationJPanel:okNewProfileJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            local newProfileName = self.newProfileNameJTextField:getText()
            self:getGenericProfiles():add(newProfileName)
            self.genericProfilesJList:setModel(self:getGenericProfiles():getDefaultListModelHelper():getListModel())
            self.genericProfilesJList:setSelectedValue(newProfileName, true)
            self.newProfileJDialog:setVisible(false)
            self:updateProfileUI(newProfileName)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okNewProfileJButtonActionPerformed", e)
        end
end


function GenericModuleConfigurationJPanel:newProfileJButtonActionPerformed(evt)
        self.newProfileJDialog:setVisible(true)
end

return GenericModuleConfigurationJPanel

