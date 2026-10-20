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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local Raster = require("java.awt.image.Raster")
-- local File = require("java.io.File")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ImagePersistanceUtil = require("org.allbinary.media.image.ImagePersistanceUtil")
local ImageProcessorInput = require("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = require("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageUtil = require("org.allbinary.media.image.ImageUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local JPanel = require("org.allbinary.image.gui.JPanel")

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

local CreateIconImagesJPanel = {}
CreateIconImagesJPanel.__index = CreateIconImagesJPanel
CreateIconImagesJPanel.className = "CreateIconImagesJPanel"
setmetatable(CreateIconImagesJPanel, {__index = JPanel})

function CreateIconImagesJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageProcessorInput = nil
    self.aboveJButton = nil
end


function CreateIconImagesJPanel.new(imageProcessorInput)
    local self = setmetatable(JPanel.new(), CreateIconImagesJPanel)
    self:_init_fields()
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
        local numberStringArray = java_new_array(nil, 101)
        numberStringArray[1] = tostring(-1)
        for index = 1, 100 - 1 do
            numberStringArray[index + 1] = tostring(index)
        end
        local araster = self.imageProcessorInput:getBufferedImageArray()[1]:getAlphaRaster()
        if araster == nil then
            print("there is no Alpha channel!!!!!!!!!")
        else
            print("Alpha channel found !")
        end
    return self
end


function CreateIconImagesJPanel:process()
        (function()
            local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    local imageUtil = ImageUtil.getInstance()
                    local stringMaker = StringMaker.new()
                    local imageProcessorInput = self:getImageProcessorInput()
                    local files = imageProcessorInput:getFiles()
                    local iconWidthList = BasicArrayListD.new()
                    local iconHeightList = BasicArrayListD.new()
                    iconWidthList:add(864)
                    iconHeightList:add(864)
                    local ANDROID = "android-icon-"
                    local IOS = "ios-icon-"
                    local size = iconWidthList:size()
                    local width = 0
                    local height = 0
                    for index2 = 0, size - 1 do
                        width = math.tointeger((iconWidthList:get(index2)) // 1)
                        height = math.tointeger((iconHeightList:get(index2)) // 1)
                        local generatedBufferedImageArray = imageUtil:createBufferedImage3(imageProcessorInput:getBufferedImageArray(), width, height, true)
                        local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
                        for index = 0, (generatedBufferedImageArray.n or #generatedBufferedImageArray) - 1 do
                            local filePath = files[index + 1]:getAbsolutePath()
                            local endIndex = filePath:lastIndexOf("\\")
                            local path = string.sub(filePath, (0) + 1, endIndex + 1)
                            stringMaker:delete(0, stringMaker:length())
                            stringMaker:append(path):append(ANDROID):appendint(width):append(CanvasStrings.getInstance()._PNG)
                            local newFilePath = tostring(stringMaker)
                            imagePersistanceUtil:saveWithBatik(AbFile.createAbFile(newFilePath), generatedBufferedImageArray[index + 1])
                            stringMaker:delete(0, stringMaker:length())
                            stringMaker:append(path):append(IOS):appendint(width):append(CanvasStrings.getInstance()._PNG)
                            newFilePath = tostring(stringMaker)
                            imagePersistanceUtil:saveWithBatik(AbFile.createAbFile(newFilePath), generatedBufferedImageArray[index + 1])
                        end
                    end
                    self:getParent():repaint()
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
                end
            end
            return o
        end)():start()
end


function CreateIconImagesJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end


function CreateIconImagesJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end


function CreateIconImagesJPanel:initComponents()
        self.aboveJButton = JButton.new()
        self.aboveJButton:setText("Process")
        self.aboveJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:aboveJButtonActionPerformed(evt)
            end
            return o
        end)())
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.aboveJButton):addGap(0, 335, Short.MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.aboveJButton):addContainerGap(286, Short.MAX_VALUE)))
end


function CreateIconImagesJPanel:aboveJButtonActionPerformed(evt)
        self:process()
end

return CreateIconImagesJPanel

