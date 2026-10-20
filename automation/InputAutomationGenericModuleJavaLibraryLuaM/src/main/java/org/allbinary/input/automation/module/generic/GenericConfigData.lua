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
-- package org.allbinary.input.automation.module.generic


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericConfigData = {}
GenericConfigData.__index = GenericConfigData
GenericConfigData.className = "GenericConfigData"


function GenericConfigData.new()
    local self = setmetatable({}, GenericConfigData)
    return self
end

GenericConfigData.RELATIVE_PATH = "./"
GenericConfigData.CONFIG_PATH = "modules/configs/"
GenericConfigData.MODULE_RELATIVE_PATH = tostring(GenericConfigData.RELATIVE_PATH + GenericConfigData.CONFIG_PATH) .. "allbinary/input/automation/module/"
GenericConfigData.GAME_MODULE_RELATIVE_PATH = tostring(GenericConfigData.MODULE_RELATIVE_PATH) .. "game/"
GenericConfigData.MMO_GAME_MODULE_RELATIVE_PATH = tostring(GenericConfigData.GAME_MODULE_RELATIVE_PATH) .. "mmog/"
GenericConfigData.FREE_MMO_GAME_MODULE_RELATIVE_PATH = "free/"

return GenericConfigData

