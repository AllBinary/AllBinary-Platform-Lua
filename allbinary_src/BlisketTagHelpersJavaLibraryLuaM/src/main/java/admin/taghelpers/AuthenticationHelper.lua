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
-- package admin.taghelpers

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local BasicUserRole = require("org.allbinary.business.user.role.BasicUserRole")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleFactory = require("org.allbinary.business.user.role.UserRoleFactory")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local UserEntityInterface = require("org.allbinary.data.tables.user.UserEntityInterface")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local BooleanUtil = require("org.allbinary.logic.java.bool.BooleanUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AuthenticationHelper = {}
AuthenticationHelper.__index = AuthenticationHelper
AuthenticationHelper.className = "AuthenticationHelper"
setmetatable(AuthenticationHelper, {__index = TagHelper})

function AuthenticationHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.authenticated = nil
    self.sessionUserName = nil
    self.role = nil
    self.timeout = nil
    self.attemptsInteger = nil
end

function AuthenticationHelper.new(...)
    local count = select("#", ...)
    if count == 2 then return AuthenticationHelper._new2(...)
    elseif count == 2 then return AuthenticationHelper._new2(...)
    end
end


function AuthenticationHelper._new2(hashMap, pageContext)
    local self = AuthenticationHelper._new2(hashMap, pageContext:getRequest())
        -- this(...) made self above
    return self
end


function AuthenticationHelper._new2(hashMap, httpServletRequest)
    local self = setmetatable(TagHelper.new(), AuthenticationHelper)
    self:_init_fields()
        self.weblisketSession = WeblisketSession.new(hashMap, httpServletRequest)
        self:getFormData()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
            self.logUtil:putF(self:outputSessionInfo(), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function AuthenticationHelper:getFormData()
        self.authenticated = self.weblisketSession:getAuthentication()
        self.sessionUserName = self.weblisketSession:getUserName()
        self.role = self.weblisketSession:getRole()
        self.attemptsInteger = self.weblisketSession:getAttempts()
        self.timeout = self.weblisketSession:getTimeout()
end


-- throws Exception
function AuthenticationHelper:invalidateSession()
        local try_ok, try_error = pcall(function()
            self.weblisketSession:clear()
            return TagSupport.EVAL_BODY_INCLUDE
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidateSession()", e)
            end
            return nil
        end
end


function AuthenticationHelper:isSessionOld()
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
end


function AuthenticationHelper:isRarelyUsedSession()
        if self.role ~= nil then
            local timeCreated = self.weblisketSession:getCreationTime()
            local lastAccess = self.weblisketSession:getLastAccessedTime()
            local inactivityAllowed = self.role:getSessionInactivityTimeout()
            local calendar = Calendar.getInstance()
            local timeFirst = calendar:getTimeInMillis() - lastAccess
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Session Is Rarely Used - Timeout: ")
                stringBuffer:appendlong(lastAccess)
                stringBuffer:append(" Eval: ")
                stringBuffer:appendlong(timeFirst)
                stringBuffer:append(" > ")
                stringBuffer:appendlong(inactivityAllowed)
                self.logUtil:putF(tostring(stringBuffer), self, "isRarelyUsedSession()")
            end
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                self.logUtil:putF("Role Is Not In Session", self, "isRarelyUsedSession()")
            end
        end
        return false
end


function AuthenticationHelper:validRole()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Trying New login<p/>")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set valid role"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validRole()", e)
            end
            return error
        end
end


function AuthenticationHelper:invalidRole()
        local try_ok, try_error = pcall(function()
            self.weblisketSession:setAuthenticated(false)
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Sorry your username and password is invalid on this page. ")
            stringBuffer:append("Trying New login<p/>")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set role invalid"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidRole()", e)
            end
            return error
        end
end


-- throws Exception
function AuthenticationHelper:isAuthenticated()
        if BooleanUtil.getInstance():getFromString(self.authenticated) then
            return true
        else
            return false
        end
end


function AuthenticationHelper:isAuthenticationSessionValid(roles)
        local try_ok, try_error = pcall(function()
            if self.role ~= nil then
                if self:isAuthenticated() then
                    if self.sessionUserName ~= nil then
                        local basicUserRole = self.role:getBasicUserRole()
                        local basicUserRoleArray = roles:toArray()
                        local size = (basicUserRoleArray.n or #basicUserRoleArray)
                        for index = 0, size - 1 do
                            local mustBeOfRole = basicUserRoleArray[index + 1]
                            if basicUserRole:equals(mustBeOfRole) then
                                if basicUserRole:equals(UserRoleFactory.getInstance().CUSTOMER) then
                                    local userEntityInterface = UserEntityFactory.getInstance()
                                    local userInterface = userEntityInterface:getUser(self.sessionUserName)
                                    if not userInterface:isSessionValid() then
                                        return false
                                    end
                                end
                                return true
                            end
                        end
                    end
                    return false
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATION) then
                    self.logUtil:putF("Role Is Not In Session", self, "isAuthenticationSessionValid()")
                end
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isAuthenticatedSessionValid()", e)
            end
            return false
        end
end


function AuthenticationHelper:nextAttempt()
        if self.attemptsInteger ~= nil and math.tointeger(self.attemptsInteger // 1) > 0 then
            self.weblisketSession:setAttempts(math.tointeger(self.attemptsInteger // 1) + 1)
        else
            self.weblisketSession:setAttempts(1)
        end
end


function AuthenticationHelper:processIfNewLogin(userName, password)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:putF("Starting: " .. userName, self, "processIfNewLogin()")
            end
            if userName ~= nil and ((userName < StringUtil.getInstance().EMPTY_STRING and -1) or (userName > StringUtil.getInstance().EMPTY_STRING and 1) or 0) ~= 0 and password ~= nil and ((password < StringUtil.getInstance().EMPTY_STRING and -1) or (password > StringUtil.getInstance().EMPTY_STRING and 1) or 0) ~= 0 then
                local login = nil
                local userEntityInterface = UserEntityFactory.getInstance()
                login = userEntityInterface:login(userName, password)
                if ((login < self.GLOBALS2.LOGINSUCCESS and -1) or (login > self.GLOBALS2.LOGINSUCCESS and 1) or 0) == 0 then
                    local userInterface = userEntityInterface:getUser(userName)
                    if userInterface:isSessionValid() then
                        self.weblisketSession:setAttempts(0)
                        return true
                    end
                end
                self:nextAttempt()
                return false
            end
            self:nextAttempt()
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processIfNewLogin()", e)
            end
            return false
        end
end


function AuthenticationHelper:processInvalidation()
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
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processInvalidation()", e)
            end
            return false
        end
end


function AuthenticationHelper:outputSessionInfo()
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local timeCreated = self.weblisketSession:getCreationTime()
            local stringBuffer = StringMaker.new()
            local lastAccess = self.weblisketSession:getLastAccessedTime()
            stringBuffer:append("Time Since Last Access: " .. tostring((calendar:getTimeInMillis() - lastAccess)) .. "<br/>\n")
            if self.role ~= nil then
                stringBuffer:append("Auth: ")
                stringBuffer:append(self.authenticated)
                stringBuffer:append(" UserName: ")
                stringBuffer:append(self.sessionUserName)
                stringBuffer:append(" Role: ")
                stringBuffer:append(tostring(self.role))
                stringBuffer:append("<br/>\n")
                stringBuffer:append("Time Left: ")
                stringBuffer:appendlong(java_int((self.role:getSessionTimeout() - (calendar:getTimeInMillis() - timeCreated))))
                stringBuffer:append("<br/>\n")
                stringBuffer:append("Inactivity Time Allowed: ")
                stringBuffer:appendlong(java_int(self.role:getSessionTimeout()))
                stringBuffer:append("<br/>\n")
                stringBuffer:append("Inactivity Time Allowed: ")
                stringBuffer:appendlong(java_int(self.role:getSessionInactivityTimeout()))
                stringBuffer:append("<br/>\n")
            else
                stringBuffer:append("Role Is Not Set<br/>\n")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            return "Error"
        end
end


function AuthenticationHelper:getRole()
        return self.role
end

return AuthenticationHelper

