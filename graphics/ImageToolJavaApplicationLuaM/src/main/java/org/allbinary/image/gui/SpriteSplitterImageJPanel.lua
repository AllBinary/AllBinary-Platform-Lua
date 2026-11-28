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

local SpriteSplitterImageJPanel = {}
package.loaded["org.allbinary.image.gui.SpriteSplitterImageJPanel"] = SpriteSplitterImageJPanel

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

-- local Graphics = require("java.awt.Graphics")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local RenderedImage = require("java.awt.image.RenderedImage")
local File = java_lazy("java.io.File")
-- local IOException = require("java.io.IOException")
-- local ImageIO = require("javax.imageio.ImageIO")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ImageProcessedVisitor = java_lazy("org.allbinary.media.image.ImageProcessedVisitor")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageStrings = java_lazy("org.allbinary.media.image.ImageStrings")
local SpriteSplitterUtil = java_lazy("org.allbinary.media.image.SpriteSplitterUtil")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JCheckBox = require("javax.swing.JCheckBox")
-- local JComboBox = require("javax.swing.JComboBox")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table SpriteSplitterImageJPanel is declared before the requires
SpriteSplitterImageJPanel.__index = SpriteSplitterImageJPanel
SpriteSplitterImageJPanel.className = "SpriteSplitterImageJPanel"
SpriteSplitterImageJPanel.javaClassName = "org.allbinary.image.gui.SpriteSplitterImageJPanel"
setmetatable(SpriteSplitterImageJPanel, {__index = JPanel})
SpriteSplitterImageJPanel.java_implements = " ImageProcessedVisitor "
SpriteSplitterImageJPanel.java_interfaces = function() return {ImageProcessedVisitor} end

function SpriteSplitterImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.result == nil then self.result = nil end
    if self.generateJButton == nil then self.generateJButton = nil end
    if self.heightReductionTextField == nil then self.heightReductionTextField = nil end
    if self.increaseHeightTextField == nil then self.increaseHeightTextField = nil end
    if self.increaseWidthTextField == nil then self.increaseWidthTextField = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLabel3 == nil then self.jLabel3 = nil end
    if self.jLabel4 == nil then self.jLabel4 = nil end
    if self.jLabel5 == nil then self.jLabel5 = nil end
    if self.jLabel6 == nil then self.jLabel6 = nil end
    if self.jLabel7 == nil then self.jLabel7 = nil end
    if self.jLabel8 == nil then self.jLabel8 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.jPanel2 == nil then self.jPanel2 = nil end
    if self.spriteTypeJComboBox == nil then self.spriteTypeJComboBox = nil end
    if self.totalAnimationsJComboBox == nil then self.totalAnimationsJComboBox = nil end
    if self.totalFramesJComboBox == nil then self.totalFramesJComboBox = nil end
    if self.widthReductionTextField == nil then self.widthReductionTextField = nil end
    if self.writeOverOriginalJCheckBox == nil then self.writeOverOriginalJCheckBox = nil end
end


function SpriteSplitterImageJPanel._jinit(self, imageProcessorInput)
    java_super_init(JPanel, self)
    SpriteSplitterImageJPanel._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
    return self
end

function SpriteSplitterImageJPanel.new(...)
    local self = setmetatable({}, SpriteSplitterImageJPanel)
    SpriteSplitterImageJPanel._jinit(self, ...)
    return self
end


function SpriteSplitterImageJPanel:process()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local spriteSplitterUtil = SpriteSplitterUtil.getInstance()
                    local spriteType = self.spriteTypeJComboBox:getSelectedItem()
                    local totalFrames = tostring(self.totalFramesJComboBox:getSelectedItem())
                    local totalAnimations = tostring(self.totalAnimationsJComboBox:getSelectedItem())
                    local widthReduction = tostring(self.widthReductionTextField:getText())
                    local heightReduction = tostring(self.heightReductionTextField:getText())
                    local increaseWidth = tostring(self.increaseWidthTextField:getText())
                    local increaseHeight = tostring(self.increaseHeightTextField:getText())
                    spriteSplitterUtil:process(java_outer_self:getImageProcessorInput(), totalFrames, totalAnimations, widthReduction, heightReduction, increaseWidth, increaseHeight, spriteType, java_outer_self)
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)():start()
end
java_overload(SpriteSplitterImageJPanel, "process", 0)


function SpriteSplitterImageJPanel:initComponents()
        self.writeOverOriginalJCheckBox = JCheckBox.new()
        self.widthReductionTextField = JTextField.new()
        self.jLabel5 = JLabel.new()
        self.jPanel1 = (function()
            local java_outer_self = self
        local o = JPanel.new and JPanel.new() or setmetatable({}, {__index = JPanel})
            

            function o:paint(graphics)
                if not rawequal(java_outer_self.result, nil) then
                    graphics:drawImage(java_outer_self.result, 0, 0, java_outer_self.result:getWidth(nil), java_outer_self.result:getHeight(nil), nil)
                end
            end
            java_overload(o, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)
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
        self.spriteTypeJComboBox:setModel(DefaultComboBoxModel.new({SpriteSplitterUtil.getInstance().DIRECTIONAL_ANIMATIONS, SpriteSplitterUtil.getInstance().HORIZONTAL_ANIMATIONS, SpriteSplitterUtil.getInstance().HORIZONTAL_SPRITE}))
        self.jLabel7 = JLabel.new()
        self.increaseWidthTextField = JTextField.new()
        self.jLabel8 = JLabel.new()
        self.increaseHeightTextField = JTextField.new()
        self.writeOverOriginalJCheckBox:setText("Write Over Original")
        self.writeOverOriginalJCheckBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.writeOverOriginalJCheckBoxActionPerformed and self or java_outer_self):writeOverOriginalJCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.widthReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.widthReductionTextFieldActionPerformed and self or java_outer_self):widthReductionTextFieldActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel5:setText("Less Width:")
        self.jLabel4:setText("Results:")
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.jLabel4):addGap(0, 0, require("java.lang.Short").MAX_VALUE)))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.jLabel4):addGap(0, 184, require("java.lang.Short").MAX_VALUE)))
        self.jLabel6:setText("Less Height:")
        self.heightReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.generateJButton:setText("Generate")
        self.generateJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.generateJButtonActionPerformed and self or java_outer_self):generateJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Row Total:")
        self.totalFramesJComboBox:setSelectedIndex(1)
        self.totalFramesJComboBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.totalFramesJComboBoxActionPerformed and self or java_outer_self):totalFramesJComboBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel2:setText("Column Total :")
        self.totalAnimationsJComboBox:setSelectedIndex(3)
        self.totalAnimationsJComboBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.totalAnimationsJComboBoxActionPerformed and self or java_outer_self):totalAnimationsJComboBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel3:setText("Type:")
        self.spriteTypeJComboBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.spriteTypeJComboBoxActionPerformed and self or java_outer_self):spriteTypeJComboBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local jPanel2Layout = GroupLayout.new(self.jPanel2)
        self.jPanel2:setLayout(jPanel2Layout)
        jPanel2Layout:setHorizontalGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(GroupLayout.Alignment.TRAILING, jPanel2Layout:createSequentialGroup():addContainerGap():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.totalFramesJComboBox, GroupLayout.PREFERRED_SIZE, 48, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel2):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.totalAnimationsJComboBox, GroupLayout.PREFERRED_SIZE, 39, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel3):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.spriteTypeJComboBox, GroupLayout.PREFERRED_SIZE, 172, GroupLayout.PREFERRED_SIZE):addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        jPanel2Layout:setVerticalGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel2Layout:createSequentialGroup():addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.totalFramesJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2):addComponent(self.totalAnimationsJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel3):addComponent(self.spriteTypeJComboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))))
        self.jLabel7:setText("More Width:")
        self.increaseWidthTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.increaseWidthTextField:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.increaseWidthTextFieldActionPerformed and self or java_outer_self):increaseWidthTextFieldActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel8:setText("More Height:")
        self.increaseHeightTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, GroupLayout.PREFERRED_SIZE, 415, require("java.lang.Short").MAX_VALUE):addGap(78, 78, 78)):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.writeOverOriginalJCheckBox):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.generateJButton)):addGroup(layout:createSequentialGroup():addComponent(self.jLabel5):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.widthReductionTextField, GroupLayout.PREFERRED_SIZE, 41, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel6):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.heightReductionTextField, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel7):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.increaseWidthTextField, GroupLayout.PREFERRED_SIZE, 41, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel8):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.increaseHeightTextField, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE))):addGap(0, 0, require("java.lang.Short").MAX_VALUE))):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel7):addComponent(self.increaseWidthTextField, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel8):addComponent(self.increaseHeightTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel5):addComponent(self.widthReductionTextField, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel6):addComponent(self.heightReductionTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.writeOverOriginalJCheckBox):addComponent(self.generateJButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
end
java_overload(SpriteSplitterImageJPanel, "initComponents", 0)


function SpriteSplitterImageJPanel:writeOverOriginalJCheckBoxActionPerformed(evt)
end
java_overload(SpriteSplitterImageJPanel, "writeOverOriginalJCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:generateJButtonActionPerformed(evt)
        self:process()
end
java_overload(SpriteSplitterImageJPanel, "generateJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:spriteTypeJComboBoxActionPerformed(evt)
        local spriteSplitterUtil = SpriteSplitterUtil.getInstance()
        self.jLabel1:setText(spriteSplitterUtil.ANIMATIONS_LABELS[self.spriteTypeJComboBox:getSelectedIndex() + 1])
        self.jLabel2:setText(spriteSplitterUtil.ANIMATIONS_LABELS[self.spriteTypeJComboBox:getSelectedIndex() + 1 + 1])
end
java_overload(SpriteSplitterImageJPanel, "spriteTypeJComboBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:totalAnimationsJComboBoxActionPerformed(evt)
end
java_overload(SpriteSplitterImageJPanel, "totalAnimationsJComboBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:totalFramesJComboBoxActionPerformed(evt)
end
java_overload(SpriteSplitterImageJPanel, "totalFramesJComboBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:widthReductionTextFieldActionPerformed(evt)
end
java_overload(SpriteSplitterImageJPanel, "widthReductionTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:increaseWidthTextFieldActionPerformed(evt)
end
java_overload(SpriteSplitterImageJPanel, "increaseWidthTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function SpriteSplitterImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end
java_overload(SpriteSplitterImageJPanel, "getImageProcessorInput", 0)


function SpriteSplitterImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end
java_overload(SpriteSplitterImageJPanel, "setImageProcessorInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageProcessorInput")) end)


-- throws IOException
function SpriteSplitterImageJPanel:visit(generatedBufferedImage, name, index)
        self.logUtil:putF(self.commonStrings.VISIT, self, self.commonStrings.VISIT)
        self.result = generatedBufferedImage
        self:getParent():repaint()
        local file = self.imageProcessorInput:getFiles()[index + 1]
        if not (self.writeOverOriginalJCheckBox:isSelected()) then
            local filePath = file:getAbsolutePath()
            local extensionIndex = ((string.find(filePath, self.imageStrings.PNG_EXTENSION, 1, true) or 0) - 1)
            filePath = tostring(StringMaker.new():append(string.sub(filePath, (0) + 1, extensionIndex)):append(self.commonSeps.UNDERSCORE):append(name):append(self.imageStrings.PNG_EXTENSION))
            file = File.new(filePath)
        end
        local isWritten = ImageIO.write(self.result, self.imageStrings.PNG, file)
        self.logUtil:putF(tostring(StringMaker.new():append("File: "):append(StringUtil.getInstance():toString(file)):append(" Wrote: "):appendboolean(isWritten)), self, self.commonStrings.RUN)
end
java_overload(SpriteSplitterImageJPanel, "visit", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BufferedImage")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)

return SpriteSplitterImageJPanel

