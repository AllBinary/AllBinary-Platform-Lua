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
-- package workflows.template.data

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local WorkFlowData = require("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicWorkFlow = {}
BasicWorkFlow.__index = BasicWorkFlow
BasicWorkFlow.className = "BasicWorkFlow"

function BasicWorkFlow:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.validationDomNodeInterface = nil
    self.propertiesHashMap = nil
    self.pageContext = nil
end


function BasicWorkFlow.new(propertiesHashMap, pageContext)
    local self = setmetatable({}, BasicWorkFlow)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().WORKFLOW) then
            self.logUtil:putF("Properties: " .. tostring(propertiesHashMap), self, "BasicWorkFlow()")
        end
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.validationDomNodeInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, propertiesHashMap, pageContext)
    return self
end


-- throws Exception
function BasicWorkFlow:getName()
        return self:getPropertiesHashMap():get(WorkFlowData.getInstance().NAME)
end


function BasicWorkFlow:getPropertiesHashMap()
        return self.propertiesHashMap
end


function BasicWorkFlow:getPageContext()
        return self.pageContext
end


-- throws Exception
function BasicWorkFlow:process()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().WORKFLOW) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
        end
        if self.validationDomNodeInterface:isValid() then
            self.pageContext:getOut():print(self.validationDomNodeInterface:view())
            return tostring(TagSupport.EVAL_BODY_INCLUDE)
        else
            self.pageContext:getOut():print(self.validationDomNodeInterface:validationInfo())
            return tostring(TagSupport.SKIP_BODY)
        end
end

return BasicWorkFlow

