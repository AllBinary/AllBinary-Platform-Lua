-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.waypoint

local WaypointLayer = {}
package.loaded["org.allbinary.game.layer.waypoint.WaypointLayer"] = WaypointLayer

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Health = java_lazy("org.allbinary.game.health.Health")
local Group = java_lazy("org.allbinary.game.identification.Group")
local NullRTSFormInputFactory = java_lazy("org.allbinary.game.input.form.NullRTSFormInputFactory")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSProperties = java_lazy("org.allbinary.game.layer.AdvancedRTSProperties")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local TileLayerPositionIntoViewPosition = java_lazy("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local AttackSound = java_lazy("org.allbinary.media.audio.AttackSound")
local CollidableWaypointBehavior = java_lazy("org.allbinary.game.layer.waypoint.CollidableWaypointBehavior")
local Waypoint = java_lazy("org.allbinary.game.layer.waypoint.Waypoint")
local WaypointCellPositionHistory = java_lazy("org.allbinary.game.layer.waypoint.WaypointCellPositionHistory")

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

-- class table WaypointLayer is declared before the requires
WaypointLayer.__index = WaypointLayer
WaypointLayer.className = "WaypointLayer"
WaypointLayer.javaClassName = "org.allbinary.game.layer.waypoint.WaypointLayer"
setmetatable(WaypointLayer, {__index = AdvancedRTSGameLayer})


function WaypointLayer._jinit(self, remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y)
    java_super_init(AdvancedRTSGameLayer, self, remoteInfo, parentLayer, AdvancedRTSProperties.createProperties(), groupInterface, rootName, name, Health.new(1000), NullRTSFormInputFactory.getInstance(), animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, TileLayerPositionIntoViewPosition.new())
        -- super(...) made self above
        self:setCollidableInferface(CollidableWaypointBehavior.new(true))
        self:getWaypointBehavior():setWaypoint(Waypoint.new(self, AttackSound.getInstance()))
        self:setAnimationInterface(self.indexedButShouldBeRotationAnimationInterface)
    return self
end

function WaypointLayer.new(...)
    local self = setmetatable({}, WaypointLayer)
    WaypointLayer._jinit(self, ...)
    return self
end


function WaypointLayer:construct(rtsPlayerLayerInterface)
        self.percentCompleteP = 100
        self:initVisibility(rtsPlayerLayerInterface)
end
java_overload(WaypointLayer, "construct", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


function WaypointLayer:paint(graphics)
        if self:isVisible() then
            java_super(AdvancedRTSGameLayer, "paint", 1)(self, graphics)
        end
end
java_overload(WaypointLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function WaypointLayer:processTick(allBinaryLayerManager)
        local try_ok, try_error, try_value = pcall(function()
            self.indexedButShouldBeRotationAnimationInterface:nextFrame()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "processTick", e)
        end
end
java_overload(WaypointLayer, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function WaypointLayer:damage(damage, damageType)
end
java_overload(WaypointLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function WaypointLayer:getDamage(damageType)
        return 0
end
java_overload(WaypointLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function WaypointLayer:setDestroyed(destroyed)
        java_super(AdvancedRTSGameLayer, "setDestroyed", 1)(self, destroyed)
        if self:isDestroyed() then
            WaypointCellPositionHistory.getInstance():removeLayer(self)
        end
end
java_overload(WaypointLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function WaypointLayer:getType()
        return WaypointLayer.getStaticType()
end
java_overload(WaypointLayer, "getType", 0)


function WaypointLayer.getStaticType()
        return 4
end


function WaypointLayer:isSelfUpgradeable()
        return false
end
java_overload(WaypointLayer, "isSelfUpgradeable", 0)

return WaypointLayer

