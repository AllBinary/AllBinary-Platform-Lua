-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local Raster = require("java.awt.image.Raster")
-- local File = require("java.io.File")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local FileWrapperUtil = require("org.allbinary.logic.io.file.FileWrapperUtil")
local ImagePersistanceUtil = require("org.allbinary.media.image.ImagePersistanceUtil")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = require("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageUtil = require("org.allbinary.media.image.ImageUtil")
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

local ResizeImageJPanel = {}
ResizeImageJPanel.__index = ResizeImageJPanel
ResizeImageJPanel.className = "ResizeImageJPanel"
setmetatable(ResizeImageJPanel, {__index = JPanel})

function ResizeImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageProcessorInput = nil
    self.aboveJButton = nil
    self.adjustFor16AboveJButton = nil
    self.adjustFor16BelowJButton = nil
    self.floatPercentJTextField = nil
    self.jComboBox1 = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jTextField1 = nil
    self.jTextField2 = nil
    self.updateJButton = nil
end


function ResizeImageJPanel.new(imageProcessorInput)
    local self = setmetatable(JPanel.new(), ResizeImageJPanel)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
        local numberStringArray = java_new_array(nil, 101)
        numberStringArray[1] = tostring(-1)
        for index = 1, 100 - 1 do
            numberStringArray[index + 1] = tostring(index)
        end
        self.jComboBox1:setModel(DefaultComboBoxModel.new(numberStringArray))
        local araster = self.imageProcessorInput:getBufferedImageArray()[1]:getAlphaRaster()
        if araster == nil then
            print("there is no Alpha channel!!!!!!!!!")
        else
            print("Alpha channel found !")
        end
    return self
end


function ResizeImageJPanel:process()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local imageUtil = ImageUtil.getInstance()
                    local percent = tostring(self.jComboBox1:getSelectedItem())
                    local percentAsFloat = tonumber(self.floatPercentJTextField:getText())
                    local imageProcessorInput = self:getImageProcessorInput()
                    local files = imageProcessorInput:getFiles()
                    local generatedBufferedImageArray = nil
                    if math.tointeger(percentAsFloat // 1) ~= -1 then
                        generatedBufferedImageArray = imageUtil:createBufferedImage2(imageProcessorInput:getBufferedImageArray(), percentAsFloat, true)
                    elseif math.tointeger(percent // 1) ~= -1 then
                        generatedBufferedImageArray = imageUtil:createBufferedImageForResize(imageProcessorInput:getBufferedImageArray(), percent, true)
                    else
                        local width = tostring(self.jTextField1:getText())
                        local height = tostring(self.jTextField2:getText())
                        generatedBufferedImageArray = imageUtil:createBufferedImage3(imageProcessorInput:getBufferedImageArray(), width, height, true)
                    end
                    local araster = generatedBufferedImageArray[1]:getAlphaRaster()
                    if araster == nil then
                        print("No Alpha Channel In Result")
                    else
                        print("Found Alpha Channel In Result")
                    end
                    local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
                    for index = 0, (generatedBufferedImageArray.n or #generatedBufferedImageArray) - 1 do
                        imagePersistanceUtil:saveWithBatik(FileWrapperUtil.wrapFile(files[index + 1]), generatedBufferedImageArray[index + 1])
                    end
                    self:getParent():repaint()
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function ResizeImageJPanel:update()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local imageProcessorInput = self:getImageProcessorInput()
                    local size = (imageProcessorInput:getBufferedImageArray().n or #imageProcessorInput:getBufferedImageArray())
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    local bufferedImage = nil
                    for index = 0, size - 1 do
                        bufferedImage = bufferedImageArray[1]
                        self.jTextField1:setText(tostring(bufferedImage:getWidth()))
                        self.jTextField2:setText(tostring(bufferedImage:getHeight()))
                    end
                    self:getParent():repaint()
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function ResizeImageJPanel:updateFor16Above()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local imageProcessorInput = self:getImageProcessorInput()
                    local size = (imageProcessorInput:getBufferedImageArray().n or #imageProcessorInput:getBufferedImageArray())
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    local bufferedImage = nil
                    for index = 0, size - 1 do
                        bufferedImage = bufferedImageArray[1]
                        self.jTextField1:setText(tostring(bufferedImage:getWidth() / 16 * 16))
                        self.jTextField2:setText(tostring(bufferedImage:getHeight() / 16 * 16))
                    end
                    self:getParent():repaint()
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function ResizeImageJPanel:updateFor16Below()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local imageProcessorInput = self:getImageProcessorInput()
                    local size = (imageProcessorInput:getBufferedImageArray().n or #imageProcessorInput:getBufferedImageArray())
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    local bufferedImage = nil
                    for index = 0, size - 1 do
                        bufferedImage = bufferedImageArray[1]
                        self.jTextField1:setText(tostring(((bufferedImage:getWidth() / 16) + 1) * 16))
                        self.jTextField2:setText(tostring(((bufferedImage:getHeight() / 16) + 1) * 16))
                    end
                    self:getParent():repaint()
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function ResizeImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end


function ResizeImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end


function ResizeImageJPanel:initComponents()
        self.jLabel1 = JLabel.new()
        self.jComboBox1 = JComboBox.new()
        self.aboveJButton = JButton.new()
        self.jTextField1 = JTextField.new()
        self.jLabel2 = JLabel.new()
        self.jLabel3 = JLabel.new()
        self.jTextField2 = JTextField.new()
        self.updateJButton = JButton.new()
        self.floatPercentJTextField = JTextField.new()
        self.adjustFor16AboveJButton = JButton.new()
        self.adjustFor16BelowJButton = JButton.new()
        self.jLabel1:setText("Percent:")
        self.jComboBox1:setModel(DefaultComboBoxModel.new({"Item 1", "Item 2", "Item 3", "Item 4"}))
        self.aboveJButton:setText("Process")
        self.aboveJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:aboveJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel2:setText("Width:")
        self.jLabel3:setText("Height:")
        self.updateJButton:setText("Update")
        self.updateJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:updateJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.floatPercentJTextField:setText("-1.000000")
        self.floatPercentJTextField:setMinimumSize(Dimension.new(120, 22))
        self.adjustFor16AboveJButton:setText("Adjust for 16 Above")
        self.adjustFor16AboveJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:adjustFor16AboveJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.adjustFor16BelowJButton:setText("Adjust for 16 Below")
        self.adjustFor16BelowJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:adjustFor16BelowJButtonActionPerformed(evt)
            end
            return o
        end)())
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel1):addComponent(self.jLabel2):addComponent(self.jLabel3)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false):addComponent(self.jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.jTextField1):addComponent(self.jTextField2)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.floatPercentJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.adjustFor16AboveJButton):addComponent(self.adjustFor16BelowJButton)):addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)):addGroup(layout:createSequentialGroup():addComponent(self.updateJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.aboveJButton):addGap(0, 250, Short.MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.floatPercentJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2):addComponent(self.adjustFor16AboveJButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel3):addComponent(self.jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.adjustFor16BelowJButton)):addGap(18, 18, 18):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.aboveJButton):addComponent(self.updateJButton)):addContainerGap(175, Short.MAX_VALUE)))
end


function ResizeImageJPanel:aboveJButtonActionPerformed(evt)
        self:process()
end


function ResizeImageJPanel:updateJButtonActionPerformed(evt)
        self:update()
end


function ResizeImageJPanel:adjustFor16AboveJButtonActionPerformed(evt)
        self:updateFor16Above()
end


function ResizeImageJPanel:adjustFor16BelowJButtonActionPerformed(evt)
        self:updateFor16Below()
end

return ResizeImageJPanel

