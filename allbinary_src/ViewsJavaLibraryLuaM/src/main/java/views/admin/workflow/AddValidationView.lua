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
-- package views.admin.workflow

local WorkFlowEntityFactory = require("org.allbinary.data.tables.workflow.WorkFlowEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local NewWorkFlowFactory = require("org.allbinary.logic.control.workflow.NewWorkFlowFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local WorkFlowView = require("views.admin.workflow.WorkFlowView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AddValidationView = {}
AddValidationView.__index = AddValidationView
AddValidationView.className = "AddValidationView"
setmetatable(AddValidationView, {__index = WorkFlowView})

function AddValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
end


function AddValidationView.new(transformInfoInterface)
    local self = setmetatable(WorkFlowView.new(transformInfoInterface), AddValidationView)
    self:_init_fields()
        -- super(...) made self above
        self.workFlowInterface = NewWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, self:getPropertiesHashMap(), self:getPageContext())
    return self
end


function AddValidationView:isValid()
        local try_ok, try_error = pcall(function()
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function AddValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if WorkFlowEntityFactory.getInstance():create2():get(self.workFlowInterface:getName(), self:getTransformInfoInterface():getStoreName()) ~= nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Workflow already exist", self, "validationInfo()")
                end
                stringBuffer:append("The WorkFlow name you selected is already in use.<br/>  Please select another Name.<br />")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


function AddValidationView:toValidationInfoDoc()
        return nil
end


function AddValidationView:toValidationInfoNode(document)
        return nil
end

return AddValidationView

