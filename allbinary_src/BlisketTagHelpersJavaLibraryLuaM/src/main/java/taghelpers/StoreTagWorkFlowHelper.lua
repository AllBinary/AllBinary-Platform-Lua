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
-- package taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local TagHelper = require("admin.taghelpers.TagHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StoreTagWorkFlowFactory = require("org.allbinary.logic.control.workflow.StoreTagWorkFlowFactory")
local StoreWorkFlowInterface = require("org.allbinary.logic.control.workflow.StoreWorkFlowInterface")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreTagWorkFlowHelper = {}
StoreTagWorkFlowHelper.__index = StoreTagWorkFlowHelper
StoreTagWorkFlowHelper.className = "StoreTagWorkFlowHelper"
setmetatable(StoreTagWorkFlowHelper, {__index = TagHelper})

function StoreTagWorkFlowHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.storeWorkFlowInterface = nil
end


function StoreTagWorkFlowHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), StoreTagWorkFlowHelper)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
            self.logUtil:putF("Properties: " .. tostring(hashMap), self, "StoreTagWorkFlowHelper()")
        end
        self.storeWorkFlowInterface = StoreTagWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, hashMap, pageContext)
    return self
end


-- throws Exception
function StoreTagWorkFlowHelper:process()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF("Process", self, self.commonStrings.PROCESS)
            end
            return self.storeWorkFlowInterface:process()
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to process workflow: "
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return StoreTagWorkFlowHelper

