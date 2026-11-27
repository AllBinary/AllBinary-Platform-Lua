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

local LogConfigTypes = {}
package.loaded["org.allbinary.logic.communication.log.config.type.LogConfigTypes"] = LogConfigTypes

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

local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local LoggingInitInfo = java_lazy("org.allbinary.logic.communication.log.config.LoggingInitInfo")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigType = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigType")
local LogConfigTypeData = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeData")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LogConfigTypes is declared before the requires
LogConfigTypes.__index = LogConfigTypes
LogConfigTypes.className = "LogConfigTypes"
LogConfigTypes.javaClassName = "org.allbinary.logic.communication.log.config.type.LogConfigTypes"


function LogConfigTypes._jinit(self)
    return self
end

function LogConfigTypes.new(...)
    local self = setmetatable({}, LogConfigTypes)
    LogConfigTypes._jinit(self, ...)
    return self
end


function LogConfigTypes.init()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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
        error(require("java.lang.Exception").new("No Such LogConfigType: " .. name), 0)
end

LogConfigTypes.JSP_ERROR_NO_FUNCTION = "in JSP Not In Function"
LogConfigTypes.LOGGING = BasicArrayListD.new()


do -- Java static initializer
        LogConfigTypes.init()
end

return LogConfigTypes

