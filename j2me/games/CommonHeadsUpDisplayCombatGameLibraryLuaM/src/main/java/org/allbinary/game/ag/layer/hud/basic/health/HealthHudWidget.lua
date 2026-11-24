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
-- package org.allbinary.game.ag.layer.hud.basic.health

local HealthHudWidget = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.health.HealthHudWidget"] = HealthHudWidget

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
local Animation = java_lazy("org.allbinary.animation.Animation")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local Health = java_lazy("org.allbinary.game.health.Health")
local HealthListenerInterface = java_lazy("org.allbinary.game.health.HealthListenerInterface")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local NoTimeDelayHelper = java_lazy("org.allbinary.time.NoTimeDelayHelper")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table HealthHudWidget is declared before the requires
HealthHudWidget.__index = HealthHudWidget
HealthHudWidget.className = "HealthHudWidget"
HealthHudWidget.javaClassName = "org.allbinary.game.ag.layer.hud.basic.health.HealthHudWidget"
setmetatable(HealthHudWidget, {__index = BasicHud})
HealthHudWidget.java_implements = " PaintableInterface HealthListenerInterface "
HealthHudWidget.java_interfaces = function() return {PaintableInterface, HealthListenerInterface} end

function HealthHudWidget:_init_fields()
    if self.healthScale == nil then self.healthScale = nil end
    if self.animationInterface == nil then self.animationInterface = nil end
    if self.healthInterface == nil then self.healthInterface = nil end
    if self.max == nil then self.max = 0 end
    if self.xArray == nil then self.xArray = nil end
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.timeDelayHelper = NoTimeDelayHelper.SINGLETON
    self.slowBeatTimeDelayHelper = TimeDelayHelper.new(1280)
    self.mediumBeatTimeDelayHelper = TimeDelayHelper.new(640)
    self.fastBeatTimeDelayHelper = TimeDelayHelper.new(320)
end


function HealthHudWidget._jinit(self, animationInterface, healthInterface, location, direction)
    java_super_init(BasicHud, self, location, direction, 2, BasicColorFactory.getInstance().WHITE)
    HealthHudWidget._init_fields(self)
        -- super(...) made self above
        self.animationInterface = animationInterface
        self.healthInterface = healthInterface
        self.healthInterface:addListener(self)
        self.healthScale = (self.healthInterface:getMaxHealth() / 6) + 1
        self:onHealthChange()
        self.updateMaxWidth = healthInterface:getMaxHealth() * 16
        self.updateMaxHeight = 16
        self.xArray = java_typed_array("I", java_new_array(0, 30))
        self:update()
    return self
end

function HealthHudWidget.new(...)
    local self = setmetatable({}, HealthHudWidget)
    HealthHudWidget._jinit(self, ...)
    return self
end


function HealthHudWidget:update()
        if self.xArray ~= nil then
            for index = 0, (self.xArray.n or #self.xArray) - 1 do
                self.xArray[index + 1] = self:getX() + (index * 16)
            end
        end
end
java_overload(HealthHudWidget, "update", 0)


function HealthHudWidget:setX(x)
        java_super(BasicHud, "setX", 1)(self, x)
        self:update()
end
java_overload(HealthHudWidget, "setX", 1, function(java_a1) return true and type(java_a1) == "number" end)


function HealthHudWidget:onHealthChange()
        self.max = (self.healthInterface:getHealth() / self.healthScale)
        self.timeDelayHelper = NoTimeDelayHelper.SINGLETON
        if self.max <= 1 and self.healthInterface:isAlive() then
            self.max = 1
            if self.healthScale - self.healthInterface:getHealth() > java_idiv((self.healthScale * 2), 3) then
                self.timeDelayHelper = self.slowBeatTimeDelayHelper
            elseif self.healthScale - self.healthInterface:getHealth() > java_idiv(self.healthScale, 3) then
                self.timeDelayHelper = self.mediumBeatTimeDelayHelper
            else
                self.timeDelayHelper = self.fastBeatTimeDelayHelper
            end
        end
end
java_overload(HealthHudWidget, "onHealthChange", 0)


function HealthHudWidget:paint(graphics)
        self.myFontProcessor:process(graphics)
        for index = 0, self.max - 1 do
            if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
                self.animationInterface:paintXY(graphics, self.xArray[index + 1], self:getY())
            end
        end
end
java_overload(HealthHudWidget, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HealthHudWidget:paintThreed(graphics)
end
java_overload(HealthHudWidget, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return HealthHudWidget

