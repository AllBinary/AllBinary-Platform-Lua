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
-- package org.allbinary.animation.image

local AllBinaryJ2SEImageRotationAnimation = {}
package.loaded["org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimation"] = AllBinaryJ2SEImageRotationAnimation

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local DisposalUtil = java_lazy("org.allbinary.DisposalUtil")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local ImageCopyUtil = java_lazy("org.allbinary.media.image.ImageCopyUtil")
local ImageModifierUtil = java_lazy("org.allbinary.media.image.ImageModifierUtil")
local ImageRotationUtil = java_lazy("org.allbinary.media.image.ImageRotationUtil")
local ImageBaseRotationAnimation = require("org.allbinary.animation.image.ImageBaseRotationAnimation")
local AlphaProcessor = java_lazy("org.allbinary.animation.image.AlphaProcessor")
local ChangeColorProcessor = java_lazy("org.allbinary.animation.image.ChangeColorProcessor")
local ModifierBaseProcessor = java_lazy("org.allbinary.animation.image.ModifierBaseProcessor")
local ScaleBaseProcessor = java_lazy("org.allbinary.animation.image.ScaleBaseProcessor")
local ScaleProcessor = java_lazy("org.allbinary.animation.image.ScaleProcessor")
local SetColorProcessor = java_lazy("org.allbinary.animation.image.SetColorProcessor")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table AllBinaryJ2SEImageRotationAnimation is declared before the requires
AllBinaryJ2SEImageRotationAnimation.__index = AllBinaryJ2SEImageRotationAnimation
AllBinaryJ2SEImageRotationAnimation.className = "AllBinaryJ2SEImageRotationAnimation"
AllBinaryJ2SEImageRotationAnimation.javaClassName = "org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimation"
setmetatable(AllBinaryJ2SEImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryJ2SEImageRotationAnimation:_init_fields()
    self.imageRotationUtil = ImageRotationUtil.getInstance()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    if self.realOriginalImage == nil then self.realOriginalImage = nil end
    self.originalImageArray = java_new_array(nil, 1)
    self.twoImages = java_new_array(nil, 2)
    if self.imageToShow == nil then self.imageToShow = nil end
    if self.bufferedImageIndex == nil then self.bufferedImageIndex = 0 end
    self.lastScaleX = 1.0
    self.lastScaleY = 1.0
    self.scaleX = 1.0
    self.scaleY = 1.0
    if self.maxScaleX == nil then self.maxScaleX = 0.0 end
    if self.maxScaleY == nil then self.maxScaleY = 0.0 end
    self.alphaProcessor = ModifierBaseProcessor.getInstance()
    self.setColorProcessor = ModifierBaseProcessor.getInstance()
    self.changeColorProcessor = ModifierBaseProcessor.getInstance()
    self.scaleProcessor = ScaleProcessor.getInstance()
end


function AllBinaryJ2SEImageRotationAnimation._jinit(self, originalImage, image, angleInfo, totalAngle, animationBehavior)
    java_super_init(ImageBaseRotationAnimation, self, image, angleInfo, totalAngle, animationBehavior)
    AllBinaryJ2SEImageRotationAnimation._init_fields(self)
        -- super(...) made self above
        self.realOriginalImage = originalImage
        self.originalImageArray[1] = originalImage
        self.imageToShow = image
        self.twoImages[1] = image
        self.twoImages[2] = ImageCopyUtil.getInstance():createImageForRotation(image)
    return self
end

function AllBinaryJ2SEImageRotationAnimation.new(...)
    local self = setmetatable({}, AllBinaryJ2SEImageRotationAnimation)
    AllBinaryJ2SEImageRotationAnimation._jinit(self, ...)
    return self
end


function AllBinaryJ2SEImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if rawequal(self:getBasicColorP(), nil) or not rawequal(require("allbinary_java").number_value(self:getBasicColorP(), "intValue"), require("allbinary_java").number_value(basicColor, "intValue")) then
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "setBasicColorP", 1)(self, basicColor)
        if changed then
            self.setColorProcessor = SetColorProcessor.getInstance()
            self:updateImage()
        end
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryJ2SEImageRotationAnimation:changeBasicColor(basicColor)
        local changed = false
        if rawequal(self:getChangeBasicColor(), nil) or not rawequal(require("allbinary_java").number_value(self:getChangeBasicColor(), "intValue"), require("allbinary_java").number_value(basicColor, "intValue")) then
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "changeBasicColor", 1)(self, basicColor)
        if changed then
            self.changeColorProcessor = ChangeColorProcessor.getInstance()
            self:updateImage()
        end
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "changeBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryJ2SEImageRotationAnimation:setAlpha(alpha)
        local changed = false
        if not rawequal(self.alphaP, alpha) then
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "setAlpha", 1)(self, alpha)
        if changed then
            self.alphaProcessor = AlphaProcessor.getInstance()
            self:updateImage()
        end
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "setAlpha", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryJ2SEImageRotationAnimation:setScale(scaleX, scaleY)
        self.scaleX = scaleX
        self.scaleY = scaleY
        if not rawequal(self.scaleX, self.lastScaleX) or not rawequal(self.scaleY, self.lastScaleY) then
            self.scaleProcessor:update(self.realOriginalImage, self.originalImageArray, self.twoImages, self.bufferedImageIndex, self.scaleX, self.scaleY, self.maxScaleX, self.maxScaleY)
            self:updateImage()
        end
        self.lastScaleX = self.scaleX
        self.lastScaleY = self.scaleY
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "setScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryJ2SEImageRotationAnimation:setMaxScale(maxScaleX, maxScaleY)
        self.maxScaleX = maxScaleX
        self.maxScaleY = maxScaleY
        self.scaleProcessor:update(self.realOriginalImage, self.originalImageArray, self.twoImages, self.bufferedImageIndex, self.scaleX, self.scaleY, self.maxScaleX, self.maxScaleY)
        self:updateImage()
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "setMaxScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryJ2SEImageRotationAnimation:nextRotation()
        java_super(ImageBaseRotationAnimation, "nextRotation", 0)(self)
        self:updateImage()
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "nextRotation", 0)


function AllBinaryJ2SEImageRotationAnimation:previousRotation()
        java_super(ImageBaseRotationAnimation, "previousRotation", 0)(self)
        self:updateImage()
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "previousRotation", 0)


function AllBinaryJ2SEImageRotationAnimation:updateImage()
        self.imageRotationUtil:rotateImage(self.originalImageArray[1], self.twoImages[self.bufferedImageIndex + 1], self.angleInfo:getAngle() + 90)
        self.alphaProcessor:updateAlpha(self.imageModifierUtil, NullImage.NULL_IMAGE, self.twoImages[self.bufferedImageIndex + 1], 0, self.alphaP)
        self.setColorProcessor:updateColor(self.imageModifierUtil, NullImage.NULL_IMAGE, self.twoImages[self.bufferedImageIndex + 1], 0, self.basicColor)
        self.changeColorProcessor:updateColor(self.imageModifierUtil, NullImage.NULL_IMAGE, self.twoImages[self.bufferedImageIndex + 1], 0, self.changeBasicColorP)
        self:swap()
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "updateImage", 0)


function AllBinaryJ2SEImageRotationAnimation:setFrame(index)
        java_super(ImageBaseRotationAnimation, "setFrame", 1)(self, index)
        self:updateImage()
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryJ2SEImageRotationAnimation:swap()
        self.imageToShow = self.twoImages[self.bufferedImageIndex + 1]
        if rawequal(self.bufferedImageIndex, 0) then
            self.bufferedImageIndex = 1
        else
            self.bufferedImageIndex = 0
        end
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "swap", 0)


function AllBinaryJ2SEImageRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.imageToShow, x, y, self.anchor)
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function AllBinaryJ2SEImageRotationAnimation:close()
        java_super(ImageBaseRotationAnimation, "close", 0)(self)
        local disposalUtil = DisposalUtil.getInstance()
        local size2 = (self.twoImages.n or #self.twoImages)
        for index = 0, size2 - 1 do
            disposalUtil:disposeImage(self.twoImages[index + 1])
        end
        local size = (self.originalImageArray.n or #self.originalImageArray)
        for index = 0, size - 1 do
            disposalUtil:disposeImage(self.originalImageArray[index + 1])
        end
        disposalUtil:disposeImage(self.realOriginalImage)
        disposalUtil:disposeImage(self.imageToShow)
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "close", 0)


-- throws Throwable
function AllBinaryJ2SEImageRotationAnimation:finalize()
        java_super(ImageBaseRotationAnimation, "finalize", 0)(self)
        local disposalUtil = DisposalUtil.getInstance()
        local size2 = (self.twoImages.n or #self.twoImages)
        for index = 0, size2 - 1 do
            disposalUtil:disposeImage(self.twoImages[index + 1])
        end
        local size = (self.originalImageArray.n or #self.originalImageArray)
        for index = 0, size - 1 do
            disposalUtil:disposeImage(self.originalImageArray[index + 1])
        end
        disposalUtil:disposeImage(self.realOriginalImage)
        disposalUtil:disposeImage(self.imageToShow)
end
java_overload(AllBinaryJ2SEImageRotationAnimation, "finalize", 0)

return AllBinaryJ2SEImageRotationAnimation

