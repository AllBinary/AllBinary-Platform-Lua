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

local ImageActionScriptOutputJPanel = {}
package.loaded["org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputJPanel"] = ImageActionScriptOutputJPanel

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local DefaultListModel = require("javax.swing.DefaultListModel")
local InputImageType = java_lazy("org.allbinary.input.media.image.InputImageType")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local Insets = require("java.awt.Insets")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local AbstractListModel = require("javax.swing.AbstractListModel")
-- local BorderFactory = require("javax.swing.BorderFactory")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JCheckBox = require("javax.swing.JCheckBox")
-- local JDialog = require("javax.swing.JDialog")
-- local JLabel = require("javax.swing.JLabel")
-- local JList = require("javax.swing.JList")
-- local JPanel = require("javax.swing.JPanel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local ImageActionScriptOutputInterface = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputInterface")
local ImageTypes = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageTypes")

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

-- class table ImageActionScriptOutputJPanel is declared before the requires
ImageActionScriptOutputJPanel.__index = ImageActionScriptOutputJPanel
ImageActionScriptOutputJPanel.className = "ImageActionScriptOutputJPanel"
ImageActionScriptOutputJPanel.javaClassName = "org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputJPanel"
setmetatable(ImageActionScriptOutputJPanel, {__index = JPanel})

function ImageActionScriptOutputJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.capturedImageActionScriptOutputInterface == nil then self.capturedImageActionScriptOutputInterface = nil end
    if self.capturedImageActionJButton == nil then self.capturedImageActionJButton = nil end
    if self.capturedImageActionJDialog == nil then self.capturedImageActionJDialog = nil end
    if self.displayJCheckBox == nil then self.displayJCheckBox = nil end
    if self.itemTypesJList == nil then self.itemTypesJList = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jScrollPane1 == nil then self.jScrollPane1 = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.saveJCheckBox == nil then self.saveJCheckBox = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
end


function ImageActionScriptOutputJPanel._jinit(self, capturedImageActionScriptOutputInterface)
    java_super_init(JPanel, self)
    ImageActionScriptOutputJPanel._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.capturedImageActionScriptOutputInterface = capturedImageActionScriptOutputInterface
        self:set()
    return self
end

function ImageActionScriptOutputJPanel.new(...)
    local self = setmetatable({}, ImageActionScriptOutputJPanel)
    ImageActionScriptOutputJPanel._jinit(self, ...)
    return self
end


function ImageActionScriptOutputJPanel:set()
        self:setImageTypeJlistModel()
        local imageTypes = self.capturedImageActionScriptOutputInterface:getImageTypes()
        local vector = imageTypes:getVector()
        local selectedArray = java_typed_array("I", java_new_array(0, vector:size()))
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
java_overload(ImageActionScriptOutputJPanel, "set", 0)


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
java_overload(ImageActionScriptOutputJPanel, "update", 0)


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
java_overload(ImageActionScriptOutputJPanel, "setImageTypeJlistModel", 0)


function ImageActionScriptOutputJPanel:getCapturedImageActionJDialog()
        return self.capturedImageActionJDialog
end
java_overload(ImageActionScriptOutputJPanel, "getCapturedImageActionJDialog", 0)


function ImageActionScriptOutputJPanel:setCapturedImageActionJDialog(capturedImageActionJDialog)
        self.capturedImageActionJDialog = capturedImageActionJDialog
end
java_overload(ImageActionScriptOutputJPanel, "setCapturedImageActionJDialog", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JDialog")) end)


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
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.okJButtonActionPerformed and self or java_outer_self):okJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.saveJCheckBox:setText("Save To File")
        self.saveJCheckBox:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.saveJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.displayJCheckBox:setText("Display")
        self.displayJCheckBox:setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0))
        self.displayJCheckBox:setMargin(Insets.new(0, 0, 0, 0))
        self.displayJCheckBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.displayJCheckBoxActionPerformed and self or java_outer_self):displayJCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.itemTypesJList:setModel((function()
            local o = AbstractListModel.new and AbstractListModel.new() or setmetatable({}, {__index = AbstractListModel})
            self.strings = {"Item 1", "Item 2", "Item 3", "Item 4", "Item 5"}
            

            function o:getSize()
                return (self.strings.n or #self.strings)
            end
            java_overload(o, "getSize", 0)
            

            function o:getElementAt(i)
                return self.strings[i + 1]
            end
            java_overload(o, "getElementAt", 1, function(java_a1) return true and type(java_a1) == "number" end)
            return o
        end)())
        self.jScrollPane1:setViewportView(self.itemTypesJList)
        local capturedImageActionJDialogLayout = GroupLayout.new(self.capturedImageActionJDialog:getContentPane())
        self.capturedImageActionJDialog:getContentPane():setLayout(capturedImageActionJDialogLayout)
        capturedImageActionJDialogLayout:setHorizontalGroup(capturedImageActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addGroup(capturedImageActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addGap(61, 61, 61):addComponent(self.titleJLabel)):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addContainerGap():addGroup(capturedImageActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.displayJCheckBox):addComponent(self.saveJCheckBox, GroupLayout.Alignment.TRAILING)):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addGap(84, 84, 84):addComponent(self.okJButton)))):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addContainerGap():addComponent(self.jScrollPane1, GroupLayout.DEFAULT_SIZE, 216, require("java.lang.Short").MAX_VALUE))):addContainerGap()))
        capturedImageActionJDialogLayout:setVerticalGroup(capturedImageActionJDialogLayout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(capturedImageActionJDialogLayout:createSequentialGroup():addComponent(self.titleJLabel):addGap(5, 5, 5):addComponent(self.jScrollPane1, GroupLayout.DEFAULT_SIZE, 105, require("java.lang.Short").MAX_VALUE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.saveJCheckBox):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.displayJCheckBox):addGap(9, 9, 9):addComponent(self.okJButton):addContainerGap()))
        self:setMinimumSize(Dimension.new(100, 0))
        self.capturedImageActionJButton:setText("Edit")
        self.capturedImageActionJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.capturedImageActionJButtonActionPerformed and self or java_outer_self):capturedImageActionJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Capture Image:")
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jLabel1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.capturedImageActionJButton)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.capturedImageActionJButton)))
end
java_overload(ImageActionScriptOutputJPanel, "initComponents", 0)


function ImageActionScriptOutputJPanel:displayJCheckBoxActionPerformed(evt)
end
java_overload(ImageActionScriptOutputJPanel, "displayJCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageActionScriptOutputJPanel:okJButtonActionPerformed(evt)
        self:update()
        self:getCapturedImageActionJDialog():setVisible(false)
end
java_overload(ImageActionScriptOutputJPanel, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageActionScriptOutputJPanel:capturedImageActionJButtonActionPerformed(evt)
        self:getCapturedImageActionJDialog():setVisible(true)
end
java_overload(ImageActionScriptOutputJPanel, "capturedImageActionJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return ImageActionScriptOutputJPanel

