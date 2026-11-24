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

local GenericProfileActionsJPanel = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel"] = GenericProfileActionsJPanel

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

local DefaultListModelHelper = java_lazy("org.allbinary.input.automation.module.DefaultListModelHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JList = require("javax.swing.JList")
-- local JPanel = require("javax.swing.JPanel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
-- local ListSelectionEvent = require("javax.swing.event.ListSelectionEvent")
-- local ListSelectionListener = require("javax.swing.event.ListSelectionListener")
local GenericProfileAction = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")
local GenericProfileActionJPanel = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel")
local GenericProfileActions = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table GenericProfileActionsJPanel is declared before the requires
GenericProfileActionsJPanel.__index = GenericProfileActionsJPanel
GenericProfileActionsJPanel.className = "GenericProfileActionsJPanel"
GenericProfileActionsJPanel.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel"
setmetatable(GenericProfileActionsJPanel, {__index = JPanel})

function GenericProfileActionsJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.genericProfileActions == nil then self.genericProfileActions = nil end
    if self.genericProfileActionJPanel == nil then self.genericProfileActionJPanel = nil end
    if self.blankGenericProfileActionJPanel == nil then self.blankGenericProfileActionJPanel = nil end
    if self.deleteActionJButton == nil then self.deleteActionJButton = nil end
    if self.genericProfileActionsJList == nil then self.genericProfileActionsJList = nil end
    if self.genericProfileActionsJPanel == nil then self.genericProfileActionsJPanel = nil end
    if self.genericProfileActionsJScrollPane == nil then self.genericProfileActionsJScrollPane = nil end
    if self.newActionJButton == nil then self.newActionJButton = nil end
    if self.newProfileActionJDialog == nil then self.newProfileActionJDialog = nil end
    if self.newProfileActionJLabel == nil then self.newProfileActionJLabel = nil end
    if self.newProfileActionJTextField == nil then self.newProfileActionJTextField = nil end
    if self.okNewProfileActionJButton == nil then self.okNewProfileActionJButton = nil end
    if self.saveJButton == nil then self.saveJButton = nil end
end


function GenericProfileActionsJPanel._jinit(self)
    java_super_init(JPanel, self)
    GenericProfileActionsJPanel._init_fields(self)
        self:initComponents()
    return self
end

function GenericProfileActionsJPanel.new(...)
    local self = setmetatable({}, GenericProfileActionsJPanel)
    GenericProfileActionsJPanel._jinit(self, ...)
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
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local newProfileActionJDialogLayout = GroupLayout.new(self.newProfileActionJDialog:getContentPane())
        self.newProfileActionJDialog:getContentPane():setLayout(newProfileActionJDialogLayout)
        newProfileActionJDialogLayout:setHorizontalGroup(newProfileActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGroup(newProfileActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGap(93, 93, 93):addComponent(self.okNewProfileActionJButton)):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGap(75, 75, 75):addComponent(self.newProfileActionJLabel)):addGroup(newProfileActionJDialogLayout:createSequentialGroup():addGap(29, 29, 29):addComponent(self.newProfileActionJTextField, GroupLayout.PREFERRED_SIZE, 178, GroupLayout.PREFERRED_SIZE))):addContainerGap(34, require("java.lang.Short").MAX_VALUE)))
        newProfileActionJDialogLayout:setVerticalGroup(newProfileActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(GroupLayout.Alignment.TRAILING, newProfileActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.newProfileActionJLabel):addGap(21, 21, 21):addComponent(self.newProfileActionJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 20, require("java.lang.Short").MAX_VALUE):addComponent(self.okNewProfileActionJButton):addContainerGap()))
        self.genericProfileActionsJPanel:setPreferredSize(Dimension.new(10000, 10000))
        self.genericProfileActionsJList:addListSelectionListener((function()
            local o = ListSelectionListener.new and ListSelectionListener.new() or setmetatable({}, {__index = ListSelectionListener})
            

            function o:valueChanged(evt)
                self:genericProfileActionsJListValueChanged(evt)
            end
            java_overload(o, "valueChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ListSelectionEvent")) end)
            return o
        end)())
        self.genericProfileActionsJScrollPane:setViewportView(self.genericProfileActionsJList)
        self.newActionJButton:setText("New")
        self.newActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newActionJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.deleteActionJButton:setText("Delete")
        self.deleteActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:deleteActionJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.saveJButton:setText("Save")
        self.saveJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:saveJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.blankGenericProfileActionJPanel:setMinimumSize(Dimension.new(500, 300))
        local blankGenericProfileActionJPanelLayout = GroupLayout.new(self.blankGenericProfileActionJPanel)
        self.blankGenericProfileActionJPanel:setLayout(blankGenericProfileActionJPanelLayout)
        blankGenericProfileActionJPanelLayout:setHorizontalGroup(blankGenericProfileActionJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 500, require("java.lang.Short").MAX_VALUE))
        blankGenericProfileActionJPanelLayout:setVerticalGroup(blankGenericProfileActionJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 296, require("java.lang.Short").MAX_VALUE))
        local genericProfileActionsJPanelLayout = GroupLayout.new(self.genericProfileActionsJPanel)
        self.genericProfileActionsJPanel:setLayout(genericProfileActionsJPanelLayout)
        genericProfileActionsJPanelLayout:setHorizontalGroup(genericProfileActionsJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(genericProfileActionsJPanelLayout:createSequentialGroup():addComponent(self.genericProfileActionsJScrollPane, GroupLayout.PREFERRED_SIZE, 95, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.blankGenericProfileActionJPanel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)):addGroup(genericProfileActionsJPanelLayout:createSequentialGroup():addComponent(self.newActionJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.deleteActionJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.saveJButton):addContainerGap()))
        genericProfileActionsJPanelLayout:setVerticalGroup(genericProfileActionsJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(genericProfileActionsJPanelLayout:createSequentialGroup():addGroup(genericProfileActionsJPanelLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.newActionJButton):addComponent(self.deleteActionJButton):addComponent(self.saveJButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(genericProfileActionsJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING, false):addComponent(self.blankGenericProfileActionJPanel, 0, 296, require("java.lang.Short").MAX_VALUE):addComponent(self.genericProfileActionsJScrollPane, GroupLayout.DEFAULT_SIZE, 296, require("java.lang.Short").MAX_VALUE)):addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.genericProfileActionsJPanel, GroupLayout.PREFERRED_SIZE, 596, GroupLayout.PREFERRED_SIZE):addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.genericProfileActionsJPanel, GroupLayout.PREFERRED_SIZE, 336, GroupLayout.PREFERRED_SIZE))
end
java_overload(GenericProfileActionsJPanel, "initComponents", 0)


function GenericProfileActionsJPanel:setModel()
        local defaultListModelHelper = self:getGenericProfileActions():getDefaultListModelHelper()
        if defaultListModelHelper:getListModel():getSize() > 0 then
            self.genericProfileActionsJList:setModel(defaultListModelHelper:getListModel())
        end
end
java_overload(GenericProfileActionsJPanel, "setModel", 0)


function GenericProfileActionsJPanel:saveJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self:getGenericProfileActions():save()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "saveJButtonActionPerformed", e)
        end
end
java_overload(GenericProfileActionsJPanel, "saveJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericProfileActionsJPanel:updateProfileActionUI(profileActionNameString)
        self.blankGenericProfileActionJPanel:removeAll()
        if profileActionNameString ~= nil then
            local genericProfileAction = self:getGenericProfileActions():getAction(profileActionNameString)
            self:setGenericProfileActionJPanel(GenericProfileActionJPanel.new())
            self:getGenericProfileActionJPanel():setGenericProfileAction(genericProfileAction)
            self:getGenericProfileActionJPanel():updateProfileActionUI()
            local layout = self.blankGenericProfileActionJPanel:getLayout()
            layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 395, require("java.lang.Short").MAX_VALUE):addComponent(self:getGenericProfileActionJPanel(), GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
            layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 256, require("java.lang.Short").MAX_VALUE):addComponent(self:getGenericProfileActionJPanel(), GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
            self.logUtil:putF("Setting Configuration Profile Actions JPanel", self, "genericProfileActionsJListValueChanged")
        end
end
java_overload(GenericProfileActionsJPanel, "updateProfileActionUI", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function GenericProfileActionsJPanel:genericProfileActionsJListValueChanged(evt)
        local try_ok, try_error, try_value = pcall(function()
            local profileActionNameString = self.genericProfileActionsJList:getSelectedValue()
            self:updateProfileActionUI(profileActionNameString)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "genericProfileActionsJListValueChanged", e)
        end
end
java_overload(GenericProfileActionsJPanel, "genericProfileActionsJListValueChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ListSelectionEvent")) end)


function GenericProfileActionsJPanel:okNewProfileActionJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local newActionName = self.newProfileActionJTextField:getText()
            self:getGenericProfileActions():add(newActionName)
            self:setModel()
            self.genericProfileActionsJList:setSelectedValue(newActionName, true)
            self.newProfileActionJDialog:setVisible(false)
            self:updateProfileActionUI(newActionName)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okNewProfileActionJButtonActionPerformed", e)
        end
end
java_overload(GenericProfileActionsJPanel, "okNewProfileActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericProfileActionsJPanel:deleteActionJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local anyType = self.genericProfileActionsJList:getSelectedValues()
            for index = 0, (anyType.n or #anyType) - 1 do
                local nextSelectedValueString = anyType[index + 1]
                self:getGenericProfileActions():remove(nextSelectedValueString)
            end
            self:selectFirstElement()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteActionJButtonActionPerformed", e)
        end
end
java_overload(GenericProfileActionsJPanel, "deleteActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


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
java_overload(GenericProfileActionsJPanel, "selectFirstElement", 0)


function GenericProfileActionsJPanel:getGenericProfileActionJPanel()
        return self.genericProfileActionJPanel
end
java_overload(GenericProfileActionsJPanel, "getGenericProfileActionJPanel", 0)


function GenericProfileActionsJPanel:setGenericProfileActionJPanel(genericProfileActionJPanel)
        self.genericProfileActionJPanel = genericProfileActionJPanel
end
java_overload(GenericProfileActionsJPanel, "setGenericProfileActionJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfileActionJPanel")) end)


function GenericProfileActionsJPanel:getGenericProfileActions()
        return self.genericProfileActions
end
java_overload(GenericProfileActionsJPanel, "getGenericProfileActions", 0)


function GenericProfileActionsJPanel:setGenericProfileActions(genericProfileActions)
        self.genericProfileActions = genericProfileActions
end
java_overload(GenericProfileActionsJPanel, "setGenericProfileActions", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfileActions")) end)


function GenericProfileActionsJPanel:newActionJButtonActionPerformed(evt)
        self.newProfileActionJDialog:setVisible(true)
end
java_overload(GenericProfileActionsJPanel, "newActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return GenericProfileActionsJPanel

