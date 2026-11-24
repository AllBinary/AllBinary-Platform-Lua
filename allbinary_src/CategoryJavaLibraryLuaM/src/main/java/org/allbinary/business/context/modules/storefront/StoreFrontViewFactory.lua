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
-- package org.allbinary.business.context.modules.storefront

local StoreFrontViewFactory = {}
package.loaded["org.allbinary.business.context.modules.storefront.StoreFrontViewFactory"] = StoreFrontViewFactory

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

local StoreFrontsEntity = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity")
local StoreFrontsEntityFactory = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StoreFrontView = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontView")

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

-- class table StoreFrontViewFactory is declared before the requires
StoreFrontViewFactory.__index = StoreFrontViewFactory
StoreFrontViewFactory.className = "StoreFrontViewFactory"
StoreFrontViewFactory.javaClassName = "org.allbinary.business.context.modules.storefront.StoreFrontViewFactory"

function StoreFrontViewFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StoreFrontViewFactory._jinit(self)
    StoreFrontViewFactory._init_fields(self)
    return self
end

function StoreFrontViewFactory.new(...)
    local self = setmetatable({}, StoreFrontViewFactory)
    StoreFrontViewFactory._jinit(self, ...)
    return self
end


function StoreFrontViewFactory.getInstance(storeName)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local storeFronts = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            do return "__jreturn", StoreFrontView.new(storeFronts:getStoreFrontInterface(storeName)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                logUtil:put(commonStrings.EXCEPTION, "StoreFrontFactory", commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return StoreFrontViewFactory

