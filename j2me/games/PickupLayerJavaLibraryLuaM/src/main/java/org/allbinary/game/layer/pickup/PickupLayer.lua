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
-- package org.allbinary.game.layer.pickup

local PickupLayer = {}
package.loaded["org.allbinary.game.layer.pickup.PickupLayer"] = PickupLayer

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

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local CollidableAlwaysPickupNeverCollideBehaviorFactory = java_lazy("org.allbinary.game.collision.CollidableAlwaysPickupNeverCollideBehaviorFactory")
local DestroyedLayerProcessor = java_lazy("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local BasicGroupFactory = java_lazy("org.allbinary.game.identification.BasicGroupFactory")
local MultiPlayerGameLayer = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local OpenGLSurfaceChangedInterface = java_lazy("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local PickedUpLayerInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterface")
local PickupableInterface = require("org.allbinary.game.layer.pickup.PickupableInterface")

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

-- class table PickupLayer is declared before the requires
PickupLayer.__index = PickupLayer
PickupLayer.className = "PickupLayer"
PickupLayer.javaClassName = "org.allbinary.game.layer.pickup.PickupLayer"
setmetatable(PickupLayer, {__index = MultiPlayerGameLayer})
PickupLayer.java_implements = " PickedUpLayerInterface PickupableInterface "
PickupLayer.java_interfaces = function() return {PickedUpLayerInterface, PickupableInterface} end

function PickupLayer:_init_fields()
    self.pickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY
    if self.destroyed == nil then self.destroyed = false end
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function PickupLayer._jinit(self, name, remoteInfo, total, pickedUpLayerInterfaceFactoryInterface, animationInterface, rectangle, viewPosition)
    java_super_init(MultiPlayerGameLayer, self, remoteInfo, BasicGroupFactory.getInstance().NONE_ARRAY, name, rectangle, viewPosition)
    PickupLayer._init_fields(self)
        -- super(...) made self above
        self:setCollidableInferface(CollidableAlwaysPickupNeverCollideBehaviorFactory.getInstance():createBehavior())
        self:setLayerWidth(10)
        self:setLayerHeight(10)
        self:init(pickedUpLayerInterfaceFactoryInterface, animationInterface)
    return self
end

function PickupLayer.new(...)
    local self = setmetatable({}, PickupLayer)
    PickupLayer._jinit(self, ...)
    return self
end


function PickupLayer:init(pickedUpLayerInterfaceFactoryInterface, animationInterface)
        self.pickedUpLayerInterfaceFactoryInterface = pickedUpLayerInterfaceFactoryInterface
        self.animationInterface = animationInterface
        self:setDestroyed(false)
end
java_overload(PickupLayer, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PickedUpLayerInterfaceFactoryInterface")) and (java_a2 == nil or java_is(java_a2, "Animation")) end)


function PickupLayer:initXYZ(x, y, z)
        self:setPosition(x, y, z)
end
java_overload(PickupLayer, "initXYZ", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function PickupLayer:paint(graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self.animationInterface:paintXY(graphics, viewX, viewY)
end
java_overload(PickupLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function PickupLayer:paintThreed(graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self.animationInterface:paintThreedXYZ(graphics, viewX, viewY, 3)
end
java_overload(PickupLayer, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function PickupLayer:getPickedUpLayerInterfaceFactoryInterface()
        return self.pickedUpLayerInterfaceFactoryInterface
end
java_overload(PickupLayer, "getPickedUpLayerInterfaceFactoryInterface", 0)


function PickupLayer:setPickedUp()
        self:setDestroyed(true)
end
java_overload(PickupLayer, "setPickedUp", 0)


function PickupLayer:isDestroyed()
        return self.destroyed
end
java_overload(PickupLayer, "isDestroyed", 0)


function PickupLayer:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            DestroyedLayerProcessor.getInstance():add(self)
        end
end
java_overload(PickupLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function PickupLayer:damage(damage, damageType)
end
java_overload(PickupLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function PickupLayer:getDamage(damageType)
        return 0
end
java_overload(PickupLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function PickupLayer:set(gl)
        local openGLSurfaceChangedInterface = self.animationInterface
        openGLSurfaceChangedInterface:set(gl)
end
java_overload(PickupLayer, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL")) end)

return PickupLayer

