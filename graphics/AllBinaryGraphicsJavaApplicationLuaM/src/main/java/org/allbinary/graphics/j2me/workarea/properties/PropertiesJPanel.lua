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
-- package org.allbinary.graphics.j2me.workarea.properties

-- local swing = require("javax.swing")
local JPanel = require("org.allbinary.graphics.j2me.workarea.properties.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PropertiesJPanel = {}
PropertiesJPanel.__index = PropertiesJPanel
PropertiesJPanel.className = "PropertiesJPanel"
setmetatable(PropertiesJPanel, {__index = JPanel})

function PropertiesJPanel:_init_fields()
    self.rotateJButton = nil
    self.copyVerticalJButton = nil
    self.leftJButton = nil
    self.rotateJPanel = nil
    self.angleJTextField = nil
    self.workAreaPropertiesJPanel = nil
    self.modifierJPanel = nil
    self.upJButton = nil
    self.jPanel8 = nil
    self.downJButton = nil
    self.jPanel7 = nil
    self.rightJButton = nil
    self.copyHorizontalJButton = nil
end


function PropertiesJPanel.new()
    local self = setmetatable(JPanel.new(), PropertiesJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function PropertiesJPanel:set(panel)
        self.workAreaPropertiesJPanel:add(panel)
        self:repaint()
end


function PropertiesJPanel:initComponents()
        self.workAreaPropertiesJPanel = JPanel.new()
        self.modifierJPanel = JPanel.new()
        self.copyVerticalJButton = JButton.new()
        self.copyHorizontalJButton = JButton.new()
        self.rotateJPanel = JPanel.new()
        self.rotateJButton = JButton.new()
        self.angleJTextField = JTextField.new()
        self.jPanel7 = JPanel.new()
        self.upJButton = JButton.new()
        self.downJButton = JButton.new()
        self.jPanel8 = JPanel.new()
        self.leftJButton = JButton.new()
        self.rightJButton = JButton.new()
        self:setLayout(GridLayout.new(2, 1))
        self.workAreaPropertiesJPanel:setLayout(GridLayout.new())
        self:add(self.workAreaPropertiesJPanel)
        self.modifierJPanel:setLayout(GridLayout.new(6, 0))
        self.copyVerticalJButton:setFont(Font.new("Dialog", 0, 10))
        self.copyVerticalJButton:setText("Copy Vertical")
        self.modifierJPanel:add(self.copyVerticalJButton)
        self.copyHorizontalJButton:setFont(Font.new("Dialog", 0, 10))
        self.copyHorizontalJButton:setText("Copy Horizontal")
        self.modifierJPanel:add(self.copyHorizontalJButton)
        self.rotateJPanel:setLayout(GridLayout.new(1, 2))
        self.rotateJButton:setFont(Font.new("Dialog", 0, 10))
        self.rotateJButton:setText("Rotate")
        self.rotateJPanel:add(self.rotateJButton)
        self.angleJTextField:setText("Angle")
        self.rotateJPanel:add(self.angleJTextField)
        self.modifierJPanel:add(self.rotateJPanel)
        self.jPanel7:setLayout(GridLayout.new(1, 2))
        self.upJButton:setFont(Font.new("Dialog", 0, 10))
        self.upJButton:setText("Up")
        self.jPanel7:add(self.upJButton)
        self.downJButton:setFont(Font.new("Dialog", 0, 10))
        self.downJButton:setText("Down")
        self.jPanel7:add(self.downJButton)
        self.modifierJPanel:add(self.jPanel7)
        self.jPanel8:setLayout(GridLayout.new(1, 2))
        self.leftJButton:setFont(Font.new("Dialog", 0, 10))
        self.leftJButton:setText("Left")
        self.jPanel8:add(self.leftJButton)
        self.rightJButton:setFont(Font.new("Dialog", 0, 10))
        self.rightJButton:setText("Right")
        self.jPanel8:add(self.rightJButton)
        self.modifierJPanel:add(self.jPanel8)
        self:add(self.modifierJPanel)
end

return PropertiesJPanel

