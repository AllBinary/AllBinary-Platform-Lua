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
-- package org.allbinary.graphics.j2me

local MyFrame = {}
package.loaded["org.allbinary.graphics.j2me.MyFrame"] = MyFrame

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

-- local awt = require("java.awt")
local File = java_lazy("java.io.File")
local HashMap = java_lazy("java.util.HashMap")
-- local swing = require("javax.swing")
local XslHelper = java_lazy("org.allbinary.data.tree.dom.XslHelper")
local DomHelper = java_lazy("org.allbinary.dom.DomHelper")
local NewWorkAreaJDialog = java_lazy("org.allbinary.graphics.j2me.dialog.NewWorkAreaJDialog")
local RotateJDialog = java_lazy("org.allbinary.graphics.j2me.dialog.RotateJDialog")
local WorkAreaDom = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaDom")
local WorkAreaJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local WorkAreaJPanelInterface = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface")
local MyCanvasEvent = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventService = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService")
local MyCanvasEventSource = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource")
local FileJDialog = java_lazy("org.allbinary.gui.dialog.FileJDialog")
local FileJDialogListenerInterface = java_lazy("org.allbinary.gui.dialog.FileJDialogListenerInterface")
local HashMapJDialogListenerInterface = java_lazy("org.allbinary.gui.dialog.HashMapJDialogListenerInterface")
local LOGGING = java_lazy("org.allbinary.log.LOGGING")
local GuiLog = java_lazy("org.allbinary.logic.communication.log.GuiLog")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
-- local BorderLayout = require("java.awt.BorderLayout")
-- local Dimension = require("java.awt.Dimension")
-- local GridLayout = require("java.awt.GridLayout")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local KeyListener = require("java.awt.event.KeyListener")
-- local MouseAdapter = require("java.awt.event.MouseAdapter")
-- local MouseEvent = require("java.awt.event.MouseEvent")
-- local WindowAdapter = require("java.awt.event.WindowAdapter")
-- local WindowEvent = require("java.awt.event.WindowEvent")
-- local JButton = require("javax.swing.JButton")
-- local JFrame = require("javax.swing.JFrame")
-- local JLabel = require("javax.swing.JLabel")
-- local JMenu = require("javax.swing.JMenu")
-- local JMenuBar = require("javax.swing.JMenuBar")
-- local JMenuItem = require("javax.swing.JMenuItem")
-- local JPanel = require("javax.swing.JPanel")
-- local JTabbedPane = require("javax.swing.JTabbedPane")
-- local JToolBar = require("javax.swing.JToolBar")
-- local ChangeEvent = require("javax.swing.event.ChangeEvent")
-- local ChangeListener = require("javax.swing.event.ChangeListener")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

-- class table MyFrame is declared before the requires
MyFrame.__index = MyFrame
MyFrame.className = "MyFrame"
MyFrame.javaClassName = "org.allbinary.graphics.j2me.MyFrame"
setmetatable(MyFrame, {__index = JFrame})
MyFrame.java_implements = " FileJDialogListenerInterface HashMapJDialogListenerInterface KeyListener "
MyFrame.java_interfaces = function() return {FileJDialogListenerInterface, HashMapJDialogListenerInterface, KeyListener} end

function MyFrame:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.guiLog = GuiLog.getInstance()
    self.xslHelper = XslHelper.getInstance()
    self.JAVA_TEMPLATE = "svgExport.xsl"
    self.SAVEEXTENSION = ".gxml"
    self.JAVAEXTENSION = ".javax"
    if self.fileJDialog == nil then self.fileJDialog = nil end
    if self.rotateJDialog == nil then self.rotateJDialog = nil end
    if self.animateJButton == nil then self.animateJButton = nil end
    if self.autoDamageJMenuItem == nil then self.autoDamageJMenuItem = nil end
    if self.autoExplodeJMenuItem == nil then self.autoExplodeJMenuItem = nil end
    if self.autoGrowJMenuItem == nil then self.autoGrowJMenuItem = nil end
    if self.autoRotateGenerationJMenuItem == nil then self.autoRotateGenerationJMenuItem = nil end
    if self.autoSheildMenuItem == nil then self.autoSheildMenuItem = nil end
    if self.autoShrinkJMenuItem == nil then self.autoShrinkJMenuItem = nil end
    if self.centerJMenuItem == nil then self.centerJMenuItem = nil end
    if self.copyJMenuItem1 == nil then self.copyJMenuItem1 = nil end
    if self.exitJMenuItem == nil then self.exitJMenuItem = nil end
    if self.explodeAllJMenuItem == nil then self.explodeAllJMenuItem = nil end
    if self.exportJMenuItem1 == nil then self.exportJMenuItem1 = nil end
    if self.fileJMenu == nil then self.fileJMenu = nil end
    if self.frameJMenu == nil then self.frameJMenu = nil end
    if self.generateJMenu == nil then self.generateJMenu = nil end
    if self.insertAfterJMenuItem == nil then self.insertAfterJMenuItem = nil end
    if self.insertBeforeJMenuItem == nil then self.insertBeforeJMenuItem = nil end
    if self.jButton1 == nil then self.jButton1 = nil end
    if self.jButton2 == nil then self.jButton2 = nil end
    if self.jButton3 == nil then self.jButton3 = nil end
    if self.jButton4 == nil then self.jButton4 = nil end
    if self.jButton41 == nil then self.jButton41 = nil end
    if self.jButton5 == nil then self.jButton5 = nil end
    if self.jMenu1 == nil then self.jMenu1 = nil end
    if self.jMenuItem1 == nil then self.jMenuItem1 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.jTabbedPane == nil then self.jTabbedPane = nil end
    if self.jToolBar1 == nil then self.jToolBar1 = nil end
    if self.mainJPanel == nil then self.mainJPanel = nil end
    if self.menuJMenuBar == nil then self.menuJMenuBar = nil end
    if self.newJMenuItem == nil then self.newJMenuItem = nil end
    if self.nextFrameJMenuItem == nil then self.nextFrameJMenuItem = nil end
    if self.objectJMenu == nil then self.objectJMenu = nil end
    if self.openJButton == nil then self.openJButton = nil end
    if self.openJMenuItem == nil then self.openJMenuItem = nil end
    if self.playJButton == nil then self.playJButton = nil end
    if self.previousFrameJMenuItem == nil then self.previousFrameJMenuItem = nil end
    if self.removeJMenuItem == nil then self.removeJMenuItem = nil end
    if self.saveAsJMenuItem == nil then self.saveAsJMenuItem = nil end
    if self.saveJButton == nil then self.saveJButton = nil end
    if self.saveJMenuItem == nil then self.saveJMenuItem = nil end
    if self.statusJPanel == nil then self.statusJPanel = nil end
    if self.stopJjButton == nil then self.stopJjButton = nil end
    if self.viewJMenu == nil then self.viewJMenu = nil end
    if self.zoomInJMenuItem == nil then self.zoomInJMenuItem = nil end
    if self.zoomOutJMenuItem == nil then self.zoomOutJMenuItem = nil end
end


function MyFrame._jinit(self)
    java_super_init(JFrame, self)
    MyFrame._init_fields(self)
        self:initComponents()
        self:setSize(Dimension.new(550, 400))
        self.mainJPanel:setSize(Dimension.new(550, 400))
        self.jTabbedPane:setSize(Dimension.new(550, 400))
        self.fileJDialog = FileJDialog.new()
        self.fileJDialog:addFinishedListener(self)
        self.rotateJDialog = RotateJDialog.new(self, false)
    return self
end

function MyFrame.new(...)
    local self = setmetatable({}, MyFrame)
    MyFrame._jinit(self, ...)
    return self
end


function MyFrame:initComponents()
        self.jToolBar1 = JToolBar.new()
        self.jButton2 = JButton.new()
        self.saveJButton = JButton.new()
        self.jButton1 = JButton.new()
        self.openJButton = JButton.new()
        self.jButton3 = JButton.new()
        self.jButton4 = JButton.new()
        self.jButton41 = JButton.new()
        self.jButton5 = JButton.new()
        self.animateJButton = JButton.new()
        self.playJButton = JButton.new()
        self.stopJjButton = JButton.new()
        self.jPanel1 = JPanel.new()
        self.mainJPanel = JPanel.new()
        self.jTabbedPane = JTabbedPane.new()
        self.statusJPanel = JPanel.new()
        MyFrame.statusJLabel = JLabel.new()
        self.menuJMenuBar = JMenuBar.new()
        self.fileJMenu = JMenu.new()
        self.newJMenuItem = JMenuItem.new()
        self.openJMenuItem = JMenuItem.new()
        self.saveJMenuItem = JMenuItem.new()
        self.saveAsJMenuItem = JMenuItem.new()
        self.exportJMenuItem1 = JMenuItem.new()
        self.exitJMenuItem = JMenuItem.new()
        self.viewJMenu = JMenu.new()
        self.zoomInJMenuItem = JMenuItem.new()
        self.zoomOutJMenuItem = JMenuItem.new()
        self.objectJMenu = JMenu.new()
        self.explodeAllJMenuItem = JMenuItem.new()
        self.frameJMenu = JMenu.new()
        self.previousFrameJMenuItem = JMenuItem.new()
        self.nextFrameJMenuItem = JMenuItem.new()
        self.removeJMenuItem = JMenuItem.new()
        self.copyJMenuItem1 = JMenuItem.new()
        self.insertAfterJMenuItem = JMenuItem.new()
        self.insertBeforeJMenuItem = JMenuItem.new()
        self.generateJMenu = JMenu.new()
        self.centerJMenuItem = JMenuItem.new()
        self.autoDamageJMenuItem = JMenuItem.new()
        self.autoExplodeJMenuItem = JMenuItem.new()
        self.autoGrowJMenuItem = JMenuItem.new()
        self.jMenuItem1 = JMenuItem.new()
        self.autoRotateGenerationJMenuItem = JMenuItem.new()
        self.autoSheildMenuItem = JMenuItem.new()
        self.autoShrinkJMenuItem = JMenuItem.new()
        self.jMenu1 = JMenu.new()
        self:addWindowListener((function()
            local java_outer_self = self
        local o = WindowAdapter.new and WindowAdapter.new() or setmetatable({}, {__index = WindowAdapter})
            

            function o:windowClosing(evt)
                ;(self.exitForm and self or java_outer_self):exitForm(evt)
            
            end
            java_overload(o, "windowClosing", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)
            return o
        end)())
        self.jButton2:setText("New")
        self.jButton2:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.jButton2ActionPerformed and self or java_outer_self):jButton2ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jToolBar1:add(self.jButton2)
        self.saveJButton:setText("Save")
        self.saveJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.saveJButtonActionPerformed and self or java_outer_self):saveJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jToolBar1:add(self.saveJButton)
        self.jButton1:setText("Export")
        self.jButton1:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.jButton1ActionPerformed and self or java_outer_self):jButton1ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jToolBar1:add(self.jButton1)
        self.openJButton:setText("Open")
        self.openJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.openJButtonActionPerformed and self or java_outer_self):openJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jToolBar1:add(self.openJButton)
        self.jButton3:setText("Copy")
        self.jToolBar1:add(self.jButton3)
        self.jButton4:setText("Insert Before")
        self.jToolBar1:add(self.jButton4)
        self.jButton41:setText("Insert After")
        self.jToolBar1:add(self.jButton41)
        self.jButton5:setText("Delete")
        self.jToolBar1:add(self.jButton5)
        self.animateJButton:setText("AnimateEdit")
        self.jToolBar1:add(self.animateJButton)
        self.playJButton:setText("Play")
        self.playJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.playJButtonMousePressed and self or java_outer_self):playJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.jToolBar1:add(self.playJButton)
        self.stopJjButton:setText("Stop")
        self.stopJjButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.stopJjButtonMousePressed and self or java_outer_self):stopJjButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.jToolBar1:add(self.stopJjButton)
        self:getContentPane():add(self.jToolBar1, BorderLayout.NORTH)
        self.jPanel1:setLayout(GridLayout.new(1, 0))
        self.mainJPanel:setLayout(GridLayout.new(1, 0))
        self.jTabbedPane:setMinimumSize(Dimension.new(550, 400))
        self.jTabbedPane:addChangeListener((function()
            local java_outer_self = self
        local o = ChangeListener.new and ChangeListener.new() or setmetatable({}, {__index = ChangeListener})
            

            function o:stateChanged(evt)
                ;(self.jTabbedPaneStateChanged and self or java_outer_self):jTabbedPaneStateChanged(evt)
            
            end
            java_overload(o, "stateChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ChangeEvent")) end)
            return o
        end)())
        self.mainJPanel:add(self.jTabbedPane)
        self.jPanel1:add(self.mainJPanel)
        self:getContentPane():add(self.jPanel1, BorderLayout.CENTER)
        self.statusJPanel:setLayout(GridLayout.new(1, 0))
        MyFrame.statusJLabel:setText("Status Bar")
        self.statusJPanel:add(MyFrame.statusJLabel)
        self:getContentPane():add(self.statusJPanel, BorderLayout.SOUTH)
        self.fileJMenu:setText("File")
        self.fileJMenu:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.fileJMenuActionPerformed and self or java_outer_self):fileJMenuActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.newJMenuItem:setText("New")
        self.newJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.newJMenuItemActionPerformed and self or java_outer_self):newJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.fileJMenu:add(self.newJMenuItem)
        self.openJMenuItem:setText("Open")
        self.openJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.openJMenuItemActionPerformed and self or java_outer_self):openJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.fileJMenu:add(self.openJMenuItem)
        self.saveJMenuItem:setText("Save")
        self.saveJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.saveJMenuItemMousePressed and self or java_outer_self):saveJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.fileJMenu:add(self.saveJMenuItem)
        self.saveAsJMenuItem:setText("SaveAs")
        self.fileJMenu:add(self.saveAsJMenuItem)
        self.exportJMenuItem1:setText("Export")
        self.exportJMenuItem1:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.exportJMenuItem1ActionPerformed and self or java_outer_self):exportJMenuItem1ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.fileJMenu:add(self.exportJMenuItem1)
        self.exitJMenuItem:setText("Exit")
        self.exitJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.exitJMenuItemActionPerformed and self or java_outer_self):exitJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.fileJMenu:add(self.exitJMenuItem)
        self.menuJMenuBar:add(self.fileJMenu)
        self.viewJMenu:setText("View")
        self.zoomInJMenuItem:setText("Zoom In")
        self.zoomInJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.zoomInJMenuItemMousePressed and self or java_outer_self):zoomInJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.viewJMenu:add(self.zoomInJMenuItem)
        self.zoomOutJMenuItem:setText("Zoom Out")
        self.zoomOutJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.zoomOutJMenuItemMousePressed and self or java_outer_self):zoomOutJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.viewJMenu:add(self.zoomOutJMenuItem)
        self.menuJMenuBar:add(self.viewJMenu)
        self.objectJMenu:setText("Objects")
        self.explodeAllJMenuItem:setText("Explode All")
        self.explodeAllJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.explodeAllJMenuItemMousePressed and self or java_outer_self):explodeAllJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.objectJMenu:add(self.explodeAllJMenuItem)
        self.menuJMenuBar:add(self.objectJMenu)
        self.frameJMenu:setText("Frame")
        self.frameJMenu:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.frameJMenuActionPerformed and self or java_outer_self):frameJMenuActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.previousFrameJMenuItem:setText("Previous")
        self.frameJMenu:add(self.previousFrameJMenuItem)
        self.nextFrameJMenuItem:setText(CommonLabels.getInstance().NEXT)
        self.frameJMenu:add(self.nextFrameJMenuItem)
        self.removeJMenuItem:setText("Remove")
        self.frameJMenu:add(self.removeJMenuItem)
        self.copyJMenuItem1:setText("Copy")
        self.frameJMenu:add(self.copyJMenuItem1)
        self.insertAfterJMenuItem:setText("Ins After")
        self.frameJMenu:add(self.insertAfterJMenuItem)
        self.insertBeforeJMenuItem:setText("Ins Before")
        self.frameJMenu:add(self.insertBeforeJMenuItem)
        self.menuJMenuBar:add(self.frameJMenu)
        self.generateJMenu:setText("Generate")
        self.centerJMenuItem:setText("Center")
        self.centerJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.centerJMenuItemActionPerformed and self or java_outer_self):centerJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.generateJMenu:add(self.centerJMenuItem)
        self.autoDamageJMenuItem:setText("Damage")
        self.generateJMenu:add(self.autoDamageJMenuItem)
        self.autoExplodeJMenuItem:setText("Explode")
        self.autoExplodeJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.autoExplodeJMenuItemMousePressed and self or java_outer_self):autoExplodeJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.generateJMenu:add(self.autoExplodeJMenuItem)
        self.autoGrowJMenuItem:setText("Grow")
        self.generateJMenu:add(self.autoGrowJMenuItem)
        self.jMenuItem1:setText("Mirror")
        self.jMenuItem1:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.jMenuItem1ActionPerformed and self or java_outer_self):jMenuItem1ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.generateJMenu:add(self.jMenuItem1)
        self.autoRotateGenerationJMenuItem:setText("Rotate")
        self.autoRotateGenerationJMenuItem:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.autoRotateGenerationJMenuItemMousePressed and self or java_outer_self):autoRotateGenerationJMenuItemMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self.generateJMenu:add(self.autoRotateGenerationJMenuItem)
        self.autoSheildMenuItem:setText("Shield")
        self.generateJMenu:add(self.autoSheildMenuItem)
        self.autoShrinkJMenuItem:setText("Shrink")
        self.generateJMenu:add(self.autoShrinkJMenuItem)
        self.menuJMenuBar:add(self.generateJMenu)
        self.jMenu1:setText("Help")
        self.menuJMenuBar:add(self.jMenu1)
        self:setJMenuBar(self.menuJMenuBar)
        self:pack()
end
java_overload(MyFrame, "initComponents", 0)


function MyFrame:explodeAllJMenuItemMousePressed(evt)
        local try_ok, try_error, try_value = pcall(function()
            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.EXPLODE, nil)))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "explodeAllJMenuItemMousePressed", e)
        end
end
java_overload(MyFrame, "explodeAllJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:autoExplodeJMenuItemMousePressed(evt)
        local try_ok, try_error, try_value = pcall(function()
            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.AUTOEXPLODE, nil)))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "autoExplodeJMenuItemMousePressed", e)
        end
end
java_overload(MyFrame, "autoExplodeJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:stopJjButtonMousePressed(evt)
        self:getSelectedWorkArea():stop()
end
java_overload(MyFrame, "stopJjButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:playJButtonMousePressed(evt)
        self:getSelectedWorkArea():play()
end
java_overload(MyFrame, "playJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:autoRotateGenerationJMenuItemMousePressed(evt)
        self.rotateJDialog:setVisible(true)
end
java_overload(MyFrame, "autoRotateGenerationJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:zoomOutJMenuItemMousePressed(evt)
        self:getSelectedWorkArea():changeZoom(-1)
end
java_overload(MyFrame, "zoomOutJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:zoomInJMenuItemMousePressed(evt)
        self:getSelectedWorkArea():changeZoom(1)
end
java_overload(MyFrame, "zoomInJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:openJMenuItemActionPerformed(evt)
        self:openGraphics()
end
java_overload(MyFrame, "openJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:exportJMenuItem1ActionPerformed(evt)
        self:export()
end
java_overload(MyFrame, "exportJMenuItem1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:saveJMenuItemMousePressed(evt)
        self:save()
end
java_overload(MyFrame, "saveJMenuItemMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function MyFrame:jTabbedPaneStateChanged(evt)
        self:updateSelectedWorkArea()
end
java_overload(MyFrame, "jTabbedPaneStateChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ChangeEvent")) end)


function MyFrame:frameJMenuActionPerformed(evt)
end
java_overload(MyFrame, "frameJMenuActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:exitJMenuItemActionPerformed(evt)
        os.exit(0)
end
java_overload(MyFrame, "exitJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:newJMenuItemActionPerformed(evt)
        self:newGraphics()
end
java_overload(MyFrame, "newJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:fileJMenuActionPerformed(evt)
end
java_overload(MyFrame, "fileJMenuActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:exitForm(evt)
        os.exit(0)
end
java_overload(MyFrame, "exitForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)


function MyFrame:openJButtonActionPerformed(evt)
        self:openGraphics()
end
java_overload(MyFrame, "openJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:jButton2ActionPerformed(evt)
        self:newGraphics()
end
java_overload(MyFrame, "jButton2ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:centerJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.CENTER, nil)))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "centerJMenuItemActionPerformed", e)
        end
end
java_overload(MyFrame, "centerJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:saveJButtonActionPerformed(evt)
        self:save()
end
java_overload(MyFrame, "saveJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:jButton1ActionPerformed(evt)
        self:export()
end
java_overload(MyFrame, "jButton1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:jMenuItem1ActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self:getSelectedWorkArea():autoMirror()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "centerJMenuItemActionPerformed", e)
        end
end
java_overload(MyFrame, "jMenuItem1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MyFrame:onFiles(files)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(require("allbinary_java").to_string("Reading: ") .. require("allbinary_java").to_string(files), self, "onFiles")
            for index = 0, (files.n or #files) - 1 do
                local document = DomHelper.getInstance():createDocument(files[index + 1])
                local workAreaJPanel = WorkAreaJPanel.new(WorkAreaDom.new(document), self:getSize())
                workAreaJPanel:setLayout(GridLayout.new(1, 1))
                self:add(workAreaJPanel)
            end
            self.fileJDialog:setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onFiles", e)
        end
end
java_overload(MyFrame, "onFiles", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function MyFrame:newGraphics()
        local try_ok, try_error, try_value = pcall(function()
            local newName = require("allbinary_java").to_string("graphic") .. require("allbinary_java").to_string(MyFrame.numberOfWorkAreas)
            local dim = self:getSize()
            local newDialog = NewWorkAreaJDialog.new(self, false, dim, newName)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "newJMenuItemActionPerformed", e)
            end
        end
end
java_overload(MyFrame, "newGraphics", 0)


function MyFrame:openGraphics()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "openImageJMenuItemActionPerformed")
            self.fileJDialog:setVisible(true)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "open", e)
            end
        end
end
java_overload(MyFrame, "openGraphics", 0)


function MyFrame:export()
        local try_ok, try_error, try_value = pcall(function()
            local workAreaJPanel = self.jTabbedPane:getSelectedComponent()
            local file = File.new(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(MyFrame.SAVE_PATH) .. require("allbinary_java").to_string("/")) .. require("allbinary_java").to_string(workAreaJPanel:getName())) .. require("allbinary_java").to_string(self.JAVAEXTENSION))
            local document = workAreaJPanel:toDocument()
            self.logUtil:putF(require("allbinary_java").to_string("Export: ") .. require("allbinary_java").to_string(DomHelper.getInstance():toString(document)), self, "exportJMenuItem1ActionPerformed")
            self.xslHelper:export(file, require("allbinary_java").to_string(require("allbinary_java").to_string(MyFrame.TEMPLATE_EXPORT_PATH) .. require("allbinary_java").to_string("/")) .. require("allbinary_java").to_string(self.JAVA_TEMPLATE), document)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "export", e)
            end
        end
end
java_overload(MyFrame, "export", 0)


function MyFrame:save()
        local try_ok, try_error, try_value = pcall(function()
            local workAreaJPanel = self.jTabbedPane:getSelectedComponent()
            DomHelper.getInstance():save(File.new(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(MyFrame.SAVE_PATH) .. require("allbinary_java").to_string("/")) .. require("allbinary_java").to_string(workAreaJPanel:getName())) .. require("allbinary_java").to_string(self.SAVEEXTENSION)), workAreaJPanel:toDocument())
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
            end
        end
end
java_overload(MyFrame, "save", 0)


-- throws Exception
function MyFrame:onHashMap(hashMap)
        local angleIncrementInteger = hashMap:get(tostring(0))
        local totalRotationInteger = hashMap:get(tostring(1))
        self:getSelectedWorkArea():autoRotate(require("allbinary_java").number_value(angleIncrementInteger, "intValue"), require("allbinary_java").number_value(totalRotationInteger, "intValue"))
end
java_overload(MyFrame, "onHashMap", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function MyFrame:getSelectedWorkArea()
        return self.jTabbedPane:getSelectedComponent()
end
java_overload(MyFrame, "getSelectedWorkArea", 0)


function MyFrame:updateSelectedWorkArea()
        local numberOfTabs = self.jTabbedPane:getTabCount()
        for index = 0, numberOfTabs - 1 do
            local workAreaJPanel = self.jTabbedPane:getComponentAt(index)
            workAreaJPanel:deselect()
        end
        local workAreaJPanel = self.jTabbedPane:getSelectedComponent()
        if not rawequal(workAreaJPanel, nil) then
            workAreaJPanel:select()
        end
end
java_overload(MyFrame, "updateSelectedWorkArea", 0)


-- throws Exception
function MyFrame:add(newCanvasInterface)
        local try_ok, try_error, try_value = pcall(function()
            MyFrame.numberOfWorkAreas = MyFrame.numberOfWorkAreas + 1
            if rawequal(MyFrame.numberOfWorkAreas, MyFrame.MAXWORKAREAS) then
                error(require("java.lang.Exception").new(), 0)
            end
            self.jTabbedPane:addTab(newCanvasInterface:getName(), newCanvasInterface)
            self.jTabbedPane:setSelectedComponent(newCanvasInterface)
            local animationThread = require("java.lang.Thread").new(newCanvasInterface)
            animationThread:start()
            self:updateSelectedWorkArea()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LOGGING.contains(LOGGING.GRAPHICSCREATION) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "addNewCanvas", e)
            end
        end
end
java_overload(MyFrame, "add", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WorkAreaJPanelInterface")) end)


function MyFrame:keyPressed(keyEvent)
        self:getSelectedWorkArea():keyPressed(keyEvent)
end
java_overload(MyFrame, "keyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function MyFrame:keyReleased(keyEvent)
end
java_overload(MyFrame, "keyReleased", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function MyFrame:keyTyped(keyEvent)
end
java_overload(MyFrame, "keyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function MyFrame.main(args)
        local try_ok, try_error, try_value = pcall(function()
            AngleFactory.getInstance()
            SmallIntegerSingletonFactory.getInstance():init()
            MyFrame.new():show()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local logUtil = LogUtil.getInstance()
            logUtil:put(CommonStrings.getInstance().EXCEPTION, nil, "main", e)
        end
end

MyFrame.MAXWORKAREAS = 10
MyFrame.numberOfWorkAreas = 0
MyFrame.PATH = "G:/mnt/bc/mydev/work/graphics/AllBinaryGraphicsJavaApplication"
MyFrame.SAVE_PATH = require("allbinary_java").to_string(MyFrame.PATH) .. require("allbinary_java").to_string("/save")
MyFrame.TEMPLATE_EXPORT_PATH = require("allbinary_java").to_string(MyFrame.PATH) .. require("allbinary_java").to_string("/templates/export")
MyFrame.statusJLabel = nil

return MyFrame

