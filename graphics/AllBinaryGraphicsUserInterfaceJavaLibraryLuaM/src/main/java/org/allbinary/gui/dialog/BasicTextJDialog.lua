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
-- package org.allbinary.gui.dialog

local BasicTextJDialog = {}
package.loaded["org.allbinary.gui.dialog.BasicTextJDialog"] = BasicTextJDialog

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

local ARunnable = java_lazy("org.allbinary.thread.ARunnable")
-- local EventQueue = require("java.awt.EventQueue")
-- local Frame = require("java.awt.Frame")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JDialog = require("javax.swing.JDialog")
-- local JFrame = require("javax.swing.JFrame")
-- local JLabel = require("javax.swing.JLabel")
-- local WindowConstants = require("javax.swing.WindowConstants")
local CloseJDialogListenerInterface = java_lazy("org.allbinary.gui.dialog.CloseJDialogListenerInterface")

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

-- class table BasicTextJDialog is declared before the requires
BasicTextJDialog.__index = BasicTextJDialog
BasicTextJDialog.className = "BasicTextJDialog"
BasicTextJDialog.javaClassName = "org.allbinary.gui.dialog.BasicTextJDialog"
setmetatable(BasicTextJDialog, {__index = JDialog})

function BasicTextJDialog:_init_fields()
    if self.closeListenerInterface == nil then self.closeListenerInterface = nil end
    if self.jButton1 == nil then self.jButton1 = nil end
    if self.textJLabel == nil then self.textJLabel = nil end
end

function BasicTextJDialog._jinit(self, ...)
    local count = select("#", ...)
    if count == 3 then return BasicTextJDialog._new3(self, ...)
    elseif count == 1 then return BasicTextJDialog._new1(self, ...)
    end
    error("No constructor of BasicTextJDialog takes " .. count .. " arguments")
end

function BasicTextJDialog.new(...)
    local self = setmetatable({}, BasicTextJDialog)
    BasicTextJDialog._jinit(self, ...)
    return self
end


function BasicTextJDialog._new3(self, parent, modal, text)
    java_super_init(JDialog, self, parent, modal)
    BasicTextJDialog._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self:setText(text)
    return self
end


function BasicTextJDialog:setText(text)
        self.textJLabel:setText(text)
end
java_overload(BasicTextJDialog, "setText", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function BasicTextJDialog:addCloseListener(closeListenerInterface)
        self.closeListenerInterface = closeListenerInterface
end
java_overload(BasicTextJDialog, "addCloseListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CloseJDialogListenerInterface")) end)


function BasicTextJDialog._new1(self, text)
    java_super_init(JDialog, self)
    BasicTextJDialog._init_fields(self)
        self:initComponents()
        self.textJLabel:setText(text)
    return self
end


function BasicTextJDialog:initComponents()
        self.jButton1 = JButton.new()
        self.textJLabel = JLabel.new()
        self:setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE)
        self.jButton1:setText("OK")
        self.jButton1:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.jButton1ActionPerformed and self or java_outer_self):jButton1ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.textJLabel:setText("No Text Set")
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGap(80, 80, 80):addComponent(self.jButton1)):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.textJLabel, GroupLayout.DEFAULT_SIZE, 184, require("java.lang.Short").MAX_VALUE))):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGap(20, 20, 20):addComponent(self.textJLabel, GroupLayout.PREFERRED_SIZE, 20, GroupLayout.PREFERRED_SIZE):addGap(30, 30, 30):addComponent(self.jButton1)))
        self:pack()
end
java_overload(BasicTextJDialog, "initComponents", 0)


function BasicTextJDialog:jButton1ActionPerformed(evt)
        self:setVisible(false)
        if not rawequal(self.closeListenerInterface, nil) then
            self.closeListenerInterface:onClose()
        end
end
java_overload(BasicTextJDialog, "jButton1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function BasicTextJDialog.main(args)
        EventQueue.invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                BasicTextJDialog.new(JFrame.new(), true, "Test"):setVisible(true)
            end
            java_overload(o, "run", 0)
            return o
        end)())
end

return BasicTextJDialog

