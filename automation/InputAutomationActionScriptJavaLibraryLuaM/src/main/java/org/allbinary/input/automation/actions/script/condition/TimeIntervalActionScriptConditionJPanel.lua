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

local TimeIntervalActionScriptConditionJPanel = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionJPanel"] = TimeIntervalActionScriptConditionJPanel

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
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local TimeIntervalActionScriptConditionInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionInterface")

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

-- class table TimeIntervalActionScriptConditionJPanel is declared before the requires
TimeIntervalActionScriptConditionJPanel.__index = TimeIntervalActionScriptConditionJPanel
TimeIntervalActionScriptConditionJPanel.className = "TimeIntervalActionScriptConditionJPanel"
TimeIntervalActionScriptConditionJPanel.javaClassName = "org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionJPanel"
setmetatable(TimeIntervalActionScriptConditionJPanel, {__index = JPanel})

function TimeIntervalActionScriptConditionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.timeIntervalActionScriptConditionInterface == nil then self.timeIntervalActionScriptConditionInterface = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.timeIntervalActionJButton == nil then self.timeIntervalActionJButton = nil end
    if self.timeIntervalActionJDialog == nil then self.timeIntervalActionJDialog = nil end
    if self.timeIntervalJTextField == nil then self.timeIntervalJTextField = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
end


function TimeIntervalActionScriptConditionJPanel._jinit(self, timeIntervalActionScriptConditionInterface)
    java_super_init(JPanel, self)
    TimeIntervalActionScriptConditionJPanel._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.timeIntervalActionScriptConditionInterface = timeIntervalActionScriptConditionInterface
        self:set()
    return self
end

function TimeIntervalActionScriptConditionJPanel.new(...)
    local self = setmetatable({}, TimeIntervalActionScriptConditionJPanel)
    TimeIntervalActionScriptConditionJPanel._jinit(self, ...)
    return self
end


function TimeIntervalActionScriptConditionJPanel:set()
        self:getTimeIntervalJTextField():setText(tostring(self.timeIntervalActionScriptConditionInterface:getTimeDelayHelper().delay))
        self.timeIntervalActionScriptConditionInterface:log()
end
java_overload(TimeIntervalActionScriptConditionJPanel, "set", 0)


function TimeIntervalActionScriptConditionJPanel:update()
        self.timeIntervalActionScriptConditionInterface:getTimeDelayHelper().delay = tostring(self:getTimeIntervalJTextField():getText())
        self.timeIntervalActionScriptConditionInterface:log()
end
java_overload(TimeIntervalActionScriptConditionJPanel, "update", 0)


function TimeIntervalActionScriptConditionJPanel:getTimeIntervalJTextField()
        return self.timeIntervalJTextField
end
java_overload(TimeIntervalActionScriptConditionJPanel, "getTimeIntervalJTextField", 0)


function TimeIntervalActionScriptConditionJPanel:setTimeIntervalJTextField(timeIntervalJTextField)
        self.timeIntervalJTextField = timeIntervalJTextField
end
java_overload(TimeIntervalActionScriptConditionJPanel, "setTimeIntervalJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function TimeIntervalActionScriptConditionJPanel:getTimeIntervalActionJDialog()
        return self.timeIntervalActionJDialog
end
java_overload(TimeIntervalActionScriptConditionJPanel, "getTimeIntervalActionJDialog", 0)


function TimeIntervalActionScriptConditionJPanel:setTimeIntervalActionJDialog(timeIntervalActionJDialog)
        self.timeIntervalActionJDialog = timeIntervalActionJDialog
end
java_overload(TimeIntervalActionScriptConditionJPanel, "setTimeIntervalActionJDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JDialog")) end)


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
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel2:setText("Time (ms):")
        local timeIntervalActionJDialogLayout = GroupLayout.new(self.timeIntervalActionJDialog:getContentPane())
        self.timeIntervalActionJDialog:getContentPane():setLayout(timeIntervalActionJDialogLayout)
        timeIntervalActionJDialogLayout:setHorizontalGroup(timeIntervalActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(timeIntervalActionJDialogLayout:createSequentialGroup():addGroup(timeIntervalActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.TRAILING):addGroup(GroupLayout.Alignment.LEADING, timeIntervalActionJDialogLayout:createSequentialGroup():addGap(82, 82, 82):addComponent(self.okJButton)):addGroup(GroupLayout.Alignment.LEADING, timeIntervalActionJDialogLayout:createSequentialGroup():addGap(32, 32, 32):addGroup(timeIntervalActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(timeIntervalActionJDialogLayout:createSequentialGroup():addComponent(self.jLabel2):addGap(16, 16, 16):addComponent(self.timeIntervalJTextField, GroupLayout.DEFAULT_SIZE, 85, require("java.lang.Short").MAX_VALUE)):addComponent(self.titleJLabel)))):addContainerGap(36, require("java.lang.Short").MAX_VALUE)))
        timeIntervalActionJDialogLayout:setVerticalGroup(timeIntervalActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(timeIntervalActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.titleJLabel):addGap(20, 20, 20):addGroup(timeIntervalActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel2):addComponent(self.timeIntervalJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addGap(15, 15, 15):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.timeIntervalActionJButton:setText("Edit")
        self.timeIntervalActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:timeIntervalActionJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Time Interval:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.timeIntervalActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.timeIntervalActionJButton)))
end
java_overload(TimeIntervalActionScriptConditionJPanel, "initComponents", 0)


function TimeIntervalActionScriptConditionJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getTimeIntervalActionJDialog():setVisible(false)
end
java_overload(TimeIntervalActionScriptConditionJPanel, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function TimeIntervalActionScriptConditionJPanel:timeIntervalActionJButtonActionPerformed(evt)
        self:getTimeIntervalActionJDialog():setVisible(true)
end
java_overload(TimeIntervalActionScriptConditionJPanel, "timeIntervalActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return TimeIntervalActionScriptConditionJPanel

