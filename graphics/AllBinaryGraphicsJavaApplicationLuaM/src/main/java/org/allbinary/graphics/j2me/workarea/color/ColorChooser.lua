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
-- package org.allbinary.graphics.j2me.workarea.color

local JPanel = require("org.allbinary.graphics.j2me.workarea.color.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorChooser = {}
ColorChooser.__index = ColorChooser
ColorChooser.className = "ColorChooser"
setmetatable(ColorChooser, {__index = JPanel})

function ColorChooser:_init_fields()
    self.jColorChooser1 = nil
end


function ColorChooser.new()
    local self = setmetatable(JPanel.new(), ColorChooser)
    self:_init_fields()
        self:initComponents()
    return self
end


function ColorChooser:initComponents()
        self.jColorChooser1 = JColorChooser.new()
        self:setLayout(BorderLayout.new())
        self:add(self.jColorChooser1, java.awt.BorderLayout.CENTER)
end

return ColorChooser

