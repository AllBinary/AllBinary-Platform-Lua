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
-- package org.allbinary.game.ag.layer.weapon.mine

local MineLayer = {}
package.loaded["org.allbinary.game.ag.layer.weapon.mine.MineLayer"] = MineLayer

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

local DropWeaponSound = java_lazy("org.allbinary.ag.weapon.media.audio.DropWeaponSound")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local SimpleWeaponLayer = require("org.allbinary.game.layer.weapon.SimpleWeaponLayer")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local NoMovementFactory = java_lazy("org.allbinary.physics.movement.NoMovementFactory")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local ViewPositionEventHandler = java_lazy("org.allbinary.view.event.ViewPositionEventHandler")
local MineWeaponResources = java_lazy("org.allbinary.game.ag.layer.weapon.mine.MineWeaponResources")

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

-- class table MineLayer is declared before the requires
MineLayer.__index = MineLayer
MineLayer.className = "MineLayer"
MineLayer.javaClassName = "org.allbinary.game.ag.layer.weapon.mine.MineLayer"
setmetatable(MineLayer, {__index = SimpleWeaponLayer})

function MineLayer:_init_fields()
    self.viewPositionEventHandler = ViewPositionEventHandler.getInstance()
end


function MineLayer._jinit(self, viewPosition)
    java_super_init(SimpleWeaponLayer, self, MineLayer.NAME, RemoteInfo.REMOTE_INFO, -1, NoMovementFactory.getInstance():getMovmentInstance(), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(MineWeaponResources.getInstance().RESOURCE):getInstance(0), SimpleWeaponLayer.createDestroyed(), Rectangle.new(PointFactory.getInstance().ZERO_ZERO, 10, 10), viewPosition)
    MineLayer._init_fields(self)
        -- super(...) made self above
    return self
end

function MineLayer.new(...)
    local self = setmetatable({}, MineLayer)
    MineLayer._jinit(self, ...)
    return self
end


function MineLayer:initXYZ(x, y, z)
        self:setPosition(x + 5, y + 5, z)
        self.viewPositionEventHandler:addListener(self)
        SecondaryPlayerQueueFactory.getInstance():add(DropWeaponSound.getInstance())
end
java_overload(MineLayer, "initXYZ", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function MineLayer:damage(damage, damageType)
        self.totalDamage = self:getInitDamage() + 1
end
java_overload(MineLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MineLayer:getDamage(damageType)
        java_super(SimpleWeaponLayer, "getDamage", 1)(self, damageType)
        return self:getInitDamage()
end
java_overload(MineLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


function MineLayer:setDestroyed(destroyed)
        java_super(SimpleWeaponLayer, "setDestroyed", 1)(self, destroyed)
        if self:isDestroyed() then
            self.viewPositionEventHandler:removeListener(self)
        end
end
java_overload(MineLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)

MineLayer.NAME = "MineLayer"

return MineLayer

