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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local File = require("java.io.File")
-- local swing = require("javax.swing")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local FileWrapperUtil = require("org.allbinary.logic.io.file.FileWrapperUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ImagePersistanceUtil = require("org.allbinary.media.image.ImagePersistanceUtil")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = require("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageStrings = require("org.allbinary.media.image.ImageStrings")
local ImageUnifierCell = require("org.allbinary.media.image.ImageUnifierCell")
local ImageUnifierProperties = require("org.allbinary.media.image.ImageUnifierProperties")
local ImageUnifierUtil = require("org.allbinary.media.image.ImageUnifierUtil")
local ImageUtil = require("org.allbinary.media.image.ImageUtil")
local ImagesRatioUtil = require("org.allbinary.media.image.ImagesRatioUtil")
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

local ImageUnifierJPanel = {}
ImageUnifierJPanel.__index = ImageUnifierJPanel
ImageUnifierJPanel.className = "ImageUnifierJPanel"
setmetatable(ImageUnifierJPanel, {__index = JPanel})

function ImageUnifierJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    self.imagesRatioUtil = ImagesRatioUtil.getInstance()
    self.imageProcessorInput = nil
    self.icon = nil
    self.imageUnifierProperties = nil
    self.result = nil
    self.isImageFillIn = true
    self.avgRatioJTextField = nil
    self.cellHeightJTextField = nil
    self.cellRatioJTextField = nil
    self.cellWidthJTextField = nil
    self.columnsJTextField = nil
    self.downJButton = nil
    self.fudgeItJButton = nil
    self.imageJList = nil
    self.jButton1 = nil
    self.jButton2 = nil
    self.jButtonOrder = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jLabel4 = nil
    self.jLabel5 = nil
    self.jLabel6 = nil
    self.jPanel1 = nil
    self.jScrollPane1 = nil
    self.jScrollPane2 = nil
    self.rowsJTextField = nil
    self.upJButton = nil
end


function ImageUnifierJPanel.new(imageProcessorInput)
    local self = setmetatable(JPanel.new(), ImageUnifierJPanel)
    self:_init_fields()
        self:initComponents()
        self:setImageProcessorInput(imageProcessorInput)
    return self
end


function ImageUnifierJPanel:init()
        local try_ok, try_error = pcall(function()
            local imageProcessorInput = self:getImageProcessorInput()
            local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
            self.icon = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
            local defaultListModel = DefaultListModel.new()
            for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
                local width = bufferedImageArray[index + 1]:getWidth()
                local height = bufferedImageArray[index + 1]:getHeight()
                local newWidth = 52
                local oldRatio = width / height
                local newHeight = java_int(((newWidth + 0.0) / oldRatio))
                local iconBufferedImage = ImageUtil.getInstance():createBufferedImage(bufferedImageArray[index + 1], newWidth, newHeight, true)
                self.icon[index + 1] = ImageIconUnique.new(iconBufferedImage, index)
                defaultListModel:addElement(self.icon[index + 1])
            end
            self.imageJList:setModel(defaultListModel)
            self:updateOnPropertiesChange()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end


function ImageUnifierJPanel:updateImage()
        local try_ok, try_error = pcall(function()
            local bufferedImageArray = self:getImageProcessorInput():getBufferedImageArray()
            local tempBufferedImageArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
            for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
                local indexedImageIcon = self.imageJList:getModel():getElementAt(index)
                local bufferedImage = ImageUtil.getInstance():createBufferedImage(bufferedImageArray[indexedImageIcon:getId() + 1], self.imageUnifierProperties:getImageUnifierCell():getWidth(), self.imageUnifierProperties:getImageUnifierCell():getHeight(), false)
                tempBufferedImageArray[index + 1] = bufferedImage
            end
            local totalImages = self.imageUnifierProperties:getRows() * self.imageUnifierProperties:getColumns()
            local averageRatio = self.imagesRatioUtil:getAverage(tempBufferedImageArray, totalImages)
            local averageRatioString = tostring(averageRatio)
            if #averageRatioString > 4 then
                averageRatioString = string.sub(averageRatioString, (0) + 1, 4)
            end
            self.avgRatioJTextField:setText(averageRatioString)
            self.fudgeItJButton:setEnabled(false)
            if not self.imagesRatioUtil:isEqual(tempBufferedImageArray, totalImages) then
                if self.isImageFillIn then
                    self.fudgeItJButton:setEnabled(true)
                end
            end
            self:updateImage(tempBufferedImageArray)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateImage", e)
        end
end


function ImageUnifierJPanel:updateImageWithFudgedImages()
        local try_ok, try_error = pcall(function()
            local bufferedImageArray = self:getImageProcessorInput():getBufferedImageArray()
            local tempBufferedImageArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
            for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
                local indexedImageIcon = self.imageJList:getModel():getElementAt(index)
                local bufferedImage = ImageUtil.getInstance():createBufferedImage(bufferedImageArray[indexedImageIcon:getId() + 1], self.imageUnifierProperties:getImageUnifierCell():getWidth(), self.imageUnifierProperties:getImageUnifierCell():getHeight(), false)
                tempBufferedImageArray[index + 1] = bufferedImage
            end
            local totalImages = self.imageUnifierProperties:getRows() * self.imageUnifierProperties:getColumns()
            local averageRatio = self.imagesRatioUtil:getAverage(tempBufferedImageArray, totalImages)
            local fudgedBufferedImageArray = self.imagesRatioUtil:fudge(tempBufferedImageArray, totalImages, averageRatio)
            self:updateImage(fudgedBufferedImageArray)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateImageWithFudgedImages", e)
        end
end


-- Java overloaded method: Lua keeps the last definition
function ImageUnifierJPanel:updateImage(tempBufferedImageArray)
        self.result = ImageUnifierUtil.getInstance():getImage(tempBufferedImageArray, self.imageUnifierProperties)
        local image = ImageIcon.new(self.result)
        local label = JLabel.new(image)
        self.jScrollPane2:getViewport():add(label)
        self:updateUI()
end


function ImageUnifierJPanel:updateOnPropertiesChange()
        if self.rowsJTextField:getText():length() > 0 and self.columnsJTextField:getText():length() > 0 and self.cellWidthJTextField:getText():length() > 0 and self.cellHeightJTextField:getText():length() > 0 then
            self.imageUnifierProperties = ImageUnifierProperties.new()
            self.imageUnifierProperties:setRows(self.rowsJTextField:getText())
            self.imageUnifierProperties:setColumns(self.columnsJTextField:getText())
            local imageUnifierCell = ImageUnifierCell.new(self.cellWidthJTextField:getText(), self.cellHeightJTextField:getText())
            self.imageUnifierProperties:setImageUnifierCell(imageUnifierCell)
            local cellRatio = ((imageUnifierCell:getWidth() + 0.0) / imageUnifierCell:getHeight())
            local cellRatioString = tostring(cellRatio)
            if #cellRatioString > 4 then
                cellRatioString = string.sub(cellRatioString, (0) + 1, 4)
            end
            self.cellRatioJTextField:setText(cellRatioString)
            self:updateImage()
        end
end


function ImageUnifierJPanel:initComponents()
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        self.jScrollPane1 = JScrollPane.new()
        self.imageJList = JList.new()
        self.jScrollPane2 = JScrollPane.new()
        self.jPanel1 = JPanel.new()
        self.jButton1 = JButton.new()
        self.upJButton = JButton.new()
        self.downJButton = JButton.new()
        self.fudgeItJButton = JButton.new()
        self.jLabel2 = JLabel.new()
        self.columnsJTextField = JTextField.new()
        self.jLabel1 = JLabel.new()
        self.rowsJTextField = JTextField.new()
        self.jLabel3 = JLabel.new()
        self.cellWidthJTextField = JTextField.new()
        self.jLabel4 = JLabel.new()
        self.cellHeightJTextField = JTextField.new()
        self.jLabel5 = JLabel.new()
        self.cellRatioJTextField = JTextField.new()
        self.jLabel6 = JLabel.new()
        self.avgRatioJTextField = JTextField.new()
        self.jButton2 = JButton.new()
        self.jButtonOrder = JButton.new()
        self:setMinimumSize(Dimension.new(500, 375))
        self:setPreferredSize(Dimension.new(0, 0))
        self.imageJList:setMinimumSize(Dimension.new(50, 0))
        self.jScrollPane1:setViewportView(self.imageJList)
        self.jButton1:setText("Save")
        self.jButton1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButton1ActionPerformed(evt)
            end
            return o
        end)())
        self.upJButton:setText("Up")
        self.upJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:upJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.downJButton:setText("Down")
        self.downJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:downJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.fudgeItJButton:setText("Fudge It!")
        self.fudgeItJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:fudgeItJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel2:setText("Columns:")
        self.columnsJTextField:setText(commonPhoneStrings.TWO)
        self.columnsJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:columnsJTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.columnsJTextField:addPropertyChangeListener((function()
            local o = PropertyChangeListener.new and PropertyChangeListener.new() or setmetatable({}, {__index = PropertyChangeListener})
            

            function o:propertyChange(evt)
                self:columnsJTextFieldPropertyChange(evt)
            end
            return o
        end)())
        self.columnsJTextField:addKeyListener((function()
            local o = KeyAdapter.new and KeyAdapter.new() or setmetatable({}, {__index = KeyAdapter})
            

            function o:keyPressed(evt)
                self:columnsJTextFieldKeyPressed(evt)
            end
            

            function o:keyTyped(evt)
                self:columnsJTextFieldKeyTyped(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Rows:")
        self.rowsJTextField:setText(commonPhoneStrings.TWO)
        self.rowsJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:rowsJTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel3:setText("Cell Width:")
        self.cellWidthJTextField:setText("200")
        self.cellWidthJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:cellWidthJTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel4:setText("Cell Height:")
        self.cellHeightJTextField:setText("150")
        self.cellHeightJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:cellHeightJTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel5:setText("Cell Ratio:")
        self.cellRatioJTextField:setEditable(false)
        self.jLabel6:setText("Avg Image Ratio:")
        self.avgRatioJTextField:setEditable(false)
        self.jButton2:setText(self.commonStrings.UPDATE)
        self.jButton2:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButton2ActionPerformed(evt)
            end
            return o
        end)())
        self.jButtonOrder:setText("Order")
        self.jButtonOrder:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButtonOrderActionPerformed(evt)
            end
            return o
        end)())
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout:createSequentialGroup():addContainerGap():addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.upJButton, javax.swing.GroupLayout.PREFERRED_SIZE, 71, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 10, Short.MAX_VALUE):addComponent(self.downJButton, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)):addComponent(self.fudgeItJButton, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout:createSequentialGroup():addComponent(self.jLabel3):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 99, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout:createSequentialGroup():addComponent(self.jLabel4):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 96, javax.swing.GroupLayout.PREFERRED_SIZE)):addComponent(self.avgRatioJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addComponent(self.jLabel6, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addComponent(self.cellRatioJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addComponent(self.jLabel5, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addComponent(self.cellHeightJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addComponent(self.cellWidthJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addComponent(self.jButton2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE):addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout:createSequentialGroup():addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel2):addComponent(self.jLabel1)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.rowsJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 103, Short.MAX_VALUE):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.columnsJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 102, Short.MAX_VALUE):addGap(1, 1, 1)))):addComponent(self.jButtonOrder, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE)):addContainerGap()))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addContainerGap():addComponent(self.jButton1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.upJButton):addComponent(self.downJButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jButtonOrder):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.fudgeItJButton):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel2):addComponent(self.columnsJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.rowsJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel3):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.cellWidthJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel4):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.cellHeightJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jButton2):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel5):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.cellRatioJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addGap(7, 7, 7):addComponent(self.jLabel6):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.avgRatioJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addGap(66, 66, 66)))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 527, Short.MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.jPanel1, javax.swing.GroupLayout.Alignment.LEADING, 0, 445, Short.MAX_VALUE):addComponent(self.jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 445, Short.MAX_VALUE):addComponent(self.jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 445, Short.MAX_VALUE)):addContainerGap()))
end


function ImageUnifierJPanel:jButton2ActionPerformed(evt)
        self:updateOnPropertiesChange()
end


function ImageUnifierJPanel:columnsJTextFieldKeyPressed(evt)
end


function ImageUnifierJPanel:columnsJTextFieldKeyTyped(evt)
end


function ImageUnifierJPanel:columnsJTextFieldPropertyChange(evt)
end


function ImageUnifierJPanel:fudgeItJButtonActionPerformed(evt)
        self:updateImageWithFudgedImages()
end


function ImageUnifierJPanel:cellHeightJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end


function ImageUnifierJPanel:cellWidthJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end


function ImageUnifierJPanel:columnsJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end


function ImageUnifierJPanel:rowsJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end


function ImageUnifierJPanel:jButton1ActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            local fileArray = self.imageProcessorInput:getFiles()
            local file = fileArray[1]
            local filePath = file:getAbsolutePath()
            local extensionIndex = ((string.find(filePath, self.imageStrings.PNG_EXTENSION, 1, true) or 0) - 1)
            filePath = tostring(StringMaker.new():append(string.sub(filePath, (0) + 1, extensionIndex)):append(CommonSeps.getInstance().UNDERSCORE):appendint(java_int(self.imageUnifierProperties:getColumns())):append("_By_"):appendint(java_int(self.imageUnifierProperties:getRows())):append("_Unified"):append(self.imageStrings.PNG_EXTENSION))
            self.logUtil:putF("New File Path: " .. filePath, self, StringUtil.getInstance().EMPTY_STRING)
            local outputFile = File.new(filePath)
            ImagePersistanceUtil.getInstance():saveWithBatik(FileWrapperUtil.wrapFile(outputFile), self.result)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "jButton1ActionPerformed", e)
        end
end


function ImageUnifierJPanel:downJButtonActionPerformed(evt)
        local index = self.imageJList:getSelectedIndex()
        local defaultListModel = self.imageJList:getModel()
        if index >= 0 and index + 1 < defaultListModel:size() then
            local indexedImageIcon = defaultListModel:remove(index)
            defaultListModel:insertElementAt(indexedImageIcon, index + 1)
            self.imageJList:setSelectedIndex(index + 1)
            self:updateImage()
        end
end


function ImageUnifierJPanel:upJButtonActionPerformed(evt)
        local index = self.imageJList:getSelectedIndex()
        if index > 0 then
            local defaultListModel = self.imageJList:getModel()
            local indexedImageIcon = defaultListModel:remove(index)
            defaultListModel:insertElementAt(indexedImageIcon, index - 1)
            self.imageJList:setSelectedIndex(index - 1)
            self:updateImage()
        end
end


function ImageUnifierJPanel:jButtonOrderActionPerformed(evt)
        local defaultListModel = self.imageJList:getModel()
        local size = defaultListModel:size()
        local last = size - 1
        for index = last, 0, -1 do
            local indexedImageIcon = defaultListModel:remove(last)
            defaultListModel:insertElementAt(indexedImageIcon, last - index)
        end
        if size > 0 then
            self.imageJList:setSelectedIndex(0)
            self:updateImage()
        end
end


function ImageUnifierJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end


function ImageUnifierJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
        self:init()
end

return ImageUnifierJPanel

