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

local CollidableWeaponBehavior = {}
package.loaded["org.allbinary.game.layer.weapon.CollidableWeaponBehavior"] = CollidableWeaponBehavior

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

local CollidableHelperFactory = java_lazy("org.allbinary.game.collision.CollidableHelperFactory")
local CollidableInterfaceCompositeInterface = java_lazy("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollisionHelper = java_lazy("org.allbinary.game.collision.CollisionHelper")
local CollisionType = java_lazy("org.allbinary.game.collision.CollisionType")
local CollisionTypeFactory = java_lazy("org.allbinary.game.collision.CollisionTypeFactory")
local DamageableInterface = java_lazy("org.allbinary.game.combat.damage.DamageableInterface")
local CollidableCompositeLayer = java_lazy("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableDestroyableDamageableBehavior = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table CollidableWeaponBehavior is declared before the requires
CollidableWeaponBehavior.__index = CollidableWeaponBehavior
CollidableWeaponBehavior.className = "CollidableWeaponBehavior"
CollidableWeaponBehavior.javaClassName = "org.allbinary.game.layer.weapon.CollidableWeaponBehavior"
setmetatable(CollidableWeaponBehavior, {__index = CollidableDestroyableDamageableBehavior})

function CollidableWeaponBehavior:_init_fields()
    if self.collided == nil then self.collided = false end
    if self.collisionHelper == nil then self.collisionHelper = nil end
end


function CollidableWeaponBehavior.getNullInstance()
        if rawequal(CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR, NullUtil.getInstance().NULL_OBJECT) then
            CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR = CollidableWeaponBehavior.new(false)
        end
        return CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR
end


function CollidableWeaponBehavior._jinit(self, collidable)
    java_super_init(CollidableDestroyableDamageableBehavior, self, collidable)
    CollidableWeaponBehavior._init_fields(self)
        -- super(...) made self above
        self:setCollided(false)
        self:setCollidable(true)
        self.collisionHelper = CollidableHelperFactory.getInstance()
    return self
end

function CollidableWeaponBehavior.new(...)
    local self = setmetatable({}, CollidableWeaponBehavior)
    CollidableWeaponBehavior._jinit(self, ...)
    return self
end


function CollidableWeaponBehavior:init(sourceLayerInterface)
        self:setCollided(false)
        self.collisionHelper:setOwnerLayerInterface(sourceLayerInterface)
end
java_overload(CollidableWeaponBehavior, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


function CollidableWeaponBehavior:isCollision(ownerLayer, collisionLayer)
        if self.collisionHelper:isCollidable(collisionLayer) then
            if not rawequal(ownerLayer:getGroupInterface()[1], collisionLayer:getGroupInterface()[1]) then
                return java_super(CollidableDestroyableDamageableBehavior, "isCollision", 2)(self, ownerLayer, collisionLayer)
            end
        end
        return false
end
java_overload(CollidableWeaponBehavior, "isCollision", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableCompositeLayer")) end)


-- throws Exception
function CollidableWeaponBehavior:collide(ownerLayer, collisionLayer)
        java_super(CollidableDestroyableDamageableBehavior, "collide", 2)(self, ownerLayer, collisionLayer)
        self.collided = true
end
java_overload(CollidableWeaponBehavior, "collide", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableCompositeLayer")) end)


function CollidableWeaponBehavior:isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface)
        if self.collisionHelper:isCollidable(collidableInterfaceCompositeInterface) then
            local layerInterface = collidableInterfaceCompositeInterface
            if not rawequal(ownerLayer:getGroupInterface()[1], layerInterface:getGroupInterface()[1]) then
                if self.layerCollisionUtil:isCollision(ownerLayer, layerInterface) then
                    return true
                end
            end
        end
        return false
end
java_overload(CollidableWeaponBehavior, "isCollisionInterface", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableInterfaceCompositeInterface")) end)


-- throws Exception
function CollidableWeaponBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        local ownerDamageableInterface = ownerLayer
        local damageableInterface = collidableInterfaceCompositeInterface
        self.damageUtil:process(ownerDamageableInterface, damageableInterface)
        self.collided = true
end
java_overload(CollidableWeaponBehavior, "collideInterface", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableInterfaceCompositeInterface")) end)


function CollidableWeaponBehavior:getCollisionTypeWith(layerInterface)
        return CollisionTypeFactory.getInstance().COLLISION
end
java_overload(CollidableWeaponBehavior, "getCollisionTypeWith", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


function CollidableWeaponBehavior:isCollided()
        return self.collided
end
java_overload(CollidableWeaponBehavior, "isCollided", 0)


function CollidableWeaponBehavior:setCollided(collided)
        self.collided = collided
end
java_overload(CollidableWeaponBehavior, "setCollided", 1, function(java_a1) return true and type(java_a1) == "boolean" end)

CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR = NullUtil.getInstance().NULL_OBJECT

return CollidableWeaponBehavior

