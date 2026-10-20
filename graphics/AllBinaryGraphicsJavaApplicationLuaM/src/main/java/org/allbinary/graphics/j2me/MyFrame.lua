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

-- local awt = require("java.awt")
-- local File = require("java.io.File")
-- local HashMap = require("java.util.HashMap")
-- local swing = require("javax.swing")
local XslHelper = require("org.allbinary.data.tree.dom.XslHelper")
local DomHelper = require("org.allbinary.dom.DomHelper")
local NewWorkAreaJDialog = require("org.allbinary.graphics.j2me.dialog.NewWorkAreaJDialog")
local RotateJDialog = require("org.allbinary.graphics.j2me.dialog.RotateJDialog")
local WorkAreaDom = require("org.allbinary.graphics.j2me.workarea.WorkAreaDom")
local WorkAreaJPanel = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local WorkAreaJPanelInterface = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface")
local MyCanvasEvent = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent")
local MyCanvasEventService = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService")
local MyCanvasEventSource = require("org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource")
local FileJDialog = require("org.allbinary.gui.dialog.FileJDialog")
local FileJDialogListenerInterface = require("org.allbinary.gui.dialog.FileJDialogListenerInterface")
local HashMapJDialogListenerInterface = require("org.allbinary.gui.dialog.HashMapJDialogListenerInterface")
local LOGGING = require("org.allbinary.log.LOGGING")
local GuiLog = require("org.allbinary.logic.communication.log.GuiLog")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local JFrame = require("org.allbinary.graphics.j2me.JFrame")
local KeyListener = require("org.allbinary.graphics.j2me.KeyListener")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyFrame = {}
MyFrame.__index = MyFrame
MyFrame.className = "MyFrame"
setmetatable(MyFrame, {__index = JFrame})

function MyFrame:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.guiLog = GuiLog.getInstance()
    self.xslHelper = XslHelper.getInstance()
    self.JAVA_TEMPLATE = "svgExport.xsl"
    self.SAVEEXTENSION = ".gxml"
    self.JAVAEXTENSION = ".javax"
    self.fileJDialog = nil
    self.rotateJDialog = nil
    self.animateJButton = nil
    self.autoDamageJMenuItem = nil
    self.autoExplodeJMenuItem = nil
    self.autoGrowJMenuItem = nil
    self.autoRotateGenerationJMenuItem = nil
    self.autoSheildMenuItem = nil
    self.autoShrinkJMenuItem = nil
    self.centerJMenuItem = nil
    self.copyJMenuItem1 = nil
    self.exitJMenuItem = nil
    self.explodeAllJMenuItem = nil
    self.exportJMenuItem1 = nil
    self.fileJMenu = nil
    self.frameJMenu = nil
    self.generateJMenu = nil
    self.insertAfterJMenuItem = nil
    self.insertBeforeJMenuItem = nil
    self.jButton1 = nil
    self.jButton2 = nil
    self.jButton3 = nil
    self.jButton4 = nil
    self.jButton41 = nil
    self.jButton5 = nil
    self.jMenu1 = nil
    self.jMenuItem1 = nil
    self.jPanel1 = nil
    self.jTabbedPane = nil
    self.jToolBar1 = nil
    self.mainJPanel = nil
    self.menuJMenuBar = nil
    self.newJMenuItem = nil
    self.nextFrameJMenuItem = nil
    self.objectJMenu = nil
    self.openJButton = nil
    self.openJMenuItem = nil
    self.playJButton = nil
    self.previousFrameJMenuItem = nil
    self.removeJMenuItem = nil
    self.saveAsJMenuItem = nil
    self.saveJButton = nil
    self.saveJMenuItem = nil
    self.statusJPanel = nil
    self.stopJjButton = nil
    self.viewJMenu = nil
    self.zoomInJMenuItem = nil
    self.zoomOutJMenuItem = nil
end


function MyFrame.new()
    local self = setmetatable(JFrame.new(), MyFrame)
    self:_init_fields()
        self:initComponents()
        self:setSize(Dimension.new(550, 400))
        self.mainJPanel:setSize(Dimension.new(550, 400))
        self.jTabbedPane:setSize(Dimension.new(550, 400))
        self.fileJDialog = FileJDialog.new()
        self.fileJDialog:addFinishedListener(self)
        self.rotateJDialog = RotateJDialog.new(self, false)
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
            local o = WindowAdapter.new and WindowAdapter.new() or setmetatable({}, {__index = WindowAdapter})
            

            function o:windowClosing(evt)
                self:exitForm(evt)
            end
            return o
        end)())
        self.jButton2:setText("New")
        self.jButton2:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButton2ActionPerformed(evt)
            end
            return o
        end)())
        self.jToolBar1:add(self.jButton2)
        self.saveJButton:setText("Save")
        self.saveJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:saveJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jToolBar1:add(self.saveJButton)
        self.jButton1:setText("Export")
        self.jButton1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButton1ActionPerformed(evt)
            end
            return o
        end)())
        self.jToolBar1:add(self.jButton1)
        self.openJButton:setText("Open")
        self.openJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:openJButtonActionPerformed(evt)
            end
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
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:playJButtonMousePressed(evt)
            end
            return o
        end)())
        self.jToolBar1:add(self.playJButton)
        self.stopJjButton:setText("Stop")
        self.stopJjButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:stopJjButtonMousePressed(evt)
            end
            return o
        end)())
        self.jToolBar1:add(self.stopJjButton)
        self:getContentPane():add(self.jToolBar1, java.awt.BorderLayout.NORTH)
        self.jPanel1:setLayout(GridLayout.new(1, 0))
        self.mainJPanel:setLayout(GridLayout.new(1, 0))
        self.jTabbedPane:setMinimumSize(Dimension.new(550, 400))
        self.jTabbedPane:addChangeListener((function()
            local o = ChangeListener.new and ChangeListener.new() or setmetatable({}, {__index = ChangeListener})
            

            function o:stateChanged(evt)
                self:jTabbedPaneStateChanged(evt)
            end
            return o
        end)())
        self.mainJPanel:add(self.jTabbedPane)
        self.jPanel1:add(self.mainJPanel)
        self:getContentPane():add(self.jPanel1, java.awt.BorderLayout.CENTER)
        self.statusJPanel:setLayout(GridLayout.new(1, 0))
        MyFrame.statusJLabel:setText("Status Bar")
        self.statusJPanel:add(MyFrame.statusJLabel)
        self:getContentPane():add(self.statusJPanel, java.awt.BorderLayout.SOUTH)
        self.fileJMenu:setText("File")
        self.fileJMenu:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:fileJMenuActionPerformed(evt)
            end
            return o
        end)())
        self.newJMenuItem:setText("New")
        self.newJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:newJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.fileJMenu:add(self.newJMenuItem)
        self.openJMenuItem:setText("Open")
        self.openJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:openJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.fileJMenu:add(self.openJMenuItem)
        self.saveJMenuItem:setText("Save")
        self.saveJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:saveJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.fileJMenu:add(self.saveJMenuItem)
        self.saveAsJMenuItem:setText("SaveAs")
        self.fileJMenu:add(self.saveAsJMenuItem)
        self.exportJMenuItem1:setText("Export")
        self.exportJMenuItem1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:exportJMenuItem1ActionPerformed(evt)
            end
            return o
        end)())
        self.fileJMenu:add(self.exportJMenuItem1)
        self.exitJMenuItem:setText("Exit")
        self.exitJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:exitJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.fileJMenu:add(self.exitJMenuItem)
        self.menuJMenuBar:add(self.fileJMenu)
        self.viewJMenu:setText("View")
        self.zoomInJMenuItem:setText("Zoom In")
        self.zoomInJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:zoomInJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.viewJMenu:add(self.zoomInJMenuItem)
        self.zoomOutJMenuItem:setText("Zoom Out")
        self.zoomOutJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:zoomOutJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.viewJMenu:add(self.zoomOutJMenuItem)
        self.menuJMenuBar:add(self.viewJMenu)
        self.objectJMenu:setText("Objects")
        self.explodeAllJMenuItem:setText("Explode All")
        self.explodeAllJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:explodeAllJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.objectJMenu:add(self.explodeAllJMenuItem)
        self.menuJMenuBar:add(self.objectJMenu)
        self.frameJMenu:setText("Frame")
        self.frameJMenu:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:frameJMenuActionPerformed(evt)
            end
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
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:centerJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.generateJMenu:add(self.centerJMenuItem)
        self.autoDamageJMenuItem:setText("Damage")
        self.generateJMenu:add(self.autoDamageJMenuItem)
        self.autoExplodeJMenuItem:setText("Explode")
        self.autoExplodeJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:autoExplodeJMenuItemMousePressed(evt)
            end
            return o
        end)())
        self.generateJMenu:add(self.autoExplodeJMenuItem)
        self.autoGrowJMenuItem:setText("Grow")
        self.generateJMenu:add(self.autoGrowJMenuItem)
        self.jMenuItem1:setText("Mirror")
        self.jMenuItem1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jMenuItem1ActionPerformed(evt)
            end
            return o
        end)())
        self.generateJMenu:add(self.jMenuItem1)
        self.autoRotateGenerationJMenuItem:setText("Rotate")
        self.autoRotateGenerationJMenuItem:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:autoRotateGenerationJMenuItemMousePressed(evt)
            end
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


function MyFrame:explodeAllJMenuItemMousePressed(evt)
        local try_ok, try_error = pcall(function()
            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.EXPLODE, nil)))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "explodeAllJMenuItemMousePressed", e)
        end
end


function MyFrame:autoExplodeJMenuItemMousePressed(evt)
        local try_ok, try_error = pcall(function()
            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.AUTOEXPLODE, nil)))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "autoExplodeJMenuItemMousePressed", e)
        end
end


function MyFrame:stopJjButtonMousePressed(evt)
        self:getSelectedWorkArea():stop()
end


function MyFrame:playJButtonMousePressed(evt)
        self:getSelectedWorkArea():play()
end


function MyFrame:autoRotateGenerationJMenuItemMousePressed(evt)
        self.rotateJDialog:setVisible(true)
end


function MyFrame:zoomOutJMenuItemMousePressed(evt)
        self:getSelectedWorkArea():changeZoom(-1)
end


function MyFrame:zoomInJMenuItemMousePressed(evt)
        self:getSelectedWorkArea():changeZoom(1)
end


function MyFrame:openJMenuItemActionPerformed(evt)
        self:openGraphics()
end


function MyFrame:exportJMenuItem1ActionPerformed(evt)
        self:export()
end


function MyFrame:saveJMenuItemMousePressed(evt)
        self:save()
end


function MyFrame:jTabbedPaneStateChanged(evt)
        self:updateSelectedWorkArea()
end


function MyFrame:frameJMenuActionPerformed(evt)
end


function MyFrame:exitJMenuItemActionPerformed(evt)
        os.exit(0)
end


function MyFrame:newJMenuItemActionPerformed(evt)
        self:newGraphics()
end


function MyFrame:fileJMenuActionPerformed(evt)
end


function MyFrame:exitForm(evt)
        os.exit(0)
end


function MyFrame:openJButtonActionPerformed(evt)
        self:openGraphics()
end


function MyFrame:jButton2ActionPerformed(evt)
        self:newGraphics()
end


function MyFrame:centerJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            MyCanvasEventService.fire(MyCanvasEvent.new(MyCanvasEventSource.new(MyCanvasEventService.CENTER, nil)))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "centerJMenuItemActionPerformed", e)
        end
end


function MyFrame:saveJButtonActionPerformed(evt)
        self:save()
end


function MyFrame:jButton1ActionPerformed(evt)
        self:export()
end


function MyFrame:jMenuItem1ActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self:getSelectedWorkArea():autoMirror()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "centerJMenuItemActionPerformed", e)
        end
end


function MyFrame:onFiles(files)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Reading: " .. tostring(files), self, "onFiles")
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onFiles", e)
        end
end


function MyFrame:newGraphics()
        local try_ok, try_error = pcall(function()
            local newName = "graphic" .. tostring(MyFrame.numberOfWorkAreas)
            local dim = self:getSize()
            local newDialog = NewWorkAreaJDialog.new(self, false, dim, newName)
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "newJMenuItemActionPerformed", e)
            end
        end
end


function MyFrame:openGraphics()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "openImageJMenuItemActionPerformed")
            self.fileJDialog:setVisible(true)
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "open", e)
            end
        end
end


function MyFrame:export()
        local try_ok, try_error = pcall(function()
            local workAreaJPanel = self.jTabbedPane:getSelectedComponent()
            local file = File.new(self.SAVE_PATH .. "/" .. workAreaJPanel:getName() .. self.JAVAEXTENSION)
            local document = workAreaJPanel:toDocument()
            self.logUtil:putF("Export: " .. DomHelper.getInstance():toString(document), self, "exportJMenuItem1ActionPerformed")
            self.xslHelper:export(file, tostring(MyFrame.TEMPLATE_EXPORT_PATH) .. "/" .. self.JAVA_TEMPLATE, document)
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "export", e)
            end
        end
end


function MyFrame:save()
        local try_ok, try_error = pcall(function()
            local workAreaJPanel = self.jTabbedPane:getSelectedComponent()
            DomHelper.getInstance():save(File.new(self.SAVE_PATH .. "/" .. workAreaJPanel:getName() .. self.SAVEEXTENSION), workAreaJPanel:toDocument())
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.MENUEVENT) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, self.commonStrings.SAVE, e)
            end
        end
end


-- throws Exception
function MyFrame:onHashMap(hashMap)
        local angleIncrementInteger = hashMap:get(tostring(0))
        local totalRotationInteger = hashMap:get(tostring(1))
        self:getSelectedWorkArea():autoRotate(math.tointeger(angleIncrementInteger // 1), math.tointeger(totalRotationInteger // 1))
end


function MyFrame:getSelectedWorkArea()
        return self.jTabbedPane:getSelectedComponent()
end


function MyFrame:updateSelectedWorkArea()
        local numberOfTabs = self.jTabbedPane:getTabCount()
        for index = 0, numberOfTabs - 1 do
            local workAreaJPanel = self.jTabbedPane:getComponentAt(index)
            workAreaJPanel:deselect()
        end
        local workAreaJPanel = self.jTabbedPane:getSelectedComponent()
        if workAreaJPanel ~= nil then
            workAreaJPanel:select()
        end
end


-- throws Exception
function MyFrame:add(newCanvasInterface)
        local try_ok, try_error = pcall(function()
            self.numberOfWorkAreas = self.numberOfWorkAreas + 1
            if self.numberOfWorkAreas == MyFrame.MAXWORKAREAS then
                error(java_exception("Exception"), 0)
            end
            self.jTabbedPane:addTab(newCanvasInterface:getName(), newCanvasInterface)
            self.jTabbedPane:setSelectedComponent(newCanvasInterface)
            local animationThread = Thread.new(newCanvasInterface)
            animationThread:start()
            self:updateSelectedWorkArea()
        end)
        if not try_ok then
            local e = try_error
            if self.LOGGING:contains(self.LOGGING.GRAPHICSCREATION) then
                self.guiLog:put(self.commonStrings.EXCEPTION, self, "addNewCanvas", e)
            end
        end
end


function MyFrame:keyPressed(keyEvent)
        self:getSelectedWorkArea():keyPressed(keyEvent)
end


function MyFrame:keyReleased(keyEvent)
end


function MyFrame:keyTyped(keyEvent)
end


function MyFrame.main(args)
        local try_ok, try_error = pcall(function()
            AngleFactory.getInstance()
            SmallIntegerSingletonFactory.getInstance():init()
            MyFrame.new():show()
        end)
        if not try_ok then
            local e = try_error
            local logUtil = LogUtil.getInstance()
            logUtil:put(CommonStrings.getInstance().EXCEPTION, nil, "main", e)
        end
end

MyFrame.MAXWORKAREAS = 10
MyFrame.numberOfWorkAreas = 0
MyFrame.PATH = "G:/mnt/bc/mydev/work/graphics/AllBinaryGraphicsJavaApplication"
MyFrame.SAVE_PATH = tostring(MyFrame.PATH) .. "/save"
MyFrame.TEMPLATE_EXPORT_PATH = tostring(MyFrame.PATH) .. "/templates/export"
MyFrame.statusJLabel = nil

return MyFrame

