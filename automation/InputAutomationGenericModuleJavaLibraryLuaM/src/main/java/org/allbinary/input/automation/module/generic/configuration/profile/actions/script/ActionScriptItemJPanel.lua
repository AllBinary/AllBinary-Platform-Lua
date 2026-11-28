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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions.script

local ActionScriptItemJPanel = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.script.ActionScriptItemJPanel"] = ActionScriptItemJPanel

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

-- local Dimension = require("java.awt.Dimension")
-- local GridLayout = require("java.awt.GridLayout")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JPanel = require("javax.swing.JPanel")
-- local LayoutStyle = require("javax.swing.LayoutStyle")

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

-- class table ActionScriptItemJPanel is declared before the requires
ActionScriptItemJPanel.__index = ActionScriptItemJPanel
ActionScriptItemJPanel.className = "ActionScriptItemJPanel"
ActionScriptItemJPanel.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.script.ActionScriptItemJPanel"
setmetatable(ActionScriptItemJPanel, {__index = JPanel})

function ActionScriptItemJPanel:_init_fields()
    if self.childActionScriptConditionJPanel == nil then self.childActionScriptConditionJPanel = nil end
    if self.newActionScriptConditionJPanel == nil then self.newActionScriptConditionJPanel = nil end
    if self.newActionScriptInputJPanel == nil then self.newActionScriptInputJPanel = nil end
    if self.removeJPanel == nil then self.removeJPanel = nil end
    if self.scriptItemJPanel == nil then self.scriptItemJPanel = nil end
end


function ActionScriptItemJPanel._jinit(self)
    java_super_init(JPanel, self)
    ActionScriptItemJPanel._init_fields(self)
        self:initComponents()
    return self
end

function ActionScriptItemJPanel.new(...)
    local self = setmetatable({}, ActionScriptItemJPanel)
    ActionScriptItemJPanel._jinit(self, ...)
    return self
end


function ActionScriptItemJPanel:getNewActionScriptInputJPanel()
        return self.newActionScriptInputJPanel
end
java_overload(ActionScriptItemJPanel, "getNewActionScriptInputJPanel", 0)


function ActionScriptItemJPanel:setNewActionScriptInputJPanel(newActionScriptInputJPanel)
        self.newActionScriptInputJPanel = newActionScriptInputJPanel
end
java_overload(ActionScriptItemJPanel, "setNewActionScriptInputJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function ActionScriptItemJPanel:getRemoveJPanel()
        return self.removeJPanel
end
java_overload(ActionScriptItemJPanel, "getRemoveJPanel", 0)


function ActionScriptItemJPanel:setRemoveJPanel(removeJPanel)
        self.removeJPanel = removeJPanel
end
java_overload(ActionScriptItemJPanel, "setRemoveJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function ActionScriptItemJPanel:getScriptItemJPanel()
        return self.scriptItemJPanel
end
java_overload(ActionScriptItemJPanel, "getScriptItemJPanel", 0)


function ActionScriptItemJPanel:setScriptItemJPanel(scriptItemJPanel)
        self.scriptItemJPanel = scriptItemJPanel
end
java_overload(ActionScriptItemJPanel, "setScriptItemJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function ActionScriptItemJPanel:getNewActionScriptConditionJPanel()
        return self.newActionScriptConditionJPanel
end
java_overload(ActionScriptItemJPanel, "getNewActionScriptConditionJPanel", 0)


function ActionScriptItemJPanel:setNewActionScriptConditionJPanel(newActionScriptConditionJPanel)
        self.newActionScriptConditionJPanel = newActionScriptConditionJPanel
end
java_overload(ActionScriptItemJPanel, "setNewActionScriptConditionJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function ActionScriptItemJPanel:getChildActionScriptConditionJPanel()
        return self.childActionScriptConditionJPanel
end
java_overload(ActionScriptItemJPanel, "getChildActionScriptConditionJPanel", 0)


function ActionScriptItemJPanel:setChildActionScriptConditionJPanel(childActionScriptConditionJPanel)
        self.childActionScriptConditionJPanel = childActionScriptConditionJPanel
end
java_overload(ActionScriptItemJPanel, "setChildActionScriptConditionJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function ActionScriptItemJPanel:initComponents()
        self.newActionScriptInputJPanel = JPanel.new()
        self.childActionScriptConditionJPanel = JPanel.new()
        self.newActionScriptConditionJPanel = JPanel.new()
        self.scriptItemJPanel = JPanel.new()
        self.removeJPanel = JPanel.new()
        self.newActionScriptInputJPanel:setLayout(GridLayout.new(1, 0))
        local childActionScriptConditionJPanelLayout = GroupLayout.new(self.childActionScriptConditionJPanel)
        self.childActionScriptConditionJPanel:setLayout(childActionScriptConditionJPanelLayout)
        childActionScriptConditionJPanelLayout:setHorizontalGroup(childActionScriptConditionJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 229, require("java.lang.Short").MAX_VALUE))
        childActionScriptConditionJPanelLayout:setVerticalGroup(childActionScriptConditionJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 8, require("java.lang.Short").MAX_VALUE))
        self.newActionScriptConditionJPanel:setLayout(GridLayout.new(1, 0))
        self.scriptItemJPanel:setLayout(GridLayout.new(1, 1))
        self.removeJPanel:setLayout(GridLayout.new(1, 1))
        self.removeJPanel:setMinimumSize(Dimension.new(30, 20))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.scriptItemJPanel, GroupLayout.PREFERRED_SIZE, 167, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.removeJPanel, GroupLayout.DEFAULT_SIZE, 56, require("java.lang.Short").MAX_VALUE)):addComponent(self.newActionScriptInputJPanel, GroupLayout.DEFAULT_SIZE, 229, require("java.lang.Short").MAX_VALUE):addComponent(self.newActionScriptConditionJPanel, GroupLayout.DEFAULT_SIZE, 229, require("java.lang.Short").MAX_VALUE):addComponent(self.childActionScriptConditionJPanel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.scriptItemJPanel, GroupLayout.DEFAULT_SIZE, 31, require("java.lang.Short").MAX_VALUE):addComponent(self.removeJPanel, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 31, require("java.lang.Short").MAX_VALUE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.childActionScriptConditionJPanel, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newActionScriptConditionJPanel, GroupLayout.PREFERRED_SIZE, 28, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.newActionScriptInputJPanel, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)))
end
java_overload(ActionScriptItemJPanel, "initComponents", 0)

return ActionScriptItemJPanel

