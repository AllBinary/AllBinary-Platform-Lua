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
-- package org.allbinary.input.automation.actions.script.condition

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local ColorRangeInterface = require("org.allbinary.media.image.analysis.ColorRangeInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JPanel = require("org.allbinary.input.automation.actions.script.condition.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorAtActionScriptConditionJPanel = {}
ColorAtActionScriptConditionJPanel.__index = ColorAtActionScriptConditionJPanel
ColorAtActionScriptConditionJPanel.className = "ColorAtActionScriptConditionJPanel"
setmetatable(ColorAtActionScriptConditionJPanel, {__index = JPanel})

function ColorAtActionScriptConditionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.colorAtActionScriptConditionInterface = nil
    self.blueJLabel = nil
    self.colorAtActionJButton = nil
    self.colorAtActionJDialog = nil
    self.colorAtXJTextField = nil
    self.colorAtYJTextField = nil
    self.colorRangeJLabel = nil
    self.greenJLabel = nil
    self.jLabel1 = nil
    self.locationJLabel = nil
    self.maxBlueJTextField = nil
    self.maxGreenJTextField = nil
    self.maxJLabel = nil
    self.maxRedJTextField = nil
    self.minBlueJTextField = nil
    self.minGreenJTextField = nil
    self.minJLabel = nil
    self.minRedJTextField = nil
    self.okJButton = nil
    self.redJLabel = nil
    self.titleJLabel = nil
    self.xJLabel = nil
    self.yJLabel = nil
end


function ColorAtActionScriptConditionJPanel.new(colorAtActionScriptConditionInterface)
    local self = setmetatable(JPanel.new(), ColorAtActionScriptConditionJPanel)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.colorAtActionScriptConditionInterface = colorAtActionScriptConditionInterface
        self:set()
    return self
end


function ColorAtActionScriptConditionJPanel:set()
        local colorRangeInterface = self.colorAtActionScriptConditionInterface:getColorRangeInterface()
        self:getMinRedJTextField():setText(tostring(colorRangeInterface:getMinRed()))
        self:getMaxRedJTextField():setText(tostring(colorRangeInterface:getMaxRed()))
        self:getMinGreenJTextField():setText(tostring(colorRangeInterface:getMinGreen()))
        self:getMaxGreenJTextField():setText(tostring(colorRangeInterface:getMaxGreen()))
        self:getMinBlueJTextField():setText(tostring(colorRangeInterface:getMinBlue()))
        self:getMaxBlueJTextField():setText(tostring(colorRangeInterface:getMaxBlue()))
        self:getColorAtXJTextField():setText(tostring(self.colorAtActionScriptConditionInterface:getPoint().x))
        self:getColorAtYJTextField():setText(tostring(self.colorAtActionScriptConditionInterface:getPoint().y))
        self.colorAtActionScriptConditionInterface:log()
end


function ColorAtActionScriptConditionJPanel:update()
        local colorRangeInterface = self.colorAtActionScriptConditionInterface:getColorRangeInterface()
        colorRangeInterface:setMinRed(math.tointeger(tostring(self:getMinRedJTextField():getText()) // 1))
        colorRangeInterface:setMaxRed(math.tointeger(tostring(self:getMaxRedJTextField():getText()) // 1))
        colorRangeInterface:setMinGreen(math.tointeger(tostring(self:getMinGreenJTextField():getText()) // 1))
        colorRangeInterface:setMaxGreen(math.tointeger(tostring(self:getMaxGreenJTextField():getText()) // 1))
        colorRangeInterface:setMinBlue(math.tointeger(tostring(self:getMinBlueJTextField():getText()) // 1))
        colorRangeInterface:setMaxBlue(math.tointeger(tostring(self:getMaxBlueJTextField():getText()) // 1))
        local xString = self:getColorAtXJTextField():getText()
        if not StringValidationUtil.getInstance():isEmpty(xString) and StringValidationUtil.getInstance():isNumber(xString) then
            self.colorAtActionScriptConditionInterface:getPoint().x = math.tointeger(tonumber(xString))
        end
        local yString = self:getColorAtYJTextField():getText()
        if not StringValidationUtil.getInstance():isEmpty(yString) and StringValidationUtil.getInstance():isNumber(yString) then
            self.colorAtActionScriptConditionInterface:getPoint().y = math.tointeger(tonumber(xString))
        end
        self.colorAtActionScriptConditionInterface:log()
end


function ColorAtActionScriptConditionJPanel:getColorAtXJTextField()
        return self.colorAtXJTextField
end


function ColorAtActionScriptConditionJPanel:setColorAtXJTextField(colorAtXJTextField)
        self.colorAtXJTextField = colorAtXJTextField
end


function ColorAtActionScriptConditionJPanel:getColorAtYJTextField()
        return self.colorAtYJTextField
end


function ColorAtActionScriptConditionJPanel:setColorAtYJTextField(colorAtYJTextField)
        self.colorAtYJTextField = colorAtYJTextField
end


function ColorAtActionScriptConditionJPanel:getMaxBlueJTextField()
        return self.maxBlueJTextField
end


function ColorAtActionScriptConditionJPanel:setMaxBlueJTextField(maxBlueJTextField)
        self.maxBlueJTextField = maxBlueJTextField
end


function ColorAtActionScriptConditionJPanel:getMaxGreenJTextField()
        return self.maxGreenJTextField
end


function ColorAtActionScriptConditionJPanel:setMaxGreenJTextField(maxGreenJTextField)
        self.maxGreenJTextField = maxGreenJTextField
end


function ColorAtActionScriptConditionJPanel:getMaxRedJTextField()
        return self.maxRedJTextField
end


function ColorAtActionScriptConditionJPanel:setMaxRedJTextField(maxRedJTextField)
        self.maxRedJTextField = maxRedJTextField
end


function ColorAtActionScriptConditionJPanel:getMinBlueJTextField()
        return self.minBlueJTextField
end


function ColorAtActionScriptConditionJPanel:setMinBlueJTextField(minBlueJTextField)
        self.minBlueJTextField = minBlueJTextField
end


function ColorAtActionScriptConditionJPanel:getMinGreenJTextField()
        return self.minGreenJTextField
end


function ColorAtActionScriptConditionJPanel:setMinGreenJTextField(minGreenJTextField)
        self.minGreenJTextField = minGreenJTextField
end


function ColorAtActionScriptConditionJPanel:getMinRedJTextField()
        return self.minRedJTextField
end


function ColorAtActionScriptConditionJPanel:setMinRedJTextField(minRedJTextField)
        self.minRedJTextField = minRedJTextField
end


function ColorAtActionScriptConditionJPanel:getYJLabel()
        return self.yJLabel
end


function ColorAtActionScriptConditionJPanel:setYJLabel(yJLabel)
        self.yJLabel = yJLabel
end


function ColorAtActionScriptConditionJPanel:getColorAtActionJDialog()
        return self.colorAtActionJDialog
end


function ColorAtActionScriptConditionJPanel:setColorAtActionJDialog(colorAtActionJDialog)
        self.colorAtActionJDialog = colorAtActionJDialog
end


function ColorAtActionScriptConditionJPanel:initComponents()
        self.colorAtActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
        self.locationJLabel = JLabel.new()
        self.colorAtXJTextField = JTextField.new()
        self.xJLabel = JLabel.new()
        self.yJLabel = JLabel.new()
        self.colorAtYJTextField = JTextField.new()
        self.colorRangeJLabel = JLabel.new()
        self.redJLabel = JLabel.new()
        self.minJLabel = JLabel.new()
        self.maxJLabel = JLabel.new()
        self.greenJLabel = JLabel.new()
        self.blueJLabel = JLabel.new()
        self.minRedJTextField = JTextField.new()
        self.maxRedJTextField = JTextField.new()
        self.maxGreenJTextField = JTextField.new()
        self.minBlueJTextField = JTextField.new()
        self.maxBlueJTextField = JTextField.new()
        self.okJButton = JButton.new()
        self.minGreenJTextField = JTextField.new()
        self.colorAtActionJButton = JButton.new()
        self.jLabel1 = JLabel.new()
        self.colorAtActionJDialog:setMinimumSize(Dimension.new(350, 250))
        self.titleJLabel:setText("              Color At Action Options            ")
        self.locationJLabel:setText("Location:")
        self.xJLabel:setText("X:")
        self.yJLabel:setText("Y:")
        self.colorRangeJLabel:setText("Color Range")
        self.redJLabel:setText("Red:")
        self.minJLabel:setText("Minimum")
        self.maxJLabel:setText("Maximum")
        self.greenJLabel:setText("Green:")
        self.blueJLabel:setText("Blue:")
        self.okJButton:setText("OK")
        self.okJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        local colorAtActionJDialogLayout = GroupLayout.new(self.colorAtActionJDialog:getContentPane())
        self.colorAtActionJDialog:getContentPane():setLayout(colorAtActionJDialogLayout)
        colorAtActionJDialogLayout:setHorizontalGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.okJButton):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.blueJLabel):addComponent(self.greenJLabel):addComponent(self.redJLabel):addComponent(self.colorRangeJLabel)):addGap(29, 29, 29)):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, colorAtActionJDialogLayout:createSequentialGroup():addComponent(self.locationJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.xJLabel):addGap(18, 18, 18))):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addComponent(self.minBlueJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE):addComponent(self.minGreenJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE):addComponent(self.minJLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addComponent(self.minRedJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE):addComponent(self.colorAtXJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE)):addGap(16, 16, 16))):addGap(6, 6, 6):addComponent(self.yJLabel):addGap(24, 24, 24):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.maxJLabel, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE):addGroup(javax.swing.GroupLayout.Alignment.LEADING, colorAtActionJDialogLayout:createSequentialGroup():addGap(1, 1, 1):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false):addComponent(self.maxBlueJTextField, javax.swing.GroupLayout.Alignment.TRAILING):addComponent(self.maxRedJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 43, Short.MAX_VALUE):addComponent(self.maxGreenJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE))):addComponent(self.colorAtYJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 44, Short.MAX_VALUE)):addGap(22, 22, 22)):addGroup(javax.swing.GroupLayout.Alignment.TRAILING, colorAtActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addGap(33, 33, 33)))))
        colorAtActionJDialogLayout:setVerticalGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.titleJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGap(15, 15, 15):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.xJLabel):addComponent(self.locationJLabel):addComponent(self.colorAtXJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.yJLabel)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.minJLabel):addComponent(self.colorRangeJLabel)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.minRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addComponent(self.redJLabel)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.greenJLabel):addComponent(self.minGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.blueJLabel):addComponent(self.minBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 17, Short.MAX_VALUE):addComponent(self.okJButton)):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGap(14, 14, 14):addComponent(self.colorAtYJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxJLabel):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))):addContainerGap()))
        self:setPreferredSize(Dimension.new(100, 0))
        self.colorAtActionJButton:setText("Edit")
        self.colorAtActionJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:colorAtActionJButtonActionPerformed(evt)
            end
            return o
        end)())
        self.jLabel1:setText("Color At:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE):addComponent(self.colorAtActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.colorAtActionJButton)))
end


function ColorAtActionScriptConditionJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getColorAtActionJDialog():setVisible(false)
end


function ColorAtActionScriptConditionJPanel:colorAtActionJButtonActionPerformed(evt)
        self:getColorAtActionJDialog():setVisible(true)
end

return ColorAtActionScriptConditionJPanel

