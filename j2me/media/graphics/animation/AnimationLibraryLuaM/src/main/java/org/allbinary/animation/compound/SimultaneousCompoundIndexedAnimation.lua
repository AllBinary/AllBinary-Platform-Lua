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
-- package org.allbinary.animation.compound

local SimultaneousCompoundIndexedAnimation = {}
package.loaded["org.allbinary.animation.compound.SimultaneousCompoundIndexedAnimation"] = SimultaneousCompoundIndexedAnimation

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
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")

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

-- class table SimultaneousCompoundIndexedAnimation is declared before the requires
SimultaneousCompoundIndexedAnimation.__index = SimultaneousCompoundIndexedAnimation
SimultaneousCompoundIndexedAnimation.className = "SimultaneousCompoundIndexedAnimation"
SimultaneousCompoundIndexedAnimation.javaClassName = "org.allbinary.animation.compound.SimultaneousCompoundIndexedAnimation"
setmetatable(SimultaneousCompoundIndexedAnimation, {__index = IndexedAnimation})

function SimultaneousCompoundIndexedAnimation:_init_fields()
    if self.animationInterfaceArray == nil then self.animationInterfaceArray = nil end
end


function SimultaneousCompoundIndexedAnimation._jinit(self, animationInterfaceArray, animationBehavior)
    java_super_init(IndexedAnimation, self, animationBehavior)
    SimultaneousCompoundIndexedAnimation._init_fields(self)
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
    return self
end

function SimultaneousCompoundIndexedAnimation.new(...)
    local self = setmetatable({}, SimultaneousCompoundIndexedAnimation)
    SimultaneousCompoundIndexedAnimation._jinit(self, ...)
    return self
end


function SimultaneousCompoundIndexedAnimation:setFrame(frameIndex)
        local indexedAnimation = nil
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            indexedAnimation = self.animationInterfaceArray[index + 1]
            indexedAnimation:setFrame(frameIndex)
            end
        end
end
java_overload(SimultaneousCompoundIndexedAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function SimultaneousCompoundIndexedAnimation:getFrame()
        local indexedAnimation = self.animationInterfaceArray[1]
        return indexedAnimation:getFrame()
end
java_overload(SimultaneousCompoundIndexedAnimation, "getFrame", 0)


function SimultaneousCompoundIndexedAnimation:getSize()
        local indexedAnimation = self.animationInterfaceArray[1]
        return indexedAnimation:getSize()
end
java_overload(SimultaneousCompoundIndexedAnimation, "getSize", 0)


function SimultaneousCompoundIndexedAnimation:previousFrame()
        local indexedAnimation = nil
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            indexedAnimation = self.animationInterfaceArray[index + 1]
            indexedAnimation:previousFrame()
            end
        end
end
java_overload(SimultaneousCompoundIndexedAnimation, "previousFrame", 0)


function SimultaneousCompoundIndexedAnimation:setSequence(sequence)
end
java_overload(SimultaneousCompoundIndexedAnimation, "setSequence", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and (java_a1.jt == nil or java_a1.jt == "I") and (java_a1[1] == nil or math.type(java_a1[1]) == "integer"))) end)


function SimultaneousCompoundIndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end
java_overload(SimultaneousCompoundIndexedAnimation, "getSequence", 0)


-- throws Exception
function SimultaneousCompoundIndexedAnimation:nextFrame()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:nextFrame()
            end
        end
end
java_overload(SimultaneousCompoundIndexedAnimation, "nextFrame", 0)


function SimultaneousCompoundIndexedAnimation:paintXY(graphics, x, y)
        local size = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
        for index = 0, size - 1 do
            self.animationInterfaceArray[index + 1]:paintXY(graphics, x, y)
        end
end
java_overload(SimultaneousCompoundIndexedAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function SimultaneousCompoundIndexedAnimation:paintThreedXYZ(graphics, x, y, z)
        local size = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
        for index = 0, size - 1 do
            self.animationInterfaceArray[index + 1]:paintThreedXYZ(graphics, x, y, z)
        end
end
java_overload(SimultaneousCompoundIndexedAnimation, "paintThreedXYZ", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function SimultaneousCompoundIndexedAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end
java_overload(SimultaneousCompoundIndexedAnimation, "getAnimationInterfaceArray", 0)


function SimultaneousCompoundIndexedAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end
java_overload(SimultaneousCompoundIndexedAnimation, "setAnimationInterfaceArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)

return SimultaneousCompoundIndexedAnimation

