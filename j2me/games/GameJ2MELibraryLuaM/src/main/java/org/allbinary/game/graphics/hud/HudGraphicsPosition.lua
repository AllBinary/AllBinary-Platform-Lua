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
-- package org.allbinary.game.graphics.hud

local HudGraphicsPosition = {}
package.loaded["org.allbinary.game.graphics.hud.HudGraphicsPosition"] = HudGraphicsPosition

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

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")

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

-- class table HudGraphicsPosition is declared before the requires
HudGraphicsPosition.__index = HudGraphicsPosition
HudGraphicsPosition.className = "HudGraphicsPosition"
HudGraphicsPosition.javaClassName = "org.allbinary.game.graphics.hud.HudGraphicsPosition"

function HudGraphicsPosition:_init_fields()
    if self.anchor == nil then self.anchor = 0 end
    self.point = PointFactory.getInstance().ZERO_ZERO
end


function HudGraphicsPosition._jinit(self, point, anchor)
    HudGraphicsPosition._init_fields(self)
        self:setAnchor(anchor)
        self:setPoint(point)
    return self
end

function HudGraphicsPosition.new(...)
    local self = setmetatable({}, HudGraphicsPosition)
    HudGraphicsPosition._jinit(self, ...)
    return self
end


function HudGraphicsPosition:getAnchor()
        return self.anchor
end


function HudGraphicsPosition:setAnchor(anchor)
        self.anchor = anchor
end


function HudGraphicsPosition:getPoint()
        return self.point
end


function HudGraphicsPosition:setPoint(point)
        self.point = point
end

HudGraphicsPosition.NULL_HUD_GRAPHICS_POSITION = HudGraphicsPosition.new(PointFactory.getInstance().ZERO_ZERO, 9)

return HudGraphicsPosition

