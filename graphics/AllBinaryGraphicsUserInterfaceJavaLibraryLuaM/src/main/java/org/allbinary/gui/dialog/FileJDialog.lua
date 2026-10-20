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

local ARunnable = require("org.allbinary.thread.ARunnable")
-- local File = require("java.io.File")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local JDialog = require("org.allbinary.gui.dialog.JDialog")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileJDialog = {}
FileJDialog.__index = FileJDialog
FileJDialog.className = "FileJDialog"
setmetatable(FileJDialog, {__index = JDialog})

function FileJDialog:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.finishedListenerInterface = nil
    self.jFileChooser1 = nil
end

function FileJDialog.new(...)
    local count = select("#", ...)
    if count == 0 then return FileJDialog._new0(...)
    elseif count == 2 then return FileJDialog._new2(...)
    end
end


function FileJDialog._new0()
    local self = setmetatable(JDialog.new(), FileJDialog)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self:getJFileChooser1():setMultiSelectionEnabled(true)
    return self
end


function FileJDialog._new2(parent, modal)
    local self = setmetatable(JDialog.new(parent, modal), FileJDialog)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self:getJFileChooser1():setMultiSelectionEnabled(true)
    return self
end


function FileJDialog:addFinishedListener(finishedListenerInterface)
        self.finishedListenerInterface = finishedListenerInterface
end


function FileJDialog:initComponents()
        self.jFileChooser1 = JFileChooser.new()
        self:setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE)
        self.jFileChooser1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jFileChooser1ActionPerformed(evt)
            end
            return o
        end)())
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(org.jdesktop.layout.GroupLayout.TRAILING, layout:createSequentialGroup():addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):add(self.jFileChooser1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(layout:createSequentialGroup():addContainerGap():add(self.jFileChooser1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 357, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        self:pack()
end


function FileJDialog:jFileChooser1ActionPerformed(evt)
        self.logUtil:putF("Starting Action Command: " .. tostring(evt:getActionCommand()), self, "ActionPerformed")
        local files = self:getJFileChooser1():getSelectedFiles()
        if evt:getActionCommand() == self:getJFileChooser1().CANCEL_SELECTION then
            self:setVisible(false)
        end
        if evt:getActionCommand() == self:getJFileChooser1().APPROVE_SELECTION then
            if files ~= nil and (files.n or #files) > 0 then
                self.finishedListenerInterface:onFiles(files)
            end
        end
end


function FileJDialog.main(args)
        java.awt.EventQueue:invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                FileJDialog.new(JFrame.new(), true):setVisible(true)
            end
            return o
        end)())
end


function FileJDialog:getJFileChooser1()
        return self.jFileChooser1
end


function FileJDialog:setJFileChooser1(jFileChooser1)
        self.jFileChooser1 = jFileChooser1
end

return FileJDialog

