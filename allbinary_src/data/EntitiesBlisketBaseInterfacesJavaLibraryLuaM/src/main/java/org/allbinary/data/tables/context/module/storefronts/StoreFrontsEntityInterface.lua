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
-- package org.allbinary.data.tables.context.module.storefronts

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

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
local StoreFrontsEntityInterface = {}
StoreFrontsEntityInterface.__index = StoreFrontsEntityInterface
StoreFrontsEntityInterface.className = "StoreFrontsEntityInterface"
setmetatable(StoreFrontsEntityInterface, {__index = BasicDataTableInterface})


-- throws Exception
function StoreFrontsEntityInterface:getStoreFrontInterface(name)
    error("abstract method getStoreFrontInterface")
end


function StoreFrontsEntityInterface:getStoreFrontNames()
    error("abstract method getStoreFrontNames")
end


function StoreFrontsEntityInterface:delete(value)
    error("abstract method delete")
end


function StoreFrontsEntityInterface:insert(values)
    error("abstract method insert")
end


function StoreFrontsEntityInterface:update(updatedValues)
    error("abstract method update")
end

return StoreFrontsEntityInterface

