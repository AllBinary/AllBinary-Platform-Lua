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
-- package org.allbinary.view

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

local CenterStaticViewPositionFactory = {}
CenterStaticViewPositionFactory.__index = CenterStaticViewPositionFactory
CenterStaticViewPositionFactory.className = "CenterStaticViewPositionFactory"


function CenterStaticViewPositionFactory.new()
    local self = setmetatable({}, CenterStaticViewPositionFactory)
    return self
end


function CenterStaticViewPositionFactory:getInstance(z)
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        return StaticViewPosition.new((((displayInfoSingleton:getLastWidth()) // (1 << (1)))), (((displayInfoSingleton:getLastHeight()) // (1 << (1)))), z)
end

return CenterStaticViewPositionFactory

