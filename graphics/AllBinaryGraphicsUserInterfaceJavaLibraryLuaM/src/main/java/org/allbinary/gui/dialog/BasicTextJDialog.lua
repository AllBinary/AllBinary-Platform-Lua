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

local BasicTextJDialog = {}
BasicTextJDialog.__index = BasicTextJDialog
BasicTextJDialog.className = "BasicTextJDialog"
setmetatable(BasicTextJDialog, {__index = JDialog})

function BasicTextJDialog:_init_fields()
    self.closeListenerInterface = nil
    self.jButton1 = nil
    self.textJLabel = nil
end

function BasicTextJDialog.new(...)
    local count = select("#", ...)
    if count == 3 then return BasicTextJDialog._new3(...)
    elseif count == 1 then return BasicTextJDialog._new1(...)
    end
end


function BasicTextJDialog._new3(parent, modal, text)
    local self = setmetatable(JDialog.new(parent, modal), BasicTextJDialog)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self:setText(text)
    return self
end


function BasicTextJDialog:setText(text)
        self.textJLabel:setText(text)
end


function BasicTextJDialog:addCloseListener(closeListenerInterface)
        self.closeListenerInterface = closeListenerInterface
end


function BasicTextJDialog._new1(text)
    local self = setmetatable(JDialog.new(), BasicTextJDialog)
    self:_init_fields()
        self:initComponents()
        self.textJLabel:setText(text)
    return self
end


function BasicTextJDialog:initComponents()
        self.jButton1 = JButton.new()
        self.textJLabel = JLabel.new()
        self:setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE)
        self.jButton1:setText("OK")
        self.jButton1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButton1ActionPerformed(evt)
            end
            return o
        end)())
        self.textJLabel:setText("No Text Set")
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGap(80, 80, 80):addComponent(self.jButton1)):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.textJLabel, javax.swing.GroupLayout.DEFAULT_SIZE, 184, Short.MAX_VALUE))):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGap(20, 20, 20):addComponent(self.textJLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE):addGap(30, 30, 30):addComponent(self.jButton1)))
        self:pack()
end


function BasicTextJDialog:jButton1ActionPerformed(evt)
        self:setVisible(false)
        if self.closeListenerInterface ~= nil then
            self.closeListenerInterface:onClose()
        end
end


function BasicTextJDialog.main(args)
        java.awt.EventQueue:invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                BasicTextJDialog.new(JFrame.new(), true, "Test"):setVisible(true)
            end
            return o
        end)())
end

return BasicTextJDialog

