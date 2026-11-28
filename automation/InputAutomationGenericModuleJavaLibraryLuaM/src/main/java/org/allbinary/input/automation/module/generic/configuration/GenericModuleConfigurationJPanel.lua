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

local GenericModuleConfigurationJPanel = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationJPanel"] = GenericModuleConfigurationJPanel

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GenericProfile = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")
local GenericProfiles = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles")
local GenericProfileActions = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions")
local GenericProfileActionsJPanel = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local GridLayout = require("java.awt.GridLayout")
-- local Insets = require("java.awt.Insets")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local BorderFactory = require("javax.swing.BorderFactory")
-- local ButtonGroup = require("javax.swing.ButtonGroup")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JCheckBox = require("javax.swing.JCheckBox")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JList = require("javax.swing.JList")
-- local JPanel = require("javax.swing.JPanel")
-- local JRadioButton = require("javax.swing.JRadioButton")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local JTabbedPane = require("javax.swing.JTabbedPane")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
-- local ListSelectionEvent = require("javax.swing.event.ListSelectionEvent")
-- local ListSelectionListener = require("javax.swing.event.ListSelectionListener")
local GenericModuleConfigurationInterface = require("org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationInterface")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GenericModuleConfigurationJPanel is declared before the requires
GenericModuleConfigurationJPanel.__index = GenericModuleConfigurationJPanel
GenericModuleConfigurationJPanel.className = "GenericModuleConfigurationJPanel"
GenericModuleConfigurationJPanel.javaClassName = "org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationJPanel"
setmetatable(GenericModuleConfigurationJPanel, {__index = JPanel})
GenericModuleConfigurationJPanel.java_implements = " GenericModuleConfigurationInterface "
GenericModuleConfigurationJPanel.java_interfaces = function() return {GenericModuleConfigurationInterface} end

function GenericModuleConfigurationJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.genericProfiles == nil then self.genericProfiles = nil end
    if self.selectedGenericProfile == nil then self.selectedGenericProfile = nil end
    if self.blankGenericProfileActionsJPanel == nil then self.blankGenericProfileActionsJPanel = nil end
    if self.buttonGroup2 == nil then self.buttonGroup2 = nil end
    if self.captureComparisonJCheckBox == nil then self.captureComparisonJCheckBox = nil end
    if self.captureMotionAnalysisJCheckBox == nil then self.captureMotionAnalysisJCheckBox = nil end
    if self.deleteProfileJButton == nil then self.deleteProfileJButton = nil end
    if self.genericJTabbedPane == nil then self.genericJTabbedPane = nil end
    if self.genericProfilesJList == nil then self.genericProfilesJList = nil end
    if self.genericProfilesJPanel == nil then self.genericProfilesJPanel = nil end
    if self.genericProfilesJScrollPane == nil then self.genericProfilesJScrollPane = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLabel3 == nil then self.jLabel3 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.newProfileJButton == nil then self.newProfileJButton = nil end
    if self.newProfileJDialog == nil then self.newProfileJDialog = nil end
    if self.newProfileNameJLabel == nil then self.newProfileNameJLabel = nil end
    if self.newProfileNameJTextField == nil then self.newProfileNameJTextField = nil end
    if self.okNewProfileJButton == nil then self.okNewProfileJButton = nil end
    if self.savedCaptureJRadioButton == nil then self.savedCaptureJRadioButton = nil end
    if self.screenCaptureJRadioButton == nil then self.screenCaptureJRadioButton = nil end
end


function GenericModuleConfigurationJPanel._jinit(self)
    java_super_init(JPanel, self)
    GenericModuleConfigurationJPanel._init_fields(self)
        self:initComponents()
        self:setGenericProfiles(GenericProfiles.new(GenericProfiles.DEFAULT_FILE))
        self:selectFirstElement()
    return self
end

function GenericModuleConfigurationJPanel.new(...)
    local self = setmetatable({}, GenericModuleConfigurationJPanel)
    GenericModuleConfigurationJPanel._jinit(self, ...)
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
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.okNewProfileJButtonActionPerformed and self or java_outer_self):okNewProfileJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.newProfileNameJLabel:setText("New Profile Name")
        local newProfileJDialogLayout = GroupLayout.new(self.newProfileJDialog:getContentPane())
        self.newProfileJDialog:getContentPane():setLayout(newProfileJDialogLayout)
        newProfileJDialogLayout:setHorizontalGroup(newProfileJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(newProfileJDialogLayout:createSequentialGroup():addGroup(newProfileJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(80, 80, 80):addComponent(self.newProfileNameJLabel)):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(30, 30, 30):addComponent(self.newProfileNameJTextField, GroupLayout.PREFERRED_SIZE, 180, GroupLayout.PREFERRED_SIZE)):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(100, 100, 100):addComponent(self.okNewProfileJButton))):addContainerGap(35, require("java.lang.Short").MAX_VALUE)))
        newProfileJDialogLayout:setVerticalGroup(newProfileJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(newProfileJDialogLayout:createSequentialGroup():addGap(10, 10, 10):addComponent(self.newProfileNameJLabel):addGap(16, 16, 16):addComponent(self.newProfileNameJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addGap(20, 20, 20):addComponent(self.okNewProfileJButton)))
        self:setLayout(GridLayout.new(1, 0))
        self:setMinimumSize(Dimension.new(400, 300))
        self:setPreferredSize(Dimension.new(700, 700))
        self.genericJTabbedPane:setToolTipText(self.stringUtil.EMPTY_STRING)
        self.genericJTabbedPane:setMinimumSize(Dimension.new(800, 600))
        self.genericProfilesJPanel:setMinimumSize(Dimension.new(400, 300))
        self.genericProfilesJPanel:setPreferredSize(Dimension.new(0, 0))
        self.genericProfilesJList:addListSelectionListener((function()
            local java_outer_self = self
        local o = ListSelectionListener.new and ListSelectionListener.new() or setmetatable({}, {__index = ListSelectionListener})
            

            function o:valueChanged(evt)
                ;(self.genericProfilesJListValueChanged and self or java_outer_self):genericProfilesJListValueChanged(evt)
            
            end
            java_overload(o, "valueChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ListSelectionEvent")) end)
            return o
        end)())
        self.genericProfilesJScrollPane:setViewportView(self.genericProfilesJList)
        self.newProfileJButton:setText("New")
        self.newProfileJButton:setToolTipText("Creates a new profile")
        self.newProfileJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.newProfileJButtonActionPerformed and self or java_outer_self):newProfileJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.deleteProfileJButton:setText("Delete")
        self.deleteProfileJButton:setToolTipText("Deletes the selected profile")
        self.deleteProfileJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.deleteProfileJButtonActionPerformed and self or java_outer_self):deleteProfileJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jPanel1:setPreferredSize(Dimension.new(1000, 100))
        self.screenCaptureJRadioButton:setText("Screen Captures")
        self.screenCaptureJRadioButton:setToolTipText("Records the screen into memory for logical processing")
        self.screenCaptureJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.screenCaptureJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.screenCaptureJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.screenCaptureJRadioButtonActionPerformed and self or java_outer_self):screenCaptureJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Profile Options")
        self.jLabel2:setText("Process From:")
        self.savedCaptureJRadioButton:setText("Saved Images")
        self.savedCaptureJRadioButton:setToolTipText("Loads images from files for logical processing.  Usually for debugging your profile actions")
        self.savedCaptureJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.savedCaptureJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.savedCaptureJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.savedCaptureJRadioButtonActionPerformed and self or java_outer_self):savedCaptureJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.captureMotionAnalysisJCheckBox:setText("Motion Analysis")
        self.captureMotionAnalysisJCheckBox:setToolTipText("Uses image comparison and contraints to locate moving objects")
        self.captureMotionAnalysisJCheckBox:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.captureMotionAnalysisJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.captureMotionAnalysisJCheckBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.captureMotionAnalysisJCheckBoxActionPerformed and self or java_outer_self):captureMotionAnalysisJCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.captureComparisonJCheckBox:setText("Comparison")
        self.captureComparisonJCheckBox:setToolTipText("Compares the last two input images for multi image logic")
        self.captureComparisonJCheckBox:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.captureComparisonJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.captureComparisonJCheckBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.captureComparisonJCheckBoxActionPerformed and self or java_outer_self):captureComparisonJCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel3:setText("Image Processing:")
        self.jLabel3:setToolTipText("Turns on/off various extended image processing")
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.screenCaptureJRadioButton):addComponent(self.jLabel1):addComponent(self.jLabel2):addComponent(self.savedCaptureJRadioButton):addComponent(self.captureMotionAnalysisJCheckBox):addComponent(self.captureComparisonJCheckBox):addComponent(self.jLabel3)):addContainerGap(22, require("java.lang.Short").MAX_VALUE)))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel2):addGap(7, 7, 7):addComponent(self.screenCaptureJRadioButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.savedCaptureJRadioButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel3):addGap(7, 7, 7):addComponent(self.captureComparisonJCheckBox):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.captureMotionAnalysisJCheckBox):addContainerGap(106, require("java.lang.Short").MAX_VALUE)))
        local genericProfilesJPanelLayout = GroupLayout.new(self.genericProfilesJPanel)
        self.genericProfilesJPanel:setLayout(genericProfilesJPanelLayout)
        genericProfilesJPanelLayout:setHorizontalGroup(genericProfilesJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addGroup(genericProfilesJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addComponent(self.newProfileJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.deleteProfileJButton)):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addComponent(self.genericProfilesJScrollPane, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, 119, require("java.lang.Short").MAX_VALUE))):addContainerGap()))
        genericProfilesJPanelLayout:setVerticalGroup(genericProfilesJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(genericProfilesJPanelLayout:createSequentialGroup():addGroup(genericProfilesJPanelLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.newProfileJButton):addComponent(self.deleteProfileJButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(genericProfilesJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, 246, require("java.lang.Short").MAX_VALUE):addComponent(self.genericProfilesJScrollPane, GroupLayout.DEFAULT_SIZE, 246, require("java.lang.Short").MAX_VALUE))))
        self.genericJTabbedPane:addTab("Profiles", self.genericProfilesJPanel)
        local blankGenericProfileActionsJPanelLayout = GroupLayout.new(self.blankGenericProfileActionsJPanel)
        self.blankGenericProfileActionsJPanel:setLayout(blankGenericProfileActionsJPanelLayout)
        blankGenericProfileActionsJPanelLayout:setHorizontalGroup(blankGenericProfileActionsJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 395, require("java.lang.Short").MAX_VALUE))
        blankGenericProfileActionsJPanelLayout:setVerticalGroup(blankGenericProfileActionsJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 275, require("java.lang.Short").MAX_VALUE))
        self.genericJTabbedPane:addTab("Actions", self.blankGenericProfileActionsJPanel)
        self:add(self.genericJTabbedPane)
end
java_overload(GenericModuleConfigurationJPanel, "initComponents", 0)


function GenericModuleConfigurationJPanel:savedCaptureJRadioButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "savedCaptureJRadioButtonActionPerformed", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "savedCaptureJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericModuleConfigurationJPanel:screenCaptureJRadioButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "screenCaptureJRadioButtonActionPerformed", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "screenCaptureJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericModuleConfigurationJPanel:captureMotionAnalysisJCheckBoxActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            if self.captureMotionAnalysisJCheckBox:isSelected() then
                self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.MOTION)
            else
                self:getSelectedGenericProfile():remove(GenericProfileDataWorkerType.MOTION)
            end
            self:getGenericProfiles():save()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "captureComparisonJCheckBoxActionPerformed", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "captureMotionAnalysisJCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericModuleConfigurationJPanel:captureComparisonJCheckBoxActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            if self.captureComparisonJCheckBox:isSelected() then
                self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.COMPARISON)
            else
                self:getSelectedGenericProfile():remove(GenericProfileDataWorkerType.COMPARISON)
            end
            self:getGenericProfiles():save()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "captureComparisonJCheckBoxActionPerformed", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "captureComparisonJCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


-- throws Exception
function GenericModuleConfigurationJPanel:updateProfileUI(profileNameString)
        self:getBlankGenericProfileActionsJPanel():removeAll()
        if not rawequal(profileNameString, nil) then
            local genericProfileActionsJPanel = GenericProfileActionsJPanel.new()
            self:setSelectedGenericProfile(self:getGenericProfiles():get(profileNameString))
            self:getSelectedGenericProfile():setGenericProfileActions(GenericProfileActions.new(genericProfileActionsJPanel, profileNameString))
            genericProfileActionsJPanel:setGenericProfileActions(self:getSelectedGenericProfile():getGenericProfileActions())
            genericProfileActionsJPanel:selectFirstElement()
            local layout = self:getBlankGenericProfileActionsJPanel():getLayout()
            layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 395, require("java.lang.Short").MAX_VALUE):addComponent(genericProfileActionsJPanel, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
            layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 256, require("java.lang.Short").MAX_VALUE):addComponent(genericProfileActionsJPanel, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
            self:updateProfileOptions()
            self.logUtil:putF("Setting Configuration Profile JPanel", self, "updateProfileUI")
        else
            self.logUtil:putF("Null Configuration Profile", self, "updateProfileUI")
        end
end
java_overload(GenericModuleConfigurationJPanel, "updateProfileUI", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function GenericModuleConfigurationJPanel:selectFirstElement()
        self.genericProfilesJList:setModel(self:getGenericProfiles():getDefaultListModelHelper():getListModel())
        if self.genericProfilesJList:getModel():getSize() > 0 then
            self.genericProfilesJList:setSelectedValue(self.genericProfilesJList:getModel():getElementAt(0), true)
            self:updateProfileUI(self.genericProfilesJList:getModel():getElementAt(0))
        end
end
java_overload(GenericModuleConfigurationJPanel, "selectFirstElement", 0)


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
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(genericProfile:getName()) .. require("allbinary_java").to_string(" has GenericProfileDataWorkerType: ")) .. require("allbinary_java").to_string(tostring(genericProfileDataWorkerType)), self, "updateProfileOptions")
            if rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.SCREEN_CAPTURE) then
                self.logUtil:putF("Screen Capture Selected", self, "updateProfileOptions")
                self.screenCaptureJRadioButton:setSelected(true)
            elseif rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.SAVED_CAPTURE) then
                self.logUtil:putF("Saved Capture Selected", self, "updateProfileOptions")
                self.savedCaptureJRadioButton:setSelected(true)
            elseif rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.COMPARISON) then
                self.logUtil:putF("Checking Comparison Box", self, "updateProfileOptions")
                self.captureComparisonJCheckBox:setSelected(true)
            elseif rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.MOTION) then
                self.logUtil:putF("Checking Motion Box", self, "updateProfileOptions")
                self.captureMotionAnalysisJCheckBox:setSelected(true)
            end
        end
        if not (self.screenCaptureJRadioButton:isSelected()) and not (self.savedCaptureJRadioButton:isSelected()) then
            self.screenCaptureJRadioButton:setSelected(true)
            self:getSelectedGenericProfile():add(GenericProfileDataWorkerType.SCREEN_CAPTURE)
        end
        self.logUtil:putF(self.commonStrings.END, self, "updateProfileOptions")
end
java_overload(GenericModuleConfigurationJPanel, "updateProfileOptions", 0)


function GenericModuleConfigurationJPanel:getBlankGenericProfileActionsJPanel()
        return self.blankGenericProfileActionsJPanel
end
java_overload(GenericModuleConfigurationJPanel, "getBlankGenericProfileActionsJPanel", 0)


function GenericModuleConfigurationJPanel:setBlankGenericProfileActionsJPanel(blankGenericProfileActionsJPanel)
        self.blankGenericProfileActionsJPanel = blankGenericProfileActionsJPanel
end
java_overload(GenericModuleConfigurationJPanel, "setBlankGenericProfileActionsJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function GenericModuleConfigurationJPanel:getGenericProfiles()
        return self.genericProfiles
end
java_overload(GenericModuleConfigurationJPanel, "getGenericProfiles", 0)


function GenericModuleConfigurationJPanel:setGenericProfiles(genericProfiles)
        self.genericProfiles = genericProfiles
end
java_overload(GenericModuleConfigurationJPanel, "setGenericProfiles", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfiles")) end)


function GenericModuleConfigurationJPanel:getSelectedGenericProfile()
        return self.selectedGenericProfile
end
java_overload(GenericModuleConfigurationJPanel, "getSelectedGenericProfile", 0)


function GenericModuleConfigurationJPanel:setSelectedGenericProfile(selectedGenericProfile)
        self.selectedGenericProfile = selectedGenericProfile
end
java_overload(GenericModuleConfigurationJPanel, "setSelectedGenericProfile", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfile")) end)


function GenericModuleConfigurationJPanel:genericProfilesJListValueChanged(evt)
        local try_ok, try_error, try_value = pcall(function()
            local profileNameString = self.genericProfilesJList:getSelectedValue()
            self:updateProfileUI(profileNameString)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "genericProfilesJListValueChanged", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "genericProfilesJListValueChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ListSelectionEvent")) end)


function GenericModuleConfigurationJPanel:deleteProfileJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local anyType = self.genericProfilesJList:getSelectedValues()
            for index = 0, (anyType.n or #anyType) - 1 do
                local nextSelectedValueString = anyType[index + 1]
                self:getGenericProfiles():remove(nextSelectedValueString)
            end
            self:selectFirstElement()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteProfileJButtonActionPerformed", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "deleteProfileJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericModuleConfigurationJPanel:okNewProfileJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local newProfileName = self.newProfileNameJTextField:getText()
            self:getGenericProfiles():add(newProfileName)
            self.genericProfilesJList:setModel(self:getGenericProfiles():getDefaultListModelHelper():getListModel())
            self.genericProfilesJList:setSelectedValue(newProfileName, true)
            self.newProfileJDialog:setVisible(false)
            self:updateProfileUI(newProfileName)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okNewProfileJButtonActionPerformed", e)
        end
end
java_overload(GenericModuleConfigurationJPanel, "okNewProfileJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericModuleConfigurationJPanel:newProfileJButtonActionPerformed(evt)
        self.newProfileJDialog:setVisible(true)
end
java_overload(GenericModuleConfigurationJPanel, "newProfileJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return GenericModuleConfigurationJPanel

