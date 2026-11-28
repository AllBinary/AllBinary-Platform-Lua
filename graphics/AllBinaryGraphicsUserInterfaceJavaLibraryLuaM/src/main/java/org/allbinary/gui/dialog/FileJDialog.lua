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

local FileJDialog = {}
package.loaded["org.allbinary.gui.dialog.FileJDialog"] = FileJDialog

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
local File = java_lazy("java.io.File")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
-- local EventQueue = require("java.awt.EventQueue")
-- local Frame = require("java.awt.Frame")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local JDialog = require("javax.swing.JDialog")
-- local JFileChooser = require("javax.swing.JFileChooser")
-- local JFrame = require("javax.swing.JFrame")
-- local WindowConstants = require("javax.swing.WindowConstants")
local FileJDialogListenerInterface = java_lazy("org.allbinary.gui.dialog.FileJDialogListenerInterface")

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

-- class table FileJDialog is declared before the requires
FileJDialog.__index = FileJDialog
FileJDialog.className = "FileJDialog"
FileJDialog.javaClassName = "org.allbinary.gui.dialog.FileJDialog"
setmetatable(FileJDialog, {__index = JDialog})

function FileJDialog:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.finishedListenerInterface == nil then self.finishedListenerInterface = nil end
    if self.jFileChooser1 == nil then self.jFileChooser1 = nil end
end

function FileJDialog._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return FileJDialog._new0(self, ...)
    elseif count == 2 then return FileJDialog._new2(self, ...)
    end
    error("No constructor of FileJDialog takes " .. count .. " arguments")
end

function FileJDialog.new(...)
    local self = setmetatable({}, FileJDialog)
    FileJDialog._jinit(self, ...)
    return self
end


function FileJDialog._new0(self)
    java_super_init(JDialog, self)
    FileJDialog._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self:getJFileChooser1():setMultiSelectionEnabled(true)
    return self
end


function FileJDialog._new2(self, parent, modal)
    java_super_init(JDialog, self, parent, modal)
    FileJDialog._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self:getJFileChooser1():setMultiSelectionEnabled(true)
    return self
end


function FileJDialog:addFinishedListener(finishedListenerInterface)
        self.finishedListenerInterface = finishedListenerInterface
end
java_overload(FileJDialog, "addFinishedListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FileJDialogListenerInterface")) end)


function FileJDialog:initComponents()
        self.jFileChooser1 = JFileChooser.new()
        self:setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE)
        self.jFileChooser1:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.jFileChooser1ActionPerformed and self or java_outer_self):jFileChooser1ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(require("org.jdesktop.layout.GroupLayout").TRAILING, layout:createSequentialGroup():addContainerGap(require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):add(self.jFileChooser1, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(layout:createSequentialGroup():addContainerGap():add(self.jFileChooser1, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, 357, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):addContainerGap(require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        self:pack()
end
java_overload(FileJDialog, "initComponents", 0)


function FileJDialog:jFileChooser1ActionPerformed(evt)
        self.logUtil:putF(require("allbinary_java").to_string("Starting Action Command: ") .. require("allbinary_java").to_string(evt:getActionCommand()), self, "ActionPerformed")
        local files = self:getJFileChooser1():getSelectedFiles()
        if rawequal(evt:getActionCommand(), self:getJFileChooser1().CANCEL_SELECTION) then
            self:setVisible(false)
        end
        if rawequal(evt:getActionCommand(), self:getJFileChooser1().APPROVE_SELECTION) then
            if not rawequal(files, nil) and (files.n or #files) > 0 then
                self.finishedListenerInterface:onFiles(files)
            end
        end
end
java_overload(FileJDialog, "jFileChooser1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function FileJDialog.main(args)
        EventQueue.invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                FileJDialog.new(JFrame.new(), true):setVisible(true)
            end
            java_overload(o, "run", 0)
            return o
        end)())
end


function FileJDialog:getJFileChooser1()
        return self.jFileChooser1
end
java_overload(FileJDialog, "getJFileChooser1", 0)


function FileJDialog:setJFileChooser1(jFileChooser1)
        self.jFileChooser1 = jFileChooser1
end
java_overload(FileJDialog, "setJFileChooser1", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JFileChooser")) end)

return FileJDialog

