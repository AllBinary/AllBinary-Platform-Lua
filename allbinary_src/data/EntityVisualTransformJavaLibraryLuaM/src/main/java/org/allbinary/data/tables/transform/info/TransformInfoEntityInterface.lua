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
-- package org.allbinary.data.tables.transform.info

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

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
local TransformInfoEntityInterface = {}
TransformInfoEntityInterface.__index = TransformInfoEntityInterface
TransformInfoEntityInterface.className = "TransformInfoEntityInterface"
setmetatable(TransformInfoEntityInterface, {__index = BasicDataTableInterface})


-- throws Exception
function TransformInfoEntityInterface:get(name, propertiesHashMap, pageContext)
    error("abstract method get")
end


-- throws Exception
function TransformInfoEntityInterface:getObjectConfigs(storeName)
    error("abstract method getObjectConfigs")
end


-- throws Exception
function TransformInfoEntityInterface:getNames(storeName)
    error("abstract method getNames")
end


function TransformInfoEntityInterface:delete(name)
    error("abstract method delete")
end


function TransformInfoEntityInterface:insert(values)
    error("abstract method insert")
end


function TransformInfoEntityInterface:update(updatedValues)
    error("abstract method update")
end

return TransformInfoEntityInterface

