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

local AllBinaryFlickerAndroidImageRotationAnimation = {}
package.loaded["org.allbinary.animation.image.AllBinaryFlickerAndroidImageRotationAnimation"] = AllBinaryFlickerAndroidImageRotationAnimation

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

local Matrix = java_lazy("android.graphics.Matrix")
local Image = java_lazy("javax.microedition.lcdui.Image")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local AndroidImageUtil = java_lazy("org.allbinary.media.image.AndroidImageUtil")
local ImageModifierUtil = java_lazy("org.allbinary.media.image.ImageModifierUtil")
local ImageBaseRotationAnimation = require("org.allbinary.animation.image.ImageBaseRotationAnimation")

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

-- class table AllBinaryFlickerAndroidImageRotationAnimation is declared before the requires
AllBinaryFlickerAndroidImageRotationAnimation.__index = AllBinaryFlickerAndroidImageRotationAnimation
AllBinaryFlickerAndroidImageRotationAnimation.className = "AllBinaryFlickerAndroidImageRotationAnimation"
AllBinaryFlickerAndroidImageRotationAnimation.javaClassName = "org.allbinary.animation.image.AllBinaryFlickerAndroidImageRotationAnimation"
setmetatable(AllBinaryFlickerAndroidImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryFlickerAndroidImageRotationAnimation:_init_fields()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    self.androidImageUtil = AndroidImageUtil.getInstance()
    self.matrix = Matrix.new()
    if self.halfWidth == nil then self.halfWidth = 0 end
    if self.halfHeight == nil then self.halfHeight = 0 end
    if self.increment == nil then self.increment = 0 end
    if self.originalImage == nil then self.originalImage = nil end
end


function AllBinaryFlickerAndroidImageRotationAnimation._jinit(self, originalImage, image, angleInfo, totalAngle, animationBehavior)
    java_super_init(ImageBaseRotationAnimation, self, image, angleInfo, totalAngle, animationBehavior)
    AllBinaryFlickerAndroidImageRotationAnimation._init_fields(self)
        -- super(...) made self above
        self.originalImage = originalImage
        self.halfWidth = (((image:getWidth()) // (1 << (1))))
        self.halfHeight = (((image:getHeight()) // (1 << (1))))
        self.increment = java_int((self.angleInfo:getAngleIncrementInfo():getAngleIncrement()))
    return self
end

function AllBinaryFlickerAndroidImageRotationAnimation.new(...)
    local self = setmetatable({}, AllBinaryFlickerAndroidImageRotationAnimation)
    AllBinaryFlickerAndroidImageRotationAnimation._jinit(self, ...)
    return self
end


function AllBinaryFlickerAndroidImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if rawequal(self:getBasicColorP(), nil) or not rawequal(math.tointeger(self:getBasicColorP() // 1), math.tointeger(basicColor // 1)) then
            self.imageModifierUtil:setColor(self.originalImage, self:getImage(), 0, basicColor)
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "setBasicColorP", 1)(self, basicColor)
        if changed then
            self.matrix:setRotate(0.0, (self.halfWidth + 0.0), (self.halfHeight + 0.0))
            self:updateImage()
        end
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryFlickerAndroidImageRotationAnimation:changeBasicColor(basicColor)
        self:setBasicColorP(basicColor)
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "changeBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryFlickerAndroidImageRotationAnimation:setAlpha(alpha)
        local changed = false
        if not rawequal(self.alphaP, alpha) then
            changed = true
        end
        java_super(ImageBaseRotationAnimation, "setAlpha", 1)(self, alpha)
        self.imageModifierUtil:setAlpha(self.originalImage, self:getImage(), 0, self.alphaP)
        if changed then
            self.matrix:setRotate(0.0, (self.halfWidth + 0.0), (self.halfHeight + 0.0))
            self:updateImage()
        end
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "setAlpha", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryFlickerAndroidImageRotationAnimation:nextRotation()
        java_super(ImageBaseRotationAnimation, "nextRotation", 0)(self)
        self.matrix:setRotate((self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "nextRotation", 0)


function AllBinaryFlickerAndroidImageRotationAnimation:previousRotation()
        java_super(ImageBaseRotationAnimation, "previousRotation", 0)(self)
        self.matrix:setRotate((-self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "previousRotation", 0)


function AllBinaryFlickerAndroidImageRotationAnimation:updateImage()
        self.androidImageUtil:rotate(self:getImage(), self.originalImage, self.matrix, self.imageModifierUtil.paint)
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "updateImage", 0)


function AllBinaryFlickerAndroidImageRotationAnimation:setFrame(index)
        local currentFrame = self.circularIndexUtil:getIndex()
        self.circularIndexUtil:setIndex(index)
        local newFrame = self.circularIndexUtil:getIndex()
        self.angleInfo:adjustAngle(newFrame)
        self.matrix:setRotate(((newFrame - currentFrame) + 0.0) * (self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end
java_overload(AllBinaryFlickerAndroidImageRotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)

return AllBinaryFlickerAndroidImageRotationAnimation

