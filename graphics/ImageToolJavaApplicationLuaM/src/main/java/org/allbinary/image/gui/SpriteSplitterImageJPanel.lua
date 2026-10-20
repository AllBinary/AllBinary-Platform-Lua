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

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local RenderedImage = require("java.awt.image.RenderedImage")
-- local File = require("java.io.File")
-- local IOException = require("java.io.IOException")
-- local ImageIO = require("javax.imageio.ImageIO")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ImageProcessedVisitor = require("org.allbinary.media.image.ImageProcessedVisitor")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageStrings = require("org.allbinary.media.image.ImageStrings")
local SpriteSplitterUtil = require("org.allbinary.media.image.SpriteSplitterUtil")
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

local SpriteSplitterImageJPanel = {}
SpriteSplitterImageJPanel.__index = SpriteSplitterImageJPanel
SpriteSplitterImageJPanel.className = "SpriteSplitterImageJPanel"
setmetatable(SpriteSplitterImageJPanel, {__index = JPanel})

function SpriteSplitterImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    self.imageProcessorInput = nil
    self.result = nil
    self.generateJButton = nil
    self.heightReductionTextField = nil
    self.increaseHeightTextField = nil
    self.increaseWidthTextField = nil
    self.jLabel1 = nil
    self.jLabel2 = nil
    self.jLabel3 = nil
    self.jLabel4 = nil
    self.jLabel5 = nil
    self.jLabel6 = nil
    self.jLabel7 = nil
    self.jLabel8 = nil
    self.jPanel1 = nil
    self.jPanel2 = nil
    self.spriteTypeJComboBox = nil
    self.totalAnimationsJComboBox = nil
    self.totalFramesJComboBox = nil
    self.widthReductionTextField = nil
    self.writeOverOriginalJCheckBox = nil
end


function SpriteSplitterImageJPanel.new(imageProcessorInput)
    local self = setmetatable(JPanel.new(), SpriteSplitterImageJPanel)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
    return self
end


function SpriteSplitterImageJPanel:process()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local spriteSplitterUtil = SpriteSplitterUtil.getInstance()
                    local spriteType = self.spriteTypeJComboBox:getSelectedItem()
                    local totalFrames = tostring(self.totalFramesJComboBox:getSelectedItem())
                    local totalAnimations = tostring(self.totalAnimationsJComboBox:getSelectedItem())
                    local widthReduction = tostring(self.widthReductionTextField:getText())
                    local heightReduction = tostring(self.heightReductionTextField:getText())
                    local increaseWidth = tostring(self.increaseWidthTextField:getText())
                    local increaseHeight = tostring(self.increaseHeightTextField:getText())
                    spriteSplitterUtil:process(self:getImageProcessorInput(), totalFrames, totalAnimations, widthReduction, heightReduction, increaseWidth, increaseHeight, spriteType, self)
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function SpriteSplitterImageJPanel:initComponents()
        self.writeOverOriginalJCheckBox = JCheckBox.new()
        self.widthReductionTextField = JTextField.new()
        self.jLabel5 = JLabel.new()
        self.jPanel1 = (function()
            local o = JPanel.new and JPanel.new() or setmetatable({}, {__index = JPanel})
            

            function o:paint(graphics)
                if self.result ~= nil then
                    graphics:drawImage(self.result, 0, 0, self.result:getWidth(nil), self.result:getHeight(nil), nil)
                end
            end
            return o
        end)()
        self.jLabel4 = JLabel.new()
        self.jLabel6 = JLabel.new()
        self.heightReductionTextField = JTextField.new()
        self.generateJButton = JButton.new()
        self.jPanel2 = JPanel.new()
        self.jLabel1 = JLabel.new()
        self.totalFramesJComboBox = JComboBox.new()
        local size = 70
        local animationStringArray2 = java_new_array(nil, size - 1)
        for index = 1, size - 1 do
            animationStringArray2[index - 1 + 1] = tostring(index)
        end
        self.totalFramesJComboBox:setModel(DefaultComboBoxModel.new(animationStringArray2))
        self.jLabel2 = JLabel.new()
        self.totalAnimationsJComboBox = JComboBox.new()
        local animationStringArray = java_new_array(nil, size - 1)
        for index = 1, size - 1 do
            animationStringArray[index - 1 + 1] = tostring(index)
        end
        self.totalAnimationsJComboBox:setModel(DefaultComboBoxModel.new(animationStringArray))
        self.jLabel3 = JLabel.new()
        self.spriteTypeJComboBox = JComboBox.new()
        self.spriteTypeJComboBox:setModel(DefaultComboBoxModel.new({org.allbinary.media.image.SpriteSplitterUtil:getInstance().DIRECTIONAL_ANIMATIONS, org.allbinary.media.image.SpriteSplitterUtil:getInstance().HORIZONTAL_ANIMATIONS, org.allbinary.media.image.SpriteSplitterUtil:getInstance().HORIZONTAL_SPRITE}))
        self.jLabel7 = JLabel.new()
        self.increaseWidthTextField = JTextField.new()
        self.jLabel8 = JLabel.new()
        self.increaseHeightTextField = JTextField.new()
        self.writeOverOriginalJCheckBox:setText("Write Over Original")
        self.writeOverOriginalJCheckBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:writeOverOriginalJCheckBoxActionPerformed(evt)
            end
            return o
        end)())
        self.widthReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:widthReductionTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel5:setText("Less Width:")
        self.jLabel4:setText("Results:")
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.jLabel4):addGap(0, 0, Short.MAX_VALUE)))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.jLabel4):addGap(0, 184, Short.MAX_VALUE)))
        self.jLabel6:setText("Less Height:")
        self.heightReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.generateJButton:setText("Generate")
        self.generateJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Row Total:")
        self.totalFramesJComboBox:setSelectedIndex(1)
        self.totalFramesJComboBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:totalFramesJComboBoxActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel2:setText("Column Total :")
        self.totalAnimationsJComboBox:setSelectedIndex(3)
        self.totalAnimationsJComboBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:totalAnimationsJComboBoxActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel3:setText("Type:")
        self.spriteTypeJComboBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:spriteTypeJComboBoxActionPerformed(evt)
            end
            return o
        end)())
        local jPanel2Layout = GroupLayout.new(self.jPanel2)
        self.jPanel2:setLayout(jPanel2Layout)
        jPanel2Layout:setHorizontalGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout:createSequentialGroup():addContainerGap():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.totalFramesJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel2):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.totalAnimationsJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel3):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.spriteTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 172, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        jPanel2Layout:setVerticalGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel2Layout:createSequentialGroup():addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.totalFramesJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2):addComponent(self.totalAnimationsJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel3):addComponent(self.spriteTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
        self.jLabel7:setText("More Width:")
        self.increaseWidthTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.increaseWidthTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:increaseWidthTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel8:setText("More Height:")
        self.increaseHeightTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 415, Short.MAX_VALUE):addGap(78, 78, 78)):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.writeOverOriginalJCheckBox):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.generateJButton)):addGroup(layout:createSequentialGroup():addComponent(self.jLabel5):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel6):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel7):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.increaseWidthTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel8):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.increaseHeightTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))):addGap(0, 0, Short.MAX_VALUE))):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel7):addComponent(self.increaseWidthTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel8):addComponent(self.increaseHeightTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel5):addComponent(self.widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel6):addComponent(self.heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.writeOverOriginalJCheckBox):addComponent(self.generateJButton)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
end


function SpriteSplitterImageJPanel:writeOverOriginalJCheckBoxActionPerformed(evt)
end


function SpriteSplitterImageJPanel:generateJButtonActionPerformed(evt)
        self:process()
end


function SpriteSplitterImageJPanel:spriteTypeJComboBoxActionPerformed(evt)
        local spriteSplitterUtil = SpriteSplitterUtil.getInstance()
        self.jLabel1:setText(spriteSplitterUtil.ANIMATIONS_LABELS[self.spriteTypeJComboBox:getSelectedIndex() + 1])
        self.jLabel2:setText(spriteSplitterUtil.ANIMATIONS_LABELS[self.spriteTypeJComboBox:getSelectedIndex() + 1 + 1])
end


function SpriteSplitterImageJPanel:totalAnimationsJComboBoxActionPerformed(evt)
end


function SpriteSplitterImageJPanel:totalFramesJComboBoxActionPerformed(evt)
end


function SpriteSplitterImageJPanel:widthReductionTextFieldActionPerformed(evt)
end


function SpriteSplitterImageJPanel:increaseWidthTextFieldActionPerformed(evt)
end


function SpriteSplitterImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end


function SpriteSplitterImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end


-- throws IOException
function SpriteSplitterImageJPanel:visit(generatedBufferedImage, name, index)
        self.logUtil:putF(self.commonStrings.VISIT, self, self.commonStrings.VISIT)
        self.result = generatedBufferedImage
        self:getParent():repaint()
        local file = self.imageProcessorInput:getFiles()[index + 1]
        if not self.writeOverOriginalJCheckBox:isSelected() then
            local filePath = file:getAbsolutePath()
            local extensionIndex = ((string.find(filePath, self.imageStrings.PNG_EXTENSION, 1, true) or 0) - 1)
            filePath = tostring(StringMaker.new():append(string.sub(filePath, (0) + 1, extensionIndex)):append(self.commonSeps.UNDERSCORE):append(name):append(self.imageStrings.PNG_EXTENSION))
            file = File.new(filePath)
        end
        local isWritten = ImageIO.write(self.result, self.imageStrings.PNG, file)
        self.logUtil:putF(tostring(StringMaker.new():append("File: "):append(StringUtil.getInstance():toString(file)):append(" Wrote: "):appendboolean(isWritten)), self, self.commonStrings.RUN)
end

return SpriteSplitterImageJPanel

