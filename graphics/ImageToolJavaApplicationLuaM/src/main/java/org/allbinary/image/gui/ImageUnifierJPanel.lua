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

local ImageUnifierJPanel = {}
package.loaded["org.allbinary.image.gui.ImageUnifierJPanel"] = ImageUnifierJPanel

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
local File = java_lazy("java.io.File")
-- local DefaultListModel = require("javax.swing.DefaultListModel")
-- local ImageIcon = require("javax.swing.ImageIcon")
-- local Icon = require("javax.swing.Icon")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local FileWrapperUtil = java_lazy("org.allbinary.logic.io.file.FileWrapperUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ImagePersistanceUtil = java_lazy("org.allbinary.media.image.ImagePersistanceUtil")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = java_lazy("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageStrings = java_lazy("org.allbinary.media.image.ImageStrings")
local ImageUnifierCell = java_lazy("org.allbinary.media.image.ImageUnifierCell")
local ImageUnifierProperties = java_lazy("org.allbinary.media.image.ImageUnifierProperties")
local ImageUnifierUtil = java_lazy("org.allbinary.media.image.ImageUnifierUtil")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")
local ImagesRatioUtil = java_lazy("org.allbinary.media.image.ImagesRatioUtil")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local KeyAdapter = require("java.awt.event.KeyAdapter")
-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local PropertyChangeEvent = require("java.beans.PropertyChangeEvent")
-- local PropertyChangeListener = require("java.beans.PropertyChangeListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JLabel = require("javax.swing.JLabel")
-- local JList = require("javax.swing.JList")
-- local JPanel = require("javax.swing.JPanel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")
local ImageIconUnique = java_lazy("org.allbinary.image.gui.ImageIconUnique")

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

-- class table ImageUnifierJPanel is declared before the requires
ImageUnifierJPanel.__index = ImageUnifierJPanel
ImageUnifierJPanel.className = "ImageUnifierJPanel"
ImageUnifierJPanel.javaClassName = "org.allbinary.image.gui.ImageUnifierJPanel"
setmetatable(ImageUnifierJPanel, {__index = JPanel})
ImageUnifierJPanel.java_implements = " ImageProcessorInputCompositeInterface "
ImageUnifierJPanel.java_interfaces = function() return {ImageProcessorInputCompositeInterface} end

function ImageUnifierJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    self.imagesRatioUtil = ImagesRatioUtil.getInstance()
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.icon == nil then self.icon = nil end
    if self.imageUnifierProperties == nil then self.imageUnifierProperties = nil end
    if self.result == nil then self.result = nil end
    self.isImageFillIn = true
    if self.avgRatioJTextField == nil then self.avgRatioJTextField = nil end
    if self.cellHeightJTextField == nil then self.cellHeightJTextField = nil end
    if self.cellRatioJTextField == nil then self.cellRatioJTextField = nil end
    if self.cellWidthJTextField == nil then self.cellWidthJTextField = nil end
    if self.columnsJTextField == nil then self.columnsJTextField = nil end
    if self.downJButton == nil then self.downJButton = nil end
    if self.fudgeItJButton == nil then self.fudgeItJButton = nil end
    if self.imageJList == nil then self.imageJList = nil end
    if self.jButton1 == nil then self.jButton1 = nil end
    if self.jButton2 == nil then self.jButton2 = nil end
    if self.jButtonOrder == nil then self.jButtonOrder = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLabel3 == nil then self.jLabel3 = nil end
    if self.jLabel4 == nil then self.jLabel4 = nil end
    if self.jLabel5 == nil then self.jLabel5 = nil end
    if self.jLabel6 == nil then self.jLabel6 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.jScrollPane1 == nil then self.jScrollPane1 = nil end
    if self.jScrollPane2 == nil then self.jScrollPane2 = nil end
    if self.rowsJTextField == nil then self.rowsJTextField = nil end
    if self.upJButton == nil then self.upJButton = nil end
end


function ImageUnifierJPanel._jinit(self, imageProcessorInput)
    java_super_init(JPanel, self)
    ImageUnifierJPanel._init_fields(self)
        self:initComponents()
        self:setImageProcessorInput(imageProcessorInput)
    return self
end

function ImageUnifierJPanel.new(...)
    local self = setmetatable({}, ImageUnifierJPanel)
    ImageUnifierJPanel._jinit(self, ...)
    return self
end


function ImageUnifierJPanel:init()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end
java_overload(ImageUnifierJPanel, "init", 0)


function ImageUnifierJPanel:updateImage_j0()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateImage", e)
        end
end


function ImageUnifierJPanel:updateImageWithFudgedImages()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateImageWithFudgedImages", e)
        end
end
java_overload(ImageUnifierJPanel, "updateImageWithFudgedImages", 0)


function ImageUnifierJPanel:updateImage_j1(tempBufferedImageArray)
        self.result = ImageUnifierUtil.getInstance():getImage(tempBufferedImageArray, self.imageUnifierProperties)
        local image = ImageIcon.new(self.result)
        local label = JLabel.new(image)
        self.jScrollPane2:getViewport():add(label)
        self:updateUI()
end
function ImageUnifierJPanel:updateImage(...)
    local count = select("#", ...)
    if count == 0 then return self:updateImage_j0(...) end
    if count == 1 then return self:updateImage_j1(...) end
    error("No method updateImage takes " .. count .. " arguments")
end
ImageUnifierJPanel.updateImage__jdispatcher = ImageUnifierJPanel.updateImage


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
java_overload(ImageUnifierJPanel, "updateOnPropertiesChange", 0)


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
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.upJButton:setText("Up")
        self.upJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:upJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.downJButton:setText("Down")
        self.downJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:downJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.fudgeItJButton:setText("Fudge It!")
        self.fudgeItJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:fudgeItJButtonActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel2:setText("Columns:")
        self.columnsJTextField:setText(commonPhoneStrings.TWO)
        self.columnsJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:columnsJTextFieldActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.columnsJTextField:addPropertyChangeListener((function()
            local o = PropertyChangeListener.new and PropertyChangeListener.new() or setmetatable({}, {__index = PropertyChangeListener})
            

            function o:propertyChange(evt)
                self:columnsJTextFieldPropertyChange(evt)
            end
            java_overload(o, "propertyChange", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PropertyChangeEvent")) end)
            return o
        end)())
        self.columnsJTextField:addKeyListener((function()
            local o = KeyAdapter.new and KeyAdapter.new() or setmetatable({}, {__index = KeyAdapter})
            

            function o:keyPressed(evt)
                self:columnsJTextFieldKeyPressed(evt)
            end
            java_overload(o, "keyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)
            

            function o:keyTyped(evt)
                self:columnsJTextFieldKeyTyped(evt)
            end
            java_overload(o, "keyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)
            return o
        end)())
        self.jLabel1:setText("Rows:")
        self.rowsJTextField:setText(commonPhoneStrings.TWO)
        self.rowsJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:rowsJTextFieldActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel3:setText("Cell Width:")
        self.cellWidthJTextField:setText("200")
        self.cellWidthJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:cellWidthJTextFieldActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel4:setText("Cell Height:")
        self.cellHeightJTextField:setText("150")
        self.cellHeightJTextField:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:cellHeightJTextFieldActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
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
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jButtonOrder:setText("Order")
        self.jButtonOrder:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:jButtonOrderActionPerformed(evt)
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(GroupLayout.Alignment.TRAILING, jPanel1Layout:createSequentialGroup():addContainerGap():addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.TRAILING):addComponent(self.jButton1, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.upJButton, GroupLayout.PREFERRED_SIZE, 71, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 10, require("java.lang.Short").MAX_VALUE):addComponent(self.downJButton, GroupLayout.PREFERRED_SIZE, 70, GroupLayout.PREFERRED_SIZE)):addComponent(self.fudgeItJButton, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout:createSequentialGroup():addComponent(self.jLabel3):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 99, GroupLayout.PREFERRED_SIZE)):addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout:createSequentialGroup():addComponent(self.jLabel4):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 96, GroupLayout.PREFERRED_SIZE)):addComponent(self.avgRatioJTextField, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addComponent(self.jLabel6, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addComponent(self.cellRatioJTextField, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addComponent(self.jLabel5, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addComponent(self.cellHeightJTextField, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addComponent(self.cellWidthJTextField, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addComponent(self.jButton2, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE):addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout:createSequentialGroup():addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel2):addComponent(self.jLabel1)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.rowsJTextField, GroupLayout.DEFAULT_SIZE, 103, require("java.lang.Short").MAX_VALUE):addGroup(jPanel1Layout:createSequentialGroup():addComponent(self.columnsJTextField, GroupLayout.DEFAULT_SIZE, 102, require("java.lang.Short").MAX_VALUE):addGap(1, 1, 1)))):addComponent(self.jButtonOrder, GroupLayout.DEFAULT_SIZE, 151, require("java.lang.Short").MAX_VALUE)):addContainerGap()))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel1Layout:createSequentialGroup():addContainerGap():addComponent(self.jButton1):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.upJButton):addComponent(self.downJButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jButtonOrder):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.fudgeItJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel2):addComponent(self.columnsJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.rowsJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel3):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.cellWidthJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel4):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.cellHeightJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jButton2):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel5):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.cellRatioJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addGap(7, 7, 7):addComponent(self.jLabel6):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.avgRatioJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addGap(66, 66, 66)))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jScrollPane1, GroupLayout.PREFERRED_SIZE, 84, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jScrollPane2, GroupLayout.DEFAULT_SIZE, 527, require("java.lang.Short").MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(GroupLayout.Alignment.TRAILING, layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.TRAILING):addComponent(self.jPanel1, GroupLayout.Alignment.LEADING, 0, 445, require("java.lang.Short").MAX_VALUE):addComponent(self.jScrollPane2, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 445, require("java.lang.Short").MAX_VALUE):addComponent(self.jScrollPane1, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 445, require("java.lang.Short").MAX_VALUE)):addContainerGap()))
end
java_overload(ImageUnifierJPanel, "initComponents", 0)


function ImageUnifierJPanel:jButton2ActionPerformed(evt)
        self:updateOnPropertiesChange()
end
java_overload(ImageUnifierJPanel, "jButton2ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:columnsJTextFieldKeyPressed(evt)
end
java_overload(ImageUnifierJPanel, "columnsJTextFieldKeyPressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function ImageUnifierJPanel:columnsJTextFieldKeyTyped(evt)
end
java_overload(ImageUnifierJPanel, "columnsJTextFieldKeyTyped", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "KeyEvent")) end)


function ImageUnifierJPanel:columnsJTextFieldPropertyChange(evt)
end
java_overload(ImageUnifierJPanel, "columnsJTextFieldPropertyChange", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PropertyChangeEvent")) end)


function ImageUnifierJPanel:fudgeItJButtonActionPerformed(evt)
        self:updateImageWithFudgedImages()
end
java_overload(ImageUnifierJPanel, "fudgeItJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:cellHeightJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end
java_overload(ImageUnifierJPanel, "cellHeightJTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:cellWidthJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end
java_overload(ImageUnifierJPanel, "cellWidthJTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:columnsJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end
java_overload(ImageUnifierJPanel, "columnsJTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:rowsJTextFieldActionPerformed(evt)
        self:updateOnPropertiesChange()
end
java_overload(ImageUnifierJPanel, "rowsJTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:jButton1ActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "jButton1ActionPerformed", e)
        end
end
java_overload(ImageUnifierJPanel, "jButton1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


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
java_overload(ImageUnifierJPanel, "downJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


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
java_overload(ImageUnifierJPanel, "upJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


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
java_overload(ImageUnifierJPanel, "jButtonOrderActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageUnifierJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end
java_overload(ImageUnifierJPanel, "getImageProcessorInput", 0)


function ImageUnifierJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
        self:init()
end
java_overload(ImageUnifierJPanel, "setImageProcessorInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageProcessorInput")) end)

return ImageUnifierJPanel

