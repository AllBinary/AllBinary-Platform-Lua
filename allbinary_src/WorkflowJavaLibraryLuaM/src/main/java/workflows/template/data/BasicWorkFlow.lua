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

local BasicWorkFlow = {}
package.loaded["workflows.template.data.BasicWorkFlow"] = BasicWorkFlow

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

local HashMap = java_lazy("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local WorkFlowData = java_lazy("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = java_lazy("org.allbinary.logic.control.workflow.WorkFlowInterface")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformFactory = java_lazy("org.allbinary.logic.visual.transform.TransformFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table BasicWorkFlow is declared before the requires
BasicWorkFlow.__index = BasicWorkFlow
BasicWorkFlow.className = "BasicWorkFlow"
BasicWorkFlow.javaClassName = "workflows.template.data.BasicWorkFlow"
BasicWorkFlow.java_implements = " WorkFlowInterface "
BasicWorkFlow.java_interfaces = function() return {WorkFlowInterface} end

function BasicWorkFlow:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.validationDomNodeInterface == nil then self.validationDomNodeInterface = nil end
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
    if self.pageContext == nil then self.pageContext = nil end
end


function BasicWorkFlow._jinit(self, propertiesHashMap, pageContext)
    BasicWorkFlow._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().WORKFLOW) then
            self.logUtil:putF(require("allbinary_java").to_string("Properties: ") .. require("allbinary_java").to_string(tostring(propertiesHashMap)), self, "BasicWorkFlow()")
        end
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.validationDomNodeInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, propertiesHashMap, pageContext)
    return self
end

function BasicWorkFlow.new(...)
    local self = setmetatable({}, BasicWorkFlow)
    BasicWorkFlow._jinit(self, ...)
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().WORKFLOW) then
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

