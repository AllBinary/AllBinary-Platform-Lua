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
local WorkFlowData = require("org.allbinary.logic.control.workflow.WorkFlowData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local DeleteValidationView = {}
DeleteValidationView.__index = DeleteValidationView
DeleteValidationView.className = "DeleteValidationView"
setmetatable(DeleteValidationView, {__index = WorkFlowView})

function DeleteValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.workFlowName = nil
end


function DeleteValidationView.new(transformInfoInterface)
    local self = setmetatable(WorkFlowView.new(transformInfoInterface), DeleteValidationView)
    self:_init_fields()
        -- super(...) made self above
        self.workFlowName = self:getPageContext():getRequest():getParameter(WorkFlowData.getInstance().NAME)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Name: " .. self.workFlowName, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function DeleteValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if self.workFlowName == nil then
                return false
            end
            if WorkFlowEntityFactory.getInstance():create2():get(self.workFlowName, self:getWeblisketSession():getStoreName()) == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("WorkFlow does not exist.", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function DeleteValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.workFlowName == nil then
                stringBuffer:append("WorkFlow name is invalid<br />")
            end
            if WorkFlowEntityFactory.getInstance():create2():get(self.workFlowName, self:getWeblisketSession():getStoreName()) == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("WorkFlow does not exist.", self, "validationInfo()")
                end
                stringBuffer:append("WorkFlow does not exist<br />")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function DeleteValidationView:toValidationInfoDoc()
        return nil
end


function DeleteValidationView:toValidationInfoNode(document)
        return nil
end

return DeleteValidationView

