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
-- package org.allbinary.game.health

local HealthBar = {}
package.loaded["org.allbinary.game.health.HealthBar"] = HealthBar

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local HealthListenerInterface = require("org.allbinary.game.health.HealthListenerInterface")
local Health = java_lazy("org.allbinary.game.health.Health")
local HealthBarAnimation = java_lazy("org.allbinary.game.health.HealthBarAnimation")
local HealthInterface = java_lazy("org.allbinary.game.health.HealthInterface")

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

-- class table HealthBar is declared before the requires
HealthBar.__index = HealthBar
HealthBar.className = "HealthBar"
HealthBar.javaClassName = "org.allbinary.game.health.HealthBar"
setmetatable(HealthBar, {__index = Paintable})
HealthBar.java_implements = " HealthListenerInterface "
HealthBar.java_interfaces = function() return {HealthListenerInterface} end

function HealthBar:_init_fields()
    if self.animationInterface == nil then self.animationInterface = nil end
    if self.healthInterface == nil then self.healthInterface = nil end
    if self.allbinaryLayer == nil then self.allbinaryLayer = nil end
end


function HealthBar._jinit(self, layerInterface, healthInterface, animationInterface, direction)
    java_super_init(Paintable, self)
    HealthBar._init_fields(self)
        self.allbinaryLayer = layerInterface
        self.animationInterface = animationInterface
        self.healthInterface = healthInterface
        self.healthInterface:addListener(self)
        self:onHealthChange()
    return self
end

function HealthBar.new(...)
    local self = setmetatable({}, HealthBar)
    HealthBar._jinit(self, ...)
    return self
end


function HealthBar:onHealthChange()
        self.animationInterface:onHealthChange(self.healthInterface:getHealth() * self.allbinaryLayer:getWidth() / self.healthInterface:getMaxHealth())
end
java_overload(HealthBar, "onHealthChange", 0)


function HealthBar:paint(graphics)
        self.animationInterface:paintXY(graphics, 0, 0)
end
java_overload(HealthBar, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HealthBar:paintThreed(graphics)
        self.animationInterface:paintThreedXYZ(graphics, 0, 0, 0)
end
java_overload(HealthBar, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return HealthBar

