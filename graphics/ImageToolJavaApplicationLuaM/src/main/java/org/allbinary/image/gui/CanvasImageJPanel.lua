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

local CanvasImageJPanel = {}
package.loaded["org.allbinary.image.gui.CanvasImageJPanel"] = CanvasImageJPanel

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
local CanvasExpandUtil = java_lazy("org.allbinary.media.image.CanvasExpandUtil")
local CanvasTrimUtil = java_lazy("org.allbinary.media.image.CanvasTrimUtil")
local ImageProcessedVisitor = java_lazy("org.allbinary.media.image.ImageProcessedVisitor")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageStrings = java_lazy("org.allbinary.media.image.ImageStrings")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JCheckBox = require("javax.swing.JCheckBox")
-- local JLabel = require("javax.swing.JLabel")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local LayoutStyle = require("javax.swing.LayoutStyle")

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

-- class table CanvasImageJPanel is declared before the requires
CanvasImageJPanel.__index = CanvasImageJPanel
CanvasImageJPanel.className = "CanvasImageJPanel"
CanvasImageJPanel.javaClassName = "org.allbinary.image.gui.CanvasImageJPanel"
setmetatable(CanvasImageJPanel, {__index = JPanel})
CanvasImageJPanel.java_implements = " ImageProcessedVisitor "
CanvasImageJPanel.java_interfaces = function() return {ImageProcessedVisitor} end

function CanvasImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.result == nil then self.result = nil end
    if self.generateJButton == nil then self.generateJButton = nil end
    if self.heightReductionTextField == nil then self.heightReductionTextField = nil end
    if self.heightReductionTextField1 == nil then self.heightReductionTextField1 = nil end
    if self.jLabel4 == nil then self.jLabel4 = nil end
    if self.jLabel5 == nil then self.jLabel5 = nil end
    if self.jLabel6 == nil then self.jLabel6 = nil end
    if self.jLabel7 == nil then self.jLabel7 = nil end
    if self.jLabel8 == nil then self.jLabel8 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.jPanel2 == nil then self.jPanel2 = nil end
    if self.widthReductionTextField == nil then self.widthReductionTextField = nil end
    if self.widthReductionTextField1 == nil then self.widthReductionTextField1 = nil end
    if self.writeOverOriginalJCheckBox == nil then self.writeOverOriginalJCheckBox = nil end
end


function CanvasImageJPanel._jinit(self, imageProcessorInput)
    java_super_init(JPanel, self)
    CanvasImageJPanel._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
    return self
end

function CanvasImageJPanel.new(...)
    local self = setmetatable({}, CanvasImageJPanel)
    CanvasImageJPanel._jinit(self, ...)
    return self
end


function CanvasImageJPanel:process()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local canvasTrimUtil = CanvasTrimUtil.getInstance()
                    local canvasExpandUtil = CanvasExpandUtil.getInstance()
                    local leftReduction = tostring(java_outer_self.widthReductionTextField1:getText())
                    local topReduction = tostring(java_outer_self.heightReductionTextField1:getText())
                    local widthReduction = tostring(java_outer_self.widthReductionTextField:getText())
                    local heightReduction = tostring(java_outer_self.heightReductionTextField:getText())
                    if leftReduction <= 0 or topReduction <= 0 or widthReduction <= 0 or heightReduction <= 0 then
                        canvasTrimUtil:process(java_outer_self:getImageProcessorInput(), -leftReduction, -topReduction, -widthReduction, -heightReduction, java_outer_self)
                    else
                        canvasExpandUtil:process(java_outer_self:getImageProcessorInput(), leftReduction, topReduction, java_outer_self)
                    end
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    logUtil:put(java_outer_self.commonStrings.EXCEPTION, self, java_outer_self.commonStrings.RUN, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)():start()
end
java_overload(CanvasImageJPanel, "process", 0)


function CanvasImageJPanel:initComponents()
        self.writeOverOriginalJCheckBox = JCheckBox.new()
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
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.writeOverOriginalJCheckBoxActionPerformed and self or java_outer_self):writeOverOriginalJCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 0, require("java.lang.Short").MAX_VALUE))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGap(0, 196, require("java.lang.Short").MAX_VALUE))
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
        self.jLabel4:setText("Results:")
        self.jLabel5:setText("Right:")
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
        self.jLabel6:setText("Bottom")
        self.heightReductionTextField:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField1:setText(CommonPhoneStrings.getInstance().ZERO)
        self.widthReductionTextField1:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.widthReductionTextField1ActionPerformed and self or java_outer_self):widthReductionTextField1ActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.jLabel7:setText("Top")
        self.jLabel8:setText("Left:")
        self.heightReductionTextField1:setText(CommonPhoneStrings.getInstance().ZERO)
        local jPanel2Layout = GroupLayout.new(self.jPanel2)
        self.jPanel2:setLayout(jPanel2Layout)
        jPanel2Layout:setHorizontalGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel2Layout:createSequentialGroup():addContainerGap():addComponent(self.jLabel8):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.widthReductionTextField1, GroupLayout.PREFERRED_SIZE, 41, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel5):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.widthReductionTextField, GroupLayout.PREFERRED_SIZE, 41, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel7):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.heightReductionTextField1, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel6):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.heightReductionTextField, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE):addContainerGap(140, require("java.lang.Short").MAX_VALUE)))
        jPanel2Layout:setVerticalGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(GroupLayout.Alignment.TRAILING, jPanel2Layout:createSequentialGroup():addGap(0, 16, require("java.lang.Short").MAX_VALUE):addGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel6):addComponent(self.heightReductionTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel8):addComponent(self.widthReductionTextField1, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel7):addComponent(self.heightReductionTextField1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addGroup(jPanel2Layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel5):addComponent(self.widthReductionTextField, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE)))))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addGap(78, 78, 78)):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel4):addGroup(layout:createSequentialGroup():addComponent(self.writeOverOriginalJCheckBox):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.generateJButton))):addGap(0, 0, require("java.lang.Short").MAX_VALUE))):addContainerGap()))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.jPanel2, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.generateJButton):addComponent(self.writeOverOriginalJCheckBox)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jLabel4):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addComponent(self.jPanel1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
end
java_overload(CanvasImageJPanel, "initComponents", 0)


function CanvasImageJPanel:writeOverOriginalJCheckBoxActionPerformed(evt)
end
java_overload(CanvasImageJPanel, "writeOverOriginalJCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function CanvasImageJPanel:generateJButtonActionPerformed(evt)
        self:process()
end
java_overload(CanvasImageJPanel, "generateJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function CanvasImageJPanel:widthReductionTextFieldActionPerformed(evt)
end
java_overload(CanvasImageJPanel, "widthReductionTextFieldActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function CanvasImageJPanel:widthReductionTextField1ActionPerformed(evt)
end
java_overload(CanvasImageJPanel, "widthReductionTextField1ActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function CanvasImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end
java_overload(CanvasImageJPanel, "getImageProcessorInput", 0)


function CanvasImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end
java_overload(CanvasImageJPanel, "setImageProcessorInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageProcessorInput")) end)


-- throws IOException
function CanvasImageJPanel:visit(generatedBufferedImage, name, index)
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
java_overload(CanvasImageJPanel, "visit", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BufferedImage")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)

return CanvasImageJPanel

