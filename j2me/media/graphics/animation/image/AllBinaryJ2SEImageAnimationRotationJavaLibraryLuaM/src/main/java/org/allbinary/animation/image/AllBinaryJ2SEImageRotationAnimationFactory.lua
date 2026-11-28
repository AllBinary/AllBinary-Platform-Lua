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

local AllBinaryJ2SEImageRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimationFactory"] = AllBinaryJ2SEImageRotationAnimationFactory

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
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLUtil")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local ImageCopyUtil = java_lazy("org.allbinary.media.image.ImageCopyUtil")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
local AllBinaryAdjustedJ2SEImageRotationAnimation = java_lazy("org.allbinary.animation.image.AllBinaryAdjustedJ2SEImageRotationAnimation")
local AllBinaryJ2SEImageRotationAnimation = java_lazy("org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimation")

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

-- class table AllBinaryJ2SEImageRotationAnimationFactory is declared before the requires
AllBinaryJ2SEImageRotationAnimationFactory.__index = AllBinaryJ2SEImageRotationAnimationFactory
AllBinaryJ2SEImageRotationAnimationFactory.className = "AllBinaryJ2SEImageRotationAnimationFactory"
AllBinaryJ2SEImageRotationAnimationFactory.javaClassName = "org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimationFactory"
setmetatable(AllBinaryJ2SEImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinaryJ2SEImageRotationAnimationFactory:_init_fields()
    if self.angleIncrementP == nil then self.angleIncrementP = 0 end
    if self.resizeCanvasForRotation == nil then self.resizeCanvasForRotation = false end
end


-- throws Exception
function AllBinaryJ2SEImageRotationAnimationFactory.createDXY(image, width, height, dx, dy, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
        local imageRotationAnimationFactory = AllBinaryJ2SEImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.dx = dx
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.dy = dy
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.originalDx = dx
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.originalDy = dy
        return imageRotationAnimationFactory
end


function AllBinaryJ2SEImageRotationAnimationFactory._jinit(self, image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
    java_super_init(BaseImageAnimationFactory, self, image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
    AllBinaryJ2SEImageRotationAnimationFactory._init_fields(self)
        -- super(...) made self above
        self.angleIncrementP = angleIncrement
        self.resizeCanvasForRotation = resizeCanvasForRotation
    return self
end

function AllBinaryJ2SEImageRotationAnimationFactory.new(...)
    local self = setmetatable({}, AllBinaryJ2SEImageRotationAnimationFactory)
    AllBinaryJ2SEImageRotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function AllBinaryJ2SEImageRotationAnimationFactory:getCanvasImage()
        local features = Features.getInstance()
        if self.resizeCanvasForRotation and not (features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) then
            return ImageCopyUtil.getInstance():createImageScale(self:getImage(), 1.44, false)
        else
            return self:getImage()
        end
end
java_overload(AllBinaryJ2SEImageRotationAnimationFactory, "getCanvasImage", 0)


-- throws Exception
function AllBinaryJ2SEImageRotationAnimationFactory:getInstance(instanceId)
        local imageCopyUtil = ImageCopyUtil.getInstance()
        local canvasImage = self:getCanvasImage()
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(canvasImage, self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local openGLUtil = OpenGLUtil.getInstance()
        scaledImage = openGLUtil:addImage(scaledImage)
        local copyOfScaledImage = imageCopyUtil:createImageForRotation(scaledImage)
        if not rawequal(self.animationFactoryInitializationVisitor.dx, 0) or not rawequal(self.animationFactoryInitializationVisitor.dy, 0) then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AllBinaryAdjustedJ2SEImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrementP), AngleFactory.getInstance().TOTAL_ANGLE, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return AllBinaryJ2SEImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrementP), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
        end
end
java_overload(AllBinaryJ2SEImageRotationAnimationFactory, "getInstance", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryJ2SEImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrementP
end
java_overload(AllBinaryJ2SEImageRotationAnimationFactory, "getAngleIncrement", 0)

return AllBinaryJ2SEImageRotationAnimationFactory

