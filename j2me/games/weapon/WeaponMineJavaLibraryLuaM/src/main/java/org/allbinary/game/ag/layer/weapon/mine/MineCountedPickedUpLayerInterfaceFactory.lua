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

local MineCountedPickedUpLayerInterfaceFactory = {}
package.loaded["org.allbinary.game.ag.layer.weapon.mine.MineCountedPickedUpLayerInterfaceFactory"] = MineCountedPickedUpLayerInterfaceFactory

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

local FeaturedAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local WeaponProperties = java_lazy("org.allbinary.game.combat.weapon.WeaponProperties")
local CountedPickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local IconLayerFactory = java_lazy("org.allbinary.game.layer.pickup.IconLayerFactory")
local PickedUpLayerInterfaceFactoryInterface = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local PickedUpLayerTypeFactory = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory")
local WeaponLayerCircularPool = java_lazy("org.allbinary.game.layer.weapon.WeaponLayerCircularPool")
local ScoreableInterface = java_lazy("org.allbinary.game.score.ScoreableInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local MineLayerCircularStaticPool = java_lazy("org.allbinary.game.ag.layer.weapon.mine.MineLayerCircularStaticPool")
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

-- class table MineCountedPickedUpLayerInterfaceFactory is declared before the requires
MineCountedPickedUpLayerInterfaceFactory.__index = MineCountedPickedUpLayerInterfaceFactory
MineCountedPickedUpLayerInterfaceFactory.className = "MineCountedPickedUpLayerInterfaceFactory"
MineCountedPickedUpLayerInterfaceFactory.javaClassName = "org.allbinary.game.ag.layer.weapon.mine.MineCountedPickedUpLayerInterfaceFactory"
setmetatable(MineCountedPickedUpLayerInterfaceFactory, {__index = CountedPickedUpLayerInterfaceFactory})

function MineCountedPickedUpLayerInterfaceFactory:_init_fields()
    self.weaponLayerCircularStaticPool = MineLayerCircularStaticPool.getInstance()
    self.weaponProperties = WeaponProperties.new(-1, -1, 0, 8000, 10)
    self.smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
end


-- throws Exception
function MineCountedPickedUpLayerInterfaceFactory.init()
        MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = MineCountedPickedUpLayerInterfaceFactory.new()
end


function MineCountedPickedUpLayerInterfaceFactory._jinit(self)
    java_super_init(CountedPickedUpLayerInterfaceFactory, self, PickedUpLayerTypeFactory.getInstance().MINE, IconLayerFactory.getInstance(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(MineWeaponResources.getInstance().DROP_ICON_RESOURCE):getInstance(0), 10, 10), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(MineWeaponResources.getInstance().DROP_RESOURCE):getInstance(0))
    MineCountedPickedUpLayerInterfaceFactory._init_fields(self)
        -- super(...) made self above
    return self
end

function MineCountedPickedUpLayerInterfaceFactory.new(...)
    local self = setmetatable({}, MineCountedPickedUpLayerInterfaceFactory)
    MineCountedPickedUpLayerInterfaceFactory._jinit(self, ...)
    return self
end


function MineCountedPickedUpLayerInterfaceFactory.getInstance()
        return MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface
end


function MineCountedPickedUpLayerInterfaceFactory:getTotal()
        return 3
end
java_overload(MineCountedPickedUpLayerInterfaceFactory, "getTotal", 0)


-- throws Exception
function MineCountedPickedUpLayerInterfaceFactory:getNextInstance(hashtable, x, y, z)
        local sourceLayerInterface = hashtable:get(self.smallIntegerSingletonFactory:getAt(0))
        local angle = hashtable:get(self.smallIntegerSingletonFactory:getAt(1))
        local scoreableInterface = sourceLayerInterface
        return self.weaponLayerCircularStaticPool:getInstanceWeaponLayer(sourceLayerInterface, x, y, z, java_int(require("allbinary_java").number_value(angle, "intValue")), 0, self.weaponProperties, scoreableInterface)
end
java_overload(MineCountedPickedUpLayerInterfaceFactory, "getNextInstance", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "ABHashtable")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)

MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY

return MineCountedPickedUpLayerInterfaceFactory

