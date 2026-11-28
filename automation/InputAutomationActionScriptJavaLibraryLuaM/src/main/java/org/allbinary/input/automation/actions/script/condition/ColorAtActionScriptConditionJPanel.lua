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

local ColorAtActionScriptConditionJPanel = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionJPanel"] = ColorAtActionScriptConditionJPanel

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local ColorRangeInterface = java_lazy("org.allbinary.media.image.analysis.ColorRangeInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local ColorAtActionScriptConditionInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionInterface")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ColorAtActionScriptConditionJPanel is declared before the requires
ColorAtActionScriptConditionJPanel.__index = ColorAtActionScriptConditionJPanel
ColorAtActionScriptConditionJPanel.className = "ColorAtActionScriptConditionJPanel"
ColorAtActionScriptConditionJPanel.javaClassName = "org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionJPanel"
setmetatable(ColorAtActionScriptConditionJPanel, {__index = JPanel})

function ColorAtActionScriptConditionJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.colorAtActionScriptConditionInterface == nil then self.colorAtActionScriptConditionInterface = nil end
    if self.blueJLabel == nil then self.blueJLabel = nil end
    if self.colorAtActionJButton == nil then self.colorAtActionJButton = nil end
    if self.colorAtActionJDialog == nil then self.colorAtActionJDialog = nil end
    if self.colorAtXJTextField == nil then self.colorAtXJTextField = nil end
    if self.colorAtYJTextField == nil then self.colorAtYJTextField = nil end
    if self.colorRangeJLabel == nil then self.colorRangeJLabel = nil end
    if self.greenJLabel == nil then self.greenJLabel = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.locationJLabel == nil then self.locationJLabel = nil end
    if self.maxBlueJTextField == nil then self.maxBlueJTextField = nil end
    if self.maxGreenJTextField == nil then self.maxGreenJTextField = nil end
    if self.maxJLabel == nil then self.maxJLabel = nil end
    if self.maxRedJTextField == nil then self.maxRedJTextField = nil end
    if self.minBlueJTextField == nil then self.minBlueJTextField = nil end
    if self.minGreenJTextField == nil then self.minGreenJTextField = nil end
    if self.minJLabel == nil then self.minJLabel = nil end
    if self.minRedJTextField == nil then self.minRedJTextField = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.redJLabel == nil then self.redJLabel = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
    if self.xJLabel == nil then self.xJLabel = nil end
    if self.yJLabel == nil then self.yJLabel = nil end
end


function ColorAtActionScriptConditionJPanel._jinit(self, colorAtActionScriptConditionInterface)
    java_super_init(JPanel, self)
    ColorAtActionScriptConditionJPanel._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.colorAtActionScriptConditionInterface = colorAtActionScriptConditionInterface
        self:set()
    return self
end

function ColorAtActionScriptConditionJPanel.new(...)
    local self = setmetatable({}, ColorAtActionScriptConditionJPanel)
    ColorAtActionScriptConditionJPanel._jinit(self, ...)
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
java_overload(ColorAtActionScriptConditionJPanel, "set", 0)


function ColorAtActionScriptConditionJPanel:update()
        local colorRangeInterface = self.colorAtActionScriptConditionInterface:getColorRangeInterface()
        colorRangeInterface:setMinRed(require("allbinary_java").number_value(tostring(self:getMinRedJTextField():getText()), "intValue"))
        colorRangeInterface:setMaxRed(require("allbinary_java").number_value(tostring(self:getMaxRedJTextField():getText()), "intValue"))
        colorRangeInterface:setMinGreen(require("allbinary_java").number_value(tostring(self:getMinGreenJTextField():getText()), "intValue"))
        colorRangeInterface:setMaxGreen(require("allbinary_java").number_value(tostring(self:getMaxGreenJTextField():getText()), "intValue"))
        colorRangeInterface:setMinBlue(require("allbinary_java").number_value(tostring(self:getMinBlueJTextField():getText()), "intValue"))
        colorRangeInterface:setMaxBlue(require("allbinary_java").number_value(tostring(self:getMaxBlueJTextField():getText()), "intValue"))
        local xString = self:getColorAtXJTextField():getText()
        if not (StringValidationUtil.getInstance():isEmpty(xString)) and StringValidationUtil.getInstance():isNumber(xString) then
            self.colorAtActionScriptConditionInterface:getPoint().x = math.tointeger(tonumber(xString))
        end
        local yString = self:getColorAtYJTextField():getText()
        if not (StringValidationUtil.getInstance():isEmpty(yString)) and StringValidationUtil.getInstance():isNumber(yString) then
            self.colorAtActionScriptConditionInterface:getPoint().y = math.tointeger(tonumber(xString))
        end
        self.colorAtActionScriptConditionInterface:log()
end
java_overload(ColorAtActionScriptConditionJPanel, "update", 0)


function ColorAtActionScriptConditionJPanel:getColorAtXJTextField()
        return self.colorAtXJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getColorAtXJTextField", 0)


function ColorAtActionScriptConditionJPanel:setColorAtXJTextField(colorAtXJTextField)
        self.colorAtXJTextField = colorAtXJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setColorAtXJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getColorAtYJTextField()
        return self.colorAtYJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getColorAtYJTextField", 0)


function ColorAtActionScriptConditionJPanel:setColorAtYJTextField(colorAtYJTextField)
        self.colorAtYJTextField = colorAtYJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setColorAtYJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getMaxBlueJTextField()
        return self.maxBlueJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getMaxBlueJTextField", 0)


function ColorAtActionScriptConditionJPanel:setMaxBlueJTextField(maxBlueJTextField)
        self.maxBlueJTextField = maxBlueJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setMaxBlueJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getMaxGreenJTextField()
        return self.maxGreenJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getMaxGreenJTextField", 0)


function ColorAtActionScriptConditionJPanel:setMaxGreenJTextField(maxGreenJTextField)
        self.maxGreenJTextField = maxGreenJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setMaxGreenJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getMaxRedJTextField()
        return self.maxRedJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getMaxRedJTextField", 0)


function ColorAtActionScriptConditionJPanel:setMaxRedJTextField(maxRedJTextField)
        self.maxRedJTextField = maxRedJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setMaxRedJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getMinBlueJTextField()
        return self.minBlueJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getMinBlueJTextField", 0)


function ColorAtActionScriptConditionJPanel:setMinBlueJTextField(minBlueJTextField)
        self.minBlueJTextField = minBlueJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setMinBlueJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getMinGreenJTextField()
        return self.minGreenJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getMinGreenJTextField", 0)


function ColorAtActionScriptConditionJPanel:setMinGreenJTextField(minGreenJTextField)
        self.minGreenJTextField = minGreenJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setMinGreenJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getMinRedJTextField()
        return self.minRedJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "getMinRedJTextField", 0)


function ColorAtActionScriptConditionJPanel:setMinRedJTextField(minRedJTextField)
        self.minRedJTextField = minRedJTextField
end
java_overload(ColorAtActionScriptConditionJPanel, "setMinRedJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ColorAtActionScriptConditionJPanel:getYJLabel()
        return self.yJLabel
end
java_overload(ColorAtActionScriptConditionJPanel, "getYJLabel", 0)


function ColorAtActionScriptConditionJPanel:setYJLabel(yJLabel)
        self.yJLabel = yJLabel
end
java_overload(ColorAtActionScriptConditionJPanel, "setYJLabel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JLabel")) end)


function ColorAtActionScriptConditionJPanel:getColorAtActionJDialog()
        return self.colorAtActionJDialog
end
java_overload(ColorAtActionScriptConditionJPanel, "getColorAtActionJDialog", 0)


function ColorAtActionScriptConditionJPanel:setColorAtActionJDialog(colorAtActionJDialog)
        self.colorAtActionJDialog = colorAtActionJDialog
end
java_overload(ColorAtActionScriptConditionJPanel, "setColorAtActionJDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JDialog")) end)


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
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.okJButtonActionPerformed and self or java_outer_self):okJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local colorAtActionJDialogLayout = GroupLayout.new(self.colorAtActionJDialog:getContentPane())
        self.colorAtActionJDialog:getContentPane():setLayout(colorAtActionJDialogLayout)
        colorAtActionJDialogLayout:setHorizontalGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.TRAILING):addComponent(self.okJButton):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING, false):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.blueJLabel):addComponent(self.greenJLabel):addComponent(self.redJLabel):addComponent(self.colorRangeJLabel)):addGap(29, 29, 29)):addGroup(GroupLayout.Alignment.TRAILING, colorAtActionJDialogLayout:createSequentialGroup():addComponent(self.locationJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.xJLabel):addGap(18, 18, 18))):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.minBlueJTextField, GroupLayout.DEFAULT_SIZE, 40, require("java.lang.Short").MAX_VALUE):addComponent(self.minGreenJTextField, GroupLayout.DEFAULT_SIZE, 40, require("java.lang.Short").MAX_VALUE):addComponent(self.minJLabel, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.minRedJTextField, GroupLayout.DEFAULT_SIZE, 40, require("java.lang.Short").MAX_VALUE):addComponent(self.colorAtXJTextField, GroupLayout.DEFAULT_SIZE, 40, require("java.lang.Short").MAX_VALUE)):addGap(16, 16, 16))):addGap(6, 6, 6):addComponent(self.yJLabel):addGap(24, 24, 24):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.TRAILING):addComponent(self.maxJLabel, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addGroup(GroupLayout.Alignment.LEADING, colorAtActionJDialogLayout:createSequentialGroup():addGap(1, 1, 1):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING, false):addComponent(self.maxBlueJTextField, GroupLayout.Alignment.TRAILING):addComponent(self.maxRedJTextField, GroupLayout.Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 43, require("java.lang.Short").MAX_VALUE):addComponent(self.maxGreenJTextField, GroupLayout.Alignment.TRAILING, GroupLayout.PREFERRED_SIZE, 43, GroupLayout.PREFERRED_SIZE))):addComponent(self.colorAtYJTextField, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 44, require("java.lang.Short").MAX_VALUE)):addGap(22, 22, 22)):addGroup(GroupLayout.Alignment.TRAILING, colorAtActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addGap(33, 33, 33)))))
        colorAtActionJDialogLayout:setVerticalGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.titleJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGap(15, 15, 15):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.xJLabel):addComponent(self.locationJLabel):addComponent(self.colorAtXJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.yJLabel)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.minJLabel):addComponent(self.colorRangeJLabel)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.minRedJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.redJLabel)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.greenJLabel):addComponent(self.minGreenJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(colorAtActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.blueJLabel):addComponent(self.minBlueJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 17, require("java.lang.Short").MAX_VALUE):addComponent(self.okJButton)):addGroup(colorAtActionJDialogLayout:createSequentialGroup():addGap(14, 14, 14):addComponent(self.colorAtYJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxJLabel):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxRedJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxGreenJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.maxBlueJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))):addContainerGap()))
        self:setPreferredSize(Dimension.new(100, 0))
        self.colorAtActionJButton:setText("Edit")
        self.colorAtActionJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.colorAtActionJButtonActionPerformed and self or java_outer_self):colorAtActionJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Color At:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 15, require("java.lang.Short").MAX_VALUE):addComponent(self.colorAtActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.colorAtActionJButton)))
end
java_overload(ColorAtActionScriptConditionJPanel, "initComponents", 0)


function ColorAtActionScriptConditionJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getColorAtActionJDialog():setVisible(false)
end
java_overload(ColorAtActionScriptConditionJPanel, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ColorAtActionScriptConditionJPanel:colorAtActionJButtonActionPerformed(evt)
        self:getColorAtActionJDialog():setVisible(true)
end
java_overload(ColorAtActionScriptConditionJPanel, "colorAtActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return ColorAtActionScriptConditionJPanel

