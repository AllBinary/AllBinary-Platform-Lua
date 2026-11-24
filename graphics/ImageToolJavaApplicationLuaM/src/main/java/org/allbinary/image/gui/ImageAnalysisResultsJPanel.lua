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

local ImageAnalysisResultsJPanel = {}
package.loaded["org.allbinary.image.gui.ImageAnalysisResultsJPanel"] = ImageAnalysisResultsJPanel

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

local ImageAnalysisResults = java_lazy("org.allbinary.media.image.analysis.ImageAnalysisResults")
local ImageColorRangeResults = java_lazy("org.allbinary.media.image.analysis.ImageColorRangeResults")
local ImageColorResults = java_lazy("org.allbinary.media.image.analysis.ImageColorResults")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local GroupLayout = require("javax.swing.GroupLayout")
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

-- class table ImageAnalysisResultsJPanel is declared before the requires
ImageAnalysisResultsJPanel.__index = ImageAnalysisResultsJPanel
ImageAnalysisResultsJPanel.className = "ImageAnalysisResultsJPanel"
ImageAnalysisResultsJPanel.javaClassName = "org.allbinary.image.gui.ImageAnalysisResultsJPanel"
setmetatable(ImageAnalysisResultsJPanel, {__index = JPanel})

function ImageAnalysisResultsJPanel:_init_fields()
    if self.avgBlueJTextField == nil then self.avgBlueJTextField = nil end
    if self.avgGreenJTextField == nil then self.avgGreenJTextField = nil end
    if self.avgRedJTextField == nil then self.avgRedJTextField = nil end
    if self.jComboBox1 == nil then self.jComboBox1 = nil end
    if self.jLabel1 == nil then self.jLabel1 = nil end
    if self.jLabel10 == nil then self.jLabel10 = nil end
    if self.jLabel11 == nil then self.jLabel11 = nil end
    if self.jLabel12 == nil then self.jLabel12 = nil end
    if self.jLabel13 == nil then self.jLabel13 = nil end
    if self.jLabel2 == nil then self.jLabel2 = nil end
    if self.jLabel3 == nil then self.jLabel3 = nil end
    if self.jLabel4 == nil then self.jLabel4 = nil end
    if self.jLabel5 == nil then self.jLabel5 = nil end
    if self.jLabel6 == nil then self.jLabel6 = nil end
    if self.jLabel7 == nil then self.jLabel7 = nil end
    if self.jLabel8 == nil then self.jLabel8 = nil end
    if self.jLabel9 == nil then self.jLabel9 = nil end
    if self.matchingPixelsJTextField == nil then self.matchingPixelsJTextField = nil end
    if self.maxBlueJTextField == nil then self.maxBlueJTextField = nil end
    if self.maxGreenJTextField == nil then self.maxGreenJTextField = nil end
    if self.maxRedJTextField == nil then self.maxRedJTextField = nil end
    if self.minBlueJTextField == nil then self.minBlueJTextField = nil end
    if self.minGreenJTextField == nil then self.minGreenJTextField = nil end
    if self.minRedJTextField == nil then self.minRedJTextField = nil end
    if self.percentMatchingJTextField == nil then self.percentMatchingJTextField = nil end
    if self.totalPixelsJTextField == nil then self.totalPixelsJTextField = nil end
end


function ImageAnalysisResultsJPanel._jinit(self, imageAnalysisResultsArray)
    java_super_init(JPanel, self)
    ImageAnalysisResultsJPanel._init_fields(self)
        self:initComponents()
        local imageAnalysisResults = imageAnalysisResultsArray[1]
        self:updateImageColorRangeResults(imageAnalysisResults)
    return self
end

function ImageAnalysisResultsJPanel.new(...)
    local self = setmetatable({}, ImageAnalysisResultsJPanel)
    ImageAnalysisResultsJPanel._jinit(self, ...)
    return self
end


function ImageAnalysisResultsJPanel:initComponents()
        self.jLabel1 = JLabel.new()
        self.jLabel2 = JLabel.new()
        self.jLabel3 = JLabel.new()
        self.percentMatchingJTextField = JTextField.new()
        self.totalPixelsJTextField = JTextField.new()
        self.matchingPixelsJTextField = JTextField.new()
        self.jComboBox1 = JComboBox.new()
        self.jLabel4 = JLabel.new()
        self.jLabel5 = JLabel.new()
        self.jLabel6 = JLabel.new()
        self.jLabel7 = JLabel.new()
        self.avgRedJTextField = JTextField.new()
        self.avgGreenJTextField = JTextField.new()
        self.avgBlueJTextField = JTextField.new()
        self.minGreenJTextField = JTextField.new()
        self.jLabel8 = JLabel.new()
        self.jLabel9 = JLabel.new()
        self.jLabel10 = JLabel.new()
        self.minRedJTextField = JTextField.new()
        self.minBlueJTextField = JTextField.new()
        self.jLabel11 = JLabel.new()
        self.jLabel12 = JLabel.new()
        self.jLabel13 = JLabel.new()
        self.maxRedJTextField = JTextField.new()
        self.maxGreenJTextField = JTextField.new()
        self.maxBlueJTextField = JTextField.new()
        self.jLabel1:setText("Matching Pixels:")
        self.jLabel2:setText("Total Pixels:")
        self.jLabel3:setText("Percent Matching:")
        self.percentMatchingJTextField:setEditable(false)
        self.totalPixelsJTextField:setEditable(false)
        self.matchingPixelsJTextField:setEditable(false)
        self.jComboBox1:setModel(DefaultComboBoxModel.new({CommonPhoneStrings.getInstance().ONE}))
        self.jComboBox1:setEnabled(false)
        self.jLabel4:setText("Image:")
        self.jLabel5:setText("Average Red:")
        self.jLabel6:setText("Average Green:")
        self.jLabel7:setText("Average Blue:")
        self.avgRedJTextField:setEditable(false)
        self.avgGreenJTextField:setEditable(false)
        self.avgBlueJTextField:setEditable(false)
        self.minGreenJTextField:setEditable(false)
        self.jLabel8:setText("Min Red:")
        self.jLabel9:setText("Min Green:")
        self.jLabel10:setText("Min Blue:")
        self.minRedJTextField:setEditable(false)
        self.minBlueJTextField:setEditable(false)
        self.jLabel11:setText("Max Red:")
        self.jLabel12:setText("Max Green:")
        self.jLabel13:setText("Max Blue:")
        self.maxRedJTextField:setEditable(false)
        self.maxGreenJTextField:setEditable(false)
        self.maxBlueJTextField:setEditable(false)
        local layout = GroupLayout.new(self)
        self:setLayout(layout)
        layout:setHorizontalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addContainerGap():addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel3):addComponent(self.jLabel2):addComponent(self.jLabel1):addComponent(self.jLabel5):addComponent(self.jLabel6):addComponent(self.jLabel7):addComponent(self.jLabel4)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jComboBox1, GroupLayout.PREFERRED_SIZE, 81, GroupLayout.PREFERRED_SIZE):addComponent(self.avgBlueJTextField, GroupLayout.DEFAULT_SIZE, 81, require("java.lang.Short").MAX_VALUE):addComponent(self.avgGreenJTextField, GroupLayout.DEFAULT_SIZE, 81, require("java.lang.Short").MAX_VALUE):addComponent(self.avgRedJTextField, GroupLayout.DEFAULT_SIZE, 81, require("java.lang.Short").MAX_VALUE):addComponent(self.totalPixelsJTextField, GroupLayout.DEFAULT_SIZE, 81, require("java.lang.Short").MAX_VALUE):addComponent(self.percentMatchingJTextField, GroupLayout.DEFAULT_SIZE, 81, require("java.lang.Short").MAX_VALUE):addComponent(self.matchingPixelsJTextField, GroupLayout.DEFAULT_SIZE, 81, require("java.lang.Short").MAX_VALUE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.jLabel12):addComponent(self.jLabel13):addComponent(self.jLabel8):addComponent(self.jLabel9):addComponent(self.jLabel10):addComponent(self.jLabel11)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addComponent(self.minRedJTextField, GroupLayout.PREFERRED_SIZE, 82, GroupLayout.PREFERRED_SIZE):addComponent(self.maxGreenJTextField, GroupLayout.PREFERRED_SIZE, 82, GroupLayout.PREFERRED_SIZE):addComponent(self.minGreenJTextField, GroupLayout.PREFERRED_SIZE, 82, GroupLayout.PREFERRED_SIZE):addComponent(self.minBlueJTextField, GroupLayout.PREFERRED_SIZE, 82, GroupLayout.PREFERRED_SIZE):addComponent(self.maxRedJTextField, GroupLayout.PREFERRED_SIZE, 82, GroupLayout.PREFERRED_SIZE):addComponent(self.maxBlueJTextField, GroupLayout.PREFERRED_SIZE, 82, GroupLayout.PREFERRED_SIZE)):addContainerGap(18, require("java.lang.Short").MAX_VALUE)))
        layout:setVerticalGroup(layout:createParallelGroup(GroupLayout.Alignment.LEADING):addGroup(layout:createSequentialGroup():addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel4):addComponent(self.jComboBox1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel1):addComponent(self.matchingPixelsJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel8):addComponent(self.minRedJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel2):addComponent(self.totalPixelsJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel9):addComponent(self.minGreenJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel3):addComponent(self.percentMatchingJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel10):addComponent(self.minBlueJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel5):addComponent(self.avgRedJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel11):addComponent(self.maxRedJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel6):addComponent(self.avgGreenJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.maxGreenJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel12)):addPreferredGap(LayoutStyle.ComponentPlacement.RELATED):addGroup(layout:createParallelGroup(GroupLayout.Alignment.BASELINE):addComponent(self.jLabel7):addComponent(self.avgBlueJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE):addComponent(self.jLabel13):addComponent(self.maxBlueJTextField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))))
end
java_overload(ImageAnalysisResultsJPanel, "initComponents", 0)


function ImageAnalysisResultsJPanel:updateImageColorRangeResults(imageAnalysisResults)
        local imageColorRangeResults = imageAnalysisResults:getImageColorRangeResults()
        self.matchingPixelsJTextField:setText(tostring(imageColorRangeResults:getMatchingPixelsChecked()))
        self.totalPixelsJTextField:setText(tostring(imageColorRangeResults:getTotalPixelsChecked()))
        self.percentMatchingJTextField:setText(tostring(imageColorRangeResults:getPercent()))
        local imageColorResults = imageAnalysisResults:getImageColorResults()
        self.avgRedJTextField:setText(tostring(imageColorResults:getColorAverage():getAvgRed()))
        self.avgGreenJTextField:setText(tostring(imageColorResults:getColorAverage():getAvgGreen()))
        self.avgBlueJTextField:setText(tostring(imageColorResults:getColorAverage():getAvgBlue()))
        self.minRedJTextField:setText(tostring(imageColorResults:getColorRange():getMinRed()))
        self.minGreenJTextField:setText(tostring(imageColorResults:getColorRange():getMinGreen()))
        self.minBlueJTextField:setText(tostring(imageColorResults:getColorRange():getMinBlue()))
        self.maxRedJTextField:setText(tostring(imageColorResults:getColorRange():getMaxRed()))
        self.maxGreenJTextField:setText(tostring(imageColorResults:getColorRange():getMaxGreen()))
        self.maxBlueJTextField:setText(tostring(imageColorResults:getColorRange():getMaxBlue()))
end
java_overload(ImageAnalysisResultsJPanel, "updateImageColorRangeResults", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageAnalysisResults")) end)

return ImageAnalysisResultsJPanel

