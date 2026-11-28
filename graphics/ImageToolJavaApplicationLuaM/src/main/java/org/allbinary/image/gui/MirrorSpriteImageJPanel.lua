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

local MirrorSpriteImageJPanel = {}
package.loaded["org.allbinary.image.gui.MirrorSpriteImageJPanel"] = MirrorSpriteImageJPanel

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
-- local ImageIO = require("javax.imageio.ImageIO")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BufferedImageUtil2 = java_lazy("org.allbinary.media.image.BufferedImageUtil2")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = java_lazy("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageStrings = java_lazy("org.allbinary.media.image.ImageStrings")
local MirrorImageUtil = java_lazy("org.allbinary.media.image.MirrorImageUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local JButton = require("javax.swing.JButton")
-- local JCheckBox = require("javax.swing.JCheckBox")
-- local JLabel = require("javax.swing.JLabel")
-- local JLayeredPane = require("javax.swing.JLayeredPane")
-- local JPanel = require("javax.swing.JPanel")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table MirrorSpriteImageJPanel is declared before the requires
MirrorSpriteImageJPanel.__index = MirrorSpriteImageJPanel
MirrorSpriteImageJPanel.className = "MirrorSpriteImageJPanel"
MirrorSpriteImageJPanel.javaClassName = "org.allbinary.image.gui.MirrorSpriteImageJPanel"
setmetatable(MirrorSpriteImageJPanel, {__index = JPanel})
MirrorSpriteImageJPanel.java_implements = " ImageProcessorInputCompositeInterface "
MirrorSpriteImageJPanel.java_interfaces = function() return {ImageProcessorInputCompositeInterface} end

function MirrorSpriteImageJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageStrings = ImageStrings.getInstance()
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.result == nil then self.result = nil end
    if self.generateJButton == nil then self.generateJButton = nil end
    if self.horizontalJCheckBox == nil then self.horizontalJCheckBox = nil end
    if self.imageHeightIsFrameSizeJCheckBox == nil then self.imageHeightIsFrameSizeJCheckBox = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLayeredPane1 == nil then self.jLayeredPane1 = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.jPanel2 == nil then self.jPanel2 = nil end
    if self.jPanel3 == nil then self.jPanel3 = nil end
    if self.verticleJCheckBox == nil then self.verticleJCheckBox = nil end
    if self.writeOverOriginalJCheckBox == nil then self.writeOverOriginalJCheckBox = nil end
end


function MirrorSpriteImageJPanel._jinit(self, imageProcessorInput)
    java_super_init(JPanel, self)
    MirrorSpriteImageJPanel._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF("Starting", self, self.commonStrings.CONSTRUCTOR)
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
    return self
end

function MirrorSpriteImageJPanel.new(...)
    local self = setmetatable({}, MirrorSpriteImageJPanel)
    MirrorSpriteImageJPanel._jinit(self, ...)
    return self
end


function MirrorSpriteImageJPanel:process()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local generatedBufferedImageArray = nil
                    local imageProcessorInput = java_outer_self:getImageProcessorInput()
                    local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
                    for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
                        generatedBufferedImageArray = MirrorImageUtil.getInstance():getImages(bufferedImageArray[index + 1], java_outer_self.verticleJCheckBox:isSelected(), java_outer_self.horizontalJCheckBox:isSelected())
                        java_outer_self.result = BufferedImageUtil2.getInstance():createSpriteImage(generatedBufferedImageArray)
                        java_outer_self:getParent():repaint()
                        local file = imageProcessorInput:getFiles()[index + 1]
                        if not (java_outer_self.writeOverOriginalJCheckBox:isSelected()) then
                            local filePath = file:getAbsolutePath()
                            local extensionIndex = ((string.find(filePath, java_outer_self.imageStrings.PNG_EXTENSION, 1, true) or 0) - 1)
                            filePath = require("allbinary_java").to_string(require("allbinary_java").to_string(string.sub(filePath, (0) + 1, extensionIndex)) .. require("allbinary_java").to_string("_mirror")) .. require("allbinary_java").to_string(java_outer_self.imageStrings.PNG_EXTENSION)
                            logUtil:putF(require("allbinary_java").to_string("Renamed File: ") .. require("allbinary_java").to_string(filePath), self, java_outer_self.commonStrings.RUN)
                            file = File.new(filePath)
                        end
                        local isWritten = ImageIO.write(java_outer_self.result, java_outer_self.imageStrings.PNG, file)
                        logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("File: ") .. require("allbinary_java").to_string(file)) .. require("allbinary_java").to_string(" Wrote: ")) .. require("allbinary_java").to_string(isWritten), self, java_outer_self.commonStrings.RUN)
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
java_overload(MirrorSpriteImageJPanel, "process", 0)


function MirrorSpriteImageJPanel:initComponents()
        self.jLayeredPane1 = JLayeredPane.new()
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
        self.jPanel2 = JPanel.new()
        self.imageHeightIsFrameSizeJCheckBox = JCheckBox.new()
        self.horizontalJCheckBox = JCheckBox.new()
        self.verticleJCheckBox = JCheckBox.new()
        self.writeOverOriginalJCheckBox = JCheckBox.new()
        self.generateJButton = JButton.new()
        self.jPanel3 = JPanel.new()
        self.jLabel2 = JLabel.new()
        local jPanel1Layout = GroupLayout.new(self.jPanel1)
        self.jPanel1:setLayout(jPanel1Layout)
        jPanel1Layout:setHorizontalGroup(jPanel1Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(0, 507, require("java.lang.Short").MAX_VALUE))
        jPanel1Layout:setVerticalGroup(jPanel1Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(0, 230, require("java.lang.Short").MAX_VALUE))
        self.imageHeightIsFrameSizeJCheckBox:setSelected(true)
        self.imageHeightIsFrameSizeJCheckBox:setText("Image Height Is Frame Size")
        self.imageHeightIsFrameSizeJCheckBox:setEnabled(false)
        self.imageHeightIsFrameSizeJCheckBox:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.imageHeightIsFrameSizeJCheckBoxActionPerformed and self or java_outer_self):imageHeightIsFrameSizeJCheckBoxActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.horizontalJCheckBox:setSelected(true)
        self.horizontalJCheckBox:setText("Horizontal")
        self.horizontalJCheckBox:setEnabled(false)
        self.verticleJCheckBox:setText("Verticle")
        self.verticleJCheckBox:setEnabled(false)
        self.writeOverOriginalJCheckBox:setText("Write Over Original")
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
        local jPanel2Layout = GroupLayout.new(self.jPanel2)
        self.jPanel2:setLayout(jPanel2Layout)
        jPanel2Layout:setHorizontalGroup(jPanel2Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(jPanel2Layout:createSequentialGroup():addContainerGap(require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):add(self.verticleJCheckBox):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").UNRELATED):add(self.horizontalJCheckBox):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(self.imageHeightIsFrameSizeJCheckBox):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(self.writeOverOriginalJCheckBox):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(self.generateJButton)))
        jPanel2Layout:setVerticalGroup(jPanel2Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(jPanel2Layout:createSequentialGroup():add(jPanel2Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").BASELINE):add(self.imageHeightIsFrameSizeJCheckBox, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):add(self.horizontalJCheckBox):add(self.verticleJCheckBox):add(self.writeOverOriginalJCheckBox):add(self.generateJButton, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, 25, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE)):addContainerGap()))
        self.jLabel2:setText("Results:")
        local jPanel3Layout = GroupLayout.new(self.jPanel3)
        self.jPanel3:setLayout(jPanel3Layout)
        jPanel3Layout:setHorizontalGroup(jPanel3Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(jPanel3Layout:createSequentialGroup():add(self.jLabel2):addContainerGap(448, require("java.lang.Short").MAX_VALUE)))
        jPanel3Layout:setVerticalGroup(jPanel3Layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(self.jLabel2))
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(require("org.jdesktop.layout.GroupLayout").TRAILING, layout:createSequentialGroup():addContainerGap():add(self.jPanel3, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):addContainerGap()):add(self.jPanel1, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE):add(layout:createSequentialGroup():add(self.jPanel2, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):addContainerGap(require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(layout:createSequentialGroup():add(self.jPanel2, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, 25, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(self.jPanel3, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(self.jPanel1, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
end
java_overload(MirrorSpriteImageJPanel, "initComponents", 0)


function MirrorSpriteImageJPanel:generateJButtonActionPerformed(evt)
        self:process()
end
java_overload(MirrorSpriteImageJPanel, "generateJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MirrorSpriteImageJPanel:imageHeightIsFrameSizeJCheckBoxActionPerformed(evt)
end
java_overload(MirrorSpriteImageJPanel, "imageHeightIsFrameSizeJCheckBoxActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function MirrorSpriteImageJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end
java_overload(MirrorSpriteImageJPanel, "getImageProcessorInput", 0)


function MirrorSpriteImageJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end
java_overload(MirrorSpriteImageJPanel, "setImageProcessorInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageProcessorInput")) end)

return MirrorSpriteImageJPanel

