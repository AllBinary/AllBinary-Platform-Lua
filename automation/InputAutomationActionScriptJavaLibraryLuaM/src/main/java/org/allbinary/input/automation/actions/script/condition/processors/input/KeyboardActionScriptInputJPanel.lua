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

local KeyboardActionScriptInputJPanel = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputJPanel"] = KeyboardActionScriptInputJPanel

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

-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local ComboBoxModel = require("javax.swing.ComboBoxModel")
local KeySingletonFactory = java_lazy("org.allbinary.input.KeySingletonFactory")
local InputRobot = java_lazy("org.allbinary.input.automation.robot.InputRobot")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")
local TempInputRobotNames = java_lazy("org.allbinary.input.automation.robot.TempInputRobotNames")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local Insets = require("java.awt.Insets")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local BorderFactory = require("javax.swing.BorderFactory")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JComboBox = require("javax.swing.JComboBox")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JRadioButton = require("javax.swing.JRadioButton")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
-- local SwingConstants = require("javax.swing.SwingConstants")
local KeyCharDefaultComboBoxModelFactory = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyCharDefaultComboBoxModelFactory")
local KeyNameDefaultComboBoxModelFactory = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyNameDefaultComboBoxModelFactory")
local KeyboardActionScriptInputInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputInterface")

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

-- class table KeyboardActionScriptInputJPanel is declared before the requires
KeyboardActionScriptInputJPanel.__index = KeyboardActionScriptInputJPanel
KeyboardActionScriptInputJPanel.className = "KeyboardActionScriptInputJPanel"
KeyboardActionScriptInputJPanel.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputJPanel"
setmetatable(KeyboardActionScriptInputJPanel, {__index = JPanel})

function KeyboardActionScriptInputJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.keyActionScriptInputInterface == nil then self.keyActionScriptInputInterface = nil end
    if self.addKeyJLabel == nil then self.addKeyJLabel = nil end
    if self.delayBetweenJLabel == nil then self.delayBetweenJLabel = nil end
    if self.delayJTextField == nil then self.delayJTextField = nil end
    if self.holdTimeJLabel == nil then self.holdTimeJLabel = nil end
    if self.inputAutomationTypeJComboBox == nil then self.inputAutomationTypeJComboBox = nil end
    if self.inputTypeJLabel == nil then self.inputTypeJLabel = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.keyActionJButton == nil then self.keyActionJButton = nil end
    if self.keyActionJDialog == nil then self.keyActionJDialog = nil end
    if self.keyIntegerJComboBox == nil then self.keyIntegerJComboBox = nil end
    if self.keyNameJComboBox == nil then self.keyNameJComboBox = nil end
    if self.normalJRadioButton == nil then self.normalJRadioButton = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.pressJRadioButton == nil then self.pressJRadioButton = nil end
    if self.releaseJRadioButton == nil then self.releaseJRadioButton = nil end
    if self.sequenceJRadioButton == nil then self.sequenceJRadioButton = nil end
    if self.simultaneousJRadioButton == nil then self.simultaneousJRadioButton = nil end
    if self.testJLabel == nil then self.testJLabel = nil end
    if self.textJTextField == nil then self.textJTextField = nil end
    if self.timeJTextField == nil then self.timeJTextField = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
end


function KeyboardActionScriptInputJPanel._jinit(self, keyActionScriptInputInterface)
    java_super_init(JPanel, self)
    KeyboardActionScriptInputJPanel._init_fields(self)
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

function KeyboardActionScriptInputJPanel.new(...)
    local self = setmetatable({}, KeyboardActionScriptInputJPanel)
    KeyboardActionScriptInputJPanel._jinit(self, ...)
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
java_overload(KeyboardActionScriptInputJPanel, "set", 0)


-- throws Exception
function KeyboardActionScriptInputJPanel:updateInputType()
        local comboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        local selectedItem = comboBoxModel:getSelectedItem()
        if not (StringValidationUtil.getInstance():isEmpty(selectedItem)) then
            self.keyActionScriptInputInterface:setInputRobotInterface(InputRobotFactory.getInstance():get(selectedItem))
        end
end
java_overload(KeyboardActionScriptInputJPanel, "updateInputType", 0)


function KeyboardActionScriptInputJPanel:getSelectedKey()
        local comboBoxModel = self.keyNameJComboBox:getModel()
        local selectedItem = comboBoxModel:getSelectedItem()
        if not (StringValidationUtil.getInstance():isEmpty(selectedItem)) then
            return KeySingletonFactory.getHashtable():get(selectedItem)
        end
        return nil
end
java_overload(KeyboardActionScriptInputJPanel, "getSelectedKey", 0)


function KeyboardActionScriptInputJPanel:updateKeys()
        local text = self.textJTextField:getText()
        self.keyActionScriptInputInterface:setText(text)
end
java_overload(KeyboardActionScriptInputJPanel, "updateKeys", 0)


-- throws Exception
function KeyboardActionScriptInputJPanel:update()
        self:updateInputType()
        self:updateKeys()
        self.keyActionScriptInputInterface:setTime(require("allbinary_java").number_value(tostring(self.timeJTextField:getText()), "intValue"))
        self.keyActionScriptInputInterface:log()
end
java_overload(KeyboardActionScriptInputJPanel, "update", 0)


function KeyboardActionScriptInputJPanel:getKeyActionJDialog()
        return self.keyActionJDialog
end
java_overload(KeyboardActionScriptInputJPanel, "getKeyActionJDialog", 0)


function KeyboardActionScriptInputJPanel:setKeyActionJDialog(keyActionJDialog)
        self.keyActionJDialog = keyActionJDialog
end
java_overload(KeyboardActionScriptInputJPanel, "setKeyActionJDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JDialog")) end)


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
        self.titleJLabel:setHorizontalAlignment(SwingConstants.CENTER)
        self.titleJLabel:setText("Keyboard Input Options")
        self.addKeyJLabel:setText("Add Key:")
        self.keyNameJComboBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.keyNameJComboBoxActionPerformed and self or java_outer_self):keyNameJComboBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
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
        self.pressJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.pressJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.pressJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.pressJRadioButtonActionPerformed and self or java_outer_self):pressJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.releaseJRadioButton:setText("Release")
        self.releaseJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.releaseJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.releaseJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.releaseJRadioButtonActionPerformed and self or java_outer_self):releaseJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.normalJRadioButton:setSelected(true)
        self.normalJRadioButton:setText("Normal")
        self.normalJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.normalJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.normalJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.normalJRadioButtonActionPerformed and self or java_outer_self):normalJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.simultaneousJRadioButton:setSelected(true)
        self.simultaneousJRadioButton:setText("Simultaneous")
        self.simultaneousJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.simultaneousJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.simultaneousJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.simultaneousJRadioButtonActionPerformed and self or java_outer_self):simultaneousJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.sequenceJRadioButton:setText("Sequence")
        self.sequenceJRadioButton:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.sequenceJRadioButton:setMargin(Insets.new(0, 0, 0, 0))
        self.sequenceJRadioButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.sequenceJRadioButtonActionPerformed and self or java_outer_self):sequenceJRadioButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.okJButton:setText("OK")
        self.okJButton:setHorizontalTextPosition(SwingConstants.CENTER)
        self.okJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.okJButtonActionPerformed and self or java_outer_self):okJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jPanel1:add(self.okJButton)
        self.keyIntegerJComboBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.keyIntegerJComboBoxActionPerformed and self or java_outer_self):keyIntegerJComboBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local keyActionJDialogLayout = GroupLayout.new(self.keyActionJDialog:getContentPane())
        self.keyActionJDialog:getContentPane():setLayout(keyActionJDialogLayout)
        keyActionJDialogLayout:setHorizontalGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(keyActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(keyActionJDialogLayout:createSequentialGroup():addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING, false):addComponent(self.addKeyJLabel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.inputTypeJLabel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.TRAILING):addComponent(self.inputAutomationTypeJComboBox, 0, 148, require("java.lang.Short").MAX_VALUE):addComponent(self.textJTextField, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 148, require("java.lang.Short").MAX_VALUE):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.keyNameJComboBox, 0, 101, require("java.lang.Short").MAX_VALUE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.keyIntegerJComboBox, GroupLayout.PREFERRED_SIZE, 41, GroupLayout.PREFERRED_SIZE)))):addComponent(self.testJLabel, GroupLayout.PREFERRED_SIZE, 60, GroupLayout.PREFERRED_SIZE):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.normalJRadioButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.pressJRadioButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.releaseJRadioButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 48, GroupLayout.PREFERRED_SIZE)):addGroup(GroupLayout.Alignment.TRAILING, keyActionJDialogLayout:createSequentialGroup():addComponent(self.holdTimeJLabel):addGap(22, 22, 22):addComponent(self.timeJTextField, GroupLayout.DEFAULT_SIZE, 113, require("java.lang.Short").MAX_VALUE)):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.delayBetweenJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 15, require("java.lang.Short").MAX_VALUE):addComponent(self.delayJTextField, GroupLayout.PREFERRED_SIZE, 68, GroupLayout.PREFERRED_SIZE)):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.simultaneousJRadioButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.sequenceJRadioButton))):addContainerGap()):addComponent(self.titleJLabel, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 229, require("java.lang.Short").MAX_VALUE):addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, 229, require("java.lang.Short").MAX_VALUE))
        keyActionJDialogLayout:setVerticalGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(keyActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.inputTypeJLabel):addComponent(self.inputAutomationTypeJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.addKeyJLabel):addComponent(self.keyIntegerJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.keyNameJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.testJLabel):addComponent(self.textJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.pressJRadioButton):addComponent(self.normalJRadioButton):addComponent(self.releaseJRadioButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.holdTimeJLabel):addComponent(self.timeJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.delayBetweenJLabel):addComponent(self.delayJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(keyActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.simultaneousJRadioButton):addComponent(self.sequenceJRadioButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.keyActionJButton:setText("Edit")
        self.keyActionJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.keyActionJButtonActionPerformed and self or java_outer_self):keyActionJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Key:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 49, require("java.lang.Short").MAX_VALUE):addComponent(self.keyActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.keyActionJButton)))
end
java_overload(KeyboardActionScriptInputJPanel, "initComponents", 0)


function KeyboardActionScriptInputJPanel:prependText(integer)
        if not rawequal(integer, nil) then
            local newKey = require("allbinary_java").to_string(require("allbinary_java").to_string("&#") .. require("allbinary_java").to_string(tostring(integer))) .. require("allbinary_java").to_string(";")
            self.textJTextField:setText(require("allbinary_java").to_string(newKey) .. require("allbinary_java").to_string(self.textJTextField:getText()))
        end
end
java_overload(KeyboardActionScriptInputJPanel, "prependText", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function KeyboardActionScriptInputJPanel:keyIntegerJComboBoxActionPerformed(evt)
        self.keyIntegerJComboBox:getSelectedIndex()
        self.keyNameJComboBox:setSelectedIndex(self.keyIntegerJComboBox:getSelectedIndex())
end
java_overload(KeyboardActionScriptInputJPanel, "keyIntegerJComboBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:sequenceJRadioButtonActionPerformed(evt)
        if self.sequenceJRadioButton:isSelected() then
            self.delayJTextField:setText(CommonPhoneStrings.getInstance().ONE)
            self.simultaneousJRadioButton:setSelected(false)
        end
end
java_overload(KeyboardActionScriptInputJPanel, "sequenceJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:simultaneousJRadioButtonActionPerformed(evt)
        if self.simultaneousJRadioButton:isSelected() then
            self.delayJTextField:setText(CommonPhoneStrings.getInstance().ZERO)
            self.sequenceJRadioButton:setSelected(false)
        end
end
java_overload(KeyboardActionScriptInputJPanel, "simultaneousJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:keyNameJComboBoxActionPerformed(evt)
        local integer = self:getSelectedKey()
        self:prependText(integer)
        self.keyIntegerJComboBox:setSelectedIndex(self.keyNameJComboBox:getSelectedIndex())
end
java_overload(KeyboardActionScriptInputJPanel, "keyNameJComboBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:okJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self:update()
            self:getKeyActionJDialog():setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okButtonActionPerformed", e)
        end
end
java_overload(KeyboardActionScriptInputJPanel, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:keyActionJButtonActionPerformed(evt)
        self:getKeyActionJDialog():setVisible(true)
end
java_overload(KeyboardActionScriptInputJPanel, "keyActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:normalJRadioButtonActionPerformed(evt)
        if self.normalJRadioButton:isSelected() then
            self.keyActionScriptInputInterface:setNormal()
            self.pressJRadioButton:setSelected(false)
            self.releaseJRadioButton:setSelected(false)
        end
end
java_overload(KeyboardActionScriptInputJPanel, "normalJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:releaseJRadioButtonActionPerformed(evt)
        if self.releaseJRadioButton:isSelected() then
            self.keyActionScriptInputInterface:setRelease(true)
            self.keyActionScriptInputInterface:setPress(false)
            self.pressJRadioButton:setSelected(false)
            self.normalJRadioButton:setSelected(false)
        end
end
java_overload(KeyboardActionScriptInputJPanel, "releaseJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function KeyboardActionScriptInputJPanel:pressJRadioButtonActionPerformed(evt)
        if self.pressJRadioButton:isSelected() then
            self.keyActionScriptInputInterface:setPress(true)
            self.keyActionScriptInputInterface:setRelease(false)
            self.releaseJRadioButton:setSelected(false)
            self.normalJRadioButton:setSelected(false)
        end
end
java_overload(KeyboardActionScriptInputJPanel, "pressJRadioButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return KeyboardActionScriptInputJPanel

