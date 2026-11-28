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

local MouseActionScriptInputJPanel = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputJPanel"] = MouseActionScriptInputJPanel

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

-- local InputEvent = require("java.awt.event.InputEvent")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local ComboBoxModel = require("javax.swing.ComboBoxModel")
local InputRobot = java_lazy("org.allbinary.input.automation.robot.InputRobot")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")
local TempInputRobotNames = java_lazy("org.allbinary.input.automation.robot.TempInputRobotNames")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local Insets = require("java.awt.Insets")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local BorderFactory = require("javax.swing.BorderFactory")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JCheckBox = require("javax.swing.JCheckBox")
-- local JComboBox = require("javax.swing.JComboBox")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local MouseActionScriptInputInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputInterface")

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

-- class table MouseActionScriptInputJPanel is declared before the requires
MouseActionScriptInputJPanel.__index = MouseActionScriptInputJPanel
MouseActionScriptInputJPanel.className = "MouseActionScriptInputJPanel"
MouseActionScriptInputJPanel.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputJPanel"
setmetatable(MouseActionScriptInputJPanel, {__index = JPanel})

function MouseActionScriptInputJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.mouseActionScriptInputInterface == nil then self.mouseActionScriptInputInterface = nil end
    if self.button1JCheckBox == nil then self.button1JCheckBox = nil end
    if self.button2JCheckBox == nil then self.button2JCheckBox = nil end
    if self.inputAutomationTypeJComboBox == nil then self.inputAutomationTypeJComboBox = nil end
    if self.inputTypeJLabel == nil then self.inputTypeJLabel = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLabel3 == nil then self.jLabel3 = nil end
    if self.jLabel4 == nil then self.jLabel4 = nil end
    if self.jLabel5 == nil then self.jLabel5 = nil end
    if self.jLabel6 == nil then self.jLabel6 = nil end
    if self.mouseActionJButton == nil then self.mouseActionJButton = nil end
    if self.mouseActionJDialog == nil then self.mouseActionJDialog = nil end
    if self.mouseDelayJTextField == nil then self.mouseDelayJTextField = nil end
    if self.mouseXJTextField == nil then self.mouseXJTextField = nil end
    if self.mouseYJTextField == nil then self.mouseYJTextField = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
end


function MouseActionScriptInputJPanel._jinit(self, mouseActionScriptInputInterface)
    java_super_init(JPanel, self)
    MouseActionScriptInputJPanel._init_fields(self)
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

function MouseActionScriptInputJPanel.new(...)
    local self = setmetatable({}, MouseActionScriptInputJPanel)
    MouseActionScriptInputJPanel._jinit(self, ...)
    return self
end


function MouseActionScriptInputJPanel:set()
        local inputTypeComboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        inputTypeComboBoxModel:setSelectedItem(self.mouseActionScriptInputInterface:getInputRobotInterface():getName())
        if not rawequal((self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON1_MASK), 0) then
            self.button1JCheckBox:setSelected(true)
        else
            self.button1JCheckBox:setSelected(false)
        end
        if not rawequal((self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON2_MASK), 0) then
            self.button2JCheckBox:setSelected(true)
        else
            self.button2JCheckBox:setSelected(false)
        end
        self.mouseDelayJTextField:setText(tostring(self.mouseActionScriptInputInterface:getTime()))
        self.mouseXJTextField:setText(tostring(self.mouseActionScriptInputInterface:getPoint().x))
        self.mouseYJTextField:setText(tostring(self.mouseActionScriptInputInterface:getPoint().y))
        self.mouseActionScriptInputInterface:log()
end
java_overload(MouseActionScriptInputJPanel, "set", 0)


-- throws Exception
function MouseActionScriptInputJPanel:updateInputType()
        local comboBoxModel = self.inputAutomationTypeJComboBox:getModel()
        local selectedItem = comboBoxModel:getSelectedItem()
        if not (StringValidationUtil.getInstance():isEmpty(selectedItem)) then
            self.mouseActionScriptInputInterface:setInputRobotInterface(InputRobotFactory.getInstance():get(selectedItem))
        end
end
java_overload(MouseActionScriptInputJPanel, "updateInputType", 0)


-- throws Exception
function MouseActionScriptInputJPanel:update()
        self:updateInputType()
        self.mouseActionScriptInputInterface:setTime(tostring(self.mouseDelayJTextField:getText()))
        self.logUtil:putF(require("allbinary_java").to_string("Button State: ") .. require("allbinary_java").to_string(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
        if self.button1JCheckBox:isSelected() then
            if rawequal((self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON1_MASK), 0) then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() | InputEvent.BUTTON1_MASK)
                self.logUtil:putF(require("allbinary_java").to_string("Button 1 Selected: ") .. require("allbinary_java").to_string(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        else
            if not rawequal((self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON1_MASK), 0) then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() ~ InputEvent.BUTTON1_MASK)
                self.logUtil:putF(require("allbinary_java").to_string("Button 1 Deselected: ") .. require("allbinary_java").to_string(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        end
        if self.button2JCheckBox:isSelected() then
            if rawequal((self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON2_MASK), 0) then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() | InputEvent.BUTTON2_MASK)
                self.logUtil:putF(require("allbinary_java").to_string("Button 2 Selected: ") .. require("allbinary_java").to_string(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        else
            if not rawequal((self.mouseActionScriptInputInterface:getButtonClicks() & InputEvent.BUTTON2_MASK), 0) then
                self.mouseActionScriptInputInterface:setButtonClicks(self.mouseActionScriptInputInterface:getButtonClicks() ~ InputEvent.BUTTON2_MASK)
                self.logUtil:putF(require("allbinary_java").to_string("Button 2 Deselected: ") .. require("allbinary_java").to_string(self.mouseActionScriptInputInterface:getButtonClicks()), self, "update")
            end
        end
        local mouseXString = self.mouseXJTextField:getText()
        if not (StringValidationUtil.getInstance():isEmpty(mouseXString)) and StringValidationUtil.getInstance():isNumber(mouseXString) then
            self.mouseActionScriptInputInterface:getPoint().x = math.tointeger(tonumber(mouseXString))
        end
        local mouseYString = self.mouseYJTextField:getText()
        if not (StringValidationUtil.getInstance():isEmpty(mouseYString)) and StringValidationUtil.getInstance():isNumber(mouseYString) then
            self.mouseActionScriptInputInterface:getPoint().y = math.tointeger(tonumber(mouseYString))
        end
        self.mouseActionScriptInputInterface:log()
end
java_overload(MouseActionScriptInputJPanel, "update", 0)


function MouseActionScriptInputJPanel:getMouseActionJDialog()
        return self.mouseActionJDialog
end
java_overload(MouseActionScriptInputJPanel, "getMouseActionJDialog", 0)


function MouseActionScriptInputJPanel:setMouseActionJDialog(mouseActionJDialog)
        self.mouseActionJDialog = mouseActionJDialog
end
java_overload(MouseActionScriptInputJPanel, "setMouseActionJDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JDialog")) end)


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
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.okJButtonActionPerformed and self or java_outer_self):okJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel2:setText("Buttons:")
        self.jLabel3:setText("Move To:")
        self.button1JCheckBox:setText(CommonPhoneStrings.getInstance().ONE)
        self.button1JCheckBox:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.button1JCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.button2JCheckBox:setText(CommonPhoneStrings.getInstance().TWO)
        self.button2JCheckBox:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.button2JCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.button2JCheckBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.button2JCheckBoxActionPerformed and self or java_outer_self):button2JCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
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
        mouseActionJDialogLayout:setHorizontalGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(mouseActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.inputTypeJLabel):addGroup(GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout:createSequentialGroup():addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel2):addGap(25, 25, 25)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel3):addComponent(self.jLabel6)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED))):addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.mouseDelayJTextField, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 154, require("java.lang.Short").MAX_VALUE):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addGap(45, 45, 45)):addGroup(GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout:createSequentialGroup():addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.inputAutomationTypeJComboBox, 0, 154, require("java.lang.Short").MAX_VALUE)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.button1JCheckBox):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.button2JCheckBox)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.TRAILING):addGroup(mouseActionJDialogLayout:createSequentialGroup():addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.okJButton)):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel4):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 5, require("java.lang.Short").MAX_VALUE):addComponent(self.mouseXJTextField, GroupLayout.PREFERRED_SIZE, 59, GroupLayout.PREFERRED_SIZE))):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel5):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.mouseYJTextField, GroupLayout.DEFAULT_SIZE, 62, require("java.lang.Short").MAX_VALUE))))):addContainerGap()))
        mouseActionJDialogLayout:setVerticalGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(mouseActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.inputTypeJLabel):addComponent(self.inputAutomationTypeJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel2, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE):addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.button1JCheckBox):addComponent(self.button2JCheckBox))):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel6):addComponent(self.mouseDelayJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(mouseActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel3):addComponent(self.jLabel4):addComponent(self.jLabel5):addComponent(self.mouseYJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.mouseXJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.mouseActionJButton:setText("Edit")
        self.mouseActionJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.mouseActionJButtonActionPerformed and self or java_outer_self):mouseActionJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Mouse:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 36, require("java.lang.Short").MAX_VALUE):addComponent(self.mouseActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.mouseActionJButton)))
end
java_overload(MouseActionScriptInputJPanel, "initComponents", 0)


function MouseActionScriptInputJPanel:button2JCheckBoxActionPerformed(evt)
end
java_overload(MouseActionScriptInputJPanel, "button2JCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MouseActionScriptInputJPanel:okJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self:update()
            self:getMouseActionJDialog():setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okButtonActionPerformed", e)
        end
end
java_overload(MouseActionScriptInputJPanel, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MouseActionScriptInputJPanel:mouseActionJButtonActionPerformed(evt)
        self:getMouseActionJDialog():setVisible(true)
end
java_overload(MouseActionScriptInputJPanel, "mouseActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return MouseActionScriptInputJPanel

