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
-- package org.allbinary.game.ag.ai

local HorizontaRotationManeuverAI = {}
package.loaded["org.allbinary.game.ag.ai.HorizontaRotationManeuverAI"] = HorizontaRotationManeuverAI

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local ArtificialIntelligence = java_lazy("org.allbinary.ai.ArtificialIntelligence")
local ArtificialIntelligenceTransitionInterface = java_lazy("org.allbinary.ai.ArtificialIntelligenceTransitionInterface")
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local RotationAnimationInterface = java_lazy("org.allbinary.animation.RotationAnimationInterface")
local RotationAnimationInterfaceCompositeInterface = java_lazy("org.allbinary.animation.RotationAnimationInterfaceCompositeInterface")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local BasicVelocityProperties = java_lazy("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterface")
local VelocityInterfaceCompositeInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local AngleIncrementInfo = java_lazy("org.allbinary.math.AngleIncrementInfo")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")

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

-- class table HorizontaRotationManeuverAI is declared before the requires
HorizontaRotationManeuverAI.__index = HorizontaRotationManeuverAI
HorizontaRotationManeuverAI.className = "HorizontaRotationManeuverAI"
HorizontaRotationManeuverAI.javaClassName = "org.allbinary.game.ag.ai.HorizontaRotationManeuverAI"
setmetatable(HorizontaRotationManeuverAI, {__index = BasicAI})
HorizontaRotationManeuverAI.java_implements = " ArtificialIntelligenceTransitionInterface "
HorizontaRotationManeuverAI.java_interfaces = function() return {ArtificialIntelligenceTransitionInterface} end

function HorizontaRotationManeuverAI:_init_fields()
    self.circularIndexUtil = CircularIndexUtil.createInstanceAt(10, require("java.lang.Integer").MAX_VALUE)
    self.currentSpeedDivisor = 5
    if self.rotationAnimationInterface == nil then self.rotationAnimationInterface = nil end
    if self.baseVelocityInterface == nil then self.baseVelocityInterface = nil end
    if self.velocityInterface == nil then self.velocityInterface = nil end
end


function HorizontaRotationManeuverAI._jinit(self, ownerLayerInterface, gameInput)
    java_super_init(BasicAI, self, ownerLayerInterface, gameInput)
    HorizontaRotationManeuverAI._init_fields(self)
        -- super(...) made self above
        local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.rotationAnimationInterface = rotationAnimationInterfaceCompositeInterface:getRotationAnimationInterface()
        local velocityInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.baseVelocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
        self.velocityInterface = self.baseVelocityInterface
        local rotationAnimationInterface = self.rotationAnimationInterface
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        rotationAnimationInterfaceCompositeInterface:setFrame(require("allbinary_java").number_value(angleIncrementInfo.RIGHT_FRAME, "intValue"))
    return self
end

function HorizontaRotationManeuverAI.new(...)
    local self = setmetatable({}, HorizontaRotationManeuverAI)
    HorizontaRotationManeuverAI._jinit(self, ...)
    return self
end


function HorizontaRotationManeuverAI:transition()
        local rotationAnimationInterface = self.rotationAnimationInterface
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
        rotationAnimationInterfaceCompositeInterface:setFrame(require("allbinary_java").number_value(angleIncrementInfo.RIGHT_FRAME, "intValue"))
        local allbinaryLayer = self:getOwnerLayerInterface()
        allbinaryLayer:setPosition(allbinaryLayer:getXP(), 1, allbinaryLayer:getZP())
end
java_overload(HorizontaRotationManeuverAI, "transition", 0)


-- throws Exception
function HorizontaRotationManeuverAI:processAI(allBinaryLayerManager)
        local rotationAnimationInterface = (self.rotationAnimationInterface)
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        local frame = self.rotationAnimationInterface:getFrame()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if ownerLayerInterface:getXP() - ownerLayerInterface:getWidth() <= 0 and rawequal(frame, require("allbinary_java").number_value(angleIncrementInfo.LEFT_FRAME, "intValue")) then
            self:reverse()
            self:drop()
        end
        local displayInfo = DisplayInfoSingleton.getInstance()
        if ownerLayerInterface:getX2() + ownerLayerInterface:getWidth() > displayInfo:getLastWidth() and rawequal(frame, require("allbinary_java").number_value(angleIncrementInfo.RIGHT_FRAME, "intValue")) then
            self:reverse()
            self:accelerate()
            self:drop()
        end
        local index = self.circularIndexUtil:getIndex()
        if rawequal(math.fmod(index, self.currentSpeedDivisor), 0) and rawequal(math.fmod(index, 2), 0) then
            java_super(BasicAI, "processKeyAI", 1)(self, Canvas.UP)
            self.velocityInterface:limitMaxXYVelocity(self.velocityInterface:getMaxForwardVelocity() / self.currentSpeedDivisor)
        end
        self.circularIndexUtil:next()
        if rawequal(frame, require("allbinary_java").number_value(angleIncrementInfo.LEFT_FRAME, "intValue")) then
            java_super(BasicAI, "processKeyAI", 1)(self, Canvas.KEY_NUM0)
        elseif rawequal(frame, require("allbinary_java").number_value(angleIncrementInfo.RIGHT_FRAME, "intValue")) then
            java_super(BasicAI, "processKeyAI", 1)(self, Canvas.KEY_POUND)
        end
end
java_overload(HorizontaRotationManeuverAI, "processAI", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function HorizontaRotationManeuverAI:reverse()
        local rotationAnimationInterface = self.rotationAnimationInterface
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        local frame = self.rotationAnimationInterface:getFrame()
        if rawequal(frame, require("allbinary_java").number_value(angleIncrementInfo.LEFT_FRAME, "intValue")) then
            local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
            rotationAnimationInterfaceCompositeInterface:setFrame(require("allbinary_java").number_value(angleIncrementInfo.RIGHT_FRAME, "intValue"))
            self.baseVelocityInterface:zero()
        elseif rawequal(frame, require("allbinary_java").number_value(angleIncrementInfo.RIGHT_FRAME, "intValue")) then
            local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
            rotationAnimationInterfaceCompositeInterface:setFrame(require("allbinary_java").number_value(angleIncrementInfo.LEFT_FRAME, "intValue"))
            self.baseVelocityInterface:zero()
        end
end
java_overload(HorizontaRotationManeuverAI, "reverse", 0)


function HorizontaRotationManeuverAI:accelerate()
        if self.currentSpeedDivisor > 1 then
            self.currentSpeedDivisor = self.currentSpeedDivisor - 1
        end
end
java_overload(HorizontaRotationManeuverAI, "accelerate", 0)


function HorizontaRotationManeuverAI:drop()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local y = ownerLayerInterface:getYP()
        if ownerLayerInterface:getY2() + ownerLayerInterface:getHeight() > displayInfo:getLastHeight() then
            y = 0
        else
            y = y + (ownerLayerInterface:getHeight() + 1)
        end
        ownerLayerInterface:setPosition(ownerLayerInterface:getXP(), y, ownerLayerInterface:getZP())
end
java_overload(HorizontaRotationManeuverAI, "drop", 0)


function HorizontaRotationManeuverAI:getId()
        return ArtificialIntelligence.AI_ID
end
java_overload(HorizontaRotationManeuverAI, "getId", 0)

return HorizontaRotationManeuverAI

