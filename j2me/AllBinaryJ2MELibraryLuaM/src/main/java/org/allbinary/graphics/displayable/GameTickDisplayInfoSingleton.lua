-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.graphics.displayable


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameTickDisplayInfoSingleton = {}
GameTickDisplayInfoSingleton.__index = GameTickDisplayInfoSingleton
GameTickDisplayInfoSingleton.className = "GameTickDisplayInfoSingleton"

function GameTickDisplayInfoSingleton:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.lastWidth = self.displayInfoSingleton:getLastWidth()
    self.lastHeight = self.displayInfoSingleton:getLastHeight()
    self.lastHalfWidth = self.displayInfoSingleton:getLastHalfWidth()
    self.lastHalfHeight = self.displayInfoSingleton:getLastHalfHeight()
end

function GameTickDisplayInfoSingleton.new()
    local self = setmetatable({}, GameTickDisplayInfoSingleton)
    self:_init_fields()
    return self
end


function GameTickDisplayInfoSingleton.getInstance()
        return GameTickDisplayInfoSingleton.instance
end


function GameTickDisplayInfoSingleton:update()
        self.lastWidth = self.displayInfoSingleton:getLastWidth()
        self.lastHeight = self.displayInfoSingleton:getLastHeight()
        self.lastHalfWidth = self.displayInfoSingleton:getLastHalfWidth()
        self.lastHalfHeight = self.displayInfoSingleton:getLastHalfHeight()
end


function GameTickDisplayInfoSingleton:getLastWidth()
        return self.lastWidth
end


function GameTickDisplayInfoSingleton:getLastHeight()
        return self.lastHeight
end


function GameTickDisplayInfoSingleton:getLastHalfWidth()
        return self.lastHalfWidth
end


function GameTickDisplayInfoSingleton:getLastHalfHeight()
        return self.lastHalfHeight
end

GameTickDisplayInfoSingleton.instance = GameTickDisplayInfoSingleton.new()

return GameTickDisplayInfoSingleton

