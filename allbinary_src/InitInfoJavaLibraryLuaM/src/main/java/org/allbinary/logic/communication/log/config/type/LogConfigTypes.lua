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
-- package org.allbinary.logic.communication.log.config.type

local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local LoggingInitInfo = require("org.allbinary.logic.communication.log.config.LoggingInitInfo")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Node = require("org.w3c.dom.Node")

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

local LogConfigTypes = {}
LogConfigTypes.__index = LogConfigTypes
LogConfigTypes.className = "LogConfigTypes"


function LogConfigTypes.new()
    local self = setmetatable({}, LogConfigTypes)
    return self
end


function LogConfigTypes.init()
        local try_ok, try_error = pcall(function()
            PreLogUtil.put("Initialize LogconfigTypes", "LogConfigTypes", "init()")
            LogConfigTypeFactory.getInstance()
            local loggingInitInfo = LoggingInitInfo.new()
            local logConfigTypeVector = loggingInitInfo:getTypeList()
            PreLogUtil.put("Number Of Log Configs: " .. tostring(loggingInitInfo:getNumberOfLogConfigs()), "LogConfigTypes", "init()")
            PreLogUtil.put("Number Of Log Config Type Names: " .. tostring(logConfigTypeVector:size()), "LogConfigTypes", "init()")
            LogConfigTypes.LOGGING:addAllList(logConfigTypeVector)
            LogConfigTypes.LOGGING:add(LogConfigTypeFactory.getInstance().NETBEANS_MODULE)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putSE("Unable to initialize LogConfigTypes", "LogConfigTypes", "init()", e)
        end
end


-- throws Exception
function LogConfigTypes.getInstance(node)
        local nameValueNode = DomSearchHelper.getNode(LogConfigTypeData.getInstance().NAME, node:getChildNodes())
        local name = DomNodeHelper.getTextNodeValue(nameValueNode)
        local descriptionValueNode = DomSearchHelper.getNodeNoThrow(LogConfigTypeData.getInstance().DESCRIPTION, node:getChildNodes())
        if descriptionValueNode ~= nil then
            local description = DomNodeHelper.getTextNodeValue(descriptionValueNode)
        end
        local availableLogConfigTypes = LogConfigType.availableLogConfigTypes
        local size = availableLogConfigTypes:size()
        local logConfigType = nil
        for index = 0, size - 1 do
            logConfigType = availableLogConfigTypes:get(index)
            if logConfigType:getName():compareTo(name) == 0 then
                return logConfigType
            end
        end
        error(java_exception("Exception", "No Such LogConfigType: " .. name), 0)
end

LogConfigTypes.JSP_ERROR_NO_FUNCTION = "in JSP Not In Function"
LogConfigTypes.LOGGING = BasicArrayListD.new()


do -- Java static initializer
        LogConfigTypes.init()
end

return LogConfigTypes

