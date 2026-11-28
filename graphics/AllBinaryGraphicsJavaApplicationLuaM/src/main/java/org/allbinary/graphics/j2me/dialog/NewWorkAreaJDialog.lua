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

local NewWorkAreaJDialog = {}
package.loaded["org.allbinary.graphics.j2me.dialog.NewWorkAreaJDialog"] = NewWorkAreaJDialog

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
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local JTextField = require("javax.swing.JTextField")
-- local JButton = require("javax.swing.JButton")
-- local JLabel = require("javax.swing.JLabel")
local GraphicsException = java_lazy("org.allbinary.graphics.j2me.GraphicsException")
local MyFrame = java_lazy("org.allbinary.graphics.j2me.MyFrame")
local WorkAreaJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local WorkAreaJPanelInterface = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface")
-- local Frame = require("java.awt.Frame")
-- local WindowAdapter = require("java.awt.event.WindowAdapter")
-- local WindowEvent = require("java.awt.event.WindowEvent")
-- local JDialog = require("javax.swing.JDialog")

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

-- class table NewWorkAreaJDialog is declared before the requires
NewWorkAreaJDialog.__index = NewWorkAreaJDialog
NewWorkAreaJDialog.className = "NewWorkAreaJDialog"
NewWorkAreaJDialog.javaClassName = "org.allbinary.graphics.j2me.dialog.NewWorkAreaJDialog"
setmetatable(NewWorkAreaJDialog, {__index = JDialog})

function NewWorkAreaJDialog:_init_fields()
    if self.parent == nil then self.parent = nil end
    if self.dimension == nil then self.dimension = nil end
    if self.xSizeJTextField == nil then self.xSizeJTextField = nil end
    if self.ySizeJTextField == nil then self.ySizeJTextField = nil end
    if self.nameJTextField == nil then self.nameJTextField = nil end
end


function NewWorkAreaJDialog._jinit(self, parent, modal, dimension, newName)
    java_super_init(JDialog, self, parent, modal)
    NewWorkAreaJDialog._init_fields(self)
        -- super(...) made self above
        local try_ok, try_error, try_value = pcall(function()
            self:initComponents()
            self.parent = parent
            self.xSizeJTextField = JTextField.new("12")
            self.ySizeJTextField = JTextField.new("12")
            self.nameJTextField = JTextField.new(newName)
            self.dimension = dimension
            local submitButton = JButton.new("Ok")
            submitButton:addActionListener((function()
                local java_outer_self = self
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
                

                function o:actionPerformed(evt)
                    local try_ok, try_error, try_value = pcall(function()
                        ;(self.disposeNewDialog and self or java_outer_self):disposeNewDialog()
            
                    end)
                    if not try_ok then
                        local e = try_error
                        if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    end
                end
                java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
                return o
            end)())
            self:setSize(150, 100)
            self:getContentPane():setLayout(GridLayout.new(5, 2))
            self:getContentPane():add(JLabel.new("Please enter"))
            self:getContentPane():add(JLabel.new(" the size."))
            self:getContentPane():add(JLabel.new("Name:"))
            self:getContentPane():add(self.nameJTextField)
            self:getContentPane():add(JLabel.new("X: "))
            self:getContentPane():add(self.xSizeJTextField)
            self:getContentPane():add(JLabel.new("Y: "))
            self:getContentPane():add(self.ySizeJTextField)
            self:getContentPane():add(submitButton)
            self:show()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
    return self
end

function NewWorkAreaJDialog.new(...)
    local self = setmetatable({}, NewWorkAreaJDialog)
    NewWorkAreaJDialog._jinit(self, ...)
    return self
end


-- throws Exception
function NewWorkAreaJDialog:disposeNewDialog()
        local try_ok, try_error, try_value = pcall(function()
            local canvasWidth = self.xSizeJTextField:getText()
            local canvasHeight = self.ySizeJTextField:getText()
            local newName = self.nameJTextField:getText()
            if rawequal(newName, nil) then
                error(GraphicsException.new("No Name", self, "disposeNewDialog"), 0)
            end
            local workAreaJPanel = WorkAreaJPanel.new(newName, self.dimension, require("allbinary_java").number_value(canvasWidth, "intValue"), require("allbinary_java").number_value(canvasHeight, "intValue"))
            workAreaJPanel:setLayout(GridLayout.new(1, 1))
            self.parent:add(workAreaJPanel)
            self:dispose()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
end
java_overload(NewWorkAreaJDialog, "disposeNewDialog", 0)


function NewWorkAreaJDialog:initComponents()
        self:addWindowListener((function()
            local java_outer_self = self
        local o = WindowAdapter.new and WindowAdapter.new() or setmetatable({}, {__index = WindowAdapter})
            

            function o:windowClosing(evt)
                ;(self.closeDialog and self or java_outer_self):closeDialog(evt)
            
            end
            java_overload(o, "windowClosing", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)
            return o
        end)())
        self:pack()
end
java_overload(NewWorkAreaJDialog, "initComponents", 0)


function NewWorkAreaJDialog:closeDialog(evt)
        self:setVisible(false)
        self:dispose()
end
java_overload(NewWorkAreaJDialog, "closeDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)


function NewWorkAreaJDialog.main(args)
        local try_ok, try_error, try_value = pcall(function()
            NewWorkAreaJDialog.new(MyFrame.new(), true, Dimension.new(100, 100), "testing"):show()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end

return NewWorkAreaJDialog

