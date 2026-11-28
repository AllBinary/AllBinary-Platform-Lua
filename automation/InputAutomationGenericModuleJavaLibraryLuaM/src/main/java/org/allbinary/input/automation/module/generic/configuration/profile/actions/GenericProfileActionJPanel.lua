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

local GenericProfileActionJPanel = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel"] = GenericProfileActionJPanel

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

local JTreeInterfaceFactory = java_lazy("org.allbinary.input.automation.actions.script.JTreeInterfaceFactory")
local AlwaysActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptCondition")
local ColorAtActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition")
local ProfileActionScriptConditionInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local TimeIntervalActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition")
local GenericProfileActionScriptJPanel = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScriptJPanel")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
-- local Dimension = require("java.awt.Dimension")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local GenericProfileAction = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")

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

-- class table GenericProfileActionJPanel is declared before the requires
GenericProfileActionJPanel.__index = GenericProfileActionJPanel
GenericProfileActionJPanel.className = "GenericProfileActionJPanel"
GenericProfileActionJPanel.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel"
setmetatable(GenericProfileActionJPanel, {__index = JPanel})

function GenericProfileActionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.genericProfileAction == nil then self.genericProfileAction = nil end
    if self.genericProfileActionScriptJPanel == nil then self.genericProfileActionScriptJPanel = nil end
    if self.blankProfileActionScriptJPanel == nil then self.blankProfileActionScriptJPanel = nil end
    if self.genericProfileActionScriptJScrollPane == nil then self.genericProfileActionScriptJScrollPane = nil end
    if self.ifJLabel == nil then self.ifJLabel = nil end
    if self.newAlwaysJButton == nil then self.newAlwaysJButton = nil end
    if self.newColorAtJButton == nil then self.newColorAtJButton = nil end
    if self.newTimeIntervalJButton == nil then self.newTimeIntervalJButton = nil end
end


function GenericProfileActionJPanel._jinit(self)
    java_super_init(JPanel, self)
    GenericProfileActionJPanel._init_fields(self)
        self:initComponents()
    return self
end

function GenericProfileActionJPanel.new(...)
    local self = setmetatable({}, GenericProfileActionJPanel)
    GenericProfileActionJPanel._jinit(self, ...)
    return self
end


function GenericProfileActionJPanel:updateProfileActionUI()
        self.blankProfileActionScriptJPanel:removeAll()
        local genericProfileActionScriptJPanel = GenericProfileActionScriptJPanel.new()
        JTreeInterfaceFactory.getInstance():set(genericProfileActionScriptJPanel)
        self:setGenericProfileActionScriptJPanel(genericProfileActionScriptJPanel)
        self:getGenericProfileActionScriptJPanel():setGenericProfileActionScript(self:getGenericProfileAction():getGenericProfileActionScript())
        self:getGenericProfileActionScriptJPanel():updateJTree()
        local layout = self.blankProfileActionScriptJPanel:getLayout()
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 395, require("java.lang.Short").MAX_VALUE):addComponent(self:getGenericProfileActionScriptJPanel(), GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 256, require("java.lang.Short").MAX_VALUE):addComponent(self:getGenericProfileActionScriptJPanel(), GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
        self.logUtil:putF("Updated UI", self, "updateUI")
end
java_overload(GenericProfileActionJPanel, "updateProfileActionUI", 0)


function GenericProfileActionJPanel:getGenericProfileAction()
        return self.genericProfileAction
end
java_overload(GenericProfileActionJPanel, "getGenericProfileAction", 0)


function GenericProfileActionJPanel:setGenericProfileAction(genericProfileAction)
        self.genericProfileAction = genericProfileAction
end
java_overload(GenericProfileActionJPanel, "setGenericProfileAction", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfileAction")) end)


function GenericProfileActionJPanel:getGenericProfileActionScriptJPanel()
        return self.genericProfileActionScriptJPanel
end
java_overload(GenericProfileActionJPanel, "getGenericProfileActionScriptJPanel", 0)


function GenericProfileActionJPanel:setGenericProfileActionScriptJPanel(genericProfileActionScriptJPanel)
        self.genericProfileActionScriptJPanel = genericProfileActionScriptJPanel
end
java_overload(GenericProfileActionJPanel, "setGenericProfileActionScriptJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfileActionScriptJPanel")) end)


function GenericProfileActionJPanel:initComponents()
        self.genericProfileActionScriptJScrollPane = JScrollPane.new()
        self.blankProfileActionScriptJPanel = JPanel.new()
        self.ifJLabel = JLabel.new()
        self.newColorAtJButton = JButton.new()
        self.newTimeIntervalJButton = JButton.new()
        self.newAlwaysJButton = JButton.new()
        self:setMinimumSize(Dimension.new(440, 275))
        self:setPreferredSize(Dimension.new(440, 275))
        self.genericProfileActionScriptJScrollPane:setPreferredSize(Dimension.new(474, 270))
        self.blankProfileActionScriptJPanel:setMinimumSize(Dimension.new(400, 200))
        local blankProfileActionScriptJPanelLayout = GroupLayout.new(self.blankProfileActionScriptJPanel)
        self.blankProfileActionScriptJPanel:setLayout(blankProfileActionScriptJPanelLayout)
        blankProfileActionScriptJPanelLayout:setHorizontalGroup(blankProfileActionScriptJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 9996, require("java.lang.Short").MAX_VALUE))
        blankProfileActionScriptJPanelLayout:setVerticalGroup(blankProfileActionScriptJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 9967, require("java.lang.Short").MAX_VALUE))
        self.genericProfileActionScriptJScrollPane:setViewportView(self.blankProfileActionScriptJPanel)
        self.ifJLabel:setText("Conditions:")
        self.newColorAtJButton:setText("Color Range At")
        self.newColorAtJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.newColorAtJButtonActionPerformed and self or java_outer_self):newColorAtJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.newTimeIntervalJButton:setText("Time Interval")
        self.newTimeIntervalJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.newTimeIntervalJButtonActionPerformed and self or java_outer_self):newTimeIntervalJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.newAlwaysJButton:setText("Always On/Off")
        self.newAlwaysJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.newAlwaysJButtonActionPerformed and self or java_outer_self):newAlwaysJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.ifJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newColorAtJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newTimeIntervalJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newAlwaysJButton):addContainerGap(61, require("java.lang.Short").MAX_VALUE)):addComponent(self.genericProfileActionScriptJScrollPane, GroupLayout.DEFAULT_SIZE, 440, require("java.lang.Short").MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.ifJLabel, GroupLayout.PREFERRED_SIZE, 14, GroupLayout.PREFERRED_SIZE):addComponent(self.newColorAtJButton):addComponent(self.newTimeIntervalJButton):addComponent(self.newAlwaysJButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.genericProfileActionScriptJScrollPane, GroupLayout.DEFAULT_SIZE, 246, require("java.lang.Short").MAX_VALUE)))
end
java_overload(GenericProfileActionJPanel, "initComponents", 0)


function GenericProfileActionJPanel:newTimeIntervalJButtonActionPerformed(evt)
        self.logUtil:putF("New Time Interval Action Condition", self, "newTimeIntervalJButtonActionPerformed")
        self:getGenericProfileAction():getGenericProfileActionScript():addCondition(TimeIntervalActionScriptCondition.new())
        self:updateProfileActionUI()
end
java_overload(GenericProfileActionJPanel, "newTimeIntervalJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericProfileActionJPanel:newAlwaysJButtonActionPerformed(evt)
        self.logUtil:putF("New EveryTime Action Condition", self, "newEveryTimeJButtonActionPerformed")
        self:getGenericProfileAction():getGenericProfileActionScript():addCondition(AlwaysActionScriptCondition.new())
        self:updateProfileActionUI()
end
java_overload(GenericProfileActionJPanel, "newAlwaysJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function GenericProfileActionJPanel:newColorAtJButtonActionPerformed(evt)
        self.logUtil:putF("New Color At Action Condition", self, "newColorAtJButtonActionPerformed")
        self:getGenericProfileAction():getGenericProfileActionScript():addCondition(ColorAtActionScriptCondition.new())
        self:updateProfileActionUI()
end
java_overload(GenericProfileActionJPanel, "newColorAtJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return GenericProfileActionJPanel

