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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local WorkFlowEntityFactory = require("org.allbinary.data.tables.workflow.WorkFlowEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local NewWorkFlowFactory = require("org.allbinary.logic.control.workflow.NewWorkFlowFactory")
local WorkFlowData = require("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local ModifyTable = require("admin.taghelpers.ModifyTable")

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

local WorkFlowRequestHelper = {}
WorkFlowRequestHelper.__index = WorkFlowRequestHelper
WorkFlowRequestHelper.className = "WorkFlowRequestHelper"
setmetatable(WorkFlowRequestHelper, {__index = ModifyTable})

function WorkFlowRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.workFlowInterface = nil
end


function WorkFlowRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), WorkFlowRequestHelper)
    self:_init_fields()
        self.workFlowInterface = NewWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, hashMap, pageContext)
    return self
end


-- throws Exception
function WorkFlowRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            local stringUtil = StringUtil.getInstance()
            WorkFlowEntityFactory.getInstance():create2():delete(self.workFlowInterface:getName(), stringUtil.EMPTY_STRING)
            local success = "Successfully Removed the workflow with " .. tostring(WorkFlowData.getInstance().NAME) .. "= " .. self.workFlowInterface:getName() .. " from "
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local try_ok, try_error = pcall(function()
                local error = "Failed to remove workflow with " .. tostring(WorkFlowData.getInstance().NAME) .. "= " .. self.workFlowInterface:getName() .. " from "
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
                end
                error(java_exception("Exception", e), 0)
            end)
            if not try_ok then
                local e2 = try_error
                local error = "Failed to get data from workflowinterface to set error string"
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e2)
                end
                return error
            end
        end
end


function WorkFlowRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "New User Successfully added to the Users Table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "add()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add User"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error
        end
end


function WorkFlowRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Updated WorkFlow Successfully"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update WorkFlow"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end

return WorkFlowRequestHelper

