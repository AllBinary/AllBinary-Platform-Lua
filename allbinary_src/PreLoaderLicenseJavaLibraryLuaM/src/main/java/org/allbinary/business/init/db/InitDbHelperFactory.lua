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
-- package org.allbinary.business.init.db

local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InitDbHelperFactory = {}
InitDbHelperFactory.__index = InitDbHelperFactory
InitDbHelperFactory.className = "InitDbHelperFactory"


function InitDbHelperFactory.new()
    local self = setmetatable({}, InitDbHelperFactory)
    return self
end


-- throws LicensingException
function InitDbHelperFactory.getInstance(abeClientInformation, databaseConnectionInfoInterface)
        local params = java_new_array(nil, 1)
        local classes = java_new_array(nil, 1)
        classes[1] = DatabaseConnectionInfoInterface
        params[1] = databaseConnectionInfoInterface
        local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, InitDbHelperFactory.CLASSNAME, classes, params)
        return anyType
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function InitDbHelperFactory.getInstance(abeClientInformation)
        local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, InitDbHelperFactory.CLASSNAME, nil, nil)
        return anyType
end

InitDbHelperFactory.CLASSNAME = "org.allbinary.business.installer.InitDbCrypted"

return InitDbHelperFactory

