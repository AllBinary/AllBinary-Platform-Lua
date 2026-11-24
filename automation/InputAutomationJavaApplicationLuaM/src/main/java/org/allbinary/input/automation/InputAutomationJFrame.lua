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
-- package org.allbinary.input.automation

local InputAutomationJFrame = {}
package.loaded["org.allbinary.input.automation.InputAutomationJFrame"] = InputAutomationJFrame

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
-- local URI = require("java.net.URI")
-- local URL = require("java.net.URL")
-- local Desktop = require("java.awt.Desktop")
-- local List = require("java.util.List")
-- local ImageIcon = require("javax.swing.ImageIcon")
-- local JDialog = require("javax.swing.JDialog")
-- local HelpSet = require("javax.help.HelpSet")
-- local HelpSetEvent = require("javax.help.event.HelpSetEvent")
-- local HelpSetListener = require("javax.help.event.HelpSetListener")
local InputAutomationBundleActivatorListenerInterface = java_lazy("bundle.input.automation.InputAutomationBundleActivatorListenerInterface")
local InputAutomationConfigurationModuleChangeListener = java_lazy("bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener")
local InputAutomationRobotChangeListener = java_lazy("bundle.input.automation.robot.InputAutomationRobotChangeListener")
local AppUrlGlobals = java_lazy("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local BasicTextJDialog = java_lazy("org.allbinary.gui.dialog.BasicTextJDialog")
local JListSwingWorker = java_lazy("org.allbinary.gui.swing.workers.JListSwingWorker")
local InputAutomationConfiguration = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfiguration")
local InputAutomationConfigurationFactory = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfigurationFactory")
local InputAutomationConfigurationModuleChangeEvent = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent")
local InputAutomationModuleFactoryFactory = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryFactory")
local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local InputAutomationModuleConfiguration = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local InputAutomationModuleConfigurations = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations")
local DesktopBundle = java_lazy("org.allbinary.input.automation.osgi.DesktopBundle")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")
local InputAutomationRobotChangeEvent = java_lazy("org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local JavaHelpUtil = java_lazy("org.allbinary.logic.java.help.JavaHelpUtil")
local WebappClassLoaderInfo = java_lazy("org.allbinary.logic.system.loader.WebappClassLoaderInfo")
local InputAutomationClientInformationFactory = java_lazy("org.allbinary.logic.system.security.licensing.InputAutomationClientInformationFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local RunnableInterface = java_lazy("org.allbinary.thread.RunnableInterface")
-- local Dimension = require("java.awt.Dimension")
-- local EventQueue = require("java.awt.EventQueue")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local FocusAdapter = require("java.awt.event.FocusAdapter")
-- local FocusEvent = require("java.awt.event.FocusEvent")
-- local WindowEvent = require("java.awt.event.WindowEvent")
-- local WindowFocusListener = require("java.awt.event.WindowFocusListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JCheckBoxMenuItem = require("javax.swing.JCheckBoxMenuItem")
-- local JFrame = require("javax.swing.JFrame")
-- local JLabel = require("javax.swing.JLabel")
-- local JList = require("javax.swing.JList")
-- local JMenu = require("javax.swing.JMenu")
-- local JMenuBar = require("javax.swing.JMenuBar")
-- local JMenuItem = require("javax.swing.JMenuItem")
-- local JPanel = require("javax.swing.JPanel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local JTabbedPane = require("javax.swing.JTabbedPane")
-- local WindowConstants = require("javax.swing.WindowConstants")
-- local ListSelectionEvent = require("javax.swing.event.ListSelectionEvent")
-- local ListSelectionListener = require("javax.swing.event.ListSelectionListener")

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

-- class table InputAutomationJFrame is declared before the requires
InputAutomationJFrame.__index = InputAutomationJFrame
InputAutomationJFrame.className = "InputAutomationJFrame"
InputAutomationJFrame.javaClassName = "org.allbinary.input.automation.InputAutomationJFrame"
setmetatable(InputAutomationJFrame, {__index = JFrame})
InputAutomationJFrame.java_implements = " InputAutomationConfigurationModuleChangeListener InputAutomationRobotChangeListener HelpSetListener "
InputAutomationJFrame.java_interfaces = function() return {InputAutomationConfigurationModuleChangeListener, InputAutomationRobotChangeListener, HelpSetListener} end

function InputAutomationJFrame:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputAutomationModuleConfigurations = InputAutomationModuleConfigurations.new()
    if self.inputAutomationModuleFactory == nil then self.inputAutomationModuleFactory = nil end
    if self.inputAutomationModuleInterface == nil then self.inputAutomationModuleInterface = nil end
    if self.runnableInterface == nil then self.runnableInterface = nil end
    if self.thread == nil then self.thread = nil end
    if self.helpSet == nil then self.helpSet = nil end
    self.uri = URI.new("http://geocities.com/allbinary/")
    if self.aboutJMenuItem == nil then self.aboutJMenuItem = nil end
    if self.automationModuleConfigurationJPanel == nil then self.automationModuleConfigurationJPanel = nil end
    if self.gameRobotJTabbedPane == nil then self.gameRobotJTabbedPane = nil end
    if self.helpJMenuItem == nil then self.helpJMenuItem = nil end
    if self.inputAutomationModuleJList == nil then self.inputAutomationModuleJList = nil end
    if self.inputAutomationModuleJPanel == nil then self.inputAutomationModuleJPanel = nil end
    if self.jScrollPane1 == nil then self.jScrollPane1 = nil end
    if self.mainJMenuBar == nil then self.mainJMenuBar = nil end
    if self.modulesJMenuItem == nil then self.modulesJMenuItem = nil end
    if self.noModuleSelectedJDialog == nil then self.noModuleSelectedJDialog = nil end
    if self.noModuleSelectedJLabel == nil then self.noModuleSelectedJLabel = nil end
    if self.optionsJMenu == nil then self.optionsJMenu = nil end
    if self.processingJMenu == nil then self.processingJMenu = nil end
    if self.startJMenuItem == nil then self.startJMenuItem = nil end
    if self.stopJMenuItem == nil then self.stopJMenuItem = nil end
    if self.stopOnFocusJCheckBoxMenuItem == nil then self.stopOnFocusJCheckBoxMenuItem = nil end
    if self.subscriptionJMenuItem == nil then self.subscriptionJMenuItem = nil end
    if self.toolsJMenu == nil then self.toolsJMenu = nil end
    if self.updatesJMenuItem == nil then self.updatesJMenuItem = nil end
end


function InputAutomationJFrame._jinit(self)
    java_super_init(JFrame, self)
    InputAutomationJFrame._init_fields(self)
        self:initComponents()
        local url = getmetatable(self):getResource("/help/Help.hs")
        self.logUtil:putF("URL: " .. tostring(url), self, self.commonStrings.CONSTRUCTOR)
        self.helpSet = JavaHelpUtil.getInstance():getHelpSet(url)
        url = getmetatable(self):getResource("/resources/allbinaryicon8bit.jpg")
        local imageIcon = ImageIcon.new(url)
        self:setIconImage(imageIcon:getImage())
        self:init()
    return self
end

function InputAutomationJFrame.new(...)
    local self = setmetatable({}, InputAutomationJFrame)
    InputAutomationJFrame._jinit(self, ...)
    return self
end


function InputAutomationJFrame:helpSetAdded(helpSetEvent)
        self.helpSet:add(helpSetEvent:getHelpSet())
end
java_overload(InputAutomationJFrame, "helpSetAdded", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HelpSetEvent")) end)


function InputAutomationJFrame:helpSetRemoved(helpSetEvent)
        self.helpSet:remove(helpSetEvent:getHelpSet())
end
java_overload(InputAutomationJFrame, "helpSetRemoved", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HelpSetEvent")) end)


-- throws Exception
function InputAutomationJFrame:init()
        local inputAutomationConfigurationFactory = InputAutomationConfigurationFactory.getInstance()
        inputAutomationConfigurationFactory:init(InputAutomationClientInformationFactory.getInstance())
        local inputAutomationModuleConfigurationList = inputAutomationConfigurationFactory.inputAutomationConfiguration:getInputAutomationModuleConfigurationList()
        if inputAutomationModuleConfigurationList == nil then
        else
            self.inputAutomationModuleConfigurations = InputAutomationModuleConfigurations.new(inputAutomationModuleConfigurationList)
        end
        self.inputAutomationModuleFactory = InputAutomationModuleFactoryFactory.new(self.inputAutomationModuleConfigurations, self)
        ;(JListSwingWorker.new(self.inputAutomationModuleJList, self.inputAutomationModuleFactory:getListModel())):execute()
        self.gameRobotJTabbedPane:setEnabledAt(1, false)
        self.gameRobotJTabbedPane:setSelectedIndex(0)
end
java_overload(InputAutomationJFrame, "init", 0)


function InputAutomationJFrame:initComponents()
        self.noModuleSelectedJDialog = JDialog.new()
        self.noModuleSelectedJLabel = JLabel.new()
        self.gameRobotJTabbedPane = JTabbedPane.new()
        self.inputAutomationModuleJPanel = JPanel.new()
        self.jScrollPane1 = JScrollPane.new()
        self.inputAutomationModuleJList = JList.new()
        self.automationModuleConfigurationJPanel = JPanel.new()
        self.mainJMenuBar = JMenuBar.new()
        self.processingJMenu = JMenu.new()
        self.startJMenuItem = JMenuItem.new()
        self.stopJMenuItem = JMenuItem.new()
        self.optionsJMenu = JMenu.new()
        self.stopOnFocusJCheckBoxMenuItem = JCheckBoxMenuItem.new()
        self.toolsJMenu = JMenu.new()
        self.helpJMenuItem = JMenuItem.new()
        self.updatesJMenuItem = JMenuItem.new()
        self.subscriptionJMenuItem = JMenuItem.new()
        self.modulesJMenuItem = JMenuItem.new()
        self.aboutJMenuItem = JMenuItem.new()
        self.noModuleSelectedJDialog:setMinimumSize(Dimension.new(200, 100))
        self.noModuleSelectedJLabel:setText("Please Select A Module")
        local noModuleSelectedJDialogLayout = GroupLayout.new(self.noModuleSelectedJDialog:getContentPane())
        self.noModuleSelectedJDialog:getContentPane():setLayout(noModuleSelectedJDialogLayout)
        noModuleSelectedJDialogLayout:setHorizontalGroup(noModuleSelectedJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(noModuleSelectedJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.noModuleSelectedJLabel):addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        noModuleSelectedJDialogLayout:setVerticalGroup(noModuleSelectedJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.noModuleSelectedJLabel, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 48, require("java.lang.Short").MAX_VALUE))
        self:setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE)
        self:setMinimumSize(Dimension.new(325, 215))
        self:setResizable(false)
        self:addWindowFocusListener((function()
            local o = WindowFocusListener.new and WindowFocusListener.new() or setmetatable({}, {__index = WindowFocusListener})
            

            function o:windowGainedFocus(evt)
                self:formWindowGainedFocus(evt)
            end
            java_overload(o, "windowGainedFocus", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)
            

            function o:windowLostFocus(evt)
                self:formWindowLostFocus(evt)
            end
            java_overload(o, "windowLostFocus", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)
            return o
        end)())
        self:addFocusListener((function()
            local o = FocusAdapter.new and FocusAdapter.new() or setmetatable({}, {__index = FocusAdapter})
            

            function o:focusGained(evt)
                self:formFocusGained(evt)
            end
            java_overload(o, "focusGained", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FocusEvent")) end)
            

            function o:focusLost(evt)
                self:formFocusLost(evt)
            end
            java_overload(o, "focusLost", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FocusEvent")) end)
            return o
        end)())
        self.gameRobotJTabbedPane:setMinimumSize(Dimension.new(320, 200))
        self.inputAutomationModuleJList:setMinimumSize(Dimension.new(200, 0))
        self.inputAutomationModuleJList:addListSelectionListener((function()
            local o = ListSelectionListener.new and ListSelectionListener.new() or setmetatable({}, {__index = ListSelectionListener})
            

            function o:valueChanged(evt)
                self:inputAutomationModuleJListValueChanged(evt)
            end
            java_overload(o, "valueChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ListSelectionEvent")) end)
            return o
        end)())
        self.jScrollPane1:setViewportView(self.inputAutomationModuleJList)
        local inputAutomationModuleJPanelLayout = GroupLayout.new(self.inputAutomationModuleJPanel)
        self.inputAutomationModuleJPanel:setLayout(inputAutomationModuleJPanelLayout)
        inputAutomationModuleJPanelLayout:setHorizontalGroup(inputAutomationModuleJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(inputAutomationModuleJPanelLayout:createSequentialGroup():addComponent(self.jScrollPane1, GroupLayout.PREFERRED_SIZE, 199, GroupLayout.PREFERRED_SIZE):addContainerGap(367, require("java.lang.Short").MAX_VALUE)))
        inputAutomationModuleJPanelLayout:setVerticalGroup(inputAutomationModuleJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(inputAutomationModuleJPanelLayout:createSequentialGroup():addComponent(self.jScrollPane1, GroupLayout.PREFERRED_SIZE, 330, GroupLayout.PREFERRED_SIZE):addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        self.gameRobotJTabbedPane:addTab("Modules", self.inputAutomationModuleJPanel)
        local automationModuleConfigurationJPanelLayout = GroupLayout.new(self.automationModuleConfigurationJPanel)
        self.automationModuleConfigurationJPanel:setLayout(automationModuleConfigurationJPanelLayout)
        automationModuleConfigurationJPanelLayout:setHorizontalGroup(automationModuleConfigurationJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 566, require("java.lang.Short").MAX_VALUE))
        automationModuleConfigurationJPanelLayout:setVerticalGroup(automationModuleConfigurationJPanelLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 334, require("java.lang.Short").MAX_VALUE))
        self.gameRobotJTabbedPane:addTab("Configuration", self.automationModuleConfigurationJPanel)
        self.processingJMenu:setText("Processing")
        self.processingJMenu:setToolTipText("Set module processing state")
        self.startJMenuItem:setText(self.commonStrings.START)
        self.startJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:startJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.startJMenuItem)
        self.stopJMenuItem:setText("Stop")
        self.stopJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:stopJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.stopJMenuItem)
        self.mainJMenuBar:add(self.processingJMenu)
        self.optionsJMenu:setText("Options")
        self.optionsJMenu:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:optionsJMenuActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.stopOnFocusJCheckBoxMenuItem:setSelected(true)
        self.stopOnFocusJCheckBoxMenuItem:setEnabled(false)
        self.stopOnFocusJCheckBoxMenuItem:setLabel("Stop Module On Focus")
        self.stopOnFocusJCheckBoxMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:stopOnFocusJCheckBoxMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.optionsJMenu:add(self.stopOnFocusJCheckBoxMenuItem)
        self.mainJMenuBar:add(self.optionsJMenu)
        self.toolsJMenu:setText("Help")
        self.helpJMenuItem:setText("Help")
        self.helpJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:helpJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.toolsJMenu:add(self.helpJMenuItem)
        self.updatesJMenuItem:setText("Updates")
        self.updatesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:updatesJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.toolsJMenu:add(self.updatesJMenuItem)
        self.subscriptionJMenuItem:setText("Subscription")
        self.subscriptionJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:subscriptionJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.toolsJMenu:add(self.subscriptionJMenuItem)
        self.modulesJMenuItem:setText("Module Manager")
        self.modulesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:modulesJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.toolsJMenu:add(self.modulesJMenuItem)
        self.aboutJMenuItem:setText("About")
        self.aboutJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:aboutJMenuItemActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.toolsJMenu:add(self.aboutJMenuItem)
        self.mainJMenuBar:add(self.toolsJMenu)
        self:setJMenuBar(self.mainJMenuBar)
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.gameRobotJTabbedPane, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 571, require("java.lang.Short").MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.gameRobotJTabbedPane, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 359, require("java.lang.Short").MAX_VALUE))
        self:pack()
end
java_overload(InputAutomationJFrame, "initComponents", 0)


function InputAutomationJFrame:subscriptionJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            Desktop.getDesktop():browse(self.uri)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "subscriptionJMenuItemActionPerformed", e)
        end
end
java_overload(InputAutomationJFrame, "subscriptionJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:updatesJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            Desktop.getDesktop():browse(self.uri)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updatesJMenuItemActionPerformed", e)
        end
end
java_overload(InputAutomationJFrame, "updatesJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:aboutJMenuItemActionPerformed(evt)
        local textJDialog = BasicTextJDialog.new("Copyright (c) 2002-2007 AllBinary")
        textJDialog:setVisible(true)
        textJDialog:setLocationRelativeTo(self)
end
java_overload(InputAutomationJFrame, "aboutJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:modulesJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            DesktopBundle.new():start()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "modulesJMenuItemActionPerformed", e)
        end
end
java_overload(InputAutomationJFrame, "modulesJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:helpJMenuItemActionPerformed(evt)
        JavaHelpUtil.getInstance():show(self.helpSet)
end
java_overload(InputAutomationJFrame, "helpJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:stopOnFocusJCheckBoxMenuItemActionPerformed(evt)
end
java_overload(InputAutomationJFrame, "stopOnFocusJCheckBoxMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:optionsJMenuActionPerformed(evt)
end
java_overload(InputAutomationJFrame, "optionsJMenuActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:formWindowLostFocus(evt)
        self.logUtil:putF("Nothing", self, "focusLost")
end
java_overload(InputAutomationJFrame, "formWindowLostFocus", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)


function InputAutomationJFrame:formWindowGainedFocus(evt)
        if self.stopOnFocusJCheckBoxMenuItem:isSelected() then
            self.logUtil:putF("Stopping", self, "focusGained")
            if self.runnableInterface ~= nil then
                self.runnableInterface:setRunning(false)
            end
        end
end
java_overload(InputAutomationJFrame, "formWindowGainedFocus", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WindowEvent")) end)


function InputAutomationJFrame:formFocusLost(evt)
end
java_overload(InputAutomationJFrame, "formFocusLost", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FocusEvent")) end)


function InputAutomationJFrame:formFocusGained(evt)
end
java_overload(InputAutomationJFrame, "formFocusGained", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "FocusEvent")) end)


function InputAutomationJFrame:inputAutomationModuleJListValueChanged(evt)
        local try_ok, try_error, try_value = pcall(function()
            local gameAutomationRobotModuleNameString = self.inputAutomationModuleJList:getSelectedValue()
            if gameAutomationRobotModuleNameString ~= nil then
                self.inputAutomationModuleInterface = self.inputAutomationModuleFactory:getInstance(gameAutomationRobotModuleNameString)
                self:getAutomationModuleConfigurationJPanel():removeAll()
                local layout = self:getAutomationModuleConfigurationJPanel():getLayout()
                layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 395, require("java.lang.Short").MAX_VALUE):addComponent(self.inputAutomationModuleInterface:getConfigurationJPanel(), GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 256, require("java.lang.Short").MAX_VALUE):addComponent(self.inputAutomationModuleInterface:getConfigurationJPanel(), GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                self.gameRobotJTabbedPane:setEnabledAt(1, true)
                self.logUtil:putF("Setting Module: " .. gameAutomationRobotModuleNameString .. " and Configuration JPanel", self, "gameAutomationRobotModuleJListValueChanged")
            else
                self.logUtil:putF("Module name was null", self, "gameAutomationRobotModuleJListValueChanged")
                self.gameRobotJTabbedPane:setEnabledAt(1, false)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "gameAutomationRobotModuleJListValueChanged", e)
        end
end
java_overload(InputAutomationJFrame, "inputAutomationModuleJListValueChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ListSelectionEvent")) end)


function InputAutomationJFrame:stopJMenuItemActionPerformed(evt)
        if self.runnableInterface ~= nil then
            self.runnableInterface:setRunning(false)
        else
            self.noModuleSelectedJDialog:setVisible(true)
            self.noModuleSelectedJDialog:setLocationRelativeTo(self)
        end
end
java_overload(InputAutomationJFrame, "stopJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame:startJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "startJMenuItemActionPerformed")
            if self.inputAutomationModuleInterface ~= nil then
                self.runnableInterface = self.inputAutomationModuleInterface:getInstance()
                if self.runnableInterface ~= nil then
                    self.thread = require("java.lang.Thread").new(self.runnableInterface)
                    self.thread:setPriority(require("java.lang.Thread").MIN_PRIORITY + 1)
                    self.thread:start()
                else
                    self.logUtil:putF("Runnnable was null", self, "startJMenuItemActionPerformed")
                    self.noModuleSelectedJDialog:setVisible(true)
                    self.noModuleSelectedJDialog:setLocationRelativeTo(self)
                end
            else
                self.logUtil:putF("InputAutomationModuleInterface was null", self, "startJMenuItemActionPerformed")
                self.noModuleSelectedJDialog:setVisible(true)
                self.noModuleSelectedJDialog:setLocationRelativeTo(self)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "startJMenuItemActionPerformed", e)
        end
end
java_overload(InputAutomationJFrame, "startJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function InputAutomationJFrame.getInstance()
        return InputAutomationJFrame.INPUTAUTOMATION_JFRAME
end


function InputAutomationJFrame.destroy()
        InputAutomationJFrame.INPUTAUTOMATION_JFRAME:setVisible(false)
end


function InputAutomationJFrame.create(inputAutomationBundleActivatorListenerInterface)
        LogConfigTypeFactory.getInstance()
        local appUrlGlobals = AppUrlGlobals.new()
        appUrlGlobals:setWebappPath("G:/mnt/bc/mydev/work_automation/automation/run/")
        URLGLOBALS.init(appUrlGlobals)
        WebappClassLoaderInfo.setLoader(getmetatable(appUrlGlobals):getClassLoader())
        EventQueue.invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    logUtil:putF("Running", self, commonStrings.RUN)
                    InputAutomationJFrame.INPUTAUTOMATION_JFRAME = InputAutomationJFrame.new()
                    InputRobotFactory.getInstance():addListener(InputAutomationJFrame.getInstance())
                    if inputAutomationBundleActivatorListenerInterface ~= nil then
                        inputAutomationBundleActivatorListenerInterface:registerAsService()
                        inputAutomationBundleActivatorListenerInterface:useServices()
                    end
                    InputAutomationJFrame.INPUTAUTOMATION_JFRAME:setVisible(true)
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)())
end


-- throws Exception
function InputAutomationJFrame.main(args)
        InputAutomationJFrame.create(nil)
end


function InputAutomationJFrame:getAutomationModuleConfigurationJPanel()
        return self.automationModuleConfigurationJPanel
end
java_overload(InputAutomationJFrame, "getAutomationModuleConfigurationJPanel", 0)


function InputAutomationJFrame:setAutomationModuleConfigurationJPanel(automationModuleConfigurationJPanel)
        self.automationModuleConfigurationJPanel = automationModuleConfigurationJPanel
end
java_overload(InputAutomationJFrame, "setAutomationModuleConfigurationJPanel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPanel")) end)


function InputAutomationJFrame:onAdd_j1_1(inputAutomationRobotChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onAdd")
            InputRobotFactory.getInstance():add(inputAutomationRobotChangeEvent:getInputAutomationRobotInterfaceWrapper():getInputRobotInterface())
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onAdd", e)
        end
end


function InputAutomationJFrame:onRemove_j1_1(inputAutomationRobotChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onRemove")
            InputRobotFactory.getInstance():add(inputAutomationRobotChangeEvent:getInputAutomationRobotInterfaceWrapper():getInputRobotInterface())
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onRemove", e)
        end
end


function InputAutomationJFrame:onAdd_j1_2(inputAutomationConfigurationChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onAdd")
            self.inputAutomationModuleConfigurations:add(inputAutomationConfigurationChangeEvent:getInputAutomationModuleConfiguration())
            self:init()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onAdd", e)
        end
end
function InputAutomationJFrame:onAdd(...)
    local count = select("#", ...)
    if count == 1 then return self:onAdd_j1(...) end
    error("No method onAdd takes " .. count .. " arguments")
end
InputAutomationJFrame.onAdd__jdispatcher = InputAutomationJFrame.onAdd
function InputAutomationJFrame:onAdd_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "InputAutomationRobotChangeEvent")) then return InputAutomationJFrame.onAdd_j1_1(self, ...) end
    return InputAutomationJFrame.onAdd_j1_2(self, ...)
end


function InputAutomationJFrame:onRemove_j1_2(inputAutomationConfigurationChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onRemove")
            local inputAutomationConfiguration = InputAutomationConfigurationFactory.getInstance().inputAutomationConfiguration
            local inputAutomationModuleConfigurationList = inputAutomationConfiguration:getInputAutomationModuleConfigurationList()
            if inputAutomationModuleConfigurationList == nil then
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                logUtil:putF("inputAutomationModuleConfigurationList: " .. tostring(inputAutomationModuleConfigurationList), self, commonStrings.INIT)
                error(require("java.lang.Exception").new(), 0)
            end
            local inputAutomationModuleConfigurations = InputAutomationModuleConfigurations.new(inputAutomationConfiguration:getInputAutomationModuleConfigurationList())
            inputAutomationModuleConfigurations:remove(inputAutomationConfigurationChangeEvent:getInputAutomationModuleConfiguration())
            self:init()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onRemove", e)
        end
end
function InputAutomationJFrame:onRemove(...)
    local count = select("#", ...)
    if count == 1 then return self:onRemove_j1(...) end
    error("No method onRemove takes " .. count .. " arguments")
end
InputAutomationJFrame.onRemove__jdispatcher = InputAutomationJFrame.onRemove
function InputAutomationJFrame:onRemove_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "InputAutomationRobotChangeEvent")) then return InputAutomationJFrame.onRemove_j1_1(self, ...) end
    return InputAutomationJFrame.onRemove_j1_2(self, ...)
end

InputAutomationJFrame.INPUTAUTOMATION_JFRAME = nil

return InputAutomationJFrame

