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
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HelperFactory = {}
HelperFactory.__index = HelperFactory
HelperFactory.className = "HelperFactory"

function HelperFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function HelperFactory.new()
    local self = setmetatable({}, HelperFactory)
    self:_init_fields()
    return self
end


-- throws LicensingException
function HelperFactory.getInstance(abeClientInformation, factoryName, className, hashMap, httpServletRequest)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            local params = java_new_array(nil, 2)
            local classes = java_new_array(nil, 2)
            local abeFactory = AbeFactory.getInstance()
            classes[1] = getmetatable(hashMap)
            classes[2] = abeFactory:getClass(abeClientInformation, "javax.servlet.http.HttpServletRequest")
            params[1] = hashMap
            params[2] = httpServletRequest
            local anyType = abeFactory:getInstance(abeClientInformation, className, classes, params)
            return anyType
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed To Get Instance Args: HashMap=" .. tostring(hashMap) .. " HttpServletRequest=" .. tostring(httpServletRequest)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                logUtil:put(error, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function HelperFactory.getInstance(abeClientInformation, factoryName, className, hashMap, pageContext)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            local params = java_new_array(nil, 2)
            local classes = java_new_array(nil, 2)
            local abeFactory = AbeFactory.getInstance()
            classes[1] = getmetatable(hashMap)
            classes[2] = abeFactory:getClass(abeClientInformation, "javax.servlet.jsp.PageContext")
            params[1] = hashMap
            params[2] = pageContext
            local anyType = abeFactory:getInstance(abeClientInformation, className, classes, params)
            return anyType
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local error = "Failed To Get Instance Args: HashMap=" .. tostring(hashMap) .. " PageContext=" .. tostring(pageContext)
                logUtil:put(error, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function HelperFactory.getInstance(abeClientInformation, factoryName, className, hashMap, specialhashMap, pageContext)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            local params = java_new_array(nil, 3)
            local classes = java_new_array(nil, 3)
            local abeFactory = AbeFactory.getInstance()
            classes[1] = getmetatable(hashMap)
            classes[2] = getmetatable(specialhashMap)
            classes[3] = abeFactory:getClass(abeClientInformation, "javax.servlet.jsp.PageContext")
            params[1] = hashMap
            params[2] = specialhashMap
            params[3] = pageContext
            local anyType = abeFactory:getInstance(abeClientInformation, className, classes, params)
            return anyType
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local error = "Failed To Get Instance Args: HashMap=" .. tostring(hashMap) .. " PageContext=" .. tostring(pageContext)
                logUtil:put(error, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function HelperFactory.getInstance(abeClientInformation, factoryName, className)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className)
            return anyType
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
end

return HelperFactory

