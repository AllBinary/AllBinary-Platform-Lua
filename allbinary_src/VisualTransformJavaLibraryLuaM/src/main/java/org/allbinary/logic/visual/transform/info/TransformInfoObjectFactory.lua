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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
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

local TransformInfoObjectFactory = {}
TransformInfoObjectFactory.__index = TransformInfoObjectFactory
TransformInfoObjectFactory.className = "TransformInfoObjectFactory"

function TransformInfoObjectFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoObjectFactory.getInstance()
        return TransformInfoObjectFactory.instance
end


function TransformInfoObjectFactory.new()
    local self = setmetatable({}, TransformInfoObjectFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectFactory:getInstance(abeClientInformation, transformInfoInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:putF("Creating View: " .. transformInfoInterface:getName(), self, commonStrings.GET_INSTANCE)
            end
            local params = java_new_array(nil, 1)
            local classes = java_new_array(nil, 1)
            classes[1] = TransformInfoInterface
            params[1] = transformInfoInterface
            local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface:getObjectFile(), classes, params)
            if anyType == nil then
                if transformInfoInterface ~= nil then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("\nNo Such View Name: ")
                    stringBuffer:append(transformInfoInterface:getName())
                    stringBuffer:append("\nNo Such View Object: ")
                    stringBuffer:append(transformInfoInterface:getObjectFile())
                    error(java_exception("Exception", tostring(stringBuffer)), 0)
                else
                    error(java_exception("Exception", "No Such View Object since transformInfo is null"), 0)
                end
            end
            return anyType
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed To Get Instance: "
            if transformInfoInterface ~= nil then
                error = error .. transformInfoInterface:getName()
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(error, self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end

TransformInfoObjectFactory.instance = TransformInfoObjectFactory.new()

return TransformInfoObjectFactory

