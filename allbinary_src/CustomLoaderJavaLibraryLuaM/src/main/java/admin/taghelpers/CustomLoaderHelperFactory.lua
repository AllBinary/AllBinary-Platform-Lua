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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomLoaderHelperFactory = {}
CustomLoaderHelperFactory.__index = CustomLoaderHelperFactory
CustomLoaderHelperFactory.className = "CustomLoaderHelperFactory"


function CustomLoaderHelperFactory.new()
    local self = setmetatable({}, CustomLoaderHelperFactory)
    return self
end


-- throws LicensingException
function CustomLoaderHelperFactory:getInstance(hashMap, pageContext)
        local abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
        return HelperFactory.getInstance(abeClientInformation, CustomLoaderHelperFactory.FACTORYNAME, CustomLoaderHelperFactory.CLASSNAME, hashMap, pageContext)
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function CustomLoaderHelperFactory:getInstance(abeClientInformation)
        return HelperFactory.getInstance(abeClientInformation, CustomLoaderHelperFactory.FACTORYNAME, CustomLoaderHelperFactory.CLASSNAME)
end

CustomLoaderHelperFactory.CLASSNAME = "admin.taghelpers.CustomLoaderHelper"
CustomLoaderHelperFactory.FACTORYNAME = "CustomLoaderHelperFactory"

return CustomLoaderHelperFactory

