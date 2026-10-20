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

local GameAdState = require("org.allbinary.game.GameAdState")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BottomLimiter = {}
BottomLimiter.__index = BottomLimiter
BottomLimiter.className = "BottomLimiter"

function BottomLimiter:_init_fields()
    self.bottom = 0
    self.deltaY = 0
    self.lower = 0
    self.higher = 0
end


function BottomLimiter.getInstance()
        return BottomLimiter.instance
end


function BottomLimiter.new()
    local self = setmetatable({}, BottomLimiter)
    self:_init_fields()
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

BottomLimiter.instance = BottomLimiter.new()

return BottomLimiter

