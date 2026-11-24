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
-- package org.allbinary.business.advertisement

local BottomLimiter = {}
package.loaded["org.allbinary.business.advertisement.BottomLimiter"] = BottomLimiter

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

local GameAdState = java_lazy("org.allbinary.game.GameAdState")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GameAdStateFactory = java_lazy("org.allbinary.business.advertisement.GameAdStateFactory")

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

-- class table BottomLimiter is declared before the requires
BottomLimiter.__index = BottomLimiter
BottomLimiter.className = "BottomLimiter"
BottomLimiter.javaClassName = "org.allbinary.business.advertisement.BottomLimiter"

function BottomLimiter:_init_fields()
    if self.bottom == nil then self.bottom = 0 end
    if self.deltaY == nil then self.deltaY = 0 end
    if self.lower == nil then self.lower = 0 end
    if self.higher == nil then self.higher = 0 end
end


function BottomLimiter.getInstance()
        return BottomLimiter.instance_f
end


function BottomLimiter._jinit(self)
    BottomLimiter._init_fields(self)
    return self
end

function BottomLimiter.new(...)
    local self = setmetatable({}, BottomLimiter)
    BottomLimiter._jinit(self, ...)
    return self
end


function BottomLimiter:init(lower, higher)
        self.lower = lower
        self.higher = higher
end


function BottomLimiter:update()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local gameAdState = GameAdStateFactory.getInstance():getCurrentInstance()
        if gameAdState:isShowingAt() then
            self.deltaY = self.higher
        else
            self.deltaY = self.lower
        end
        self.bottom = displayInfo:getLastHeight() - self.deltaY
end


function BottomLimiter:getDeltaY()
        return self.deltaY
end


function BottomLimiter:getBottom()
        return self.bottom
end

BottomLimiter.instance_f = BottomLimiter.new()

return BottomLimiter

