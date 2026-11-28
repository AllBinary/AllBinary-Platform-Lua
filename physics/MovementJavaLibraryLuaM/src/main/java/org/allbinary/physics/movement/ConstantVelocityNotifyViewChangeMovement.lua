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
-- package org.allbinary.physics.movement

local ConstantVelocityNotifyViewChangeMovement = {}
package.loaded["org.allbinary.physics.movement.ConstantVelocityNotifyViewChangeMovement"] = ConstantVelocityNotifyViewChangeMovement

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

local AllBinaryGameLayer = java_lazy("org.allbinary.game.layer.AllBinaryGameLayer")
local BasicVelocityProperties = java_lazy("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local AxisMathVectorUtil = java_lazy("org.allbinary.logic.math.vector.AxisMathVectorUtil")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local Movement = require("org.allbinary.physics.movement.Movement")

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

-- class table ConstantVelocityNotifyViewChangeMovement is declared before the requires
ConstantVelocityNotifyViewChangeMovement.__index = ConstantVelocityNotifyViewChangeMovement
ConstantVelocityNotifyViewChangeMovement.className = "ConstantVelocityNotifyViewChangeMovement"
ConstantVelocityNotifyViewChangeMovement.javaClassName = "org.allbinary.physics.movement.ConstantVelocityNotifyViewChangeMovement"
setmetatable(ConstantVelocityNotifyViewChangeMovement, {__index = Movement})

function ConstantVelocityNotifyViewChangeMovement:_init_fields()
    if self.basicVelocityProperties == nil then self.basicVelocityProperties = nil end
    if self.speedBasicDecimal == nil then self.speedBasicDecimal = nil end
    self.axisMathVectorUtil = AxisMathVectorUtil.getInstance()
end


function ConstantVelocityNotifyViewChangeMovement._jinit(self)
    java_super_init(Movement, self)
    ConstantVelocityNotifyViewChangeMovement._init_fields(self)
        self.speedBasicDecimal = BasicDecimal.ZERO_BIGDECIMAL
        self.basicVelocityProperties = BasicVelocityProperties.new()
    return self
end

function ConstantVelocityNotifyViewChangeMovement.new(...)
    local self = setmetatable({}, ConstantVelocityNotifyViewChangeMovement)
    ConstantVelocityNotifyViewChangeMovement._jinit(self, ...)
    return self
end


function ConstantVelocityNotifyViewChangeMovement:init(speedBasicDecimal, angle, otherAngle)
        self.speedBasicDecimal = speedBasicDecimal
        local angleFactory = AngleFactory.getInstance()
        self.basicVelocityProperties:setVelocityWithBigDecimal(speedBasicDecimal, angleFactory:getAt(angle), angleFactory:getAt(otherAngle))
end
java_overload(ConstantVelocityNotifyViewChangeMovement, "init", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicDecimal")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function ConstantVelocityNotifyViewChangeMovement:moveOutsideRadius(layer, radius, angle, otherAngle)
        local scaleFactorValue = self.speedBasicDecimal:getScaledFactorValue()
        local xVector = java_int((self.axisMathVectorUtil:calculateX(radius, angle) / scaleFactorValue))
        local yVector = java_int((self.axisMathVectorUtil:calculateY(radius, angle) / scaleFactorValue))
        local zVector = java_int((self.axisMathVectorUtil:calculateZ(radius, otherAngle) / scaleFactorValue))
        layer:moveDXYZ(xVector, yVector, zVector)
end
java_overload(ConstantVelocityNotifyViewChangeMovement, "moveOutsideRadius", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function ConstantVelocityNotifyViewChangeMovement:process(layer)
        local x = self.basicVelocityProperties:getVelocityXBasicDecimalP():getScaled()
        local y = self.basicVelocityProperties:getVelocityYBasicDecimalP():getScaled()
        local z = self.basicVelocityProperties:getVelocityZBasicDecimalP():getScaled()
        layer:moveDXYZ(x, y, z)
        if not rawequal(x, 0) or not rawequal(y, 0) or not rawequal(z, 0) then
            layer:onViewPositionChangeEvent()
        end
end
java_overload(ConstantVelocityNotifyViewChangeMovement, "process", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayer")) end)


function ConstantVelocityNotifyViewChangeMovement:stop()
        self.basicVelocityProperties:zero()
end
java_overload(ConstantVelocityNotifyViewChangeMovement, "stop", 0)

return ConstantVelocityNotifyViewChangeMovement

