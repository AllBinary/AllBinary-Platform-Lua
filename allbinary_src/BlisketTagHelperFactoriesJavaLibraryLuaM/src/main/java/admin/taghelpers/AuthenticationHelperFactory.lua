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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactory = require("admin.taghelpers.TagHelperFactory")

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
setmetatable(AuthenticationHelperFactory, {__index = TagHelperFactory})

function AuthenticationHelperFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AuthenticationHelperFactory.new()
    local self = setmetatable(TagHelperFactory.new(), AuthenticationHelperFactory)
    self:_init_fields()
    return self
end


-- throws LicensingException
function AuthenticationHelperFactory:getInstance(hashMap, pageContext)
        local try_ok, try_error = pcall(function()
            return AuthenticationHelper.new(hashMap, pageContext)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function AuthenticationHelperFactory:getInstance(hashMap, httpServletRequest)
        local try_ok, try_error = pcall(function()
            return AuthenticationHelper.new(hashMap, httpServletRequest)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

return AuthenticationHelperFactory

