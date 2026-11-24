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
-- package org.allbinary.data.tables.advertisement.sales

local AffiliateSalesEntityFactory = {}
package.loaded["org.allbinary.data.tables.advertisement.sales.AffiliateSalesEntityFactory"] = AffiliateSalesEntityFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AffiliateSalesEntity = java_lazy("org.allbinary.data.tables.advertisement.sales.AffiliateSalesEntity")
local AffiliateSalesEntityInterface = java_lazy("org.allbinary.data.tables.advertisement.sales.AffiliateSalesEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AffiliateSalesEntityFactory is declared before the requires
AffiliateSalesEntityFactory.__index = AffiliateSalesEntityFactory
AffiliateSalesEntityFactory.className = "AffiliateSalesEntityFactory"
AffiliateSalesEntityFactory.javaClassName = "org.allbinary.data.tables.advertisement.sales.AffiliateSalesEntityFactory"


function AffiliateSalesEntityFactory._jinit(self)
    return self
end

function AffiliateSalesEntityFactory.new(...)
    local self = setmetatable({}, AffiliateSalesEntityFactory)
    AffiliateSalesEntityFactory._jinit(self, ...)
    return self
end


function AffiliateSalesEntityFactory.getInstance()
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", AffiliateSalesEntity.new() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, "AffiliateEntityFactory", commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AffiliateSalesEntityFactory.CLASSNAME = "org.allbinary.data.tables.AffiliatesSalesEntity"

return AffiliateSalesEntityFactory

