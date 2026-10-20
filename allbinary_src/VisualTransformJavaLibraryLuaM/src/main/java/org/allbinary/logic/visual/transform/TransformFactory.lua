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
-- package org.allbinary.logic.visual.transform

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local TransformInfoEntity = require("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoHttpFactory = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectFactory = require("org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory")
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

local TransformFactory = {}
TransformFactory.__index = TransformFactory
TransformFactory.className = "TransformFactory"

function TransformFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function TransformFactory.getInstance()
        return TransformFactory.instance
end


function TransformFactory.new()
    local self = setmetatable({}, TransformFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformFactory:getInstance(abeClientInformation, viewName, ownerTransformInfoInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Creating Transform: " .. viewName, self, self.commonStrings.GET_INSTANCE)
            end
            local ownerTransformInfoHttpInterface = ownerTransformInfoInterface
            local transformInfoEntity = TransformInfoEntityBuilder.getInstance()
            local transformInfoInterface = transformInfoEntity:get(viewName, ownerTransformInfoHttpInterface:getPropertiesHashMap(), ownerTransformInfoHttpInterface:getPageContext())
            if transformInfoInterface == nil then
                error(java_exception("Exception", "No Such View In DB: " .. viewName), 0)
            end
            transformInfoInterface:setChild()
            local anyType = TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Created Transform: " .. viewName, self, self.commonStrings.GET_INSTANCE)
            end
            return anyType
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformFactory:getInstance(abeClientInformation, propertiesHashMap, pageContext)
        local try_ok, try_error = pcall(function()
            local transformInfoData = TransformInfoData.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Creating Transform: " .. tostring(propertiesHashMap:get(transformInfoData.NAME)), self, self.commonStrings.GET_INSTANCE)
            end
            local transformInfoEntity = TransformInfoEntityBuilder.getInstance()
            local transformInfoInterface = transformInfoEntity:get(propertiesHashMap:get(transformInfoData.NAME), propertiesHashMap, pageContext)
            if transformInfoInterface ~= nil then
                transformInfoInterface:override(propertiesHashMap)
            else
                transformInfoInterface = TransformInfoHttpFactory.getInstance(propertiesHashMap, pageContext)
            end
            local anyType = TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Created Transform: " .. tostring(propertiesHashMap:get(transformInfoData.NAME)), self, self.commonStrings.GET_INSTANCE)
            end
            return anyType
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Failed To Get Instance: ")
                stringBuffer:append(propertiesHashMap:get(TransformInfoData.getInstance().NAME))
                stringBuffer:append("->TransformFactory")
                self.logUtil:put(tostring(stringBuffer), self, self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformFactory:getInstance(abeClientInformation, transformInfoInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Creating Transform: " .. transformInfoInterface:getName(), self, "getInstance(TransformInfoInterface)")
            end
            local anyType = TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Created Transform: " .. transformInfoInterface:getName(), self, "getInstance(TransformInfoInterface)")
            end
            return anyType
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(TransformInfoInterface)", e)
            end
            error(e, 0)
        end
end

TransformFactory.instance = TransformFactory.new()

return TransformFactory

