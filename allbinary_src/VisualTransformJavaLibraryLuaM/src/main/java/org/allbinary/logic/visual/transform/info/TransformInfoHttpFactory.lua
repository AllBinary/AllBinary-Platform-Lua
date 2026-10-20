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
-- package org.allbinary.logic.visual.transform.info

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local TransformInfoHttpFactory = {}
TransformInfoHttpFactory.__index = TransformInfoHttpFactory
TransformInfoHttpFactory.className = "TransformInfoHttpFactory"


function TransformInfoHttpFactory.new()
    local self = setmetatable({}, TransformInfoHttpFactory)
    return self
end


-- throws Exception
function TransformInfoHttpFactory.getInstance(propertiesHashMap, pageContext)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            local weblisketSession = WeblisketSession.new(propertiesHashMap, pageContext)
            if not StringValidationUtil.getInstance():isEmpty(weblisketSession:getStoreName()) then
                local storeFrontInterface = StoreFrontFactory.getInstance(weblisketSession:getStoreName())
                if storeFrontInterface ~= nil then
                    return TransformInfoHttpStore.new(storeFrontInterface, propertiesHashMap, pageContext)
                else
                    error(java_exception("Exception", "No StoreFront with: " .. tostring(weblisketSession:getStoreName())), 0)
                end
            else
                return TransformInfoHttpContext.new(propertiesHashMap, pageContext)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, "TransformInfoFactory", commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end

return TransformInfoHttpFactory

