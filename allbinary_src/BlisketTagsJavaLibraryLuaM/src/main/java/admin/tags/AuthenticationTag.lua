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
-- package admin.tags

-- local Method = require("java.lang.reflect.Method")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local AuthenticationHelperFactory = require("admin.taghelpers.AuthenticationHelperFactory")
local AuthenticationRequestHelperFactory = require("admin.taghelpers.AuthenticationRequestHelperFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local WeblisketSessionData = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AuthenticationTag = {}
AuthenticationTag.__index = AuthenticationTag
AuthenticationTag.className = "AuthenticationTag"
setmetatable(AuthenticationTag, {__index = CustomTagSupport})

function AuthenticationTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.command = nil
    self.userName = nil
    self.password = nil
    self.newPassword = nil
    self.roles = nil
    self.propertiesHashMap = nil
end


function AuthenticationTag.new()
    local self = setmetatable(CustomTagSupport.new(), AuthenticationTag)
    self:_init_fields()
        local stringUtil = StringUtil.getInstance()
        self.userName = stringUtil.EMPTY_STRING
        self.password = stringUtil.EMPTY_STRING
    return self
end


function AuthenticationTag:setCommand(command)
        self.command = command
end


function AuthenticationTag:setUserName(userName)
        self.userName = userName
end


function AuthenticationTag:setPassword(value)
        self.password = value
end


function AuthenticationTag:setNewPassword(value)
        self.newPassword = value
end


function AuthenticationTag:setRoles(values)
        self.roles = values
end


-- throws LicensingException
function AuthenticationTag:changePassword()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("changePassword", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:newPassword()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("newPassword", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:invalidateSession()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("invalidateSession", nil)
            local resultInteger = method:invoke(anyType, nil)
            return math.tointeger(resultInteger // 1)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:isSessionOld()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("isSessionOld", nil)
            local resultBoolean = method:invoke(anyType, nil)
            return resultBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:isRoleValid()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.userName), getmetatable(self.password), getmetatable(self.roles)}
            local method = addressHelperClass:getMethod("isRoleValid", methodParams)
            local methodArgs = {self.userName, self.password, self.roles}
            local resultBoolean = method:invoke(anyType, methodArgs)
            return resultBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:validRole()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("validRole", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:invalidRole()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("invalidRole", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:isAuthenticationSessionValid()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.roles)}
            local method = addressHelperClass:getMethod("isAuthenticationSessionValid", methodParams)
            local methodArgs = {self.roles}
            local resultBoolean = method:invoke(anyType, methodArgs)
            return resultBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:processIfNewLogin()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local helperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.userName), getmetatable(self.password)}
            local method = helperClass:getMethod("processIfNewLogin", methodParams)
            local methodArgs = {self.userName, self.password}
            local resultBoolean = method:invoke(anyType, methodArgs)
            return resultBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function AuthenticationTag:processInvalidation()
        local try_ok, try_error = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("processInvalidation", nil)
            local resultBoolean = method:invoke(anyType, nil)
            return resultBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function AuthenticationTag:doStartTag()
        local try_ok, try_error = pcall(function()
            local stringUtil = StringUtil.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                local request = self.pageContext:getRequest()
                local stringBuffer = StringMaker.new()
                stringBuffer:append(" Request URI: ")
                stringBuffer:append(request:getRequestURI())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            if self.command ~= nil then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                if ((self.command < org.allbinary.globals.GLOBALS2.NEWPASSWORD and -1) or (self.command > org.allbinary.globals.GLOBALS2.NEWPASSWORD and 1) or 0) == 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                        self.logUtil:putF("New Password", self, self.tagStrings.DO_START_TAG)
                    end
                    if not self:newPassword() then
                        self.pageContext:getOut():print("New Password Request Failed.<p/>")
                        return self.EVAL_BODY_INCLUDE
                    else
                        self.pageContext:getOut():print("New Password Was Sent.<p/>")
                        return self.SKIP_BODY
                    end
                elseif ((self.command < org.allbinary.globals.GLOBALS2.CHANGEPASSWORD and -1) or (self.command > org.allbinary.globals.GLOBALS2.CHANGEPASSWORD and 1) or 0) == 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                        self.logUtil:putF("Change Password", self, self.tagStrings.DO_START_TAG)
                    end
                    if not self:changePassword() then
                        self.pageContext:getOut():print("Password Change Attempt Failed.<p/>")
                        return self.EVAL_BODY_INCLUDE
                    else
                        self.pageContext:getOut():print("Password Changed Successfully.<p/>")
                        return self.SKIP_BODY
                    end
                elseif ((self.command < WeblisketSessionData.INVALIDATESESSION and -1) or (self.command > WeblisketSessionData.INVALIDATESESSION and 1) or 0) == 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                        self.logUtil:putF("INVALIDATESESSION", self, self.tagStrings.DO_START_TAG)
                    end
                    return self:invalidateSession()
                else
                    if self:isSessionOld() then
                        if self:processInvalidation() then
                            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                                self.logUtil:putF("Processing Invalidation", self, self.tagStrings.DO_START_TAG)
                            end
                            self.pageContext:getOut():print("Please login again.<p>")
                            if ((self.command < org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0) == 0 then
                                return TagSupport.SKIP_BODY
                            else
                                return TagSupport.EVAL_BODY_INCLUDE
                            end
                        else
                            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                                self.logUtil:putF("Preparing session for invalidation", self, self.tagStrings.DO_START_TAG)
                            end
                            if ((self.command < org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0) == 0 then
                                return TagSupport.SKIP_BODY
                            else
                                return TagSupport.EVAL_BODY_INCLUDE
                            end
                        end
                    end
                    if (self.userName == nil or ((self.userName < stringUtil.EMPTY_STRING and -1) or (self.userName > stringUtil.EMPTY_STRING and 1) or 0) == 0) and (self.password == nil or ((self.password < stringUtil.EMPTY_STRING and -1) or (self.password > stringUtil.EMPTY_STRING and 1) or 0) == 0) and self.roles ~= nil and self:isAuthenticationSessionValid() then
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                            self.logUtil:putF("Authenticated session is valid", self, self.tagStrings.DO_START_TAG)
                        end
                        if ((self.command < org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0) == 0 then
                            return TagSupport.EVAL_BODY_INCLUDE
                        else
                            return TagSupport.SKIP_BODY
                        end
                    end
                    if self.userName ~= nil and self.password ~= nil and self:processIfNewLogin() then
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                            self.logUtil:putF("Processing new login.", self, self.tagStrings.DO_START_TAG)
                        end
                        if self:isRoleValid() then
                            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                                self.logUtil:putF("Role is valid - Processing new login", self, self.tagStrings.DO_START_TAG)
                            end
                            self.pageContext:getOut():print(self:validRole())
                            if ((self.command < org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0) == 0 then
                                return self.EVAL_BODY_INCLUDE
                            else
                                return self.SKIP_BODY
                            end
                        else
                            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                                self.logUtil:putF("Role is not valid - Processing new login", self, self.tagStrings.DO_START_TAG)
                            end
                            self.pageContext:getOut():print(self:invalidRole())
                            if ((self.command < org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0) == 0 then
                                return self.SKIP_BODY
                            else
                                return self.EVAL_BODY_INCLUDE
                            end
                        end
                    else
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                            self.logUtil:putF("Invalid Login", self, self.tagStrings.DO_START_TAG)
                        end
                        if self.userName ~= nil and ((self.userName < stringUtil.EMPTY_STRING and -1) or (self.userName > stringUtil.EMPTY_STRING and 1) or 0) ~= 0 and self.password ~= nil and ((self.password < stringUtil.EMPTY_STRING and -1) or (self.password > stringUtil.EMPTY_STRING and 1) or 0) ~= 0 then
                            self.pageContext:getOut():print("Sorry your username and/or password is invalid.<p/>")
                        end
                    end
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                        self.logUtil:putF(tostring(StringMaker.new():append("Major authentication error - userName: "):append(self.userName):append(" Password: "):append(self.password):append(" Command: "):append(self.command)), self, self.tagStrings.DO_START_TAG)
                    end
                    if ((self.command < org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0) == 0 then
                        return TagSupport.SKIP_BODY
                    else
                        return TagSupport.EVAL_BODY_INCLUDE
                    end
                end
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return AuthenticationTag

