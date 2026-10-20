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
-- package org.allbinary.input.automation.module.configuration

local JPanel = require("org.allbinary.input.automation.module.configuration.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BlankModuleConfigurationJPanel = {}
BlankModuleConfigurationJPanel.__index = BlankModuleConfigurationJPanel
BlankModuleConfigurationJPanel.className = "BlankModuleConfigurationJPanel"
setmetatable(BlankModuleConfigurationJPanel, {__index = JPanel})

function BlankModuleConfigurationJPanel:_init_fields()
    self.jLabel1 = nil
end


function BlankModuleConfigurationJPanel.new()
    local self = setmetatable(JPanel.new(), BlankModuleConfigurationJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function BlankModuleConfigurationJPanel:initComponents()
        self.jLabel1 = JLabel.new()
        self.jLabel1:setText("No Configuration Available")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout:createSequentialGroup():addContainerGap(231, Short.MAX_VALUE):addComponent(self.jLabel1):addGap(225, 225, 225)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.jLabel1):addContainerGap(362, Short.MAX_VALUE)))
end

return BlankModuleConfigurationJPanel

