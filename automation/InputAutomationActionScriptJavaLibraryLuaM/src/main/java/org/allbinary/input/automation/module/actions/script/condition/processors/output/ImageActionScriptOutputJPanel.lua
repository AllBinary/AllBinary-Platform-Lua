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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local swing = require("javax.swing")
local InputImageType = require("org.allbinary.input.media.image.InputImageType")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.JPanel")

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

local ImageActionScriptOutputJPanel = {}
ImageActionScriptOutputJPanel.__index = ImageActionScriptOutputJPanel
ImageActionScriptOutputJPanel.className = "ImageActionScriptOutputJPanel"
setmetatable(ImageActionScriptOutputJPanel, {__index = JPanel})

function ImageActionScriptOutputJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.capturedImageActionScriptOutputInterface = nil
    self.capturedImageActionJButton = nil
    self.capturedImageActionJDialog = nil
    self.displayJCheckBox = nil
    self.itemTypesJList = nil
    self.jLabel1 = nil
    self.jScrollPane1 = nil
    self.okJButton = nil
    self.saveJCheckBox = nil
    self.titleJLabel = nil
end


function ImageActionScriptOutputJPanel.new(capturedImageActionScriptOutputInterface)
    local self = setmetatable(JPanel.new(), ImageActionScriptOutputJPanel)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.capturedImageActionScriptOutputInterface = capturedImageActionScriptOutputInterface
        self:set()
    return self
end


function ImageActionScriptOutputJPanel:set()
        self:setImageTypeJlistModel()
        local imageTypes = self.capturedImageActionScriptOutputInterface:getImageTypes()
        local vector = imageTypes:getVector()
        local selectedArray = java_new_array(0, vector:size())
        local size = vector:size()
        for index = 0, size - 1 do
            local imageType = vector:get(index)
            selectedArray[(function() local value = index index = value + 1 return value end)() + 1] = imageType:getIndex()
        end
        self.itemTypesJList:setSelectedIndices(selectedArray)
        if self.capturedImageActionScriptOutputInterface:isSaved() then
            self.saveJCheckBox:setSelected(true)
        end
        if self.capturedImageActionScriptOutputInterface:isSaved() then
            self.displayJCheckBox:setSelected(true)
        end
        self.capturedImageActionScriptOutputInterface:log()
end


function ImageActionScriptOutputJPanel:update()
        local anyType = self.itemTypesJList:getSelectedValues()
        local imageTypes = ImageTypes.valueOf(anyType)
        self.capturedImageActionScriptOutputInterface:setImageTypes(imageTypes)
        if self.saveJCheckBox:isSelected() then
            self.capturedImageActionScriptOutputInterface:setSaved(true)
        else
            self.capturedImageActionScriptOutputInterface:setSaved(false)
        end
        if self.displayJCheckBox:isSelected() then
            self.capturedImageActionScriptOutputInterface:setDisplay(true)
        else
            self.capturedImageActionScriptOutputInterface:setDisplay(false)
        end
        self.capturedImageActionScriptOutputInterface:log()
end


function ImageActionScriptOutputJPanel:setImageTypeJlistModel()
        local defaultListModel = DefaultListModel.new()
        local vector = InputImageType.getAllAsVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local imageType = vector:get(index)
            defaultListModel:addElement(imageType:getName())
        end
        self.itemTypesJList:setModel(defaultListModel)
end


function ImageActionScriptOutputJPanel:getCapturedImageActionJDialog()
        return self.capturedImageActionJDialog
end


function ImageActionScriptOutputJPanel:setCapturedImageActionJDialog(capturedImageActionJDialog)
        self.capturedImageActionJDialog = capturedImageActionJDialog
end


function ImageActionScriptOutputJPanel:initComponents()
        self.capturedImageActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.okJButton = JButton.new()
        self.saveJCheckBox = JCheckBox.new()
        self.displayJCheckBox = JCheckBox.new()
        self.jScrollPane1 = JScrollPane.new()
        self.itemTypesJList = JList.new()
        self.capturedImageActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.capturedImageActionJDialog:setMinimumSize(Dimension.new(250, 250))
        self.titleJLabel:setText("Image Output Options")
        self.okJButton:setText("OK")
        self.okJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.saveJCheckBox:setText("Save To File")
        self.saveJCheckBox:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.saveJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.displayJCheckBox:setText("Display")
        self.displayJCheckBox:setBorder(javax.swing.BorderFactory:createEmptyBorder(0, 0, 0, 0))
        self.displayJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.displayJCheckBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:displayJCheckBoxActionPerformed(evt)
            end
            return o
        end)())
        self.itemTypesJList:setModel((function()
            local o = AbstractListModel.new and AbstractListModel.new() or setmetatable({}, {__index = AbstractListModel})
            self.strings = {"Item 1", "Item 2", "Item 3", "Item 4", "Item 5"}
            

            function o:getSize()
                return (strings.n or #strings)
            end
            

            function o:getElementAt(i)
                return strings[i + 1]
            end
            return o
        end)())
        self.jScrollPane1:setViewportView(self.itemTypesJList)
        local capturedImageActionJDialogLayout = GroupLayout.new(self.capturedImageActionJDialog:getContentPane())
        self.capturedImageActionJDialog:getContentPane():setLayout(capturedImageActionJDialogLayout)
        capturedImageActionJDialogLayout:setHorizontalGroup(capturedImageActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addGroup(capturedImageActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addGap(61, 61, 61):addComponent(self.titleJLabel)):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(capturedImageActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.displayJCheckBox):addComponent(self.saveJCheckBox, javax.swing.GroupLayout.Alignment.TRAILING)):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addGap(84, 84, 84):addComponent(self.okJButton)))):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 216, Short.MAX_VALUE))):addContainerGap()))
        capturedImageActionJDialogLayout:setVerticalGroup(capturedImageActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addGap(5, 5, 5):addComponent(self.jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 105, Short.MAX_VALUE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.saveJCheckBox):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.displayJCheckBox):addGap(9, 9, 9):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.capturedImageActionJButton:setText("Edit")
        self.capturedImageActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:capturedImageActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Capture Image:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.capturedImageActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.capturedImageActionJButton)))
end


function ImageActionScriptOutputJPanel:displayJCheckBoxActionPerformed(evt)
end


function ImageActionScriptOutputJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getCapturedImageActionJDialog():setVisible(false)
end


function ImageActionScriptOutputJPanel:capturedImageActionJButtonActionPerformed(evt)
        self:getCapturedImageActionJDialog():setVisible(true)
end

return ImageActionScriptOutputJPanel

