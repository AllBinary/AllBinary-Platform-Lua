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

local ARunnable = require("org.allbinary.thread.ARunnable")
-- local URI = require("java.net.URI")
-- local URL = require("java.net.URL")
-- local Desktop = require("java.awt.Desktop")
-- local List = require("java.util.List")
-- local ImageIcon = require("javax.swing.ImageIcon")
-- local JDialog = require("javax.swing.JDialog")
-- local HelpSet = require("javax.help.HelpSet")
-- local HelpSetEvent = require("javax.help.event.HelpSetEvent")
-- local HelpSetListener = require("javax.help.event.HelpSetListener")
local InputAutomationBundleActivatorListenerInterface = require("bundle.input.automation.InputAutomationBundleActivatorListenerInterface")
local InputAutomationConfigurationModuleChangeListener = require("bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener")
local InputAutomationRobotChangeListener = require("bundle.input.automation.robot.InputAutomationRobotChangeListener")
local AppUrlGlobals = require("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local BasicTextJDialog = require("org.allbinary.gui.dialog.BasicTextJDialog")
local JListSwingWorker = require("org.allbinary.gui.swing.workers.JListSwingWorker")
local InputAutomationConfiguration = require("org.allbinary.input.automation.configuration.InputAutomationConfiguration")
local InputAutomationConfigurationFactory = require("org.allbinary.input.automation.configuration.InputAutomationConfigurationFactory")
local InputAutomationConfigurationModuleChangeEvent = require("org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent")
local InputAutomationModuleFactoryFactory = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryFactory")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local InputAutomationModuleConfiguration = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local InputAutomationModuleConfigurations = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations")
local DesktopBundle = require("org.allbinary.input.automation.osgi.DesktopBundle")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local InputAutomationRobotChangeEvent = require("org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local JavaHelpUtil = require("org.allbinary.logic.java.help.JavaHelpUtil")
local WebappClassLoaderInfo = require("org.allbinary.logic.system.loader.WebappClassLoaderInfo")
local InputAutomationClientInformationFactory = require("org.allbinary.logic.system.security.licensing.InputAutomationClientInformationFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")
local JFrame = require("org.allbinary.input.automation.JFrame")

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

local InputAutomationJFrame = {}
InputAutomationJFrame.__index = InputAutomationJFrame
InputAutomationJFrame.className = "InputAutomationJFrame"
setmetatable(InputAutomationJFrame, {__index = JFrame})

function InputAutomationJFrame:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputAutomationModuleConfigurations = InputAutomationModuleConfigurations.new()
    self.inputAutomationModuleFactory = nil
    self.inputAutomationModuleInterface = nil
    self.runnableInterface = nil
    self.thread = nil
    self.helpSet = nil
    self.uri = URI.new("http://geocities.com/allbinary/")
    self.aboutJMenuItem = nil
    self.automationModuleConfigurationJPanel = nil
    self.gameRobotJTabbedPane = nil
    self.helpJMenuItem = nil
    self.inputAutomationModuleJList = nil
    self.inputAutomationModuleJPanel = nil
    self.jScrollPane1 = nil
    self.mainJMenuBar = nil
    self.modulesJMenuItem = nil
    self.noModuleSelectedJDialog = nil
    self.noModuleSelectedJLabel = nil
    self.optionsJMenu = nil
    self.processingJMenu = nil
    self.startJMenuItem = nil
    self.stopJMenuItem = nil
    self.stopOnFocusJCheckBoxMenuItem = nil
    self.subscriptionJMenuItem = nil
    self.toolsJMenu = nil
    self.updatesJMenuItem = nil
end


function InputAutomationJFrame.new()
    local self = setmetatable(JFrame.new(), InputAutomationJFrame)
    self:_init_fields()
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


function InputAutomationJFrame:helpSetAdded(helpSetEvent)
        self.helpSet:add(helpSetEvent:getHelpSet())
end


function InputAutomationJFrame:helpSetRemoved(helpSetEvent)
        self.helpSet:remove(helpSetEvent:getHelpSet())
end


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
        (JListSwingWorker.new(self.inputAutomationModuleJList, self.inputAutomationModuleFactory:getListModel())):execute()
        self.gameRobotJTabbedPane:setEnabledAt(1, false)
        self.gameRobotJTabbedPane:setSelectedIndex(0)
end


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
        noModuleSelectedJDialogLayout:setHorizontalGroup(noModuleSelectedJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(noModuleSelectedJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.noModuleSelectedJLabel):addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        noModuleSelectedJDialogLayout:setVerticalGroup(noModuleSelectedJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.noModuleSelectedJLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 48, Short.MAX_VALUE))
        self:setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE)
        self:setMinimumSize(Dimension.new(325, 215))
        self:setResizable(false)
        self:addWindowFocusListener((function()
            local o = WindowFocusListener.new and WindowFocusListener.new() or setmetatable({}, {__index = WindowFocusListener})
            

            function o:windowGainedFocus(evt)
                self:formWindowGainedFocus(evt)
            end
            

            function o:windowLostFocus(evt)
                self:formWindowLostFocus(evt)
            end
            return o
        end)())
        self:addFocusListener((function()
            local o = FocusAdapter.new and FocusAdapter.new() or setmetatable({}, {__index = FocusAdapter})
            

            function o:focusGained(evt)
                self:formFocusGained(evt)
            end
            

            function o:focusLost(evt)
                self:formFocusLost(evt)
            end
            return o
        end)())
        self.gameRobotJTabbedPane:setMinimumSize(Dimension.new(320, 200))
        self.inputAutomationModuleJList:setMinimumSize(Dimension.new(200, 0))
        self.inputAutomationModuleJList:addListSelectionListener((function()
            local o = ListSelectionListener.new and ListSelectionListener.new() or setmetatable({}, {__index = ListSelectionListener})
            

            function o:valueChanged(evt)
                self:inputAutomationModuleJListValueChanged(evt)
            end
            return o
        end)())
        self.jScrollPane1:setViewportView(self.inputAutomationModuleJList)
        local inputAutomationModuleJPanelLayout = GroupLayout.new(self.inputAutomationModuleJPanel)
        self.inputAutomationModuleJPanel:setLayout(inputAutomationModuleJPanelLayout)
        inputAutomationModuleJPanelLayout:setHorizontalGroup(inputAutomationModuleJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(inputAutomationModuleJPanelLayout:createSequentialGroup():addComponent(self.jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 199, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap(367, Short.MAX_VALUE)))
        inputAutomationModuleJPanelLayout:setVerticalGroup(inputAutomationModuleJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(inputAutomationModuleJPanelLayout:createSequentialGroup():addComponent(self.jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 330, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        self.gameRobotJTabbedPane:addTab("Modules", self.inputAutomationModuleJPanel)
        local automationModuleConfigurationJPanelLayout = GroupLayout.new(self.automationModuleConfigurationJPanel)
        self.automationModuleConfigurationJPanel:setLayout(automationModuleConfigurationJPanelLayout)
        automationModuleConfigurationJPanelLayout:setHorizontalGroup(automationModuleConfigurationJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 566, Short.MAX_VALUE))
        automationModuleConfigurationJPanelLayout:setVerticalGroup(automationModuleConfigurationJPanelLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 334, Short.MAX_VALUE))
        self.gameRobotJTabbedPane:addTab("Configuration", self.automationModuleConfigurationJPanel)
        self.processingJMenu:setText("Processing")
        self.processingJMenu:setToolTipText("Set module processing state")
        self.startJMenuItem:setText(self.commonStrings.START)
        self.startJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:startJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.startJMenuItem)
        self.stopJMenuItem:setText("Stop")
        self.stopJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:stopJMenuItemActionPerformed(evt)
            end
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
            return o
        end)())
        self.toolsJMenu:add(self.helpJMenuItem)
        self.updatesJMenuItem:setText("Updates")
        self.updatesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:updatesJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.toolsJMenu:add(self.updatesJMenuItem)
        self.subscriptionJMenuItem:setText("Subscription")
        self.subscriptionJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:subscriptionJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.toolsJMenu:add(self.subscriptionJMenuItem)
        self.modulesJMenuItem:setText("Module Manager")
        self.modulesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:modulesJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.toolsJMenu:add(self.modulesJMenuItem)
        self.aboutJMenuItem:setText("About")
        self.aboutJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:aboutJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.toolsJMenu:add(self.aboutJMenuItem)
        self.mainJMenuBar:add(self.toolsJMenu)
        self:setJMenuBar(self.mainJMenuBar)
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.gameRobotJTabbedPane, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 571, Short.MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.gameRobotJTabbedPane, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 359, Short.MAX_VALUE))
        self:pack()
end


function InputAutomationJFrame:subscriptionJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            Desktop.getDesktop():browse(self.uri)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "subscriptionJMenuItemActionPerformed", e)
        end
end


function InputAutomationJFrame:updatesJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            Desktop.getDesktop():browse(self.uri)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updatesJMenuItemActionPerformed", e)
        end
end


function InputAutomationJFrame:aboutJMenuItemActionPerformed(evt)
        local textJDialog = BasicTextJDialog.new("Copyright (c) 2002-2007 AllBinary")
        textJDialog:setVisible(true)
        textJDialog:setLocationRelativeTo(self)
end


function InputAutomationJFrame:modulesJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            DesktopBundle.new():start()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "modulesJMenuItemActionPerformed", e)
        end
end


function InputAutomationJFrame:helpJMenuItemActionPerformed(evt)
        JavaHelpUtil.getInstance():show(self.helpSet)
end


function InputAutomationJFrame:stopOnFocusJCheckBoxMenuItemActionPerformed(evt)
end


function InputAutomationJFrame:optionsJMenuActionPerformed(evt)
end


function InputAutomationJFrame:formWindowLostFocus(evt)
        self.logUtil:putF("Nothing", self, "focusLost")
end


function InputAutomationJFrame:formWindowGainedFocus(evt)
        if self.stopOnFocusJCheckBoxMenuItem:isSelected() then
            self.logUtil:putF("Stopping", self, "focusGained")
            if self.runnableInterface ~= nil then
                self.runnableInterface:setRunning(false)
            end
        end
end


function InputAutomationJFrame:formFocusLost(evt)
end


function InputAutomationJFrame:formFocusGained(evt)
end


function InputAutomationJFrame:inputAutomationModuleJListValueChanged(evt)
        local try_ok, try_error = pcall(function()
            local gameAutomationRobotModuleNameString = self.inputAutomationModuleJList:getSelectedValue()
            if gameAutomationRobotModuleNameString ~= nil then
                self.inputAutomationModuleInterface = self.inputAutomationModuleFactory:getInstance(gameAutomationRobotModuleNameString)
                self:getAutomationModuleConfigurationJPanel():removeAll()
                local layout = self:getAutomationModuleConfigurationJPanel():getLayout()
                layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 395, Short.MAX_VALUE):addComponent(self.inputAutomationModuleInterface:getConfigurationJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 256, Short.MAX_VALUE):addComponent(self.inputAutomationModuleInterface:getConfigurationJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                self.gameRobotJTabbedPane:setEnabledAt(1, true)
                self.logUtil:putF("Setting Module: " .. gameAutomationRobotModuleNameString .. " and Configuration JPanel", self, "gameAutomationRobotModuleJListValueChanged")
            else
                self.logUtil:putF("Module name was null", self, "gameAutomationRobotModuleJListValueChanged")
                self.gameRobotJTabbedPane:setEnabledAt(1, false)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "gameAutomationRobotModuleJListValueChanged", e)
        end
end


function InputAutomationJFrame:stopJMenuItemActionPerformed(evt)
        if self.runnableInterface ~= nil then
            self.runnableInterface:setRunning(false)
        else
            self.noModuleSelectedJDialog:setVisible(true)
            self.noModuleSelectedJDialog:setLocationRelativeTo(self)
        end
end


function InputAutomationJFrame:startJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "startJMenuItemActionPerformed")
            if self.inputAutomationModuleInterface ~= nil then
                self.runnableInterface = self.inputAutomationModuleInterface:getInstance()
                if self.runnableInterface ~= nil then
                    self.thread = Thread.new(self.runnableInterface)
                    self.thread:setPriority(Thread.MIN_PRIORITY + 1)
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "startJMenuItemActionPerformed", e)
        end
end


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
        self.URLGLOBALS:init(appUrlGlobals)
        WebappClassLoaderInfo.setLoader(getmetatable(appUrlGlobals):getClassLoader())
        java.awt.EventQueue:invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                local try_ok, try_error = pcall(function()
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
                    logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
                end
            end
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


function InputAutomationJFrame:setAutomationModuleConfigurationJPanel(automationModuleConfigurationJPanel)
        self.automationModuleConfigurationJPanel = automationModuleConfigurationJPanel
end


function InputAutomationJFrame:onAdd(inputAutomationRobotChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onAdd")
            InputRobotFactory.getInstance():add(inputAutomationRobotChangeEvent:getInputAutomationRobotInterfaceWrapper():getInputRobotInterface())
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onAdd", e)
        end
end


function InputAutomationJFrame:onRemove(inputAutomationRobotChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onRemove")
            InputRobotFactory.getInstance():add(inputAutomationRobotChangeEvent:getInputAutomationRobotInterfaceWrapper():getInputRobotInterface())
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onRemove", e)
        end
end


-- Java overloaded method: Lua keeps the last definition
function InputAutomationJFrame:onAdd(inputAutomationConfigurationChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onAdd")
            self.inputAutomationModuleConfigurations:add(inputAutomationConfigurationChangeEvent:getInputAutomationModuleConfiguration())
            self:init()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onAdd", e)
        end
end


-- Java overloaded method: Lua keeps the last definition
function InputAutomationJFrame:onRemove(inputAutomationConfigurationChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onRemove")
            local inputAutomationConfiguration = InputAutomationConfigurationFactory.getInstance().inputAutomationConfiguration
            local inputAutomationModuleConfigurationList = inputAutomationConfiguration:getInputAutomationModuleConfigurationList()
            if inputAutomationModuleConfigurationList == nil then
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                logUtil:putF("inputAutomationModuleConfigurationList: " .. tostring(inputAutomationModuleConfigurationList), self, commonStrings.INIT)
                error(java_exception("Exception"), 0)
            end
            local inputAutomationModuleConfigurations = InputAutomationModuleConfigurations.new(inputAutomationConfiguration:getInputAutomationModuleConfigurationList())
            inputAutomationModuleConfigurations:remove(inputAutomationConfigurationChangeEvent:getInputAutomationModuleConfiguration())
            self:init()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onRemove", e)
        end
end

InputAutomationJFrame.INPUTAUTOMATION_JFRAME = nil

return InputAutomationJFrame

