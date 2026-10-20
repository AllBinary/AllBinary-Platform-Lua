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
-- local RenderedImage = require("java.awt.image.RenderedImage")
-- local File = require("java.io.File")
-- local ImageIO = require("javax.imageio.ImageIO")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ImageJ2SERotationUtil = require("org.allbinary.media.image.ImageJ2SERotationUtil")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = require("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageStrings = require("org.allbinary.media.image.ImageStrings")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.image.gui.JPanel")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local RotationSpriteImageJPanel = {}
RotationSpriteImageJPanel.__index = RotationSpriteImageJPanel
RotationSpriteImageJPanel.className = "RotationSpriteImageJPanel"
setmetatable(RotationSpriteImageJPanel, {__index = JPanel})

function RotationSpriteImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    self.imageProcessorInput = nil
    self.result = nil
    self.generateJButton = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jPanel1 = nil
    self.jPanel2 = nil
    self.jPanel3 = nil
    self.totalAngleJComboBox = nil
    self.totalFramesJComboBox = nil
    self.writeOverOriginalJCheckBox = nil
end


function RotationSpriteImageJPanel.new(imageProcessorInput)
    local self = setmetatable(JPanel.new(), RotationSpriteImageJPanel)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
    return self
end


function RotationSpriteImageJPanel:process()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local generatedBufferedImageArray = nil
                    local imageProcessorInput = self:getImageProcessorInput()
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
                        local totalFrames = tostring(self.totalFramesJComboBox:getSelectedItem())
                        local totalAngle = tostring(self.totalAngleJComboBox:getSelectedItem())
                        generatedBufferedImageArray = ImageJ2SERotationUtil.getInstance():getRotatedImages(bufferedImageArray[index + 1], totalFrames, totalAngle)
                        self.result = ImageJ2SERotationUtil.getInstance():createSpriteImage(generatedBufferedImageArray)
                        self:getParent():repaint()
                        local file = imageProcessorInput:getFiles()[index + 1]
                        if not self.writeOverOriginalJCheckBox:isSelected() then
                            local filePath = file:getAbsolutePath()
                            local extensionIndex = ((string.find(filePath, self.imageStrings.PNG_EXTENSION, 1, true) or 0) - 1)
                            filePath = tostring(StringMaker.new():append(string.sub(filePath, (0) + 1, extensionIndex)):append(CommonSeps.getInstance().UNDERSCORE):append("sprite"):append(self.imageStrings.PNG_EXTENSION))
                            logUtil:putF("New File Path: " .. filePath, self, self.commonStrings.RUN)
                            file = File.new(filePath)
                        end
                        local isWritten = ImageIO.write(self.result, self.imageStrings.PNG, file)
                        logUtil:putF("File: " .. tostring(file) .. " Wrote: " .. tostring(isWritten), self, self.commonStrings.RUN)
                    end
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function RotationSpriteImageJPanel:initComponents()
        self.jPanel1 = (function()
            local o = JPanel.new and JPanel.new() or setmetatable({}, {__index = JPanel})
            

            function o:paint(graphics)
                if self.result ~= nil then
                    graphics:drawImage(self.result, 0, 0, self.result:getWidth(nil), self.result:getHeight(nil), nil)
                end
            end
            return o
        end)()
        self.jPanel2 = JPanel.new()
        self.totalFramesJComboBox = JComboBox.new()
        self.jLabel1 = JLabel.new()
        self.generateJButton = JButton.new()
        self.totalAngleJComboBox = JComboBox.new()
        self.jLabel3 = JLabel.new()
        self.writeOverOriginalJCheckBox = JCheckBox.new()
        self.jPanel3 = JPanel.new()
        self.jLabel2 = JLabel.new()
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(0, 436, Short.MAX_VALUE))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(0, 227, Short.MAX_VALUE))
        self.totalFramesJComboBox:setModel(DefaultComboBoxModel.new({CommonPhoneStrings.getInstance().FOUR, CommonPhoneStrings.getInstance().NINE, "18", "20", "36"}))
        self.jLabel1:setText("Total Frames:")
        self.generateJButton:setText("Generate")
        self.generateJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.totalAngleJComboBox:setModel(DefaultComboBoxModel.new({"360", "90"}))
        self.totalAngleJComboBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:totalAngleJComboBoxActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel3:setText("Total Angle:")
        self.writeOverOriginalJCheckBox:setText("Write Over Original")
        local jPanel2Layout = GroupLayout.new(self.jPanel2)
        self.jPanel2:setLayout(jPanel2Layout)
        jPanel2Layout:setHorizontalGroup(jPanel2Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(jPanel2Layout:createSequentialGroup():add(8, 8, 8):add(self.jLabel1):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(self.totalFramesJComboBox, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(self.jLabel3):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(self.totalAngleJComboBox, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(self.writeOverOriginalJCheckBox):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(self.generateJButton):addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        jPanel2Layout:setVerticalGroup(jPanel2Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(jPanel2Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE):add(self.jLabel1):add(self.totalFramesJComboBox, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):add(self.generateJButton):add(self.totalAngleJComboBox, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):add(self.jLabel3):add(self.writeOverOriginalJCheckBox)))
        self.jLabel2:setText("Results:")
        local jPanel3Layout = GroupLayout.new(self.jPanel3)
        self.jPanel3:setLayout(jPanel3Layout)
        jPanel3Layout:setHorizontalGroup(jPanel3Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(jPanel3Layout:createSequentialGroup():add(self.jLabel2):addContainerGap(377, Short.MAX_VALUE)))
        jPanel3Layout:setVerticalGroup(jPanel3Layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(self.jLabel2))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(org.jdesktop.layout.GroupLayout.TRAILING, self.jPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):add(layout:createSequentialGroup():addContainerGap():add(self.jPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addContainerGap()):add(self.jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        layout:setVerticalGroup(layout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(layout:createSequentialGroup():add(self.jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED):add(self.jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(self.jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
end


function RotationSpriteImageJPanel:generateJButtonActionPerformed(evt)
        self:process()
end


function RotationSpriteImageJPanel:totalAngleJComboBoxActionPerformed(evt)
end


function RotationSpriteImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end


function RotationSpriteImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end

return RotationSpriteImageJPanel

