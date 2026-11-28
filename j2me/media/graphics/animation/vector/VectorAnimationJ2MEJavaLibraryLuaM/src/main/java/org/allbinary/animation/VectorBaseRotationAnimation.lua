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

local VectorBaseRotationAnimation = {}
package.loaded["org.allbinary.animation.VectorBaseRotationAnimation"] = VectorBaseRotationAnimation

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
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local VectorAnimationInterface = require("org.allbinary.animation.VectorAnimationInterface")
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

-- class table VectorBaseRotationAnimation is declared before the requires
VectorBaseRotationAnimation.__index = VectorBaseRotationAnimation
VectorBaseRotationAnimation.className = "VectorBaseRotationAnimation"
VectorBaseRotationAnimation.javaClassName = "org.allbinary.animation.VectorBaseRotationAnimation"
setmetatable(VectorBaseRotationAnimation, {__index = RotationAnimation})
VectorBaseRotationAnimation.java_implements = " VectorAnimationInterface "
VectorBaseRotationAnimation.java_interfaces = function() return {VectorAnimationInterface} end

function VectorBaseRotationAnimation:_init_fields()
    self.currentPoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
end


function VectorBaseRotationAnimation._jinit(self, angleInfo, currentPoints, basicColor, animationBehavior)
    java_super_init(RotationAnimation, self, angleInfo, CircularIndexUtil.createInstance(360 / angleInfo:getAngleIncrementInfo():getAngleIncrement()), animationBehavior)
    VectorBaseRotationAnimation._init_fields(self)
        -- super(...) made self above
        self:setPoints(currentPoints)
        self:setBasicColorP(basicColor)
    return self
end

function VectorBaseRotationAnimation.new(...)
    local self = setmetatable({}, VectorBaseRotationAnimation)
    VectorBaseRotationAnimation._jinit(self, ...)
    return self
end


-- throws Exception
function VectorBaseRotationAnimation:getAnimationSize()
        return self:getSize()
end
java_overload(VectorBaseRotationAnimation, "getAnimationSize", 0)


function VectorBaseRotationAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end
java_overload(VectorBaseRotationAnimation, "getFrame", 0)


function VectorBaseRotationAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
end
java_overload(VectorBaseRotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VectorBaseRotationAnimation:nextFrame()
        self.circularIndexUtil:next()
end
java_overload(VectorBaseRotationAnimation, "nextFrame", 0)


function VectorBaseRotationAnimation:previousFrame()
        self.circularIndexUtil:previous()
end
java_overload(VectorBaseRotationAnimation, "previousFrame", 0)


function VectorBaseRotationAnimation:getSize()
        return (self.currentPoints.n or #self.currentPoints)
end
java_overload(VectorBaseRotationAnimation, "getSize", 0)


function VectorBaseRotationAnimation:setSequence(sequence)
end
java_overload(VectorBaseRotationAnimation, "setSequence", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and (java_a1.jt == nil or java_a1.jt == "I") and (java_a1[1] == nil or math.type(java_a1[1]) == "integer"))) end)


function VectorBaseRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end
java_overload(VectorBaseRotationAnimation, "getSequence", 0)


function VectorBaseRotationAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP(graphics, self.basicColor)
        local try_ok, try_error, try_value = pcall(function()
            local nextPointX = 0
            local nextPointY = 0
            local nextPoint = nil
            local point = nil
            local currentPointsFrame = self.currentPoints[self.circularIndexUtil:getIndex() + 1]
            local size = (currentPointsFrame.n or #currentPointsFrame)
            local index = size - 2
            while (function() index = index - 1 return index end)() >= 0 do
                nextPoint = currentPointsFrame[index + 1]
                point = currentPointsFrame[index + 1 + 1]
                nextPointX = nextPoint[1]
                nextPointY = nextPoint[2]
                if not rawequal(nextPointX, 1000) then
                    graphics:drawLine(point[1] + x, point[2] + y, nextPointX + x, nextPointY + y)
                else
                    index = index - 1
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "paintVectors", e)
        end
end
java_overload(VectorBaseRotationAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function VectorBaseRotationAnimation:getPoints(frame)
        return self.currentPoints[frame + 1]
end
java_overload(VectorBaseRotationAnimation, "getPoints", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VectorBaseRotationAnimation:setPoints(currentPoints)
        self.currentPoints = currentPoints
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.currentPoints.n or #self.currentPoints))
end
java_overload(VectorBaseRotationAnimation, "setPoints", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function VectorBaseRotationAnimation:getBasicColorP()
        return java_super(RotationAnimation, "getBasicColorP", 0)(self)
end
java_overload(VectorBaseRotationAnimation, "getBasicColorP", 0)


function VectorBaseRotationAnimation:setBasicColorP(basicColor)
        java_super(RotationAnimation, "setBasicColorP", 1)(self, basicColor)
end
java_overload(VectorBaseRotationAnimation, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)

return VectorBaseRotationAnimation

