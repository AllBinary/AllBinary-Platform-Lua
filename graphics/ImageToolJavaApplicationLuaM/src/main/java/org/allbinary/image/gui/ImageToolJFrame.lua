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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local File = require("java.io.File")
-- local Arrays = require("java.util.Arrays")
-- local Comparator = require("java.util.Comparator")
-- local ImageIO = require("javax.imageio.ImageIO")
local FileJDialog = require("org.allbinary.gui.dialog.FileJDialog")
local FileJDialogListenerInterface = require("org.allbinary.gui.dialog.FileJDialogListenerInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = require("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ColorRange = require("org.allbinary.media.image.analysis.ColorRange")
local ColorRangeInterface = require("org.allbinary.media.image.analysis.ColorRangeInterface")
local ImageAnalysis = require("org.allbinary.media.image.analysis.ImageAnalysis")
local ImageAnalysisResults = require("org.allbinary.media.image.analysis.ImageAnalysisResults")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JFrame = require("org.allbinary.image.gui.JFrame")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageToolJFrame = {}
ImageToolJFrame.__index = ImageToolJFrame
ImageToolJFrame.className = "ImageToolJFrame"
setmetatable(ImageToolJFrame, {__index = JFrame})

function ImageToolJFrame:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.fileJDialog = nil
    self.imageProcessorInput = nil
    self.analysisActionJDialog = nil
    self.analyzeJMenuItem = nil
    self.blueJLabel = nil
    self.colorRangeJLabel = nil
    self.createStripImageJMenuItem = nil
    self.fileJMenu = nil
    self.generateSpriteSplitterMenuItem = nil
    self.generateRotationMenuItem = nil
    self.generateMirrorSpriteMenuItem = nil
    self.generateRotationSpriteJMenuItem = nil
    self.greenJLabel = nil
    self.jPanel1 = nil
    self.mainJMenuBar = nil
    self.maxBlueJTextField = nil
    self.maxGreenJTextField = nil
    self.maxJLabel = nil
    self.maxRedJTextField = nil
    self.minBlueJTextField = nil
    self.minGreenJTextField = nil
    self.minJLabel = nil
    self.minRedJTextField = nil
    self.mirrorJMenuItem = nil
    self.okJButton = nil
    self.openImageJMenuItem = nil
    self.processingJMenu = nil
    self.redJLabel = nil
    self.scaleImagesJMenuItem = nil
    self.canvasImagesJMenuItem = nil
    self.createIconImagesJMenuItem = nil
    self.titleJLabel = nil
end


function ImageToolJFrame.new()
    local self = setmetatable(JFrame.new(), ImageToolJFrame)
    self:_init_fields()
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
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:okJButtonActionPerformed(evt)
            end
            return o
        end)())
        local analysisActionJDialogLayout = GroupLayout.new(self.analysisActionJDialog:getContentPane())
        self.analysisActionJDialog:getContentPane():setLayout(analysisActionJDialogLayout)
        analysisActionJDialogLayout:setHorizontalGroup(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(analysisActionJDialogLayout:createSequentialGroup():addContainerGap():add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(analysisActionJDialogLayout:createSequentialGroup():add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(self.blueJLabel):add(self.greenJLabel):add(self.redJLabel):add(self.colorRangeJLabel)):add(29, 29, 29):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(org.jdesktop.layout.GroupLayout.TRAILING, self.minJLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 58, Short.MAX_VALUE):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false):add(org.jdesktop.layout.GroupLayout.LEADING, self.minBlueJTextField):add(org.jdesktop.layout.GroupLayout.LEADING, self.minGreenJTextField):add(org.jdesktop.layout.GroupLayout.LEADING, self.minRedJTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 42, Short.MAX_VALUE):add(org.jdesktop.layout.GroupLayout.LEADING, self.okJButton))):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING):add(org.jdesktop.layout.GroupLayout.LEADING, analysisActionJDialogLayout:createSequentialGroup():add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false):add(org.jdesktop.layout.GroupLayout.LEADING, self.maxRedJTextField):add(org.jdesktop.layout.GroupLayout.LEADING, analysisActionJDialogLayout:createSequentialGroup():add(1, 1, 1):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(self.maxBlueJTextField):add(self.maxGreenJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 43, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 17, Short.MAX_VALUE)):add(org.jdesktop.layout.GroupLayout.LEADING, self.maxJLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 61, Short.MAX_VALUE)):addContainerGap()):add(org.jdesktop.layout.GroupLayout.TRAILING, analysisActionJDialogLayout:createSequentialGroup():add(self.titleJLabel):add(25, 25, 25)))))
        analysisActionJDialogLayout:setVerticalGroup(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING):add(analysisActionJDialogLayout:createSequentialGroup():add(self.titleJLabel):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE):add(self.minJLabel):add(self.colorRangeJLabel):add(self.maxJLabel)):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING):add(self.redJLabel):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE):add(self.minRedJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):add(self.maxRedJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING):add(self.greenJLabel):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE):add(self.minGreenJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):add(self.maxGreenJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))):addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING):add(self.blueJLabel):add(analysisActionJDialogLayout:createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE):add(self.minBlueJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE):add(self.maxBlueJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))):add(16, 16, 16):add(self.okJButton):addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        self:setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE)
        self:getContentPane():setLayout(GridLayout.new(1, 0))
        self.jPanel1:setLayout(GridLayout.new(1, 0))
        self:getContentPane():add(self.jPanel1)
        self.fileJMenu:setText("File")
        self.fileJMenu:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:fileJMenuActionPerformed(evt)
            end
            return o
        end)())
        self.openImageJMenuItem:setText("Open")
        self.openImageJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:openImageJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.fileJMenu:add(self.openImageJMenuItem)
        self.mainJMenuBar:add(self.fileJMenu)
        self.processingJMenu:setText("Processing")
        self.processingJMenu:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:processingJMenuActionPerformed(evt)
            end
            return o
        end)())
        self.analyzeJMenuItem:setText("Image Analyze")
        self.analyzeJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:analyzeJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.analyzeJMenuItem)
        self.generateMirrorSpriteMenuItem:setText("Mirror Sprite Generator")
        self.generateMirrorSpriteMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateMirrorSpriteMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.generateMirrorSpriteMenuItem)
        self.generateRotationSpriteJMenuItem:setText("Rotation Sprite Generator")
        self.generateRotationSpriteJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateRotationSpriteJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.generateRotationSpriteJMenuItem)
        self.generateSpriteSplitterMenuItem:setText("Sprite Splitter Generator")
        self.generateSpriteSplitterMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateSpriteSplitterMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.generateSpriteSplitterMenuItem)
        self.generateRotationMenuItem:setText("Rotate Image Generator")
        self.generateRotationMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:generateRotationMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.generateRotationMenuItem)
        self.createStripImageJMenuItem:setText("Multi Image Unifier")
        self.createStripImageJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:createStripImageJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.createStripImageJMenuItem)
        self.mirrorJMenuItem:setText("Mirror Image(s)")
        self.mirrorJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:mirrorJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.mirrorJMenuItem)
        self.scaleImagesJMenuItem:setText("Scale Image(s)")
        self.scaleImagesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:scaleImagesJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.scaleImagesJMenuItem)
        self.canvasImagesJMenuItem:setText("Canvas Image(s)")
        self.canvasImagesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:canvasImagesJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.canvasImagesJMenuItem)
        self.createIconImagesJMenuItem:setText("Create Icon Image(s)")
        self.createIconImagesJMenuItem:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:createIconsJMenuItemActionPerformed(evt)
            end
            return o
        end)())
        self.processingJMenu:add(self.createIconImagesJMenuItem)
        self.mainJMenuBar:add(self.processingJMenu)
        self:setJMenuBar(self.mainJMenuBar)
        self:pack()
end


function ImageToolJFrame:createStripImageJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            local imageUnifierJPanel = ImageUnifierJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(imageUnifierJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = imageUnifierJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "createStripImageJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:okJButtonActionPerformed(evt)
        local try_ok, try_error = pcall(function()
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "okJButtonActionPerformed", e)
        end
end


function ImageToolJFrame:processingJMenuActionPerformed(evt)
end


function ImageToolJFrame:openImageJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "openImageJMenuItemActionPerformed")
            self.fileJDialog:setVisible(true)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "openImageJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:onFiles(files)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Reading " .. tostring((files.n or #files)) .. " files.", self, "onFiles")
            Arrays.sort(files, (function()
                local o = Comparator.new and Comparator.new() or setmetatable({}, {__index = Comparator})
                

                function o:compare(file1, file2)
                    local fileNameIndexValue1 = self:extractIndexNumberIfAnyFromFileName(file1:getName())
                    local fileNameIndexValue2 = self:extractIndexNumberIfAnyFromFileName(file2:getName())
                    return fileNameIndexValue1 - fileNameIndexValue2
                end
                

                function o:extractIndexNumberIfAnyFromFileName(name)
                    local i = 0
                    local try_ok, try_error = pcall(function()
                        local start = name:lastIndexOf("_") + 1
                        local end_ = name:lastIndexOf(".")
                        local number = string.sub(name, (start) + 1, end_)
                        i = math.tointeger(tonumber(number))
                    end)
                    if not try_ok then
                        local e = try_error
                        i = 0
                    end
                    return i
                end
                return o
            end)())
            local bufferedImageArray = java_new_array(nil, (files.n or #files))
            for index = 0, (files.n or #files) - 1 do
                bufferedImageArray[index + 1] = ImageIO.read(files[index + 1])
                if bufferedImageArray[index + 1] == nil then
                    error(java_exception("Exception", "Unable to read file: " .. tostring(files[index + 1]:getPath())), 0)
                end
            end
            self.imageProcessorInput = ImageProcessorInput.new(files, bufferedImageArray)
            self.fileJDialog:setVisible(false)
            if ImageToolJFrame.imageProcessorInputCompositeInterface ~= nil then
                ImageToolJFrame.imageProcessorInputCompositeInterface:setImageProcessorInput(self.imageProcessorInput)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onFiles", e)
        end
end


function ImageToolJFrame:fileJMenuActionPerformed(evt)
end


function ImageToolJFrame:analyzeJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "analyzeJMenuItemActionPerformed")
            self.analysisActionJDialog:setVisible(true)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "analyzeJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:generateRotationSpriteJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "generateRotationSpriteJMenuItemActionPerformed")
            local spriteImageJPanel = RotationSpriteImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(spriteImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = spriteImageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateRotationSpriteJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:generateSpriteSplitterMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "generateRotationSpriteJMenuItemActionPerformed")
            local imageJPanel = SpriteSplitterImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(imageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = imageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateRotationMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:generateRotationMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "generateRotationSpriteJMenuItemActionPerformed")
            local rotationImageJPanel = RotationImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(rotationImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = rotationImageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateRotationMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:scaleImagesJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "scaleImagesJMenuItemActionPerformed")
            local resizeImageJPanel = ResizeImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(resizeImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = resizeImageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "scaleImagesJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:createIconsJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "createIconsJMenuItemActionPerformed")
            local createIconImagesJPanel = CreateIconImagesJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(createIconImagesJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = createIconImagesJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "scaleImagesJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:canvasImagesJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "canvasImagesJMenuItemActionPerformed")
            local resizeImageJPanel = CanvasImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(resizeImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = resizeImageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "scaleImagesJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:generateMirrorSpriteMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "generateMirrorSpriteJMenuItemActionPerformed")
            local spriteImageJPanel = MirrorSpriteImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(spriteImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = spriteImageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateMirrorSpriteJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:mirrorJMenuItemActionPerformed(evt)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Starting", self, "generateMirrorJMenuItemActionPerformed")
            local mirrorImageJPanel = MirrorImageJPanel.new(self.imageProcessorInput)
            self.jPanel1:removeAll()
            self.jPanel1:add(mirrorImageJPanel)
            self.jPanel1:updateUI()
            ImageToolJFrame.imageProcessorInputCompositeInterface = mirrorImageJPanel
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateMirrorJMenuItemActionPerformed", e)
        end
end


function ImageToolJFrame:getColorRangeInterface()
        local colorRangeInterface = ColorRange.new()
        colorRangeInterface:setMinRed(math.tointeger(self:getMinRedJTextField():getText() // 1))
        colorRangeInterface:setMaxRed(math.tointeger(self:getMaxRedJTextField():getText() // 1))
        colorRangeInterface:setMinGreen(math.tointeger(self:getMinGreenJTextField():getText() // 1))
        colorRangeInterface:setMaxGreen(math.tointeger(self:getMaxGreenJTextField():getText() // 1))
        colorRangeInterface:setMinBlue(math.tointeger(self:getMinBlueJTextField():getText() // 1))
        colorRangeInterface:setMaxBlue(math.tointeger(self:getMaxBlueJTextField():getText() // 1))
        return colorRangeInterface
end


function ImageToolJFrame:getMaxBlueJTextField()
        return self.maxBlueJTextField
end


function ImageToolJFrame:setMaxBlueJTextField(maxBlueJTextField)
        self.maxBlueJTextField = self.maxBlueJTextField
end


function ImageToolJFrame:getMaxGreenJTextField()
        return self.maxGreenJTextField
end


function ImageToolJFrame:setMaxGreenJTextField(maxGreenJTextField)
        self.maxGreenJTextField = self.maxGreenJTextField
end


function ImageToolJFrame:getMaxRedJTextField()
        return self.maxRedJTextField
end


function ImageToolJFrame:setMaxRedJTextField(maxRedJTextField)
        self.maxRedJTextField = self.maxRedJTextField
end


function ImageToolJFrame:getMinBlueJTextField()
        return self.minBlueJTextField
end


function ImageToolJFrame:setMinBlueJTextField(minBlueJTextField)
        self.minBlueJTextField = self.minBlueJTextField
end


function ImageToolJFrame:getMinGreenJTextField()
        return self.minGreenJTextField
end


function ImageToolJFrame:setMinGreenJTextField(minGreenJTextField)
        self.minGreenJTextField = self.minGreenJTextField
end


function ImageToolJFrame:getMinRedJTextField()
        return self.minRedJTextField
end


function ImageToolJFrame:setMinRedJTextField(minRedJTextField)
        self.minRedJTextField = self.minRedJTextField
end

ImageToolJFrame.imageProcessorInputCompositeInterface = nil

return ImageToolJFrame

