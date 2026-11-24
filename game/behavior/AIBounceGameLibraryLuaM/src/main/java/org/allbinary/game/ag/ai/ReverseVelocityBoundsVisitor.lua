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

local ReverseVelocityBoundsVisitor = {}
package.loaded["org.allbinary.game.ag.ai.ReverseVelocityBoundsVisitor"] = ReverseVelocityBoundsVisitor

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

local BoundsVisitorInterface = java_lazy("org.allbinary.bounds.BoundsVisitorInterface")
local VelocityInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterface")
local VelocityInterfaceCompositeInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local LayerInterface = java_lazy("org.allbinary.layer.LayerInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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

-- class table ReverseVelocityBoundsVisitor is declared before the requires
ReverseVelocityBoundsVisitor.__index = ReverseVelocityBoundsVisitor
ReverseVelocityBoundsVisitor.className = "ReverseVelocityBoundsVisitor"
ReverseVelocityBoundsVisitor.javaClassName = "org.allbinary.game.ag.ai.ReverseVelocityBoundsVisitor"
ReverseVelocityBoundsVisitor.java_implements = " BoundsVisitorInterface "
ReverseVelocityBoundsVisitor.java_interfaces = function() return {BoundsVisitorInterface} end

function ReverseVelocityBoundsVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.velocityInterface == nil then self.velocityInterface = nil end
    if self.layerInterface == nil then self.layerInterface = nil end
end


function ReverseVelocityBoundsVisitor._jinit(self, layerInterface)
    ReverseVelocityBoundsVisitor._init_fields(self)
        self.layerInterface = layerInterface
        local velocityInterfaceCompositeInterface = layerInterface
        self.velocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
    return self
end

function ReverseVelocityBoundsVisitor.new(...)
    local self = setmetatable({}, ReverseVelocityBoundsVisitor)
    ReverseVelocityBoundsVisitor._jinit(self, ...)
    return self
end


function ReverseVelocityBoundsVisitor:getX()
        return self.layerInterface:getXP()
end


function ReverseVelocityBoundsVisitor:getY()
        return self.layerInterface:getYP()
end


function ReverseVelocityBoundsVisitor:minX()
        if self.velocityInterface:getVelocityXBasicDecimalP():getUnscaled() < 0 then
            self.velocityInterface:getVelocityXBasicDecimalP():multiplyint(-1)
        end
end


function ReverseVelocityBoundsVisitor:maxX()
        if self.velocityInterface:getVelocityXBasicDecimalP():getUnscaled() > 0 then
            self.velocityInterface:getVelocityXBasicDecimalP():multiplyint(-1)
        end
end


function ReverseVelocityBoundsVisitor:minY()
        if self.velocityInterface:getVelocityYBasicDecimalP():getUnscaled() < 0 then
            self.velocityInterface:getVelocityYBasicDecimalP():multiplyint(-1)
        end
end


function ReverseVelocityBoundsVisitor:maxY()
        if self.velocityInterface:getVelocityYBasicDecimalP():getUnscaled() > 0 then
            self.velocityInterface:getVelocityYBasicDecimalP():multiplyint(-1)
        end
end

return ReverseVelocityBoundsVisitor

