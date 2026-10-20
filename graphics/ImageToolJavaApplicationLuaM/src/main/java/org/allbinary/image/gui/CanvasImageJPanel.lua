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
local CanvasExpandUtil = require("org.allbinary.media.image.CanvasExpandUtil")
local CanvasTrimUtil = require("org.allbinary.media.image.CanvasTrimUtil")
local ImageProcessedVisitor = require("org.allbinary.media.image.ImageProcessedVisitor")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageStrings = require("org.allbinary.media.image.ImageStrings")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local CanvasImageJPanel = {}
CanvasImageJPanel.__index = CanvasImageJPanel
CanvasImageJPanel.className = "CanvasImageJPanel"
setmetatable(CanvasImageJPanel, {__index = JPanel})

function CanvasImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    self.imageProcessorInput = nil
    self.result = nil
    self.generateJButton = nil
    self.heightReductionTextField = nil
    self.heightReductionTextField1 = nil
    self.jLabel4 = nil
    self.jLabel5 = nil
    self.jLabel6 = nil
    self.jLabel7 = nil
    self.jLabel8 = nil
    self.jPanel1 = nil
    self.jPanel2 = nil
    self.widthReductionTextField = nil
    self.widthReductionTextField1 = nil
    self.writeOverOriginalJCheckBox = nil
end


function CanvasImageJPanel.new(imageProcessorInput)
    local self = setmetatable(JPanel.new(), CanvasImageJPanel)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
    return self
end


function CanvasImageJPanel:process()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local canvasTrimUtil = CanvasTrimUtil.getInstance()
                    local canvasExpandUtil = CanvasExpandUtil.getInstance()
                    local leftReduction = tostring(self.widthReductionTextField1:getText())
                    local topReduction = tostring(self.heightReductionTextField1:getText())
                    local widthReduction = tostring(self.widthReductionTextField:getText())
                    local heightReduction = tostring(self.heightReductionTextField:getText())
                    if leftReduction <= 0 or topReduction <= 0 or widthReduction <= 0 or heightReduction <= 0 then
                        canvasTrimUtil:process(self:getImageProcessorInput(), -leftReduction, -topReduction, -widthReduction, -heightReduction, self)
                    else
                        canvasExpandUtil:process(self:getImageProcessorInput(), leftReduction, topReduction, self)
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


function CanvasImageJPanel:initComponents()
        self.writeOverOriginalJCheckBox = JCheckBox.new()
        self.jPanel1 = (function()
            local o = JPanel.new and JPanel.new() or setmetatable({}, {__index = JPanel})
            

            function o:paint(graphics)
                if self.result ~= nil then
                    graphics:drawImage(self.result, 0, 0, self.result:getWidth(nil), self.result:getHeight(nil), nil)
                end
            end
            return o
        end)()
        self.generateJButton = JButton.new()
        self.jLabel4 = JLabel.new()
        self.jPanel2 = JPanel.new()
        self.jLabel5 = JLabel.new()
        self.widthReductionTextField = JTextField.new()
        self.jLabel6 = JLabel.new()
        self.heightReductionTextField = JTextField.new()
        self.widthReductionTextField1 = JTextField.new()
        self.jLabel7 = JLabel.new()
        self.jLabel8 = JLabel.new()
        self.heightReductionTextField1 = JTextField.new()
        self.writeOverOriginalJCheckBox:setSelected(true)
        self.writeOverOriginalJCheckBox:setText("Write Over Original")
        self.writeOverOriginalJCheckBox:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:writeOverOriginalJCheckBoxActionPerformed(evt)
            end
            return o
        end)())
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 0, Short.MAX_VALUE))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGap(0, 196, Short.MAX_VALUE))
        self.generateJButton:setText("Generate")
        self.generateJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel4:setText("Results:")
        self.jLabel5:setText("Right:")
        self.widthReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:widthReductionTextFieldActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel6:setText("Bottom")
        self.heightReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField1:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField1:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:widthReductionTextField1ActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel7:setText("Top")
        self.jLabel8:setText("Left:")
        self.heightReductionTextField1:setText(CommonPhoneStrings.getInstance().ZERO)
        local jPanel2Layout = GroupLayout.new(self.jPanel2)
        self.jPanel2:setLayout(jPanel2Layout)
        jPanel2Layout:setHorizontalGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel2Layout:createSequentialGroup():addContainerGap():addComponent(self.jLabel8):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.widthReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel5):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel7):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.heightReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel6):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE):addContainerGap(140, Short.MAX_VALUE)))
        jPanel2Layout:setVerticalGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout:createSequentialGroup():addGap(0, 16, Short.MAX_VALUE):addGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel6):addComponent(self.heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel8):addComponent(self.widthReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel7):addComponent(self.heightReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addGroup(jPanel2Layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel5):addComponent(self.widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)))))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addGap(78, 78, 78)):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.jLabel4):addGroup(layout:createSequentialGroup():addComponent(self.writeOverOriginalJCheckBox):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.generateJButton))):addGap(0, 0, Short.MAX_VALUE))):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.generateJButton):addComponent(self.writeOverOriginalJCheckBox)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel4):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
end


function CanvasImageJPanel:writeOverOriginalJCheckBoxActionPerformed(evt)
end


function CanvasImageJPanel:generateJButtonActionPerformed(evt)
        self:process()
end


function CanvasImageJPanel:widthReductionTextFieldActionPerformed(evt)
end


function CanvasImageJPanel:widthReductionTextField1ActionPerformed(evt)
end


function CanvasImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end


function CanvasImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end


-- throws IOException
function CanvasImageJPanel:visit(generatedBufferedImage, name, index)
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

return CanvasImageJPanel

