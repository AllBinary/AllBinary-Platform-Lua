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
-- package org.allbinary.input.automation.module.generic.configuration.profile

local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

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
local GenericProfileDataWorkerTypeInterface = {}
GenericProfileDataWorkerTypeInterface.__index = GenericProfileDataWorkerTypeInterface
GenericProfileDataWorkerTypeInterface.className = "GenericProfileDataWorkerTypeInterface"


function GenericProfileDataWorkerTypeInterface:getName()
    error("abstract method getName")
end


function GenericProfileDataWorkerTypeInterface:setName(name)
    error("abstract method setName")
end


function GenericProfileDataWorkerTypeInterface:toString()
    error("abstract method toString")
end
GenericProfileDataWorkerTypeInterface.__tostring = function(self) return self:toString() end


-- throws Exception
function GenericProfileDataWorkerTypeInterface:toXmlNode(document)
    error("abstract method toXmlNode")
end

return GenericProfileDataWorkerTypeInterface

