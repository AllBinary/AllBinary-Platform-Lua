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
-- package org.allbinary.graphics.j2me.dialog

local RotateJDialog = {}
package.loaded["org.allbinary.graphics.j2me.dialog.RotateJDialog"] = RotateJDialog

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
local HashMap = java_lazy("java.util.HashMap")
local HashMapJDialogListenerInterface = java_lazy("org.allbinary.gui.dialog.HashMapJDialogListenerInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local EventQueue = require("java.awt.EventQueue")
-- local Frame = require("java.awt.Frame")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local WindowAdapter = require("java.awt.event.WindowAdapter")
-- local WindowEvent = require("java.awt.event.WindowEvent")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JDialog = require("javax.swing.JDialog")
-- local JFrame = require("javax.swing.JFrame")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
-- local WindowConstants = require("javax.swing.WindowConstants")

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

-- class table RotateJDialog is declared before the requires
RotateJDialog.__index = RotateJDialog
RotateJDialog.className = "RotateJDialog"
RotateJDialog.javaClassName = "org.allbinary.graphics.j2me.dialog.RotateJDialog"
setmetatable(RotateJDialog, {__index = JDialog})

function RotateJDialog:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = StdUtil.getInstance():createHashMap()
    if self.angleIncrementJTextField == nil then self.angleIncrementJTextField = nil end
    if self.jButton1 == nil then self.jButton1 = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.totalRotationJTextField == nil then self.totalRotationJTextField = nil end
end


function RotateJDialog._jinit(self, parent, modal)
    java_super_init(JDialog, self, parent, modal)
    RotateJDialog._init_fields(self)
        -- super(...) made self above
        self:initComponents()
    return self
end

function RotateJDialog.new(...)
    local self = setmetatable({}, RotateJDialog)
    RotateJDialog._jinit(self, ...)
    return self
end


function RotateJDialog:initComponents()
        self.angleIncrementJTextField = JTextField.new()
        self.jLabel1 = JLabel.new()
        self.totalRotationJTextField = JTextField.new()
        self.jLabel2 = JLabel.new()
        self.jPanel1 = JPanel.new()
        self.jButton1 = JButton.new()
        self:setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE)
        self.angleIncrementJTextField:setText("36")
        self.jLabel1:setText("Angle Increment:")
        self.totalRotationJTextField:setText("360")
        self.jLabel2:setText("Total Angular Rotation:")
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
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addGap(62, 62, 62):addComponent(self.jButton1):addContainerGap(62, require("java.lang.Short").MAX_VALUE)))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jButton1))
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(GroupLayout.Alignment.TRAILING):addComponent(self.jLabel1):addComponent(self.jLabel2)):addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.totalRotationJTextField, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 31, require("java.lang.Short").MAX_VALUE):addComponent(self.angleIncrementJTextField, GroupLayout.Alignment.TRAILING, GroupLayout.PREFERRED_SIZE, 31, GroupLayout.PREFERRED_SIZE)):addContainerGap()):addComponent(self.jPanel1, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.angleIncrementJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel1)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.totalRotationJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 16, require("java.lang.Short").MAX_VALUE):addComponent(self.jPanel1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addContainerGap()))
        self:pack()
end
java_overload(RotateJDialog, "initComponents", 0)


function RotateJDialog:jButton1ActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.hashMap:put(tostring(0), tostring(self.angleIncrementJTextField:getText()))
            self.hashMap:put(tostring(1), tostring(self.totalRotationJTextField:getText()))
            ;(self:getParent()):onHashMap(self.hashMap)
            self:setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.EXCEPTION, self, "jButton1ActionPerformed")
        end
end
java_overload(RotateJDialog, "jButton1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function RotateJDialog.main(args)
        EventQueue.invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local dialog = RotateJDialog.new(JFrame.new(), true)
                dialog:addWindowListener((function()
                    local o = WindowAdapter.new and WindowAdapter.new() or setmetatable({}, {__index = WindowAdapter})
                    

                    function o:windowClosing(e)
                        os.exit(0)
                    end
                    java_overload(o, "windowClosing", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)
                    return o
                end)())
                dialog:setVisible(true)
            end
            java_overload(o, "run", 0)
            return o
        end)())
end

return RotateJDialog

