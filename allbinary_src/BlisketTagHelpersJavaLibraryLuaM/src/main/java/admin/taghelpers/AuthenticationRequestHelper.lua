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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local UserData = require("org.allbinary.business.user.UserData")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local Password = require("org.allbinary.business.user.password.Password")
local BasicUserRole = require("org.allbinary.business.user.role.BasicUserRole")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local UserEntityInterface = require("org.allbinary.data.tables.user.UserEntityInterface")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionData = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local NewPasswordEmail = require("org.allbinary.logic.communication.smtp.email.NewPasswordEmail")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TagHelper = require("admin.taghelpers.TagHelper")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AuthenticationRequestHelper = {}
AuthenticationRequestHelper.__index = AuthenticationRequestHelper
AuthenticationRequestHelper.className = "AuthenticationRequestHelper"
setmetatable(AuthenticationRequestHelper, {__index = TagHelper})

function AuthenticationRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.weblisketSession = nil
    self.request = nil
end

function AuthenticationRequestHelper.new(...)
    local count = select("#", ...)
    if count == 2 then return AuthenticationRequestHelper._new2(...)
    elseif count == 2 then return AuthenticationRequestHelper._new2(...)
    end
end


function AuthenticationRequestHelper._new2(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), AuthenticationRequestHelper)
    self:_init_fields()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.request = pageContext:getRequest()
    return self
end


function AuthenticationRequestHelper._new2(hashMap, httpServletRequest)
    local self = setmetatable(TagHelper.new(), AuthenticationRequestHelper)
    self:_init_fields()
        self.weblisketSession = WeblisketSession.new(hashMap, httpServletRequest)
        self.request = httpServletRequest
    return self
end


-- throws Exception
function AuthenticationRequestHelper:generateNewPassword()
        if self.weblisketSession ~= nil and self.weblisketSession:getId() ~= nil then
            local startIndex = self.weblisketSession:getId():length()
            if startIndex >= 8 then
                return self.weblisketSession:getId():substring(startIndex - 8)
            else
                error(java_exception("Exception", "Error Generating New Password"), 0)
            end
        else
            error(java_exception("Exception", "No Session Available For Generating New Password"), 0)
        end
end


function AuthenticationRequestHelper:newPassword()
        local try_ok, try_error = pcall(function()
            local userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
            local email = self.request:getParameter(UserData.MAINEMAIL)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF("Generating New Password For: " .. userName, self, "newPassword()")
            end
            local userEntityInterface = UserEntityFactory.getInstance()
            local userInterface = userEntityInterface:getUser(userName)
            if userInterface:getMainEmail():compareTo(email) ~= 0 then
                if userInterface:getSecondaryEmail() ~= nil and userInterface:getSecondaryEmail():compareTo(email) ~= 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                        self.logUtil:putF("Requested Email Is Not In User Profile", self, "newPassword()")
                    end
                    return false
                end
            end
            local newPassword = self:generateNewPassword()
            userInterface:setPassword(newPassword)
            local newPasswordHashMap = userInterface:toPasswordHashMap()
            UserEntityFactory.getInstance():update(userName, newPasswordHashMap)
            NewPasswordEmail.new(self.abeClientInformation, userInterface, newPassword):process()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF("Generated New Password For: " .. userName, self, "newPassword()")
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "newPassword()", e)
            end
            return false
        end
end


function AuthenticationRequestHelper:changePassword()
        local try_ok, try_error = pcall(function()
            local userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
            local passwordString = self.request:getParameter(WeblisketSessionData.REMOVABLEPASSWORD)
            local newPassword = self.request:getParameter(WeblisketSessionData.REMOVABLENEWPASSWORD)
            local newReenteredPassword = self.request:getParameter(WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF("Changing Password For User: " .. userName, self, "changePassword()")
            end
            local password = Password.new(newPassword)
            if not password:isValid() then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.logUtil:putF("New Password Is Not Valid", self, "changePassword()")
                end
                return false
            end
            if ((newPassword < newReenteredPassword and -1) or (newPassword > newReenteredPassword and 1) or 0) ~= 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.logUtil:putF("New Password Fields Do Not Match", self, "changePassword()")
                end
                return false
            end
            local sessionPassword = self.weblisketSession:getPassword()
            local userEntityInterface = UserEntityFactory.getInstance()
            local userInterface = userEntityInterface:getUser(userName)
            local login = userEntityInterface:login(userName, passwordString)
            if ((login < self.GLOBALS2.LOGINSUCCESS and -1) or (login > self.GLOBALS2.LOGINSUCCESS and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.logUtil:putF("Authentication Successful", self, "changePassword()")
                end
                local newPasswordHashMap = password:toHashMap(nil)
                UserEntityFactory.getInstance():update(userName, newPasswordHashMap)
                NewPasswordEmail.new(self.abeClientInformation, userInterface, newPassword):process()
                return true
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF("Authentication Failed", self, "changePassword()")
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put("Authentication Failed", self, "changePassword()", e)
            end
            return false
        end
end


function AuthenticationRequestHelper:isRoleValid(userName, password, roles)
        local try_ok, try_error = pcall(function()
            local userEntityInterface = UserEntityFactory.getInstance()
            local userInterface = userEntityInterface:getUser(userName)
            if userInterface:getRole() == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.logUtil:putF("Role is null: " .. tostring(userInterface:getRole()) .. " Valid Roles: " .. tostring(roles), self, "isRoleValid()")
                end
                return false
            end
            local basicUserRoleArray = roles:toArray()
            local size = (basicUserRoleArray.n or #basicUserRoleArray)
            for index = 0, size - 1 do
                local nextRole = basicUserRoleArray[index + 1]
                if userInterface:getRole():getBasicUserRole():equals(nextRole) then
                    userInterface:validateSession(self.weblisketSession)
                    self.request:removeAttribute(WeblisketSessionData.REMOVABLEUSERNAME)
                    self.request:removeAttribute(WeblisketSessionData.REMOVABLEPASSWORD)
                    return true
                end
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Role is not valid: ")
                stringBuffer:append(tostring(userInterface:getRole()))
                stringBuffer:append(" Valid Roles: ")
                stringBuffer:append(tostring(roles))
                self.logUtil:putF(tostring(stringBuffer), self, "isRoleValid()")
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isRoleValid()", e)
            end
            return false
        end
end

return AuthenticationRequestHelper

