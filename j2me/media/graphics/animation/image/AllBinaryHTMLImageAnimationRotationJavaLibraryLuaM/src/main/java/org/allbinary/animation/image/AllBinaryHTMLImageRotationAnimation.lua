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

local AllBinaryHTMLImageRotationAnimation = {}
package.loaded["org.allbinary.animation.image.AllBinaryHTMLImageRotationAnimation"] = AllBinaryHTMLImageRotationAnimation

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local ImageCopyUtil = java_lazy("org.allbinary.media.image.ImageCopyUtil")
local ImageModifierUtil = java_lazy("org.allbinary.media.image.ImageModifierUtil")
local ImageRotationUtil = java_lazy("org.allbinary.media.image.ImageRotationUtil")
local PlaynMutableImage = java_lazy("org.microemu.device.playn.PlaynMutableImage")
local CanvasImage = java_lazy("playn.core.CanvasImage")
local CanvasSurface = java_lazy("playn.core.CanvasSurface")
local ImageBaseRotationAnimation = require("org.allbinary.animation.image.ImageBaseRotationAnimation")
local AlphaBaseProcessor = java_lazy("org.allbinary.animation.image.AlphaBaseProcessor")
local AlphaProcessor = java_lazy("org.allbinary.animation.image.AlphaProcessor")

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

-- class table AllBinaryHTMLImageRotationAnimation is declared before the requires
AllBinaryHTMLImageRotationAnimation.__index = AllBinaryHTMLImageRotationAnimation
AllBinaryHTMLImageRotationAnimation.className = "AllBinaryHTMLImageRotationAnimation"
AllBinaryHTMLImageRotationAnimation.javaClassName = "org.allbinary.animation.image.AllBinaryHTMLImageRotationAnimation"
setmetatable(AllBinaryHTMLImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryHTMLImageRotationAnimation:_init_fields()
    self.imageRotationUtil = ImageRotationUtil.getInstance()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    if self.originalImage == nil then self.originalImage = nil end
    self.twoImages = java_new_array(nil, 2)
    self.canvasSurfaceArray = java_new_array(nil, 2)
    if self.imageToShow == nil then self.imageToShow = nil end
    if self.bufferedImageIndex == nil then self.bufferedImageIndex = 0 end
    self.alphaProcessor = AlphaBaseProcessor.getInstance()
end


function AllBinaryHTMLImageRotationAnimation._jinit(self, originalImage, image, angleInfo, totalAngle, animationBehavior)
    java_super_init(ImageBaseRotationAnimation, self, image, angleInfo, totalAngle, animationBehavior)
    AllBinaryHTMLImageRotationAnimation._init_fields(self)
        -- super(...) made self above
        self.originalImage = originalImage
        self.imageToShow = image
        self.twoImages[1] = image
        self.twoImages[2] = ImageCopyUtil.getInstance():createImage(image)
        self.canvasSurfaceArray[1] = self:getCanvasSurface(self.twoImages[1])
        self.canvasSurfaceArray[2] = self:getCanvasSurface(self.twoImages[2])
    return self
end

function AllBinaryHTMLImageRotationAnimation.new(...)
    local self = setmetatable({}, AllBinaryHTMLImageRotationAnimation)
    AllBinaryHTMLImageRotationAnimation._jinit(self, ...)
    return self
end


function AllBinaryHTMLImageRotationAnimation:getCanvasSurface(image)
        local htmlImage = image
        local canvasImage = htmlImage:getImage()
        local canvasSurface = htmlImage:getCanvasSurface(canvasImage)
        canvasSurface:translate(self.originalImage:getWidth() / 2, self.originalImage:getHeight() / 2)
        return canvasSurface
end
java_overload(AllBinaryHTMLImageRotationAnimation, "getCanvasSurface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Image")) end)


function AllBinaryHTMLImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "setBasicColorP", 1)(self, basicColor)
        if changed then
            self:updateImage()
        end
end
java_overload(AllBinaryHTMLImageRotationAnimation, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryHTMLImageRotationAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "setAlpha", 1)(self, alpha)
        if changed then
            self.alphaProcessor = AlphaProcessor.getInstance()
            self:updateImage()
        end
end
java_overload(AllBinaryHTMLImageRotationAnimation, "setAlpha", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryHTMLImageRotationAnimation:nextRotation()
        java_super(ImageBaseRotationAnimation, "nextRotation", 0)(self)
        self:updateImage()
end
java_overload(AllBinaryHTMLImageRotationAnimation, "nextRotation", 0)


function AllBinaryHTMLImageRotationAnimation:previousRotation()
        java_super(ImageBaseRotationAnimation, "previousRotation", 0)(self)
        self:updateImage()
end
java_overload(AllBinaryHTMLImageRotationAnimation, "previousRotation", 0)


function AllBinaryHTMLImageRotationAnimation:updateImage()
        local canvasSurface = self.canvasSurfaceArray[self.bufferedImageIndex + 1]
        canvasSurface:save()
        self.imageRotationUtil:rotateImageCanvasSurfaceClear(self.originalImage, self.twoImages[self.bufferedImageIndex + 1], canvasSurface, self.angleInfo:getAngle() + 90)
        self.alphaProcessor:setAlpha(self.imageModifierUtil, self.originalImage, self.twoImages[self.bufferedImageIndex + 1], self.alphaP)
        self.imageRotationUtil:drawImage(self.originalImage, self.imageToShow, canvasSurface)
        canvasSurface:restore()
        self:swap()
end
java_overload(AllBinaryHTMLImageRotationAnimation, "updateImage", 0)


function AllBinaryHTMLImageRotationAnimation:setFrame(index)
        java_super(ImageBaseRotationAnimation, "setFrame", 1)(self, index)
        self:updateImage()
end
java_overload(AllBinaryHTMLImageRotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryHTMLImageRotationAnimation:swap()
        self.imageToShow = self.twoImages[self.bufferedImageIndex + 1]
        if self.bufferedImageIndex == 0 then
            self.bufferedImageIndex = 1
        else
            self.bufferedImageIndex = 0
        end
end
java_overload(AllBinaryHTMLImageRotationAnimation, "swap", 0)


function AllBinaryHTMLImageRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.imageToShow, x, y, self.anchor)
end
java_overload(AllBinaryHTMLImageRotationAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return AllBinaryHTMLImageRotationAnimation

