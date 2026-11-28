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

local CreateIconImagesJPanel = {}
package.loaded["org.allbinary.image.gui.CreateIconImagesJPanel"] = CreateIconImagesJPanel

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
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ImagePersistanceUtil = java_lazy("org.allbinary.media.image.ImagePersistanceUtil")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")
local ImageProcessorInputCompositeInterface = java_lazy("org.allbinary.media.image.ImageProcessorInputCompositeInterface")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local GroupLayout = require("javax.swing.GroupLayout")
-- local JButton = require("javax.swing.JButton")
-- local JPanel = require("javax.swing.JPanel")

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

-- class table CreateIconImagesJPanel is declared before the requires
CreateIconImagesJPanel.__index = CreateIconImagesJPanel
CreateIconImagesJPanel.className = "CreateIconImagesJPanel"
CreateIconImagesJPanel.javaClassName = "org.allbinary.image.gui.CreateIconImagesJPanel"
setmetatable(CreateIconImagesJPanel, {__index = JPanel})
CreateIconImagesJPanel.java_implements = " ImageProcessorInputCompositeInterface "
CreateIconImagesJPanel.java_interfaces = function() return {ImageProcessorInputCompositeInterface} end

function CreateIconImagesJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.imageProcessorInput == nil then self.imageProcessorInput = nil end
    if self.aboveJButton == nil then self.aboveJButton = nil end
end


function CreateIconImagesJPanel._jinit(self, imageProcessorInput)
    java_super_init(JPanel, self)
    CreateIconImagesJPanel._init_fields(self)
        -- super(...) made self above
        self:initComponents()
        self.imageProcessorInput = imageProcessorInput
        local numberStringArray = java_new_array(nil, 101)
        numberStringArray[1] = tostring(-1)
        for index = 1, 100 - 1 do
            numberStringArray[index + 1] = tostring(index)
        end
        local araster = self.imageProcessorInput:getBufferedImageArray()[1]:getAlphaRaster()
        if rawequal(araster, nil) then
            print("there is no Alpha channel!!!!!!!!!")
        else
            print("Alpha channel found !")
        end
    return self
end

function CreateIconImagesJPanel.new(...)
    local self = setmetatable({}, CreateIconImagesJPanel)
    CreateIconImagesJPanel._jinit(self, ...)
    return self
end


function CreateIconImagesJPanel:process()
        ;(function()
            local java_outer_self = self
        local o = Thread.new and Thread.new() or setmetatable({}, {__index = Thread})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error, try_value = pcall(function()
                    local imageUtil = ImageUtil.getInstance()
                    local stringMaker = StringMaker.new()
                    local imageProcessorInput = java_outer_self:getImageProcessorInput()
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
java_overload(CreateIconImagesJPanel, "process", 0)


function CreateIconImagesJPanel:getImageProcessorInput()
        return self.imageProcessorInput
end
java_overload(CreateIconImagesJPanel, "getImageProcessorInput", 0)


function CreateIconImagesJPanel:setImageProcessorInput(imageProcessorInput)
        self.imageProcessorInput = imageProcessorInput
end
java_overload(CreateIconImagesJPanel, "setImageProcessorInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageProcessorInput")) end)


function CreateIconImagesJPanel:initComponents()
        self.aboveJButton = JButton.new()
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
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addComponent(self.aboveJButton):addGap(0, 335, require("java.lang.Short").MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addComponent(self.aboveJButton):addContainerGap(286, require("java.lang.Short").MAX_VALUE)))
end
java_overload(CreateIconImagesJPanel, "initComponents", 0)


function CreateIconImagesJPanel:aboveJButtonActionPerformed(evt)
        self:process()
end
java_overload(CreateIconImagesJPanel, "aboveJButtonActionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)

return CreateIconImagesJPanel

