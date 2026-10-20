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
-- package org.allbinary.game.midlet


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseLoadingTypeFactory = {}
LicenseLoadingTypeFactory.__index = LicenseLoadingTypeFactory
LicenseLoadingTypeFactory.className = "LicenseLoadingTypeFactory"

function LicenseLoadingTypeFactory:_init_fields()
    self.INITIAL_LOADING = LicenseLoadingType.new("Initial Loading")
    self.GAME_START = LicenseLoadingType.new("Game Start")
    self.LOGIN = LicenseLoadingType.new("Login")
    self.OTHER = LicenseLoadingType.new("Other/Usually The First Non Demo Level")
end

function LicenseLoadingTypeFactory.new()
    local self = setmetatable({}, LicenseLoadingTypeFactory)
    self:_init_fields()
    return self
end


function LicenseLoadingTypeFactory.getIntance()
        return LicenseLoadingTypeFactory.instance
end

LicenseLoadingTypeFactory.instance = LicenseLoadingTypeFactory.new()

return LicenseLoadingTypeFactory

