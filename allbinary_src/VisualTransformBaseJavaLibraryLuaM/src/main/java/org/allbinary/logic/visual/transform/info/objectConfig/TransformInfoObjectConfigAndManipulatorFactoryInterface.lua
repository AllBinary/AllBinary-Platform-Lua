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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")

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
local TransformInfoObjectConfigAndManipulatorFactoryInterface = {}
TransformInfoObjectConfigAndManipulatorFactoryInterface.__index = TransformInfoObjectConfigAndManipulatorFactoryInterface
TransformInfoObjectConfigAndManipulatorFactoryInterface.className = "TransformInfoObjectConfigAndManipulatorFactoryInterface"


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactoryInterface:getInstance(abeClientInformation, transformInfoInterface, objectConfigFileAbPath)
    error("abstract method getInstance")
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactoryInterface:getInstance(abeClientInformation, transformInfoInterface)
    error("abstract method getInstance")
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfigAndManipulatorFactoryInterface:getInstance(abeClientInformation, transformInfoInterface, document)
    error("abstract method getInstance")
end

return TransformInfoObjectConfigAndManipulatorFactoryInterface

