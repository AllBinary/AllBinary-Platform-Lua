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

local ARunnable = require("org.allbinary.thread.ARunnable")
-- local HashMap = require("java.util.HashMap")
local HashMapJDialogListenerInterface = require("org.allbinary.gui.dialog.HashMapJDialogListenerInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JDialog = require("org.allbinary.graphics.j2me.dialog.JDialog")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RotateJDialog = {}
RotateJDialog.__index = RotateJDialog
RotateJDialog.className = "RotateJDialog"
setmetatable(RotateJDialog, {__index = JDialog})

function RotateJDialog:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = StdUtil.getInstance():createHashMap()
    self.angleIncrementJTextField = nil
    self.jButton1 = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jPanel1 = nil
    self.totalRotationJTextField = nil
end


function RotateJDialog.new(parent, modal)
    local self = setmetatable(JDialog.new(parent, modal), RotateJDialog)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
    return self
end


function RotateJDialog:initComponents()
        self.angleIncrementJTextField = JTextField.new()
        self.jLabel1 = JLabel.new()
        self.totalRotationJTextField = JTextField.new()
        self.jLabel2 = JLabel.new()
        self.jPanel1 = JPanel.new()
        self.jButton1 = JButton.new()
        self:setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE)
        self.angleIncrementJTextField:setText("36")
        self.jLabel1:setText("Angle Increment:")
        self.totalRotationJTextField:setText("360")
        self.jLabel2:setText("Total Angular Rotation:")
        self.jButton1:setText("OK")
        self.jButton1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButton1ActionPerformed(evt)
            end
            return o
        end)())
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addGap(62, 62, 62):addComponent(self.jButton1):addContainerGap(62, Short.MAX_VALUE)))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jButton1))
        local layout = GroupLayout.new(self:getContentPane())
        self:getContentPane():setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.jLabel1):addComponent(self.jLabel2)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.totalRotationJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE):addComponent(self.angleIncrementJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)):addContainerGap()):addComponent(self.jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.angleIncrementJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel1)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.totalRotationJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 16, Short.MAX_VALUE):addComponent(self.jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap()))
        self:pack()
end


function RotateJDialog:jButton1ActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.hashMap:put(tostring(0), tostring(self.angleIncrementJTextField:getText()))
            self.hashMap:put(tostring(1), tostring(self.totalRotationJTextField:getText()))
            (self:getParent()):onHashMap(self.hashMap)
            self:setVisible(false)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.EXCEPTION, self, "jButton1ActionPerformed")
        end
end


function RotateJDialog.main(args)
        java.awt.EventQueue:invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local dialog = RotateJDialog.new(JFrame.new(), true)
                dialog:addWindowListener((function()
                    local o = WindowAdapter.new and WindowAdapter.new() or setmetatable({}, {__index = WindowAdapter})
                    

                    function o:windowClosing(e)
                        os.exit(0)
                    end
                    return o
                end)())
                dialog:setVisible(true)
            end
            return o
        end)())
end

return RotateJDialog

