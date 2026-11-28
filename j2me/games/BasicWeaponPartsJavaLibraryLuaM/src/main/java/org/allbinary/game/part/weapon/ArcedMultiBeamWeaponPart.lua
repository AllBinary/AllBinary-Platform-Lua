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
-- package org.allbinary.game.part.weapon

local ArcedMultiBeamWeaponPart = {}
package.loaded["org.allbinary.game.part.weapon.ArcedMultiBeamWeaponPart"] = ArcedMultiBeamWeaponPart

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

local Animation = java_lazy("org.allbinary.animation.Animation")
local WeaponProperties = java_lazy("org.allbinary.game.combat.weapon.WeaponProperties")
local WeaponLayer = java_lazy("org.allbinary.game.layer.weapon.WeaponLayer")
local WeaponLayerCircularPool = java_lazy("org.allbinary.game.layer.weapon.WeaponLayerCircularPool")
local ScoreableInterface = java_lazy("org.allbinary.game.score.ScoreableInterface")
local RelativeRelationship = java_lazy("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local BasicWeaponPart = require("org.allbinary.game.part.weapon.BasicWeaponPart")

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

-- class table ArcedMultiBeamWeaponPart is declared before the requires
ArcedMultiBeamWeaponPart.__index = ArcedMultiBeamWeaponPart
ArcedMultiBeamWeaponPart.className = "ArcedMultiBeamWeaponPart"
ArcedMultiBeamWeaponPart.javaClassName = "org.allbinary.game.part.weapon.ArcedMultiBeamWeaponPart"
setmetatable(ArcedMultiBeamWeaponPart, {__index = BasicWeaponPart})

function ArcedMultiBeamWeaponPart:_init_fields()
    if self.weaponLayerCircularStaticPool == nil then self.weaponLayerCircularStaticPool = nil end
    if self.total == nil then self.total = 0 end
    self.TOTAL_ANGLE = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
end


function ArcedMultiBeamWeaponPart._jinit(self, animationInterface, sourceLayerInterface, weaponLayerCircularStaticPool, total, weaponProperties, scoreableInterface, relativeRelationship)
    java_super_init(BasicWeaponPart, self, animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship)
    ArcedMultiBeamWeaponPart._init_fields(self)
        -- super(...) made self above
        self.total = total
        self.weaponLayerCircularStaticPool = weaponLayerCircularStaticPool
    return self
end

function ArcedMultiBeamWeaponPart.new(...)
    local self = setmetatable({}, ArcedMultiBeamWeaponPart)
    ArcedMultiBeamWeaponPart._jinit(self, ...)
    return self
end


-- throws Exception
function ArcedMultiBeamWeaponPart:processScore(allbinaryLayerManager, angle, otherAngle, weaponProperties, scoreableInterface)
        local increment = (java_idiv((self.total - 1), self.TOTAL_ANGLE))
        local minAngle = (angle - ((((increment * self.total)) // (1 << (1)))))
        local next = 0
        local weaponLayer = nil
        for index = 0, self.total - 1 do
            weaponLayer = self.weaponLayerCircularStaticPool:getInstanceWeaponLayer(self:getOwnerLayerInterface(), self.relativeRelationship:getX(), self.relativeRelationship:getY(), 0, (minAngle + increment), otherAngle, weaponProperties, scoreableInterface)
            allbinaryLayerManager:append(weaponLayer)
            next = next + (increment)
        end
end
java_overload(ArcedMultiBeamWeaponPart, "processScore", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and type(java_a2) == "number" and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "WeaponProperties")) and (java_a5 == nil or java_is(java_a5, "ScoreableInterface")) end)

return ArcedMultiBeamWeaponPart

