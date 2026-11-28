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

local ImageToolJFrame = {}
package.loaded["org.allbinary.image.gui.ImageToolJFrame"] = ImageToolJFrame

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
-- local Arrays = require("java.util.Arrays")
local Comparator = java_lazy("java.util.Comparator")
-- local ImageIO = require("javax.imageio.ImageIO")
local FileJDialog = java_lazy("org.allbinary.gui.dialog.FileJDialog")
local FileJDialogListenerInterface = java_lazy("org.allbinary.gui.dialog.FileJDialogListenerInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = java_lazy("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ColorRange = java_lazy("org.allbinary.media.image.analysis.ColorRange")
local ColorRangeInterface = java_lazy("org.allbinary.media.image.analysis.ColorRangeInterface")
local ImageAnalysis = java_lazy("org.allbinary.media.image.analysis.ImageAnalysis")
local ImageAnalysisResults = java_lazy("org.allbinary.media.image.analysis.ImageAnalysisResults")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local Dimension = require("java.awt.Dimension")
-- local GridLayout = require("java.awt.GridLayout")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local JButton = require("javax.swing.JButton")
-- local JDialog = require("javax.swing.JDialog")
-- local JFrame = require("javax.swing.JFrame")
-- local JLabel = require("javax.swing.JLabel")
-- local JMenu = require("javax.swing.JMenu")
-- local JMenuBar = require("javax.swing.JMenuBar")
-- local JMenuItem = require("javax.swing.JMenuItem")
-- local JPanel = require("javax.swing.JPanel")
-- local JTextField = require("javax.swing.JTextField")
-- local WindowConstants = require("javax.swing.WindowConstants")
local CanvasImageJPanel = java_lazy("org.allbinary.image.gui.CanvasImageJPanel")
local CreateIconImagesJPanel = java_lazy("org.allbinary.image.gui.CreateIconImagesJPanel")
local ImageAnalysisResultsJPanel = java_lazy("org.allbinary.image.gui.ImageAnalysisResultsJPanel")
local ImageUnifierJPanel = java_lazy("org.allbinary.image.gui.ImageUnifierJPanel")
local MirrorImageJPanel = java_lazy("org.allbinary.image.gui.MirrorImageJPanel")
local MirrorSpriteImageJPanel = java_lazy("org.allbinary.image.gui.MirrorSpriteImageJPanel")
local ResizeImageJPanel = java_lazy("org.allbinary.image.gui.ResizeImageJPanel")
local RotationImageJPanel = java_lazy("org.allbinary.image.gui.RotationImageJPanel")
local RotationSpriteImageJPanel = java_lazy("org.allbinary.image.gui.RotationSpriteImageJPanel")
local SpriteSplitterImageJPanel = java_lazy("org.allbinary.image.gui.SpriteSplitterImageJPanel")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table ImageToolJFrame is declared before the requires
ImageToolJFrame.__index = ImageToolJFrame
ImageToolJFrame.className = "ImageToolJFrame"
ImageToolJFrame.javaClassName = "org.allbinary.image.gui.ImageToolJFrame"
setmetatable(ImageToolJFrame, {__index = JFrame})
ImageToolJFrame.java_implements = " FileJDialogListenerInterface "
ImageToolJFrame.java_interfaces = function() return {FileJDialogListenerInterface} end

function ImageToolJFrame:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.fileJDialog == nil then self.fileJDialog = nil end
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.analysisActionJDialog == nil then self.analysisActionJDialog = nil end
    if self.analyzeJMenuItem == nil then self.analyzeJMenuItem = nil end
    if self.blueJLabel == nil then self.blueJLabel = nil end
    if self.colorRangeJLabel == nil then self.colorRangeJLabel = nil end
    if self.createStripImageJMenuItem == nil then self.createStripImageJMenuItem = nil end
    if self.fileJMenu == nil then self.fileJMenu = nil end
    if self.generateSpriteSplitterMenuItem == nil then self.generateSpriteSplitterMenuItem = nil end
    if self.generateRotationMenuItem == nil then self.generateRotationMenuItem = nil end
    if self.generateMirrorSpriteMenuItem == nil then self.generateMirrorSpriteMenuItem = nil end
    if self.generateRotationSpriteJMenuItem == nil then self.generateRotationSpriteJMenuItem = nil end
    if self.greenJLabel == nil then self.greenJLabel = nil end
    if self.jPanel1 == nil then self.jPanel1 = nil end
    if self.mainJMenuBar == nil then self.mainJMenuBar = nil end
    if self.maxBlueJTextField == nil then self.maxBlueJTextField = nil end
    if self.maxGreenJTextField == nil then self.maxGreenJTextField = nil end
    if self.maxJLabel == nil then self.maxJLabel = nil end
    if self.maxRedJTextField == nil then self.maxRedJTextField = nil end
    if self.minBlueJTextField == nil then self.minBlueJTextField = nil end
    if self.minGreenJTextField == nil then self.minGreenJTextField = nil end
    if self.minJLabel == nil then self.minJLabel = nil end
    if self.minRedJTextField == nil then self.minRedJTextField = nil end
    if self.mirrorJMenuItem == nil then self.mirrorJMenuItem = nil end
    if self.okJButton == nil then self.okJButton = nil end
    if self.openImageJMenuItem == nil then self.openImageJMenuItem = nil end
    if self.processingJMenu == nil then self.processingJMenu = nil end
    if self.redJLabel == nil then self.redJLabel = nil end
    if self.scaleImagesJMenuItem == nil then self.scaleImagesJMenuItem = nil end
    if self.canvasImagesJMenuItem == nil then self.canvasImagesJMenuItem = nil end
    if self.createIconImagesJMenuItem == nil then self.createIconImagesJMenuItem = nil end
    if self.titleJLabel == nil then self.titleJLabel = nil end
end


function ImageToolJFrame._jinit(self)
    java_super_init(JFrame, self)
    ImageToolJFrame._init_fields(self)
        self:initComponents()
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        self:setSize(640, 480)
        self:getMaxRedJTextField():setText("255")
        self:getMaxGreenJTextField():setText("255")
        self:getMaxBlueJTextField():setText("255")
        self:getMinRedJTextField():setText(commonPhoneStrings.ZERO)
        self:getMinGreenJTextField():setText(commonPhoneStrings.ZERO)
        self:getMinBlueJTextField():setText(commonPhoneStrings.ZERO)
        self.fileJDialog = FileJDialog.new()
        self.fileJDialog:addFinishedListener(self)
    return self
end

function ImageToolJFrame.new(...)
    local self = setmetatable({}, ImageToolJFrame)
    ImageToolJFrame._jinit(self, ...)
    return self
end


function ImageToolJFrame:initComponents()
        self.analysisActionJDialog = JDialog.new()
        self.titleJLabel = JLabel.new()
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
        self.jPanel1 = JPanel.new()
        self.mainJMenuBar = JMenuBar.new()
        self.fileJMenu = JMenu.new()
        self.openImageJMenuItem = JMenuItem.new()
        self.processingJMenu = JMenu.new()
        self.analyzeJMenuItem = JMenuItem.new()
        self.generateSpriteSplitterMenuItem = JMenuItem.new()
        self.generateRotationMenuItem = JMenuItem.new()
        self.generateMirrorSpriteMenuItem = JMenuItem.new()
        self.generateRotationSpriteJMenuItem = JMenuItem.new()
        self.createStripImageJMenuItem = JMenuItem.new()
        self.mirrorJMenuItem = JMenuItem.new()
        self.scaleImagesJMenuItem = JMenuItem.new()
        self.canvasImagesJMenuItem = JMenuItem.new()
        self.createIconImagesJMenuItem = JMenuItem.new()
        self.analysisActionJDialog:setMinimumSize(Dimension.new(350, 250))
        self.titleJLabel:setText("              Color At Action Options            ")
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
        local analysisActionJDialogLayout = GroupLayout.new(self.analysisActionJDialog:getContentPane())
        self.analysisActionJDialog:getContentPane():setLayout(analysisActionJDialogLayout)
        analysisActionJDialogLayout:setHorizontalGroup(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(analysisActionJDialogLayout:createSequentialGroup():addContainerGap():add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(analysisActionJDialogLayout:createSequentialGroup():add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(self.blueJLabel):add(self.greenJLabel):add(self.redJLabel):add(self.colorRangeJLabel)):add(29, 29, 29):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(require("org.jdesktop.layout.GroupLayout").TRAILING, self.minJLabel, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, 58, require("java.lang.Short").MAX_VALUE):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").TRAILING, false):add(require("org.jdesktop.layout.GroupLayout").LEADING, self.minBlueJTextField):add(require("org.jdesktop.layout.GroupLayout").LEADING, self.minGreenJTextField):add(require("org.jdesktop.layout.GroupLayout").LEADING, self.minRedJTextField, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, 42, require("java.lang.Short").MAX_VALUE):add(require("org.jdesktop.layout.GroupLayout").LEADING, self.okJButton))):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").TRAILING):add(require("org.jdesktop.layout.GroupLayout").LEADING, analysisActionJDialogLayout:createSequentialGroup():add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").TRAILING, false):add(require("org.jdesktop.layout.GroupLayout").LEADING, self.maxRedJTextField):add(require("org.jdesktop.layout.GroupLayout").LEADING, analysisActionJDialogLayout:createSequentialGroup():add(1, 1, 1):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(self.maxBlueJTextField):add(self.maxGreenJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, 43, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE)))):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED, 17, require("java.lang.Short").MAX_VALUE)):add(require("org.jdesktop.layout.GroupLayout").LEADING, self.maxJLabel, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, 61, require("java.lang.Short").MAX_VALUE)):addContainerGap()):add(require("org.jdesktop.layout.GroupLayout").TRAILING, analysisActionJDialogLayout:createSequentialGroup():add(self.titleJLabel):add(25, 25, 25)))))
        analysisActionJDialogLayout:setVerticalGroup(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").LEADING):add(analysisActionJDialogLayout:createSequentialGroup():add(self.titleJLabel):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").BASELINE):add(self.minJLabel):add(self.colorRangeJLabel):add(self.maxJLabel)):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").TRAILING):add(self.redJLabel):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").BASELINE):add(self.minRedJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):add(self.maxRedJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE))):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").TRAILING):add(self.greenJLabel):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").BASELINE):add(self.minGreenJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):add(self.maxGreenJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE))):addPreferredGap(require("org.jdesktop.layout.LayoutStyle").RELATED):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").TRAILING):add(self.blueJLabel):add(analysisActionJDialogLayout:createParallelGroup(require("org.jdesktop.layout.GroupLayout").BASELINE):add(self.minBlueJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE):add(self.maxBlueJTextField, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE, require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("org.jdesktop.layout.GroupLayout").PREFERRED_SIZE))):add(16, 16, 16):add(self.okJButton):addContainerGap(require("org.jdesktop.layout.GroupLayout").DEFAULT_SIZE, require("java.lang.Short").MAX_VALUE)))
        self:setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE)
        self:getContentPane():setLayout(GridLayout.new(1, 0))
        self.jPanel1:setLayout(GridLayout.new(1, 0))
        self:getContentPane():add(self.jPanel1)
        self.fileJMenu:setText("File")
        self.fileJMenu:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.fileJMenuActionPerformed and self or java_outer_self):fileJMenuActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.openImageJMenuItem:setText("Open")
        self.openImageJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.openImageJMenuItemActionPerformed and self or java_outer_self):openImageJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.fileJMenu:add(self.openImageJMenuItem)
        self.mainJMenuBar:add(self.fileJMenu)
        self.processingJMenu:setText("Processing")
        self.processingJMenu:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.processingJMenuActionPerformed and self or java_outer_self):processingJMenuActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.analyzeJMenuItem:setText("Image Analyze")
        self.analyzeJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.analyzeJMenuItemActionPerformed and self or java_outer_self):analyzeJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.analyzeJMenuItem)
        self.generateMirrorSpriteMenuItem:setText("Mirror Sprite Generator")
        self.generateMirrorSpriteMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.generateMirrorSpriteMenuItemActionPerformed and self or java_outer_self):generateMirrorSpriteMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.generateMirrorSpriteMenuItem)
        self.generateRotationSpriteJMenuItem:setText("Rotation Sprite Generator")
        self.generateRotationSpriteJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.generateRotationSpriteJMenuItemActionPerformed and self or java_outer_self):generateRotationSpriteJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.generateRotationSpriteJMenuItem)
        self.generateSpriteSplitterMenuItem:setText("Sprite Splitter Generator")
        self.generateSpriteSplitterMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.generateSpriteSplitterMenuItemActionPerformed and self or java_outer_self):generateSpriteSplitterMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.generateSpriteSplitterMenuItem)
        self.generateRotationMenuItem:setText("Rotate Image Generator")
        self.generateRotationMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.generateRotationMenuItemActionPerformed and self or java_outer_self):generateRotationMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.generateRotationMenuItem)
        self.createStripImageJMenuItem:setText("Multi Image Unifier")
        self.createStripImageJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.createStripImageJMenuItemActionPerformed and self or java_outer_self):createStripImageJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.createStripImageJMenuItem)
        self.mirrorJMenuItem:setText("Mirror Image(s)")
        self.mirrorJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.mirrorJMenuItemActionPerformed and self or java_outer_self):mirrorJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.mirrorJMenuItem)
        self.scaleImagesJMenuItem:setText("Scale Image(s)")
        self.scaleImagesJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.scaleImagesJMenuItemActionPerformed and self or java_outer_self):scaleImagesJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.scaleImagesJMenuItem)
        self.canvasImagesJMenuItem:setText("Canvas Image(s)")
        self.canvasImagesJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.canvasImagesJMenuItemActionPerformed and self or java_outer_self):canvasImagesJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.canvasImagesJMenuItem)
        self.createIconImagesJMenuItem:setText("Create Icon Image(s)")
        self.createIconImagesJMenuItem:addActionListener((function()
            local java_outer_self = self
        local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                ;(self.createIconsJMenuItemActionPerformed and self or java_outer_self):createIconsJMenuItemActionPerformed(evt)
            
            end
            java_overload(o, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)
            return o
        end)())
        self.processingJMenu:add(self.createIconImagesJMenuItem)
        self.mainJMenuBar:add(self.processingJMenu)
        self:setJMenuBar(self.mainJMenuBar)
        self:pack()
end
java_overload(ImageToolJFrame, "initComponents", 0)


function ImageToolJFrame:createStripImageJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            local imageUnifierJPanel = ImageUnifierJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(imageUnifierJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = imageUnifierJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "createStripImageJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "createStripImageJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:okJButtonActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "okJButtonActionPerformed")
            local imageAnalysisResultsArray = ImageAnalysis.getInstance():process(self.imageProcessorInput:getBufferedImageArray(), self:getColorRangeInterface())
            self.jPanel1:removeAll()
            self.jPanel1:add(ImageAnalysisResultsJPanel.new(imageAnalysisResultsArray))
            self.jPanel1:updateUI()
            self.analysisActionJDialog:setVisible(false)
            ImageToolJFrame.imageProcessorInputCompositeInterface = nil
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okJButtonActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "okJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:processingJMenuActionPerformed(evt)
end
java_overload(ImageToolJFrame, "processingJMenuActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:openImageJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "openImageJMenuItemActionPerformed")
            self.fileJDialog:setVisible(true)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "openImageJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "openImageJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:onFiles(files)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("Reading ") .. require("allbinary_java").to_string((files.n or #files))) .. require("allbinary_java").to_string(" files."), self, "onFiles")
            Arrays.sort(files, (function()
                local o = Comparator.new and Comparator.new() or setmetatable({}, {__index = Comparator})
                

                function o:compare(file1, file2)
                    local fileNameIndexValue1 = self:extractIndexNumberIfAnyFromFileName(file1:getName())
                    local fileNameIndexValue2 = self:extractIndexNumberIfAnyFromFileName(file2:getName())
                    return fileNameIndexValue1 - fileNameIndexValue2
                end
                java_overload(o, "compare", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "File")) and (java_a2 == nil or java_is(java_a2, "File")) end)
                

                function o:extractIndexNumberIfAnyFromFileName(name)
                    local i = 0
                    local try_ok, try_error, try_value = pcall(function()
                        local start = name:lastIndexOf("_") + 1
                        local end_ = name:lastIndexOf(".")
                        local number = string.sub(name, (start) + 1, end_)
                        i = math.tointeger(tonumber(number))
                    end)
                    if not try_ok then
                        local e = try_error
                        if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                        i = 0
                    end
                    return i
                end
                java_overload(o, "extractIndexNumberIfAnyFromFileName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)
                return o
            end)())
            local bufferedImageArray = java_new_array(nil, (files.n or #files))
            for index = 0, (files.n or #files) - 1 do
                bufferedImageArray[index + 1] = ImageIO.read(files[index + 1])
                if rawequal(bufferedImageArray[index + 1], nil) then
                    error(require("java.lang.Exception").new(require("allbinary_java").to_string("Unable to read file: ") .. require("allbinary_java").to_string(files[index + 1]:getPath())), 0)
                end
            end
            self.imageProcessorInput = ImageProcessorInput.new(files, bufferedImageArray)
            self.fileJDialog:setVisible(false)
            if not rawequal(ImageToolJFrame.imageProcessorInputCompositeInterface, nil) then
                ImageToolJFrame.imageProcessorInputCompositeInterface:setImageProcessorInput(self.imageProcessorInput)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onFiles", e)
        end
end
java_overload(ImageToolJFrame, "onFiles", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function ImageToolJFrame:fileJMenuActionPerformed(evt)
end
java_overload(ImageToolJFrame, "fileJMenuActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:analyzeJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "analyzeJMenuItemActionPerformed")
            self.analysisActionJDialog:setVisible(true)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "analyzeJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "analyzeJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:generateRotationSpriteJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "generateRotationSpriteJMenuItemActionPerformed")
            local spriteImageJPanel = RotationSpriteImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(spriteImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = spriteImageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateRotationSpriteJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "generateRotationSpriteJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:generateSpriteSplitterMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "generateRotationSpriteJMenuItemActionPerformed")
            local imageJPanel = SpriteSplitterImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(imageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = imageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateRotationMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "generateSpriteSplitterMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:generateRotationMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "generateRotationSpriteJMenuItemActionPerformed")
            local rotationImageJPanel = RotationImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(rotationImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = rotationImageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateRotationMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "generateRotationMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:scaleImagesJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "scaleImagesJMenuItemActionPerformed")
            local resizeImageJPanel = ResizeImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(resizeImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = resizeImageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "scaleImagesJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "scaleImagesJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:createIconsJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "createIconsJMenuItemActionPerformed")
            local createIconImagesJPanel = CreateIconImagesJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(createIconImagesJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = createIconImagesJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "scaleImagesJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "createIconsJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:canvasImagesJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "canvasImagesJMenuItemActionPerformed")
            local resizeImageJPanel = CanvasImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(resizeImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = resizeImageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "scaleImagesJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "canvasImagesJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:generateMirrorSpriteMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "generateMirrorSpriteJMenuItemActionPerformed")
            local spriteImageJPanel = MirrorSpriteImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(spriteImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = spriteImageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateMirrorSpriteJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "generateMirrorSpriteMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:mirrorJMenuItemActionPerformed(evt)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Starting", self, "generateMirrorJMenuItemActionPerformed")
            local mirrorImageJPanel = MirrorImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(mirrorImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = mirrorImageJPanel
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateMirrorJMenuItemActionPerformed", e)
        end
end
java_overload(ImageToolJFrame, "mirrorJMenuItemActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ImageToolJFrame:getColorRangeInterface()
        local colorRangeInterface = ColorRange.new()
        colorRangeInterface:setMinRed(require("allbinary_java").number_value(self:getMinRedJTextField():getText(), "intValue"))
        colorRangeInterface:setMaxRed(require("allbinary_java").number_value(self:getMaxRedJTextField():getText(), "intValue"))
        colorRangeInterface:setMinGreen(require("allbinary_java").number_value(self:getMinGreenJTextField():getText(), "intValue"))
        colorRangeInterface:setMaxGreen(require("allbinary_java").number_value(self:getMaxGreenJTextField():getText(), "intValue"))
        colorRangeInterface:setMinBlue(require("allbinary_java").number_value(self:getMinBlueJTextField():getText(), "intValue"))
        colorRangeInterface:setMaxBlue(require("allbinary_java").number_value(self:getMaxBlueJTextField():getText(), "intValue"))
        return colorRangeInterface
end
java_overload(ImageToolJFrame, "getColorRangeInterface", 0)


function ImageToolJFrame:getMaxBlueJTextField()
        return self.maxBlueJTextField
end
java_overload(ImageToolJFrame, "getMaxBlueJTextField", 0)


function ImageToolJFrame:setMaxBlueJTextField(maxBlueJTextField)
        self.maxBlueJTextField = self.maxBlueJTextField
end
java_overload(ImageToolJFrame, "setMaxBlueJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ImageToolJFrame:getMaxGreenJTextField()
        return self.maxGreenJTextField
end
java_overload(ImageToolJFrame, "getMaxGreenJTextField", 0)


function ImageToolJFrame:setMaxGreenJTextField(maxGreenJTextField)
        self.maxGreenJTextField = self.maxGreenJTextField
end
java_overload(ImageToolJFrame, "setMaxGreenJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ImageToolJFrame:getMaxRedJTextField()
        return self.maxRedJTextField
end
java_overload(ImageToolJFrame, "getMaxRedJTextField", 0)


function ImageToolJFrame:setMaxRedJTextField(maxRedJTextField)
        self.maxRedJTextField = self.maxRedJTextField
end
java_overload(ImageToolJFrame, "setMaxRedJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ImageToolJFrame:getMinBlueJTextField()
        return self.minBlueJTextField
end
java_overload(ImageToolJFrame, "getMinBlueJTextField", 0)


function ImageToolJFrame:setMinBlueJTextField(minBlueJTextField)
        self.minBlueJTextField = self.minBlueJTextField
end
java_overload(ImageToolJFrame, "setMinBlueJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ImageToolJFrame:getMinGreenJTextField()
        return self.minGreenJTextField
end
java_overload(ImageToolJFrame, "getMinGreenJTextField", 0)


function ImageToolJFrame:setMinGreenJTextField(minGreenJTextField)
        self.minGreenJTextField = self.minGreenJTextField
end
java_overload(ImageToolJFrame, "setMinGreenJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)


function ImageToolJFrame:getMinRedJTextField()
        return self.minRedJTextField
end
java_overload(ImageToolJFrame, "getMinRedJTextField", 0)


function ImageToolJFrame:setMinRedJTextField(minRedJTextField)
        self.minRedJTextField = self.minRedJTextField
end
java_overload(ImageToolJFrame, "setMinRedJTextField", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JTextField")) end)

ImageToolJFrame.imageProcessorInputCompositeInterface = nil

return ImageToolJFrame

