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
-- package views.admin.user

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local UserName = require("org.allbinary.business.user.username.UserName")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local UserView = require("views.admin.user.UserView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DeleteValidationUserView = {}
DeleteValidationUserView.__index = DeleteValidationUserView
DeleteValidationUserView.className = "DeleteValidationUserView"
setmetatable(DeleteValidationUserView, {__index = UserView})

function DeleteValidationUserView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userName = nil
end


function DeleteValidationUserView.new(transformInfoInterface)
    local self = setmetatable(UserView.new(transformInfoInterface), DeleteValidationUserView)
    self:_init_fields()
        -- super(...) made self above
        local httpServletRequest = self:getPageContext():getRequest()
        local hashMap = RequestParams.new(httpServletRequest):toHashMap()
        self.userName = UserName.new(hashMap):get()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("User Name: " .. self.userName, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function DeleteValidationUserView:isValid()
        local try_ok, try_error = pcall(function()
            if UserName.getInstance():isValid(self.userName) == true then
                self.user = UserEntityFactory.getInstance():getUser(self.userName)
                if self.user == nil then
                    return false
                end
            else
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


function DeleteValidationUserView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if UserName.getInstance():isValid(self.userName) == true then
                self.user = UserEntityFactory.getInstance():getUser(self.userName)
                if self.user == nil then
                    stringBuffer:append("User does not exist.<br />")
                end
            else
                stringBuffer:append("User Name is not valid.<br />")
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


function DeleteValidationUserView:toValidationInfoDoc()
        return nil
end


function DeleteValidationUserView:toValidationInfoNode(document)
        return nil
end

return DeleteValidationUserView

