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

local AllBinaryArrayImageRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.image.AllBinaryArrayImageRotationAnimationFactory"] = AllBinaryArrayImageRotationAnimationFactory

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local ImageToRotationImageArrayUtil = java_lazy("org.allbinary.media.image.ImageToRotationImageArrayUtil")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
local AdjustedImageArrayRotationAnimation = java_lazy("org.allbinary.animation.image.AdjustedImageArrayRotationAnimation")
local ImageArrayRotationAnimation = java_lazy("org.allbinary.animation.image.ImageArrayRotationAnimation")

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

-- class table AllBinaryArrayImageRotationAnimationFactory is declared before the requires
AllBinaryArrayImageRotationAnimationFactory.__index = AllBinaryArrayImageRotationAnimationFactory
AllBinaryArrayImageRotationAnimationFactory.className = "AllBinaryArrayImageRotationAnimationFactory"
AllBinaryArrayImageRotationAnimationFactory.javaClassName = "org.allbinary.animation.image.AllBinaryArrayImageRotationAnimationFactory"
setmetatable(AllBinaryArrayImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinaryArrayImageRotationAnimationFactory:_init_fields()
    self.imageArray = NullImage.NULL_IMAGE_ARRAY
    if self.angleIncrement == nil then self.angleIncrement = 0 end
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory.createFactory(image, dx, dy)
        local arrayImageRotationAnimationFactory = AllBinaryArrayImageRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance():getGameControlFidelity(), AnimationBehaviorFactory.getInstance())
        arrayImageRotationAnimationFactory:initDXY(dx, dy)
        return arrayImageRotationAnimationFactory
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory.createFactoryA(image, dx, dy, angleIncrement)
        local arrayImageRotationAnimationFactory = AllBinaryArrayImageRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), angleIncrement, AnimationBehaviorFactory.getInstance())
        arrayImageRotationAnimationFactory:initDXY(dx, dy)
        return arrayImageRotationAnimationFactory
end


function AllBinaryArrayImageRotationAnimationFactory._jinit(self, image, width, height, angleIncrement, animationBehaviorFactory)
    java_super_init(BaseImageAnimationFactory, self, image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
    AllBinaryArrayImageRotationAnimationFactory._init_fields(self)
        -- super(...) made self above
        self.angleIncrement = angleIncrement
        self:init()
    return self
end

function AllBinaryArrayImageRotationAnimationFactory.new(...)
    local self = setmetatable({}, AllBinaryArrayImageRotationAnimationFactory)
    AllBinaryArrayImageRotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory:init()
        self:setImageArray(ImageToRotationImageArrayUtil.getInstance():generate(self:getImage(), self:getAngleIncrement(), java_int(AngleFactory.getInstance().TOTAL_ANGLE)))
end
java_overload(AllBinaryArrayImageRotationAnimationFactory, "init", 0)


function AllBinaryArrayImageRotationAnimationFactory:initDXY(dx, dy)
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
        self.animationFactoryInitializationVisitor.originalDx = dx
        self.animationFactoryInitializationVisitor.originalDy = dy
end
java_overload(AllBinaryArrayImageRotationAnimationFactory, "initDXY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory:getInstance(instanceId)
        local scaledImageArray = java_new_array(nil, (self.imageArray.n or #self.imageArray))
        local size = (scaledImageArray.n or #scaledImageArray)
        local image = self:getImage()
        for index = 0, size - 1 do
            scaledImageArray[index + 1] = self.animationFactoryImageScaleUtil:createImage(image, image:getWidth(), image:getHeight(), self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        end
        if not rawequal(self.animationFactoryInitializationVisitor.dx, 0) or not rawequal(self.animationFactoryInitializationVisitor.dy, 0) then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AdjustedImageArrayRotationAnimation.new(scaledImageArray, AngleInfo.getInstance(self:getAngleIncrement()), java_int(AngleFactory.getInstance().TOTAL_ANGLE), self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return ImageArrayRotationAnimation.new(scaledImageArray, AngleInfo.getInstance(self:getAngleIncrement()), java_int(AngleFactory.getInstance().TOTAL_ANGLE), self.animationBehaviorFactory:getOrCreateInstance())
        end
end
java_overload(AllBinaryArrayImageRotationAnimationFactory, "getInstance", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryArrayImageRotationAnimationFactory:setImageArray(imageArray)
        self.imageArray = imageArray
end
java_overload(AllBinaryArrayImageRotationAnimationFactory, "setImageArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function AllBinaryArrayImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrement
end
java_overload(AllBinaryArrayImageRotationAnimationFactory, "getAngleIncrement", 0)

return AllBinaryArrayImageRotationAnimationFactory

