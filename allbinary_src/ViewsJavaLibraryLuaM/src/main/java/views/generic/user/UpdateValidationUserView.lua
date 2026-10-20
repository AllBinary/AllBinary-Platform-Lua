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
-- package views.generic.user

local NewUserFactory = require("org.allbinary.business.user.NewUserFactory")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpdateValidationUserView = {}
UpdateValidationUserView.__index = UpdateValidationUserView
UpdateValidationUserView.className = "UpdateValidationUserView"
setmetatable(UpdateValidationUserView, {__index = HttpStoreComponentView})

function UpdateValidationUserView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.user = nil
end


function UpdateValidationUserView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), UpdateValidationUserView)
    self:_init_fields()
        -- super(...) made self above
        self.user = NewUserFactory.getInstance(transformInfoInterface)
    return self
end


function UpdateValidationUserView:isValid()
        local try_ok, try_error = pcall(function()
            if UserEntityFactory.getInstance():getUser(self.user:getUserName()) == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("User does not exist", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            if self.user:isValid() == false then
                return false
            end
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


function UpdateValidationUserView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if UserEntityFactory.getInstance():getUser(self.user:getUserName()) == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("User does not exist", self, "validationInfo()")
                end
                stringBuffer:append("Unable to update user that does not exist.<br />")
            end
            if self.user:isValid() == false then
                stringBuffer:append(self.user:validationInfo())
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


function UpdateValidationUserView:toValidationInfoDoc()
        return nil
end


function UpdateValidationUserView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function UpdateValidationUserView:view()
        return self.views.ValidationOnlyTempUtil:getInstance():view(self)
end

return UpdateValidationUserView

