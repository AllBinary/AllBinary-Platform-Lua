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

local ImageAnalysisResults = require("org.allbinary.media.image.analysis.ImageAnalysisResults")
local ImageColorRangeResults = require("org.allbinary.media.image.analysis.ImageColorRangeResults")
local ImageColorResults = require("org.allbinary.media.image.analysis.ImageColorResults")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
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

local ImageAnalysisResultsJPanel = {}
ImageAnalysisResultsJPanel.__index = ImageAnalysisResultsJPanel
ImageAnalysisResultsJPanel.className = "ImageAnalysisResultsJPanel"
setmetatable(ImageAnalysisResultsJPanel, {__index = JPanel})

function ImageAnalysisResultsJPanel:_init_fields()
    self.avgBlueJTextField = nil
    self.avgGreenJTextField = nil
    self.avgRedJTextField = nil
    self.jComboBox1 = nil
    self.jLabel1 = nil
    self.jLabel10 = nil
    self.jLabel11 = nil
    self.jLabel12 = nil
    self.jLabel13 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jLabel4 = nil
    self.jLabel5 = nil
    self.jLabel6 = nil
    self.jLabel7 = nil
    self.jLabel8 = nil
    self.jLabel9 = nil
    self.matchingPixelsJTextField = nil
    self.maxBlueJTextField = nil
    self.maxGreenJTextField = nil
    self.maxRedJTextField = nil
    self.minBlueJTextField = nil
    self.minGreenJTextField = nil
    self.minRedJTextField = nil
    self.percentMatchingJTextField = nil
    self.totalPixelsJTextField = nil
end


function ImageAnalysisResultsJPanel.new(imageAnalysisResultsArray)
    local self = setmetatable(JPanel.new(), ImageAnalysisResultsJPanel)
    self:_init_fields()
        self:initComponents()
        local imageAnalysisResults = imageAnalysisResultsArray[1]
        self:updateImageColorRangeResults(imageAnalysisResults)
    return self
end


function ImageAnalysisResultsJPanel:initComponents()
        self.jLabel1 = JLabel.new()
        self.jLabel2 = JLabel.new()
        self.jLabel3 = JLabel.new()
        self.percentMatchingJTextField = JTextField.new()
        self.totalPixelsJTextField = JTextField.new()
        self.matchingPixelsJTextField = JTextField.new()
        self.jComboBox1 = JComboBox.new()
        self.jLabel4 = JLabel.new()
        self.jLabel5 = JLabel.new()
        self.jLabel6 = JLabel.new()
        self.jLabel7 = JLabel.new()
        self.avgRedJTextField = JTextField.new()
        self.avgGreenJTextField = JTextField.new()
        self.avgBlueJTextField = JTextField.new()
        self.minGreenJTextField = JTextField.new()
        self.jLabel8 = JLabel.new()
        self.jLabel9 = JLabel.new()
        self.jLabel10 = JLabel.new()
        self.minRedJTextField = JTextField.new()
        self.minBlueJTextField = JTextField.new()
        self.jLabel11 = JLabel.new()
        self.jLabel12 = JLabel.new()
        self.jLabel13 = JLabel.new()
        self.maxRedJTextField = JTextField.new()
        self.maxGreenJTextField = JTextField.new()
        self.maxBlueJTextField = JTextField.new()
        self.jLabel1:setText("Matching Pixels:")
        self.jLabel2:setText("Total Pixels:")
        self.jLabel3:setText("Percent Matching:")
        self.percentMatchingJTextField:setEditable(false)
        self.totalPixelsJTextField:setEditable(false)
        self.matchingPixelsJTextField:setEditable(false)
        self.jComboBox1:setModel(DefaultComboBoxModel.new({CommonPhoneStrings.getInstance().ONE}))
        self.jComboBox1:setEnabled(false)
        self.jLabel4:setText("Image:")
        self.jLabel5:setText("Average Red:")
        self.jLabel6:setText("Average Green:")
        self.jLabel7:setText("Average Blue:")
        self.avgRedJTextField:setEditable(false)
        self.avgGreenJTextField:setEditable(false)
        self.avgBlueJTextField:setEditable(false)
        self.minGreenJTextField:setEditable(false)
        self.jLabel8:setText("Min Red:")
        self.jLabel9:setText("Min Green:")
        self.jLabel10:setText("Min Blue:")
        self.minRedJTextField:setEditable(false)
        self.minBlueJTextField:setEditable(false)
        self.jLabel11:setText("Max Red:")
        self.jLabel12:setText("Max Green:")
        self.jLabel13:setText("Max Blue:")
        self.maxRedJTextField:setEditable(false)
        self.maxGreenJTextField:setEditable(false)
        self.maxBlueJTextField:setEditable(false)
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel3):addComponent(self.jLabel2):addComponent(self.jLabel1):addComponent(self.jLabel5):addComponent(self.jLabel6):addComponent(self.jLabel7):addComponent(self.jLabel4)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.avgBlueJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 81, Short.MAX_VALUE):addComponent(self.avgGreenJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 81, Short.MAX_VALUE):addComponent(self.avgRedJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 81, Short.MAX_VALUE):addComponent(self.totalPixelsJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 81, Short.MAX_VALUE):addComponent(self.percentMatchingJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 81, Short.MAX_VALUE):addComponent(self.matchingPixelsJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 81, Short.MAX_VALUE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel12):addComponent(self.jLabel13):addComponent(self.jLabel8):addComponent(self.jLabel9):addComponent(self.jLabel10):addComponent(self.jLabel11)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.minRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.maxGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.minGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.minBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.maxRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.maxBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)):addContainerGap(18, Short.MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel4):addComponent(self.jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.matchingPixelsJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel8):addComponent(self.minRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel2):addComponent(self.totalPixelsJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel9):addComponent(self.minGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel3):addComponent(self.percentMatchingJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel10):addComponent(self.minBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel5):addComponent(self.avgRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel11):addComponent(self.maxRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel6):addComponent(self.avgGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.maxGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel12)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel7):addComponent(self.avgBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel13):addComponent(self.maxBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
end


function ImageAnalysisResultsJPanel:updateImageColorRangeResults(imageAnalysisResults)
        local imageColorRangeResults = imageAnalysisResults:getImageColorRangeResults()
        self.matchingPixelsJTextField:setText(tostring(imageColorRangeResults:getMatchingPixelsChecked()))
        self.totalPixelsJTextField:setText(tostring(imageColorRangeResults:getTotalPixelsChecked()))
        self.percentMatchingJTextField:setText(tostring(imageColorRangeResults:getPercent()))
        local imageColorResults = imageAnalysisResults:getImageColorResults()
        self.avgRedJTextField:setText(tostring(imageColorResults:getColorAverage():getAvgRed()))
        self.avgGreenJTextField:setText(tostring(imageColorResults:getColorAverage():getAvgGreen()))
        self.avgBlueJTextField:setText(tostring(imageColorResults:getColorAverage():getAvgBlue()))
        self.minRedJTextField:setText(tostring(imageColorResults:getColorRange():getMinRed()))
        self.minGreenJTextField:setText(tostring(imageColorResults:getColorRange():getMinGreen()))
        self.minBlueJTextField:setText(tostring(imageColorResults:getColorRange():getMinBlue()))
        self.maxRedJTextField:setText(tostring(imageColorResults:getColorRange():getMaxRed()))
        self.maxGreenJTextField:setText(tostring(imageColorResults:getColorRange():getMaxGreen()))
        self.maxBlueJTextField:setText(tostring(imageColorResults:getColorRange():getMaxBlue()))
end

return ImageAnalysisResultsJPanel

