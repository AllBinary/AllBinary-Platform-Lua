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

local UserName = require("org.allbinary.business.user.username.UserName")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local UserView = require("views.generic.user.UserView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EditValidationView = {}
EditValidationView.__index = EditValidationView
EditValidationView.className = "EditValidationView"
setmetatable(EditValidationView, {__index = UserView})

function EditValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function EditValidationView.new(transformInfoInterface)
    local self = setmetatable(UserView.new(transformInfoInterface), EditValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function EditValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if UserName.getInstance():isValid(self:getWeblisketSession():getUserName()) == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Failed to validate username", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            self.user = UserEntityFactory.getInstance():getUser(self:getWeblisketSession():getUserName())
            if self.user == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("User does not exist", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            if self.user:isValid() == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("User exists but is invalid - Probably manually modified", self, self.commonStrings.IS_VALID)
                end
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


function EditValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if UserName.getInstance():isValid(self:getWeblisketSession():getUserName()) == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Failed to validate username", self, "validationInfo()")
                end
                stringBuffer:append("Session User Name is not valid - Your session data has been logged!")
            end
            if self.user == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("User does not exist", self, self.commonStrings.IS_VALID)
                end
                stringBuffer:append("User profile does not exist - Your session data has been logged!")
            end
            if self.user:isValid() == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("User exists but is invalid - Probably manually modified", self, self.commonStrings.IS_VALID)
                end
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


function EditValidationView:toValidationInfoDoc()
        return nil
end


function EditValidationView:toValidationInfoNode(document)
        return nil
end

return EditValidationView

