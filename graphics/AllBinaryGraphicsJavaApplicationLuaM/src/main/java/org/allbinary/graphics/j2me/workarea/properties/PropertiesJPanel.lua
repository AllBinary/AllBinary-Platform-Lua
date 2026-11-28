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
-- package org.allbinary.graphics.j2me.workarea.properties

local PropertiesJPanel = {}
package.loaded["org.allbinary.graphics.j2me.workarea.properties.PropertiesJPanel"] = PropertiesJPanel

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

-- local swing = require("javax.swing")
-- local Font = require("java.awt.Font")
-- local GridLayout = require("java.awt.GridLayout")
-- local JButton = require("javax.swing.JButton")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")

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

-- class table PropertiesJPanel is declared before the requires
PropertiesJPanel.__index = PropertiesJPanel
PropertiesJPanel.className = "PropertiesJPanel"
PropertiesJPanel.javaClassName = "org.allbinary.graphics.j2me.workarea.properties.PropertiesJPanel"
setmetatable(PropertiesJPanel, {__index = JPanel})

function PropertiesJPanel:_init_fields()
    if self.rotateJButton == nil then self.rotateJButton = nil end
    if self.copyVerticalJButton == nil then self.copyVerticalJButton = nil end
    if self.leftJButton == nil then self.leftJButton = nil end
    if self.rotateJPanel == nil then self.rotateJPanel = nil end
    if self.angleJTextField == nil then self.angleJTextField = nil end
    if self.workAreaPropertiesJPanel == nil then self.workAreaPropertiesJPanel = nil end
    if self.modifierJPanel == nil then self.modifierJPanel = nil end
    if self.upJButton == nil then self.upJButton = nil end
    if self.jPanel8 == nil then self.jPanel8 = nil end
    if self.downJButton == nil then self.downJButton = nil end
    if self.jPanel7 == nil then self.jPanel7 = nil end
    if self.rightJButton == nil then self.rightJButton = nil end
    if self.copyHorizontalJButton == nil then self.copyHorizontalJButton = nil end
end


function PropertiesJPanel._jinit(self)
    java_super_init(JPanel, self)
    PropertiesJPanel._init_fields(self)
        self:initComponents()
    return self
end

function PropertiesJPanel.new(...)
    local self = setmetatable({}, PropertiesJPanel)
    PropertiesJPanel._jinit(self, ...)
    return self
end


function PropertiesJPanel:set(panel)
        self.workAreaPropertiesJPanel:add(panel)
        self:repaint()
end
java_overload(PropertiesJPanel, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function PropertiesJPanel:initComponents()
        self.workAreaPropertiesJPanel = JPanel.new()
        self.modifierJPanel = JPanel.new()
        self.copyVerticalJButton = JButton.new()
        self.copyHorizontalJButton = JButton.new()
        self.rotateJPanel = JPanel.new()
        self.rotateJButton = JButton.new()
        self.angleJTextField = JTextField.new()
        self.jPanel7 = JPanel.new()
        self.upJButton = JButton.new()
        self.downJButton = JButton.new()
        self.jPanel8 = JPanel.new()
        self.leftJButton = JButton.new()
        self.rightJButton = JButton.new()
        self:setLayout(GridLayout.new(2, 1))
        self.workAreaPropertiesJPanel:setLayout(GridLayout.new())
        self:add(self.workAreaPropertiesJPanel)
        self.modifierJPanel:setLayout(GridLayout.new(6, 0))
        self.copyVerticalJButton:setFont(Font.new("Dialog", 0, 10))
        self.copyVerticalJButton:setText("Copy Vertical")
        self.modifierJPanel:add(self.copyVerticalJButton)
        self.copyHorizontalJButton:setFont(Font.new("Dialog", 0, 10))
        self.copyHorizontalJButton:setText("Copy Horizontal")
        self.modifierJPanel:add(self.copyHorizontalJButton)
        self.rotateJPanel:setLayout(GridLayout.new(1, 2))
        self.rotateJButton:setFont(Font.new("Dialog", 0, 10))
        self.rotateJButton:setText("Rotate")
        self.rotateJPanel:add(self.rotateJButton)
        self.angleJTextField:setText("Angle")
        self.rotateJPanel:add(self.angleJTextField)
        self.modifierJPanel:add(self.rotateJPanel)
        self.jPanel7:setLayout(GridLayout.new(1, 2))
        self.upJButton:setFont(Font.new("Dialog", 0, 10))
        self.upJButton:setText("Up")
        self.jPanel7:add(self.upJButton)
        self.downJButton:setFont(Font.new("Dialog", 0, 10))
        self.downJButton:setText("Down")
        self.jPanel7:add(self.downJButton)
        self.modifierJPanel:add(self.jPanel7)
        self.jPanel8:setLayout(GridLayout.new(1, 2))
        self.leftJButton:setFont(Font.new("Dialog", 0, 10))
        self.leftJButton:setText("Left")
        self.jPanel8:add(self.leftJButton)
        self.rightJButton:setFont(Font.new("Dialog", 0, 10))
        self.rightJButton:setText("Right")
        self.jPanel8:add(self.rightJButton)
        self.modifierJPanel:add(self.jPanel8)
        self:add(self.modifierJPanel)
end
java_overload(PropertiesJPanel, "initComponents", 0)

return PropertiesJPanel

