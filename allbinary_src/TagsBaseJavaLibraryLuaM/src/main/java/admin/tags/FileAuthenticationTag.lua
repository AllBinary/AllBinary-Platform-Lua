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

-- local Calendar = require("java.util.Calendar")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local InstallerInfo = require("org.allbinary.business.init.InstallerInfo")
local BasicUserRole = require("org.allbinary.business.user.role.BasicUserRole")
local BasicUserRoleFactory = require("org.allbinary.business.user.role.BasicUserRoleFactory")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local BasicWeblisketSession = require("org.allbinary.logic.communication.http.request.session.BasicWeblisketSession")
local WeblisketSessionData = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local BooleanUtil = require("org.allbinary.logic.java.bool.BooleanUtil")
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

local FileAuthenticationTag = {}
FileAuthenticationTag.__index = FileAuthenticationTag
FileAuthenticationTag.className = "FileAuthenticationTag"
setmetatable(FileAuthenticationTag, {__index = CustomTagSupport})

function FileAuthenticationTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.attemptsInteger = nil
    self.weblisketSession = nil
    self.request = nil
    self.command = nil
    self.userName = nil
    self.password = nil
    self.newPassword = nil
    self.authenticated = nil
    self.sessionUserName = nil
    self.role = nil
    self.timeout = nil
    self.roles = nil
end


function FileAuthenticationTag.new()
    local self = setmetatable(CustomTagSupport.new(), FileAuthenticationTag)
    self:_init_fields()
    return self
end


function FileAuthenticationTag:setCommand(command)
        self.command = command
end


function FileAuthenticationTag:setUserName(userName)
        self.userName = userName
end


function FileAuthenticationTag:setPassword(value)
        self.password = value
end


function FileAuthenticationTag:setNewPassword(value)
        self.newPassword = value
end


function FileAuthenticationTag:setRoles(values)
        self.roles = values
end


function FileAuthenticationTag:makeSessionValid(storedRole, userName)
        self.weblisketSession:setAuthenticated()
        self.weblisketSession:setRole(storedRole)
        self.weblisketSession:setUserName(userName)
        self.request:removeAttribute(WeblisketSessionData.REMOVABLEUSERNAME)
        self.request:removeAttribute(WeblisketSessionData.REMOVABLEPASSWORD)
end


function FileAuthenticationTag:getFormData()
        self.authenticated = self.weblisketSession:getAuthentication()
        self.sessionUserName = self.weblisketSession:getUserName()
        self.role = self.weblisketSession:getRole()
        self.attemptsInteger = self.weblisketSession:getAttempts()
        self.timeout = self.weblisketSession:getTimeout()
end


function FileAuthenticationTag:nextAttempt()
        if self.attemptsInteger ~= nil and math.tointeger(self.attemptsInteger // 1) > 0 then
            self.weblisketSession:setAttempts(math.tointeger(self.attemptsInteger // 1) + 1)
        else
            self.weblisketSession:setAttempts(1)
        end
end


-- throws LicensingException
function FileAuthenticationTag:changePassword()
        local try_ok, try_error = pcall(function()
            local userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
            local password = self.request:getParameter(WeblisketSessionData.REMOVABLEPASSWORD)
            local newPassword = self.request:getParameter(WeblisketSessionData.REMOVABLENEWPASSWORD)
            local newReenteredPassword = self.request:getParameter(WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD)
            if ((newPassword < newReenteredPassword and -1) or (newPassword > newReenteredPassword and 1) or 0) ~= 0 then
                return false
            end
            local installerInfo = InstallerInfo.new()
            if installerInfo:isValid(userName, password) then
                installerInfo:setPassword(newPassword)
                installerInfo:write()
                self.weblisketSession:setUserName(userName)
                self.weblisketSession:setPassword(newPassword)
                return true
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


function FileAuthenticationTag:invalidateSession()
        local try_ok, try_error = pcall(function()
            self.weblisketSession:clear()
            return math.tointeger(TagSupport.EVAL_BODY_INCLUDE // 1)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidateSession()", e)
            end
            return TagSupport.SKIP_BODY
        end
end


-- throws LicensingException
function FileAuthenticationTag:isSessionOld()
        local try_ok, try_error = pcall(function()
            if self.role ~= nil then
                local timeCreated = self.weblisketSession:getCreationTime()
                local sessionTimout = self.role:getSessionTimeout()
                local calendar = Calendar.getInstance()
                local timeFirst = calendar:getTimeInMillis() - sessionTimout
                if timeFirst > timeCreated then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Session Is Old - Timeout: ")
                        stringBuffer:appendlong(sessionTimout)
                        stringBuffer:append(" Eval: ")
                        stringBuffer:appendlong(timeFirst)
                        stringBuffer:append(" > ")
                        stringBuffer:appendlong(timeCreated)
                        self.logUtil:putF(tostring(stringBuffer), self, "isSessionOld()")
                    end
                    return true
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                    self.logUtil:putF("Role Is Not In Session", self, "isSessionOld()")
                end
            end
            return self:isRarelyUsedSession()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isSessionOld()", e)
            end
            return false
        end
end


function FileAuthenticationTag:isRarelyUsedSession()
        if self.role ~= nil then
            local timeCreated = self.weblisketSession:getCreationTime()
            local lastAccess = self.weblisketSession:getLastAccessedTime()
            local timePassed = self.role:getSessionInactivityTimeout()
            local calendar = Calendar.getInstance()
            local timeFirst = calendar:getTimeInMillis() - lastAccess
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Session Is Rarely Used - Timeout: ")
                stringBuffer:appendlong(lastAccess)
                stringBuffer:append(" Eval: ")
                stringBuffer:appendlong(timeFirst)
                stringBuffer:append(" > ")
                stringBuffer:appendlong(timePassed)
                self.logUtil:putF(tostring(stringBuffer), self, "isRarelyUsedSession()")
            end
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                self.logUtil:putF("Role Is Not In Session", self, "isRarelyUsedSession()")
            end
        end
        return false
end


-- throws LicensingException
function FileAuthenticationTag:isRoleValid()
        local try_ok, try_error = pcall(function()
            self:makeSessionValid(BasicUserRoleFactory.getInstance().INSTALLER, self.userName)
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isRoleValid()", e)
            end
            return false
        end
end


-- throws LicensingException
function FileAuthenticationTag:validRole()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Trying New login<p>")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set valid role"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validRole()", e)
            end
            return error
        end
end


-- throws LicensingException
function FileAuthenticationTag:invalidRole()
        local try_ok, try_error = pcall(function()
            self.weblisketSession:setAuthenticated(false)
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Sorry your username and password is invalid on this page.")
            stringBuffer:append("Trying New login<p>")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set role invalid"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidRole()", e)
            end
            return error
        end
end


-- throws LicensingException
function FileAuthenticationTag:isAuthenticationSessionValid()
        local try_ok, try_error = pcall(function()
            if BooleanUtil.getInstance():getFromString(self.authenticated) then
                local size = self.roles:size()
                for index = 0, size - 1 do
                    local mustBeOfRole = self.roles:get(index)
                    if self.sessionUserName ~= nil and self.role:equals(mustBeOfRole) then
                        return true
                    end
                end
                return false
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isAuthenticationSessionValid()", e)
            end
            return false
        end
end


-- throws LicensingException
function FileAuthenticationTag:processIfNewLogin()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:putF("Starting for User: " .. self.userName .. " Attempt: " .. tostring(self.weblisketSession:getAttempts()), self, "processIfNewLogin()")
            end
            if self.userName ~= nil and ((self.userName < StringUtil.getInstance().EMPTY_STRING and -1) or (self.userName > StringUtil.getInstance().EMPTY_STRING and 1) or 0) ~= 0 and self.password ~= nil and ((self.password < StringUtil.getInstance().EMPTY_STRING and -1) or (self.password > StringUtil.getInstance().EMPTY_STRING and 1) or 0) ~= 0 then
                local login = nil
                local installerInfo = InstallerInfo.new()
                if installerInfo:isValid(self.userName, self.password) then
                    login = org.allbinary.globals.GLOBALS2.LOGINSUCCESS
                else
                    login = org.allbinary.globals.GLOBALS2.LOGINFAILED
                end
                if ((login < org.allbinary.globals.GLOBALS2.LOGINSUCCESS and -1) or (login > org.allbinary.globals.GLOBALS2.LOGINSUCCESS and 1) or 0) == 0 then
                    self.weblisketSession:setAttempts(0)
                    return true
                end
                self:nextAttempt()
                return false
            end
            self:nextAttempt()
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processIfNewLogin()", e)
            end
            return false
        end
end


-- throws LicensingException
function FileAuthenticationTag:processInvalidation()
        local try_ok, try_error = pcall(function()
            if BooleanUtil.getInstance():getFromString(self.timeout) then
                self:invalidateSession()
                return true
            end
            do
                self.weblisketSession:setTimeout(BooleanFactory.getInstance().TRUE_STRING)
                return false
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isSetToInvalidate()", e)
            end
            return false
        end
end


-- throws JspTagException
function FileAuthenticationTag:doStartTag()
        local try_ok, try_error = pcall(function()
            local stringUtil = StringUtil.getInstance()
            self.request = self.pageContext:getRequest()
            self.weblisketSession = BasicWeblisketSession.new(self.pageContext)
            self:getFormData()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF("Started", self, self.tagStrings.DO_START_TAG)
            end
            if self.command ~= nil then
                if ((self.command < org.allbinary.globals.GLOBALS2.CHANGEPASSWORD and -1) or (self.command > org.allbinary.globals.GLOBALS2.CHANGEPASSWORD and 1) or 0) == 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                        self.logUtil:putF("Change Password", self, self.tagStrings.DO_START_TAG)
                    end
                    if not self:changePassword() then
                        self.pageContext:getOut():print("Password Change Attempt Failed.<p>")
                        return self.EVAL_BODY_INCLUDE
                    else
                        self.pageContext:getOut():print("Password Changed Successfully.<p>")
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
                        if self.userName ~= nil and ((self.userName < StringUtil.getInstance().EMPTY_STRING and -1) or (self.userName > StringUtil.getInstance().EMPTY_STRING and 1) or 0) ~= 0 and self.password ~= nil and ((self.password < StringUtil.getInstance().EMPTY_STRING and -1) or (self.password > StringUtil.getInstance().EMPTY_STRING and 1) or 0) ~= 0 then
                            self.pageContext:getOut():print("Sorry your username and/or password is invalid.<p>")
                        end
                    end
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Major authentication error - userName: ")
                        stringBuffer:append(self.userName)
                        stringBuffer:append(" Password: ")
                        stringBuffer:append(self.password)
                        stringBuffer:append(" Command: ")
                        stringBuffer:append(self.command)
                        self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
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

return FileAuthenticationTag

