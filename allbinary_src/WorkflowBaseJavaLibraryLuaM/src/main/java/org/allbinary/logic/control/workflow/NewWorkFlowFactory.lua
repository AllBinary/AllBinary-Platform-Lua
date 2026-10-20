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
-- package org.allbinary.logic.control.workflow

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
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

local NewWorkFlowFactory = {}
NewWorkFlowFactory.__index = NewWorkFlowFactory
NewWorkFlowFactory.className = "NewWorkFlowFactory"

function NewWorkFlowFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NewWorkFlowFactory.getInstance()
        return NewWorkFlowFactory.instance
end


function NewWorkFlowFactory.new()
    local self = setmetatable({}, NewWorkFlowFactory)
    self:_init_fields()
    return self
end


-- throws Exception, LicensingException
-- Java overloaded method: Lua keeps the last definition
function NewWorkFlowFactory:getInstance(abeClientInformation, hashMap, pageContext)
        local try_ok, try_error = pcall(function()
            local className = hashMap:get(DynamicObjectData.NAME)
            local params = java_new_array(nil, 2)
            local classes = java_new_array(nil, 2)
            classes[1] = getmetatable(hashMap)
            classes[2] = AbeFactory.getInstance():getClass(abeClientInformation, "javax.servlet.jsp.PageContext")
            params[1] = hashMap
            params[2] = pageContext
            local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className, classes, params)
            return WorkFlowWrapper.new(anyType)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getInstance(HashMap)", e)
            end
            error(e, 0)
        end
end


-- throws Exception, LicensingException
-- Java overloaded method: Lua keeps the last definition
function NewWorkFlowFactory:getInstance(abeClientInformation, className)
        local try_ok, try_error = pcall(function()
            local stringUtil = StringUtil.getInstance()
            if className ~= nil and ((className < stringUtil.EMPTY_STRING and -1) or (className > stringUtil.EMPTY_STRING and 1) or 0) ~= 0 then
                local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className, nil, nil)
                return WorkFlowWrapper.new(anyType)
            else
                error(java_exception("Exception", "No WorkFlow ClassName"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end

NewWorkFlowFactory.instance = NewWorkFlowFactory.new()

return NewWorkFlowFactory

