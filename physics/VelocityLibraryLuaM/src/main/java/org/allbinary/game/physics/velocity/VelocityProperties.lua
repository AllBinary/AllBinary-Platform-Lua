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
-- package org.allbinary.game.physics.velocity

local VelocityProperties = {}
package.loaded["org.allbinary.game.physics.velocity.VelocityProperties"] = VelocityProperties

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

local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterface = require("org.allbinary.game.physics.velocity.VelocityInterface")

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

-- class table VelocityProperties is declared before the requires
VelocityProperties.__index = VelocityProperties
VelocityProperties.className = "VelocityProperties"
VelocityProperties.javaClassName = "org.allbinary.game.physics.velocity.VelocityProperties"
setmetatable(VelocityProperties, {__index = BasicVelocityProperties})
VelocityProperties.java_implements = " VelocityInterface "
VelocityProperties.java_interfaces = function() return {VelocityInterface} end

function VelocityProperties:_init_fields()
    if self.maxForwardVelocity == nil then self.maxForwardVelocity = 0 end
    if self.maxReverseVelocity == nil then self.maxReverseVelocity = 0 end
end


function VelocityProperties._jinit(self, maxForwardVelocity, maxReverseVelocity)
    java_super_init(BasicVelocityProperties, self)
    VelocityProperties._init_fields(self)
        self:setMaxForwardVelocity(maxForwardVelocity)
        self:setMaxReverseVelocity(maxReverseVelocity)
    return self
end

function VelocityProperties.new(...)
    local self = setmetatable({}, VelocityProperties)
    VelocityProperties._jinit(self, ...)
    return self
end


function VelocityProperties:getMaxForwardVelocity()
        return self.maxForwardVelocity
end
java_overload(VelocityProperties, "getMaxForwardVelocity", 0)


function VelocityProperties:setMaxForwardVelocity(maxForwardVelocity)
        self.maxForwardVelocity = maxForwardVelocity
end
java_overload(VelocityProperties, "setMaxForwardVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:getMaxReverseVelocity()
        return self.maxReverseVelocity
end
java_overload(VelocityProperties, "getMaxReverseVelocity", 0)


function VelocityProperties:setMaxReverseVelocity(maxReverseVelocity)
        self.maxReverseVelocity = maxReverseVelocity
end
java_overload(VelocityProperties, "setMaxReverseVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:limitMaxXYForwardVelocity()
        self:limitMaxXYVelocity(self:getMaxForwardVelocity())
end
java_overload(VelocityProperties, "limitMaxXYForwardVelocity", 0)


function VelocityProperties:limitMaxXYReverseVelocity()
        self:limitMaxXYVelocity(self:getMaxReverseVelocity())
end
java_overload(VelocityProperties, "limitMaxXYReverseVelocity", 0)


function VelocityProperties:limitMaxYForwardVelocity()
        self:limitMaxYVelocity(self:getMaxForwardVelocity())
end
java_overload(VelocityProperties, "limitMaxYForwardVelocity", 0)


function VelocityProperties:limitMaxYReverseVelocity()
        self:limitMaxYVelocity(self:getMaxReverseVelocity())
end
java_overload(VelocityProperties, "limitMaxYReverseVelocity", 0)


function VelocityProperties:limitMaxXForwardVelocity()
        self:limitMaxXVelocity(self:getMaxForwardVelocity())
end
java_overload(VelocityProperties, "limitMaxXForwardVelocity", 0)


function VelocityProperties:limitMaxXReverseVelocity()
        self:limitMaxXVelocity(self:getMaxReverseVelocity())
end
java_overload(VelocityProperties, "limitMaxXReverseVelocity", 0)


function VelocityProperties:isOverXYMaxForwardVelocity()
        return self:isOverXYMaxVelocity(self:getMaxForwardVelocity())
end
java_overload(VelocityProperties, "isOverXYMaxForwardVelocity", 0)


function VelocityProperties:isOverXYMaxReverseVelocity()
        return self:isOverXYMaxVelocity(self:getMaxReverseVelocity())
end
java_overload(VelocityProperties, "isOverXYMaxReverseVelocity", 0)


function VelocityProperties:limitXYToForwardAndReverseMaxVelocity()
        self:limitMaxXYForwardVelocity()
        self:limitMaxXYReverseVelocity()
end
java_overload(VelocityProperties, "limitXYToForwardAndReverseMaxVelocity", 0)


function VelocityProperties:limitMaxXYVelocity(maxVelocity)
        self:limitMaxXVelocity(maxVelocity)
        self:limitMaxYVelocity(maxVelocity)
end
java_overload(VelocityProperties, "limitMaxXYVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:limitMaxPositiveYVelocity(maxVelocity)
        if self.velocityYBasicDecimal:getUnscaled() > maxVelocity then
            self.velocityYBasicDecimal:setint(maxVelocity)
        end
end
java_overload(VelocityProperties, "limitMaxPositiveYVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:limitMaxNegativeYVelocity(maxVelocity)
        if self.velocityYBasicDecimal:getUnscaled() < -maxVelocity then
            self.velocityYBasicDecimal:setint(-maxVelocity)
        end
end
java_overload(VelocityProperties, "limitMaxNegativeYVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:limitMaxYVelocity(maxVelocity)
        self:limitMaxPositiveYVelocity(maxVelocity)
        self:limitMaxNegativeYVelocity(maxVelocity)
end
java_overload(VelocityProperties, "limitMaxYVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:limitMaxXVelocity(maxVelocity)
        if self.velocityXBasicDecimal:getUnscaled() > maxVelocity then
            self.velocityXBasicDecimal:setint(maxVelocity)
        end
        if self.velocityXBasicDecimal:getUnscaled() < -maxVelocity then
            self.velocityXBasicDecimal:setint(-maxVelocity)
        end
end
java_overload(VelocityProperties, "limitMaxXVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:isOverXYMaxVelocity(maxVelocity)
        if self.velocityXBasicDecimal:getUnscaled() > maxVelocity then
            return true
        end
        if self.velocityXBasicDecimal:getUnscaled() < -maxVelocity then
            return true
        end
        if self.velocityYBasicDecimal:getUnscaled() > maxVelocity then
            return true
        end
        if self.velocityYBasicDecimal:getUnscaled() < -maxVelocity then
            return true
        end
        return false
end
java_overload(VelocityProperties, "isOverXYMaxVelocity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function VelocityProperties:setVelocityi(magnitude, angle, otherAngle)
        java_super(BasicVelocityProperties, "setVelocityi", 3)(self, magnitude, angle, otherAngle)
        self:limitXYToForwardAndReverseMaxVelocity()
end
java_overload(VelocityProperties, "setVelocityi", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function VelocityProperties:addVelocityi(magnitude, angle, otherAngle)
        java_super(BasicVelocityProperties, "addVelocityi", 3)(self, magnitude, angle, otherAngle)
        self:limitXYToForwardAndReverseMaxVelocity()
end
java_overload(VelocityProperties, "addVelocityi", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)

VelocityProperties.NULL_VELOCITY_PROPERTIES = VelocityProperties.new(0, 0)

return VelocityProperties

