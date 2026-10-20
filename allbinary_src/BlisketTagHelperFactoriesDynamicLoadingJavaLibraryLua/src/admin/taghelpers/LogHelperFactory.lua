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
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
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

local LogHelperFactory = {}
LogHelperFactory.__index = LogHelperFactory
LogHelperFactory.className = "LogHelperFactory"


function LogHelperFactory.new()
    local self = setmetatable({}, LogHelperFactory)
    return self
end


-- throws LicensingException
function LogHelperFactory:getInstance(hashMap, pageContext)
        return HelperFactory.getInstance(LogHelperFactory.FACTORYNAME, LogHelperFactory.CLASSNAME, hashMap, pageContext)
end

LogHelperFactory.CLASSNAME = "admin.taghelpers.LogHelper"
LogHelperFactory.FACTORYNAME = "LogelperFactory"

return LogHelperFactory

