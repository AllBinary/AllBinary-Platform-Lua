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
-- package views.admin.storefront.statistics

local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local StoreFrontStatisticsComponent = require("views.admin.storefront.statistics.StoreFrontStatisticsComponent")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--extends StoreFrontComponent
local ValidationStoreFrontStatisticsView = {}
ValidationStoreFrontStatisticsView.__index = ValidationStoreFrontStatisticsView
ValidationStoreFrontStatisticsView.className = "ValidationStoreFrontStatisticsView"
setmetatable(ValidationStoreFrontStatisticsView, {__index = StoreFrontStatisticsComponent})

function ValidationStoreFrontStatisticsView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.newStoreFrontInterface = nil
end


function ValidationStoreFrontStatisticsView.new(transformInfoInterface)
    local self = setmetatable(StoreFrontStatisticsComponent.new(transformInfoInterface), ValidationStoreFrontStatisticsView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ValidationStoreFrontStatisticsView:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function ValidationStoreFrontStatisticsView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Never")
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


function ValidationStoreFrontStatisticsView:toValidationInfoDoc()
        return nil
end


function ValidationStoreFrontStatisticsView:toValidationInfoNode(document)
        return nil
end

return ValidationStoreFrontStatisticsView

