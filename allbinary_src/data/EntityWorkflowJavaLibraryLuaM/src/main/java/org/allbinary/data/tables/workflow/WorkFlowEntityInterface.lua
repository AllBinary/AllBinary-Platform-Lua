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
-- package org.allbinary.data.tables.workflow

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")
local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")

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
local WorkFlowEntityInterface = {}
WorkFlowEntityInterface.__index = WorkFlowEntityInterface
WorkFlowEntityInterface.className = "WorkFlowEntityInterface"
setmetatable(WorkFlowEntityInterface, {__index = BasicDataTableInterface})


function WorkFlowEntityInterface:get(storeName)
    error("abstract method get")
end


-- throws Exception, LicensingException
-- Java overloaded method: Lua keeps the last definition
function WorkFlowEntityInterface:get(name, storeName)
    error("abstract method get")
end


function WorkFlowEntityInterface:delete(name, storeName)
    error("abstract method delete")
end


function WorkFlowEntityInterface:insert(values)
    error("abstract method insert")
end


function WorkFlowEntityInterface:update(updatedValues)
    error("abstract method update")
end

return WorkFlowEntityInterface

