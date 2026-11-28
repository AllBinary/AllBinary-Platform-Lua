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
-- package org.allbinary.animation.image.sprite

local SpriteIndexedAnimationFactory = {}
package.loaded["org.allbinary.animation.image.sprite.SpriteIndexedAnimationFactory"] = SpriteIndexedAnimationFactory

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
local Sprite = java_lazy("javax.microedition.lcdui.game.Sprite")
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorUtil = java_lazy("org.allbinary.graphics.color.BasicColorUtil")
local AnimationFactorySpriteScaleUtil = java_lazy("org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")
local AdjustedSpriteIndexedAnimation = java_lazy("org.allbinary.animation.image.sprite.AdjustedSpriteIndexedAnimation")
local SpriteIndexedAnimation = java_lazy("org.allbinary.animation.image.sprite.SpriteIndexedAnimation")

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

-- class table SpriteIndexedAnimationFactory is declared before the requires
SpriteIndexedAnimationFactory.__index = SpriteIndexedAnimationFactory
SpriteIndexedAnimationFactory.className = "SpriteIndexedAnimationFactory"
SpriteIndexedAnimationFactory.javaClassName = "org.allbinary.animation.image.sprite.SpriteIndexedAnimationFactory"
setmetatable(SpriteIndexedAnimationFactory, {__index = BaseImageAnimationFactory})
SpriteIndexedAnimationFactory.java_implements = " ProceduralAnimationInterfaceFactoryInterface "
SpriteIndexedAnimationFactory.java_interfaces = function() return {ProceduralAnimationInterfaceFactoryInterface} end

function SpriteIndexedAnimationFactory:_init_fields()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
    self.basicColorArray = BasicColorUtil.getInstance().ZERO_ARRAY
end


-- throws Exception
function SpriteIndexedAnimationFactory.createCWHDXY(image, basicColorArray, width, height, dx, dy, animationBehaviorFactory)
        return SpriteIndexedAnimationFactory.new(image, basicColorArray, PrimitiveIntUtil.getArrayInstance(), width, height, dx, dy, animationBehaviorFactory)
end


-- throws Exception
function SpriteIndexedAnimationFactory.createCWH(image, basicColorArray, width, height, animationBehaviorFactory)
        local spriteIndexedAnimationFactory = SpriteIndexedAnimationFactory.new(image, basicColorArray, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
        spriteIndexedAnimationFactory:initHWH()
        return spriteIndexedAnimationFactory
end


-- throws Exception
function SpriteIndexedAnimationFactory.createWH(image, width, height, animationBehaviorFactory)
        return SpriteIndexedAnimationFactory.new(image, BasicColorUtil.getInstance().ZERO_ARRAY, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
end


function SpriteIndexedAnimationFactory._jinit(self, image, basicColorArray, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    java_super_init(BaseImageAnimationFactory, self, image, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    SpriteIndexedAnimationFactory._init_fields(self)
        -- super(...) made self above
        self.basicColorArray = basicColorArray
    return self
end

function SpriteIndexedAnimationFactory.new(...)
    local self = setmetatable({}, SpriteIndexedAnimationFactory)
    SpriteIndexedAnimationFactory._jinit(self, ...)
    return self
end


function SpriteIndexedAnimationFactory:initHWH()
        self.animationFactoryInitializationVisitor.dx = -((self.animationFactoryInitializationVisitor.width) // (1 << (2)))
        self.animationFactoryInitializationVisitor.dy = -((self.animationFactoryInitializationVisitor.height) // (1 << (2)))
        if AndroidUtil.isAndroid() then
            self.animationFactoryInitializationVisitor.dx = self.animationFactoryInitializationVisitor.dx + (3)
        end
end
java_overload(SpriteIndexedAnimationFactory, "initHWH", 0)


-- throws Exception
function SpriteIndexedAnimationFactory:getInstance(instanceId)
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        if not rawequal(self.animationFactoryInitializationVisitor.dx, 0) or not rawequal(self.animationFactoryInitializationVisitor.dy, 0) then
            return AdjustedSpriteIndexedAnimation.new(sprite, self:getImage(), self.basicColorArray, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return SpriteIndexedAnimation.new(sprite, self:getImage(), self.basicColorArray, self.animationBehaviorFactory:getOrCreateInstance())
        end
end
java_overload(SpriteIndexedAnimationFactory, "getInstance", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function SpriteIndexedAnimationFactory:getInstanceAnimation(animationInterface)
        return self:getInstance(0)
end
java_overload(SpriteIndexedAnimationFactory, "getInstanceAnimation", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Animation")) end)

return SpriteIndexedAnimationFactory

