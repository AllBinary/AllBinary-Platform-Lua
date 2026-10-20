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
-- package org.allbinary.image.gui

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.image.gui.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageJPanel = {}
ImageJPanel.__index = ImageJPanel
ImageJPanel.className = "ImageJPanel"
setmetatable(ImageJPanel, {__index = JPanel})

function ImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.isDrawn = false
    self.bufferedImage = nil
end


function ImageJPanel.new(bufferedImage)
    local self = setmetatable(JPanel.new(), ImageJPanel)
    self:_init_fields()
        self:initComponents()
        self.bufferedImage = bufferedImage
        self:setSize(self.bufferedImage:getWidth(nil), self.bufferedImage:getHeight(nil))
    return self
end


function ImageJPanel:paint(graphics)
        if not self.isDrawn then
            self.logUtil:putF(self.commonStrings.START, self, self.canvasStrings.PAINT)
            graphics:drawImage(self.bufferedImage, 0, 0, self.bufferedImage:getWidth(nil), self.bufferedImage:getHeight(nil), nil)
            self.isDrawn = true
        end
end


function ImageJPanel:initComponents()
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 400, Short.MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 300, Short.MAX_VALUE))
end

return ImageJPanel

