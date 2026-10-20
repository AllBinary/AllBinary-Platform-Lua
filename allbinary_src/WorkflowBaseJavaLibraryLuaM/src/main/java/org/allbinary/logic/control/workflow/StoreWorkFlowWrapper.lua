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

-- local Method = require("java.lang.reflect.Method")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local WorkFlowWrapper = require("org.allbinary.logic.control.workflow.WorkFlowWrapper")

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

local StoreWorkFlowWrapper = {}
StoreWorkFlowWrapper.__index = StoreWorkFlowWrapper
StoreWorkFlowWrapper.className = "StoreWorkFlowWrapper"
setmetatable(StoreWorkFlowWrapper, {__index = WorkFlowWrapper})

function StoreWorkFlowWrapper:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StoreWorkFlowWrapper.new(anyType)
    local self = setmetatable(WorkFlowWrapper.new(anyType), StoreWorkFlowWrapper)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function StoreWorkFlowWrapper:getStoreName()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self:getWorkFlowObject())
            local method = helperClass:getMethod("getStoreName", nil)
            local result = method:invoke(self:getWorkFlowObject(), nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Reflection Exception"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getStoreName()", e)
            end
            error(java_exception("Exception", error), 0)
        end
end

return StoreWorkFlowWrapper

