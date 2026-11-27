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
-- package org.allbinary.animation

local RotationAnimation = {}
package.loaded["org.allbinary.animation.RotationAnimation"] = RotationAnimation

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

local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionUtil = java_lazy("org.allbinary.direction.DirectionUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local Angle = java_lazy("org.allbinary.math.Angle")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local FrameUtil = java_lazy("org.allbinary.math.FrameUtil")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local RotationAnimationInterface = require("org.allbinary.animation.RotationAnimationInterface")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")

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

-- class table RotationAnimation is declared before the requires
RotationAnimation.__index = RotationAnimation
RotationAnimation.className = "RotationAnimation"
RotationAnimation.javaClassName = "org.allbinary.animation.RotationAnimation"
setmetatable(RotationAnimation, {__index = IndexedAnimation})
RotationAnimation.java_implements = " RotationAnimationInterface "
RotationAnimation.java_interfaces = function() return {RotationAnimationInterface} end

function RotationAnimation:_init_fields()
    self.frameUtil = FrameUtil.getInstance()
    self.directionUtil = DirectionUtil.getInstance()
    if self.angleInfo == nil then self.angleInfo = nil end
    if self.circularIndexUtil == nil then self.circularIndexUtil = nil end
end


function RotationAnimation._jinit(self, angleInfo, circularIndexUtil, animationBehavior)
    java_super_init(IndexedAnimation, self, animationBehavior)
    RotationAnimation._init_fields(self)
        -- super(...) made self above
        self.angleInfo = angleInfo
        self.circularIndexUtil = circularIndexUtil
    return self
end

function RotationAnimation.new(...)
    local self = setmetatable({}, RotationAnimation)
    RotationAnimation._jinit(self, ...)
    return self
end


function RotationAnimation:nextRotationX()
end
java_overload(RotationAnimation, "nextRotationX", 0)


function RotationAnimation:previousRotationX()
end
java_overload(RotationAnimation, "previousRotationX", 0)


function RotationAnimation:nextRotation()
        self.angleInfo:adjustAngle(self.circularIndexUtil:next())
end
java_overload(RotationAnimation, "nextRotation", 0)


function RotationAnimation:previousRotation()
        self.angleInfo:adjustAngle(self.circularIndexUtil:previous())
end
java_overload(RotationAnimation, "previousRotation", 0)


function RotationAnimation:nextRotationZ()
end
java_overload(RotationAnimation, "nextRotationZ", 0)


function RotationAnimation:previousRotationZ()
end
java_overload(RotationAnimation, "previousRotationZ", 0)


function RotationAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
        local newFrame = self.circularIndexUtil:getIndex()
        self.angleInfo:adjustAngle(newFrame)
end
java_overload(RotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function RotationAnimation:setFrameByDirection(direction)
        local angle = self.directionUtil:getFrameAngle(direction)
        self:adjustFrameToAngle(angle)
end
java_overload(RotationAnimation, "setFrameByDirection", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Direction")) end)


function RotationAnimation:setFrameToAngle(angle)
        self:adjustFrameToAngle(angle)
end
java_overload(RotationAnimation, "setFrameToAngle", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Angle")) end)


function RotationAnimation:adjustFrameToAngle(angle)
        self:adjustFrame(angle:getValue())
end
java_overload(RotationAnimation, "adjustFrameToAngle", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Angle")) end)


function RotationAnimation:adjustFrame(angle)
        self:setFrame(self.frameUtil:getFrameForAngle(angle, java_int(self.angleInfo:getAngleIncrementInfo():getAngleIncrement())))
end
java_overload(RotationAnimation, "adjustFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function RotationAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end
java_overload(RotationAnimation, "getFrame", 0)


function RotationAnimation:getSize()
        return self.circularIndexUtil:getSize()
end
java_overload(RotationAnimation, "getSize", 0)


function RotationAnimation:getAngleInfoP()
        return self.angleInfo
end
java_overload(RotationAnimation, "getAngleInfoP", 0)


function RotationAnimation:toString()
        return tostring(StringMaker.new():append(tostring(IndexedAnimation)):append("circularIndexUtil: "):append(tostring(self.circularIndexUtil)):append("angleInfo: "):append(tostring(self.angleInfo)))
end
java_overload(RotationAnimation, "toString", 0)
RotationAnimation.__tostring = function(self) return self:toString() end

return RotationAnimation

