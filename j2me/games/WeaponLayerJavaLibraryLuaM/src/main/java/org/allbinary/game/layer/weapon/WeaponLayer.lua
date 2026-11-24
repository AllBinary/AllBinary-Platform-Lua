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
-- package org.allbinary.game.layer.weapon

local WeaponLayer = {}
package.loaded["org.allbinary.game.layer.weapon.WeaponLayer"] = WeaponLayer

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
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local CollidableBaseBehavior = java_lazy("org.allbinary.game.collision.CollidableBaseBehavior")
local DestroyedLayerProcessor = java_lazy("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local WeaponProperties = java_lazy("org.allbinary.game.combat.weapon.WeaponProperties")
local GameConfigurationUtil = java_lazy("org.allbinary.game.configuration.GameConfigurationUtil")
local BasicGroupFactory = java_lazy("org.allbinary.game.identification.BasicGroupFactory")
local MultiPlayerGameLayer = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local NoScoreable = java_lazy("org.allbinary.game.score.NoScoreable")
local ScoreableInterface = java_lazy("org.allbinary.game.score.ScoreableInterface")
local TickableInterface = java_lazy("org.allbinary.game.tick.TickableInterface")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local Movement = java_lazy("org.allbinary.physics.movement.Movement")
local ViewPosition = java_lazy("org.allbinary.view.ViewPosition")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local CollidableWeaponBehavior = java_lazy("org.allbinary.game.layer.weapon.CollidableWeaponBehavior")

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

-- class table WeaponLayer is declared before the requires
WeaponLayer.__index = WeaponLayer
WeaponLayer.className = "WeaponLayer"
WeaponLayer.javaClassName = "org.allbinary.game.layer.weapon.WeaponLayer"
setmetatable(WeaponLayer, {__index = MultiPlayerGameLayer})
WeaponLayer.java_implements = " TickableInterface "
WeaponLayer.java_interfaces = function() return {TickableInterface} end

function WeaponLayer:_init_fields()
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
    if self.initAnimationInterface == nil then self.initAnimationInterface = nil end
    if self.destroyedAnimationInterface == nil then self.destroyedAnimationInterface = nil end
    self.sourceLayerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
    if self.totalDamage == nil then self.totalDamage = 0 end
    if self.initDamage == nil then self.initDamage = 0 end
    self.destroyed = true
    self.scoreableInterface = NoScoreable.getInstance()
    if self.movement == nil then self.movement = nil end
    self.weaponProperties = WeaponProperties.NULL_WEAPON_PROPERTIES
    if self.multiPlayerType == nil then self.multiPlayerType = nil end
    self.collidableWeaponBehavior = CollidableWeaponBehavior.getNullInstance()
end


function WeaponLayer._jinit(self, name, remoteInfo, multiPlayerType, movement, animationInterface, destroyedAnimationInterface, rectangle, viewPosition)
    java_super_init(MultiPlayerGameLayer, self, remoteInfo, BasicGroupFactory.getInstance().NONE_ARRAY, name, rectangle, viewPosition)
    WeaponLayer._init_fields(self)
        -- super(...) made self above
        self.initAnimationInterface = animationInterface
        self:setAnimationInterface(animationInterface)
        self.destroyedAnimationInterface = destroyedAnimationInterface
        self.movement = movement
        self.multiPlayerType = multiPlayerType
    return self
end

function WeaponLayer.new(...)
    local self = setmetatable({}, WeaponLayer)
    WeaponLayer._jinit(self, ...)
    return self
end


function WeaponLayer:setCollidableInferface(collidableInferface)
        java_super(MultiPlayerGameLayer, "setCollidableInferface", 1)(self, collidableInferface)
        self.collidableWeaponBehavior = self:getCollidableInferface()
end
java_overload(WeaponLayer, "setCollidableInferface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CollidableBaseBehavior")) end)


-- throws Exception
function WeaponLayer:initXYZ(x, y, z)
        self.x = x
        self.y = y
        self.z = z
end
java_overload(WeaponLayer, "initXYZ", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function WeaponLayer:init(sourceLayerInterface, angle, otherAngle, weaponProperties, scoreable)
        self:setWeaponPropertiesP(weaponProperties)
        self:setReadyForExplosion(false)
        self:setAnimationInterface(self:getInitAnimationInterfaceP())
        self:setOwnerLayerInterface(sourceLayerInterface)
        self.collidableWeaponBehavior:init(sourceLayerInterface)
        self:setGroupInterfaces()
        if scoreable ~= nil then
            self.scoreableInterface = scoreable
        end
        self.totalDamage = 0
        self.initDamage = weaponProperties:getDamage()
        self:setDestroyed(false)
        self.movement:init(weaponProperties:getSpeed(), angle, otherAngle)
end
java_overload(WeaponLayer, "init", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and type(java_a2) == "number" and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "WeaponProperties")) and (java_a5 == nil or java_is(java_a5, "ScoreableInterface")) end)


function WeaponLayer:setGroupInterfaces()
        local basicGroupFactory = BasicGroupFactory.getInstance()
        if self.sourceLayerInterface:getGroupInterface()[1] == basicGroupFactory.ENEMY then
            self:setGroupInterface(basicGroupFactory.ENEMY_ARRAY)
        else
            self:setGroupInterface(self.sourceLayerInterface:getGroupInterface())
        end
end
java_overload(WeaponLayer, "setGroupInterfaces", 0)


-- throws Exception
function WeaponLayer:processTick(allBinaryLayerManager)
        if self:isExhausted() and not self:isDestroyed() then
            if self:isReadyForExplosion() then
                local indexedAnimationInterface = self:getAnimationInterface()
                local currentFrame = indexedAnimationInterface:getFrame()
                if currentFrame < indexedAnimationInterface:getAnimationSize() - 1 then
                    indexedAnimationInterface:nextFrame()
                else
                    self:setDestroyed(true)
                end
            else
                local collidableWeaponBehavior = self:getCollidableInferface()
                if collidableWeaponBehavior:isCollided() then
                    self:setAnimationInterface(self.destroyedAnimationInterface)
                    self:getMovement():stop()
                    self:setReadyForExplosion(true)
                else
                    self:setDestroyed(true)
                end
            end
        end
        self.movement:process(self)
        self.totalDamage = self.totalDamage + (self.weaponProperties:getDissipation())
end
java_overload(WeaponLayer, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function WeaponLayer:isDestroyed()
        return self.destroyed
end
java_overload(WeaponLayer, "isDestroyed", 0)


function WeaponLayer:damage(damage, damageType)
        self.totalDamage = self.totalDamage + (damage * damage)
end
java_overload(WeaponLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function WeaponLayer:givePoints(total)
        self.scoreableInterface:addPoints(GameConfigurationUtil.getInstance():getCompetitionValue() * total)
end
java_overload(WeaponLayer, "givePoints", 1, function(java_a1) return true and type(java_a1) == "number" end)


function WeaponLayer:isExhausted()
        if self.totalDamage > self:getInitDamage() or self.totalDamage < 0 then
            return true
        else
            return false
        end
end
java_overload(WeaponLayer, "isExhausted", 0)


function WeaponLayer:getDamage(damageType)
        if not self:isExhausted() then
            local total = self:getInitDamage() - self.totalDamage
            self:givePoints(total)
            return total
        end
        return 0
end
java_overload(WeaponLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


function WeaponLayer:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            self.scoreableInterface = NoScoreable.getInstance()
            DestroyedLayerProcessor.getInstance():add(self)
        end
end
java_overload(WeaponLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function WeaponLayer:getInitDamage()
        return self.initDamage
end
java_overload(WeaponLayer, "getInitDamage", 0)


function WeaponLayer:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end
java_overload(WeaponLayer, "setAnimationInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Animation")) end)


function WeaponLayer:getAnimationInterface()
        return self.animationInterface
end
java_overload(WeaponLayer, "getAnimationInterface", 0)


function WeaponLayer:getInitAnimationInterfaceP()
        return self.initAnimationInterface
end
java_overload(WeaponLayer, "getInitAnimationInterfaceP", 0)


function WeaponLayer:setInitAnimationInterfaceP(initAnimationInterface)
        self.initAnimationInterface = initAnimationInterface
end
java_overload(WeaponLayer, "setInitAnimationInterfaceP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Animation")) end)


function WeaponLayer:getDestroyedAnimationInterface()
        return self.destroyedAnimationInterface
end
java_overload(WeaponLayer, "getDestroyedAnimationInterface", 0)


function WeaponLayer:getOwnerLayerInterface()
        return self.sourceLayerInterface
end
java_overload(WeaponLayer, "getOwnerLayerInterface", 0)


function WeaponLayer:setOwnerLayerInterface(sourceLayerInterface)
        self.sourceLayerInterface = sourceLayerInterface
end
java_overload(WeaponLayer, "setOwnerLayerInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


function WeaponLayer:paint(graphics)
        local viewPosition = self:getViewPosition()
        self.animationInterface:paintXY(graphics, viewPosition:getX() - self:getHalfWidth(), viewPosition:getY() - self:getHalfHeight())
end
java_overload(WeaponLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function WeaponLayer:paintThreed(graphics)
        local viewPosition = self:getViewPosition()
        self.animationInterface:paintThreedXYZ(graphics, viewPosition:getX() - self:getHalfWidth(), viewPosition:getY() - self:getHalfHeight(), viewPosition:getZ() - self:getHalfDepth())
end
java_overload(WeaponLayer, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function WeaponLayer:getMovement()
        return self.movement
end
java_overload(WeaponLayer, "getMovement", 0)


function WeaponLayer:setMovement(movement)
        self.movement = movement
end
java_overload(WeaponLayer, "setMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Movement")) end)


function WeaponLayer:getType()
        return WeaponLayer.getStaticType()
end
java_overload(WeaponLayer, "getType", 0)


function WeaponLayer.getStaticType()
        return 0
end


function WeaponLayer:getMultiPlayerType()
        return self.multiPlayerType
end
java_overload(WeaponLayer, "getMultiPlayerType", 0)


function WeaponLayer:setWeaponPropertiesP(weaponProperties)
        self.weaponProperties = weaponProperties
end
java_overload(WeaponLayer, "setWeaponPropertiesP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WeaponProperties")) end)


function WeaponLayer:getWeaponPropertiesP()
        return self.weaponProperties
end
java_overload(WeaponLayer, "getWeaponPropertiesP", 0)


function WeaponLayer:implmentsTickableInterface()
        return true
end
java_overload(WeaponLayer, "implmentsTickableInterface", 0)


-- throws Exception
function WeaponLayer:set(gl)
        self.initAnimationInterface:set(gl)
end
java_overload(WeaponLayer, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL")) end)

return WeaponLayer

