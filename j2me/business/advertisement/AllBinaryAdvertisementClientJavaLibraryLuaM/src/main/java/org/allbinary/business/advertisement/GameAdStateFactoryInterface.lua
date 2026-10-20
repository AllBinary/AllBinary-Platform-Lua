-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local SoftwareInformation = require("org.allbinary.logic.system.SoftwareInformation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local GameAdStateFactoryInterface = {}
GameAdStateFactoryInterface.__index = GameAdStateFactoryInterface
GameAdStateFactoryInterface.className = "GameAdStateFactoryInterface"


-- throws Exception
function GameAdStateFactoryInterface:getInstanceForApp(softwareInformation)
    error("abstract method getInstanceForApp")
end

return GameAdStateFactoryInterface

