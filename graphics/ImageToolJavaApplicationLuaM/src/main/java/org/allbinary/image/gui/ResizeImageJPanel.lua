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

local ResizeImageJPanel = {}
package.loaded["org.allbinary.image.gui.ResizeImageJPanel"] = ResizeImageJPanel

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
-- local Raster = require("java.awt.image.Raster")
local File = java_lazy("java.io.File")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local FileWrapperUtil = java_lazy("org.allbinary.logic.io.file.FileWrapperUtil")
local ImagePersistanceUtil = java_lazy("org.allbinary.media.image.ImagePersistanceUtil")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = java_lazy("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
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

-- class table ResizeImageJPanel is declared before the requires
ResizeImageJPanel.__index = ResizeImageJPanel
ResizeImageJPanel.className = "ResizeImageJPanel"
ResizeImageJPanel.javaClassName = "org.allbinary.image.gui.ResizeImageJPanel"
setmetatable(ResizeImageJPanel, {__index = JPanel})
ResizeImageJPanel.java_implements = " ImageProcessorInputCompositeInterface "
ResizeImageJPanel.java_interfaces = function() return {ImageProcessorInputCompositeInterface} end

function ResizeImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.aboveJButton == nil then self.aboveJButton = nil end
    if self.adjustFor16AboveJButton == nil then self.adjustFor16AboveJButton = nil end
    if self.adjustFor16BelowJButton == nil then self.adjustFor16BelowJButton = nil end
    if self.floatPercentJTextField == nil then self.floatPercentJTextField = nil end
    if self.jComboBox1 == nil then self.jComboBox1 = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLabel3 == nil then self.jLabel3 = nil end
    if self.jTextField1 == nil then self.jTextField1 = nil end
    if self.jTextField2 == nil then self.jTextField2 = nil end
    if self.updateJButton == nil then self.updateJButton = nil end
end


function ResizeImageJPanel._jinit(self, imageProcessorInput)
    java_super_init(JPanel, self)
    ResizeImageJPanel._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
        local numberStringArray = java_new_array(nil, 101)
        numberStringArray[1] = tostring(-1)
        for index = 1, 100 - 1 do
            numberStringArray[index + 1] = tostring(index)
        end
        self.jComboBox1:setModel(DefaultComboBoxModel.new(numberStringArray))
        local araster = self.imageProcessorInput:getBufferedImageArray()[1]:getAlphaRaster()
        if rawequal(araster, nil) then
            print("there is no Alpha channel!!!!!!!!!")
        else
            print("Alpha channel found !")
        end
    return self
end

function ResizeImageJPanel.new(...)
    local self = setmetatable({}, ResizeImageJPanel)
    ResizeImageJPanel._jinit(self, ...)
    return self
end


function ResizeImageJPanel:process()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local imageUtil = ImageUtil.getInstance()
                    local percent = tostring(java_outer_self.jComboBox1:getSelectedItem())
                    local percentAsFloat = tonumber(java_outer_self.floatPercentJTextField:getText())
                    local imageProcessorInput = java_outer_self:getImageProcessorInput()
                    local files = imageProcessorInput:getFiles()
                    local generatedBufferedImageArray = nil
                    if not rawequal(math.tointeger(percentAsFloat // 1), -1) then
                        generatedBufferedImageArray = imageUtil:createBufferedImage2(imageProcessorInput:getBufferedImageArray(), percentAsFloat, true)
                    elseif not rawequal(math.tointeger(percent // 1), -1) then
                        generatedBufferedImageArray = imageUtil:createBufferedImageForResize(imageProcessorInput:getBufferedImageArray(), percent, true)
                    else
                        local width = tostring(java_outer_self.jTextField1:getText())
                        local height = tostring(java_outer_self.jTextField2:getText())
                        generatedBufferedImageArray = imageUtil:createBufferedImage3(imageProcessorInput:getBufferedImageArray(), width, height, true)
                    end
                    local araster = generatedBufferedImageArray[1]:getAlphaRaster()
                    if rawequal(araster, nil) then
                        print("No Alpha Channel In Result")
                    else
                        print("Found Alpha Channel In Result")
                    end
                    local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
                    for index = 0, (generatedBufferedImageArray.n or #generatedBufferedImageArray) - 1 do
                        imagePersistanceUtil:saveWithBatik(FileWrapperUtil.wrapFile(files[index + 1]), generatedBufferedImageArray[index + 1])
                    end
                    java_outer_self:getParent():repaint()
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
java_overload(ResizeImageJPanel, "process", 0)


function ResizeImageJPanel:update()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local imageProcessorInput = java_outer_self:getImageProcessorInput()
                    local size = (imageProcessorInput:getBufferedImageArray().n or #imageProcessorInput:getBufferedImageArray())
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    local bufferedImage = nil
                    for index = 0, size - 1 do
                        bufferedImage = bufferedImageArray[1]
                        java_outer_self.jTextField1:setText(tostring(bufferedImage:getWidth()))
                        java_outer_self.jTextField2:setText(tostring(bufferedImage:getHeight()))
                    end
                    java_outer_self:getParent():repaint()
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
java_overload(ResizeImageJPanel, "update", 0)


function ResizeImageJPanel:updateFor16Above()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local imageProcessorInput = java_outer_self:getImageProcessorInput()
                    local size = (imageProcessorInput:getBufferedImageArray().n or #imageProcessorInput:getBufferedImageArray())
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    local bufferedImage = nil
                    for index = 0, size - 1 do
                        bufferedImage = bufferedImageArray[1]
                        java_outer_self.jTextField1:setText(tostring(bufferedImage:getWidth() / 16 * 16))
                        java_outer_self.jTextField2:setText(tostring(bufferedImage:getHeight() / 16 * 16))
                    end
                    java_outer_self:getParent():repaint()
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
java_overload(ResizeImageJPanel, "updateFor16Above", 0)


function ResizeImageJPanel:updateFor16Below()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local imageProcessorInput = java_outer_self:getImageProcessorInput()
                    local size = (imageProcessorInput:getBufferedImageArray().n or #imageProcessorInput:getBufferedImageArray())
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    local bufferedImage = nil
                    for index = 0, size - 1 do
                        bufferedImage = bufferedImageArray[1]
                        java_outer_self.jTextField1:setText(tostring(((bufferedImage:getWidth() / 16) + 1) * 16))
                        java_outer_self.jTextField2:setText(tostring(((bufferedImage:getHeight() / 16) + 1) * 16))
                    end
                    java_outer_self:getParent():repaint()
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
java_overload(ResizeImageJPanel, "updateFor16Below", 0)


function ResizeImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end
java_overload(ResizeImageJPanel, "getImageProcessorInput", 0)


function ResizeImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end
java_overload(ResizeImageJPanel, "setImageProcessorInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageProcessorInput")) end)


function ResizeImageJPanel:initComponents()
        self.jLabel1 = JLabel.new()
        self.jComboBox1 = JComboBox.new()
        self.aboveJButton = JButton.new()
        self.jTextField1 = JTextField.new()
        self.jLabel2 = JLabel.new()
        self.jLabel3 = JLabel.new()
        self.jTextField2 = JTextField.new()
        self.updateJButton = JButton.new()
        self.floatPercentJTextField = JTextField.new()
        self.adjustFor16AboveJButton = JButton.new()
        self.adjustFor16BelowJButton = JButton.new()
        self.jLabel1:setText("Percent:")
        self.jComboBox1:setModel(DefaultComboBoxModel.new({"Item 1", "Item 2", "Item 3", "Item 4"}))
        self.aboveJButton:setText("Process")
        self.aboveJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.aboveJButtonActionPerformed and self or java_outer_self):aboveJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel2:setText("Width:")
        self.jLabel3:setText("Height:")
        self.updateJButton:setText("Update")
        self.updateJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.updateJButtonActionPerformed and self or java_outer_self):updateJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.floatPercentJTextField:setText("-1.000000")
        self.floatPercentJTextField:setMinimumSize(Dimension.new(120, 22))
        self.adjustFor16AboveJButton:setText("Adjust for 16 Above")
        self.adjustFor16AboveJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.adjustFor16AboveJButtonActionPerformed and self or java_outer_self):adjustFor16AboveJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.adjustFor16BelowJButton:setText("Adjust for 16 Below")
        self.adjustFor16BelowJButton:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.adjustFor16BelowJButtonActionPerformed and self or java_outer_self):adjustFor16BelowJButtonActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel1):addComponent(self.jLabel2):addComponent(self.jLabel3)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING, false):addComponent(self.jComboBox1, 0, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addComponent(self.jTextField1):addComponent(self.jTextField2)):addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.floatPercentJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.adjustFor16AboveJButton):addComponent(self.adjustFor16BelowJButton)):addContainerGap(GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)):addGroup(layout:createSequentialGroup():addComponent(self.updateJButton):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.aboveJButton):addGap(0, 250, require("java.lang.Short").MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.jComboBox1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.floatPercentJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jTextField1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel2):addComponent(self.adjustFor16AboveJButton)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel3):addComponent(self.jTextField2, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.adjustFor16BelowJButton)):addGap(18, 18, 18):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.aboveJButton):addComponent(self.updateJButton)):addContainerGap(175, require("java.lang.Short").MAX_VALUE)))
end
java_overload(ResizeImageJPanel, "initComponents", 0)


function ResizeImageJPanel:aboveJButtonActionPerformed(evt)
        self:process()
end
java_overload(ResizeImageJPanel, "aboveJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ResizeImageJPanel:updateJButtonActionPerformed(evt)
        self:update()
end
java_overload(ResizeImageJPanel, "updateJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ResizeImageJPanel:adjustFor16AboveJButtonActionPerformed(evt)
        self:updateFor16Above()
end
java_overload(ResizeImageJPanel, "adjustFor16AboveJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ResizeImageJPanel:adjustFor16BelowJButtonActionPerformed(evt)
        self:updateFor16Below()
end
java_overload(ResizeImageJPanel, "adjustFor16BelowJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return ResizeImageJPanel

