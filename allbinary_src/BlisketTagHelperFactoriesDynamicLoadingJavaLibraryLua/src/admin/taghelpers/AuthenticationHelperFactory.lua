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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
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

local AuthenticationHelperFactory = {}
AuthenticationHelperFactory.__index = AuthenticationHelperFactory
AuthenticationHelperFactory.className = "AuthenticationHelperFactory"


function AuthenticationHelperFactory.new()
    local self = setmetatable({}, AuthenticationHelperFactory)
    return self
end


-- throws LicensingException
function AuthenticationHelperFactory:getInstance(hashMap, pageContext)
        return HelperFactory.getInstance(AuthenticationHelperFactory.FACTORYNAME, AuthenticationHelperFactory.CLASSNAME, hashMap, pageContext)
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function AuthenticationHelperFactory:getInstance(hashMap, httpServletRequest)
        return HelperFactory.getInstance(AuthenticationHelperFactory.FACTORYNAME, AuthenticationHelperFactory.CLASSNAME, hashMap, httpServletRequest)
end

AuthenticationHelperFactory.CLASSNAME = "admin.taghelpers.AuthenticationHelper"
AuthenticationHelperFactory.FACTORYNAME = "AuthenticationHelperFactory"

return AuthenticationHelperFactory

