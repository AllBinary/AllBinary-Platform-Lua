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
-- package org.allbinary.game.ag.layer.hud.basic.life

local LivesHudWidget = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.life.LivesHudWidget"] = LivesHudWidget

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
local Life = java_lazy("org.allbinary.game.ag.life.Life")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")

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

-- class table LivesHudWidget is declared before the requires
LivesHudWidget.__index = LivesHudWidget
LivesHudWidget.className = "LivesHudWidget"
LivesHudWidget.javaClassName = "org.allbinary.game.ag.layer.hud.basic.life.LivesHudWidget"
setmetatable(LivesHudWidget, {__index = BasicHud})
LivesHudWidget.java_implements = " PaintableInterface "
LivesHudWidget.java_interfaces = function() return {PaintableInterface} end

function LivesHudWidget:_init_fields()
    if self.lifeInterface == nil then self.lifeInterface = nil end
    if self.xArray == nil then self.xArray = nil end
    if self.animationInterface == nil then self.animationInterface = nil end
end


function LivesHudWidget._jinit(self, animationInterface, lifeInterface, location, direction)
    java_super_init(BasicHud, self, location, direction, 2, BasicColorFactory.getInstance().WHITE)
    LivesHudWidget._init_fields(self)
        -- super(...) made self above
        self.lifeInterface = lifeInterface
        local size = java_int(self:getLifeInterface():getMaxlives())
        self.xArray = java_typed_array("I", java_new_array(0, size))
        self.animationInterface = animationInterface
        self.updateMaxWidth = self.lifeInterface:getMaxlives() * 16
        self.updateMaxHeight = 16
    return self
end

function LivesHudWidget.new(...)
    local self = setmetatable({}, LivesHudWidget)
    LivesHudWidget._jinit(self, ...)
    return self
end


function LivesHudWidget:updateMeasurement(graphics)
        java_super(BasicHud, "updateMeasurement", 1)(self, graphics)
        local maxLives = java_int(self:getLifeInterface():getMaxlives())
        for index = 0, maxLives - 1 do
            self.xArray[index + 1] = self:getX() + (index * 16)
        end
end
java_overload(LivesHudWidget, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function LivesHudWidget:onDisplayChangeEvent(displayChangeEvent)
        java_super(BasicHud, "onDisplayChangeEvent", 1)(self, displayChangeEvent)
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(LivesHudWidget, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


function LivesHudWidget:setX(x)
        java_super(BasicHud, "setX", 1)(self, x)
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(LivesHudWidget, "setX", 1, function(java_a1) return true and type(java_a1) == "number" end)


function LivesHudWidget:paint(graphics)
        self.myFontProcessor:process(graphics)
        do
            local index = java_int(self:getLifeInterface():get())
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterface:paintXY(graphics, self.xArray[index + 1], self:getY())
            end
        end
end
java_overload(LivesHudWidget, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function LivesHudWidget:paintThreed(graphics)
end
java_overload(LivesHudWidget, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function LivesHudWidget:getLifeInterface()
        return self.lifeInterface
end
java_overload(LivesHudWidget, "getLifeInterface", 0)

return LivesHudWidget

