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
-- package views.admin.storefront

local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local StoreFrontComponent = require("views.admin.storefront.StoreFrontComponent")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EditValidationStoreFrontView = {}
EditValidationStoreFrontView.__index = EditValidationStoreFrontView
EditValidationStoreFrontView.className = "EditValidationStoreFrontView"
setmetatable(EditValidationStoreFrontView, {__index = StoreFrontComponent})

function EditValidationStoreFrontView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function EditValidationStoreFrontView.new(transformInfoInterface)
    local self = setmetatable(StoreFrontComponent.new(transformInfoInterface), EditValidationStoreFrontView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function EditValidationStoreFrontView:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if self.newStoreFrontInterface:isNameValid() == false then
                valid = false
            end
            if StoreFrontFactory.getInstance(self.newStoreFrontInterface:getName()) == nil then
                valid = false
            end
            self.newStoreFrontInterface = StoreFrontFactory.getInstance(self.newStoreFrontInterface:getName())
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


function EditValidationStoreFrontView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.newStoreFrontInterface:isNameValid() == false then
                stringBuffer:append(self.newStoreFrontInterface:nameValidationInfo())
            end
            if StoreFrontFactory.getInstance(self.newStoreFrontInterface:getName()) == nil then
                stringBuffer:append(tostring(self.newStoreFrontInterface) .. " does not exist.<br>")
            end
            return "Unkown Error"
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function EditValidationStoreFrontView:toValidationInfoDoc()
        return nil
end


function EditValidationStoreFrontView:toValidationInfoNode(document)
        return nil
end

return EditValidationStoreFrontView

