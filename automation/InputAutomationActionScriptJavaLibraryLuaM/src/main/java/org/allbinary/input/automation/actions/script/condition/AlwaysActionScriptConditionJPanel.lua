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

local AlwaysActionScriptConditionJPanel = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptConditionJPanel"] = AlwaysActionScriptConditionJPanel

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JComboBox = require("javax.swing.JComboBox")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local AlwaysActionScriptConditionInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptConditionInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table AlwaysActionScriptConditionJPanel is declared before the requires
AlwaysActionScriptConditionJPanel.__index = AlwaysActionScriptConditionJPanel
AlwaysActionScriptConditionJPanel.className = "AlwaysActionScriptConditionJPanel"
AlwaysActionScriptConditionJPanel.javaClassName = "org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptConditionJPanel"
setmetatable(AlwaysActionScriptConditionJPanel, {__index = JPanel})

function AlwaysActionScriptConditionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.alwaysActionScriptConditionInterface == nil then self.alwaysActionScriptConditionInterface = nil end
    if self.alwaysActionJButton == nil then self.alwaysActionJButton = nil end
    if self.alwaysActionJDialog == nil then self.alwaysActionJDialog = nil end
    if self.alwaysJComboBox == nil then self.alwaysJComboBox = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
end


function AlwaysActionScriptConditionJPanel._jinit(self, alwaysActionScriptConditionInterface)
    java_super_init(JPanel, self)
    AlwaysActionScriptConditionJPanel._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.alwaysActionScriptConditionInterface = alwaysActionScriptConditionInterface
        self:set()
    return self
end

function AlwaysActionScriptConditionJPanel.new(...)
    local self = setmetatable({}, AlwaysActionScriptConditionJPanel)
    AlwaysActionScriptConditionJPanel._jinit(self, ...)
    return self
end


function AlwaysActionScriptConditionJPanel:set()
        if self.alwaysActionScriptConditionInterface:isIsOn() then
            self.alwaysJComboBox:setSelectedIndex(0)
        else
            self.alwaysJComboBox:setSelectedIndex(1)
        end
        self.alwaysActionScriptConditionInterface:log()
end
java_overload(AlwaysActionScriptConditionJPanel, "set", 0)


function AlwaysActionScriptConditionJPanel:update()
        if rawequal(self.alwaysJComboBox:getSelectedIndex(), 0) then
            self.alwaysActionScriptConditionInterface:setIsOn(true)
        else
            self.alwaysActionScriptConditionInterface:setIsOn(false)
        end
        self.alwaysActionScriptConditionInterface:log()
end
java_overload(AlwaysActionScriptConditionJPanel, "update", 0)


function AlwaysActionScriptConditionJPanel:getAlwaysActionJDialog()
        return self.alwaysActionJDialog
end
java_overload(AlwaysActionScriptConditionJPanel, "getAlwaysActionJDialog", 0)


function AlwaysActionScriptConditionJPanel:setAlwaysActionJDialog(alwaysActionJDialog)
        self.alwaysActionJDialog = alwaysActionJDialog
end
java_overload(AlwaysActionScriptConditionJPanel, "setAlwaysActionJDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JDialog")) end)


function AlwaysActionScriptConditionJPanel:initComponents()
        self.alwaysActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.okJButton = JButton.new()
        self.jLabel2 = JLabel.new()
        self.alwaysJComboBox = JComboBox.new()
        self.alwaysActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.alwaysActionJDialog:setMinimumSize(Dimension.new(250, 150))
        self.titleJLabel:setText("Always Condition Options")
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
        self.jLabel2:setText("On:")
        self.alwaysJComboBox:setModel(DefaultComboBoxModel.new({"true", "false"}))
        local alwaysActionJDialogLayout = GroupLayout.new(self.alwaysActionJDialog:getContentPane())
        self.alwaysActionJDialog:getContentPane():setLayout(alwaysActionJDialogLayout)
        alwaysActionJDialogLayout:setHorizontalGroup(alwaysActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addGroup(alwaysActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addGap(47, 47, 47):addGroup(alwaysActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING, false):addGroup(GroupLayout.Alignment.TRAILING, alwaysActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel2):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.alwaysJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addComponent(self.titleJLabel))):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addGap(79, 79, 79):addComponent(self.okJButton))):addContainerGap(45, require("java.lang.Short").MAX_VALUE)))
        alwaysActionJDialogLayout:setVerticalGroup(alwaysActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(alwaysActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.titleJLabel):addGap(20, 20, 20):addGroup(alwaysActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.alwaysJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2)):addGap(15, 15, 15):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.alwaysActionJButton:setText("Edit")
        self.alwaysActionJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.alwaysActionJButtonActionPerformed and self or java_outer_self):alwaysActionJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Always:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 33, require("java.lang.Short").MAX_VALUE):addComponent(self.alwaysActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.alwaysActionJButton)))
end
java_overload(AlwaysActionScriptConditionJPanel, "initComponents", 0)


function AlwaysActionScriptConditionJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getAlwaysActionJDialog():setVisible(false)
end
java_overload(AlwaysActionScriptConditionJPanel, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function AlwaysActionScriptConditionJPanel:alwaysActionJButtonActionPerformed(evt)
        self:getAlwaysActionJDialog():setVisible(true)
end
java_overload(AlwaysActionScriptConditionJPanel, "alwaysActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return AlwaysActionScriptConditionJPanel

