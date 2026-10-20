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
-- package org.allbinary.game.init

local GameInitializationInterfaceFactoryInterface = require("org.allbinary.game.init.GameInitializationInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicBuildGameInitializerFactory = {}
BasicBuildGameInitializerFactory.__index = BasicBuildGameInitializerFactory
BasicBuildGameInitializerFactory.className = "BasicBuildGameInitializerFactory"

function BasicBuildGameInitializerFactory.new()
    local self = setmetatable({}, BasicBuildGameInitializerFactory)
    return self
end


function BasicBuildGameInitializerFactory:getInstance()
        return BaseGameInitialization.NULL_BASE_GAME_INITIALIZATION
end

BasicBuildGameInitializerFactory.NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY = BasicBuildGameInitializerFactory.new()

return BasicBuildGameInitializerFactory

