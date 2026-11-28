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

local FileAuthenticationTag = {}
package.loaded["admin.tags.FileAuthenticationTag"] = FileAuthenticationTag

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Calendar = java_lazy("java.util.Calendar")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local InstallerInfo = java_lazy("org.allbinary.business.init.InstallerInfo")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")
local BasicUserRoleFactory = java_lazy("org.allbinary.business.user.role.BasicUserRoleFactory")
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local BasicWeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.BasicWeblisketSession")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local BooleanUtil = java_lazy("org.allbinary.logic.java.bool.BooleanUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table FileAuthenticationTag is declared before the requires
FileAuthenticationTag.__index = FileAuthenticationTag
FileAuthenticationTag.className = "FileAuthenticationTag"
FileAuthenticationTag.javaClassName = "admin.tags.FileAuthenticationTag"
setmetatable(FileAuthenticationTag, {__index = CustomTagSupport})

function FileAuthenticationTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.attemptsInteger == nil then self.attemptsInteger = nil end
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.request == nil then self.request = nil end
    if self.command == nil then self.command = nil end
    if self.userName == nil then self.userName = nil end
    if self.password == nil then self.password = nil end
    if self.newPassword_f == nil then self.newPassword_f = nil end
    if self.authenticated == nil then self.authenticated = nil end
    if self.sessionUserName == nil then self.sessionUserName = nil end
    if self.role == nil then self.role = nil end
    if self.timeout == nil then self.timeout = nil end
    if self.roles == nil then self.roles = nil end
end


function FileAuthenticationTag._jinit(self)
    java_super_init(CustomTagSupport, self)
    FileAuthenticationTag._init_fields(self)
    return self
end

function FileAuthenticationTag.new(...)
    local self = setmetatable({}, FileAuthenticationTag)
    FileAuthenticationTag._jinit(self, ...)
    return self
end


function FileAuthenticationTag:setCommand(command)
        self.command = command
end
java_overload(FileAuthenticationTag, "setCommand", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function FileAuthenticationTag:setUserName(userName)
        self.userName = userName
end
java_overload(FileAuthenticationTag, "setUserName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function FileAuthenticationTag:setPassword(value)
        self.password = value
end
java_overload(FileAuthenticationTag, "setPassword", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function FileAuthenticationTag:setNewPassword(value)
        self.newPassword_f = value
end
java_overload(FileAuthenticationTag, "setNewPassword", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function FileAuthenticationTag:setRoles(values)
        self.roles = values
end
java_overload(FileAuthenticationTag, "setRoles", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function FileAuthenticationTag:makeSessionValid(storedRole, userName)
        self.weblisketSession:setAuthenticated()
        self.weblisketSession:setRole(storedRole)
        self.weblisketSession:setUserName(userName)
        self.request:removeAttribute(WeblisketSessionData.REMOVABLEUSERNAME)
        self.request:removeAttribute(WeblisketSessionData.REMOVABLEPASSWORD)
end
java_overload(FileAuthenticationTag, "makeSessionValid", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "BasicUserRole")) and (java_a2 == nil or type(java_a2) == "string") end)


function FileAuthenticationTag:getFormData()
        self.authenticated = self.weblisketSession:getAuthentication()
        self.sessionUserName = self.weblisketSession:getUserName()
        self.role = self.weblisketSession:getRole()
        self.attemptsInteger = self.weblisketSession:getAttempts()
        self.timeout = self.weblisketSession:getTimeout()
end
java_overload(FileAuthenticationTag, "getFormData", 0)


function FileAuthenticationTag:nextAttempt()
        if not rawequal(self.attemptsInteger, nil) and math.tointeger(self.attemptsInteger // 1) > 0 then
            self.weblisketSession:setAttempts(math.tointeger(self.attemptsInteger // 1) + 1)
        else
            self.weblisketSession:setAttempts(1)
        end
end
java_overload(FileAuthenticationTag, "nextAttempt", 0)


-- throws LicensingException
function FileAuthenticationTag:changePassword()
        local try_ok, try_error, try_value = pcall(function()
            local userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
            local password = self.request:getParameter(WeblisketSessionData.REMOVABLEPASSWORD)
            local newPassword = self.request:getParameter(WeblisketSessionData.REMOVABLENEWPASSWORD)
            local newReenteredPassword = self.request:getParameter(WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD)
            if not rawequal(((newPassword < newReenteredPassword and -1) or (newPassword > newReenteredPassword and 1) or 0), 0) then
                do return "__jreturn", false end
            end
            local installerInfo = InstallerInfo.new()
            if installerInfo:isValid(userName, password) then
                installerInfo:setPassword(newPassword)
                installerInfo:write()
                self.weblisketSession:setUserName(userName)
                self.weblisketSession:setPassword(newPassword)
                do return "__jreturn", true end
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "changePassword", 0)


function FileAuthenticationTag:invalidateSession()
        local try_ok, try_error, try_value = pcall(function()
            self.weblisketSession:clear()
            do return "__jreturn", math.tointeger(TagSupport.EVAL_BODY_INCLUDE // 1) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidateSession()", e)
            end
            return TagSupport.SKIP_BODY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "invalidateSession", 0)


-- throws LicensingException
function FileAuthenticationTag:isSessionOld()
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(self.role, nil) then
                local timeCreated = self.weblisketSession:getCreationTime()
                local sessionTimout = self.role:getSessionTimeout()
                local calendar = Calendar.getInstance()
                local timeFirst = calendar:getTimeInMillis() - sessionTimout
                if timeFirst > timeCreated then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Session Is Old - Timeout: ")
                        stringBuffer:appendlong(sessionTimout)
                        stringBuffer:append(" Eval: ")
                        stringBuffer:appendlong(timeFirst)
                        stringBuffer:append(" > ")
                        stringBuffer:appendlong(timeCreated)
                        self.logUtil:putF(tostring(stringBuffer), self, "isSessionOld()")
                    end
                    do return "__jreturn", true end
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
                    self.logUtil:putF("Role Is Not In Session", self, "isSessionOld()")
                end
            end
            do return "__jreturn", self:isRarelyUsedSession() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isSessionOld()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "isSessionOld", 0)


function FileAuthenticationTag:isRarelyUsedSession()
        if not rawequal(self.role, nil) then
            local timeCreated = self.weblisketSession:getCreationTime()
            local lastAccess = self.weblisketSession:getLastAccessedTime()
            local timePassed = self.role:getSessionInactivityTimeout()
            local calendar = Calendar.getInstance()
            local timeFirst = calendar:getTimeInMillis() - lastAccess
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
                self.logUtil:putF("Role Is Not In Session", self, "isRarelyUsedSession()")
            end
        end
        return false
end
java_overload(FileAuthenticationTag, "isRarelyUsedSession", 0)


-- throws LicensingException
function FileAuthenticationTag:isRoleValid()
        local try_ok, try_error, try_value = pcall(function()
            self:makeSessionValid(BasicUserRoleFactory.getInstance().INSTALLER, self.userName)
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isRoleValid()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "isRoleValid", 0)


-- throws LicensingException
function FileAuthenticationTag:validRole()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Trying New login<p>")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to set valid role"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validRole()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "validRole", 0)


-- throws LicensingException
function FileAuthenticationTag:invalidRole()
        local try_ok, try_error, try_value = pcall(function()
            self.weblisketSession:setAuthenticated(false)
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Sorry your username and password is invalid on this page.")
            stringBuffer:append("Trying New login<p>")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to set role invalid"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidRole()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "invalidRole", 0)


-- throws LicensingException
function FileAuthenticationTag:isAuthenticationSessionValid()
        local try_ok, try_error, try_value = pcall(function()
            if BooleanUtil.getInstance():getFromString(self.authenticated) then
                local size = self.roles:size()
                for index = 0, size - 1 do
                    local mustBeOfRole = self.roles:get(index)
                    if not rawequal(self.sessionUserName, nil) and require("allbinary_java").equals(self.role, mustBeOfRole) then
                        do return "__jreturn", true end
                    end
                end
                do return "__jreturn", false end
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isAuthenticationSessionValid()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "isAuthenticationSessionValid", 0)


-- throws LicensingException
function FileAuthenticationTag:processIfNewLogin()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Starting for User: ") .. require("allbinary_java").to_string(self.userName)) .. require("allbinary_java").to_string(" Attempt: ")) .. require("allbinary_java").to_string(self.weblisketSession:getAttempts()), self, "processIfNewLogin()")
            end
            if not rawequal(self.userName, nil) and not rawequal(((self.userName < StringUtil.getInstance().EMPTY_STRING and -1) or (self.userName > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) and not rawequal(self.password, nil) and not rawequal(((self.password < StringUtil.getInstance().EMPTY_STRING and -1) or (self.password > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) then
                local login = nil
                local installerInfo = InstallerInfo.new()
                if installerInfo:isValid(self.userName, self.password) then
                    login = GLOBALS2.LOGINSUCCESS
                else
                    login = GLOBALS2.LOGINFAILED
                end
                if rawequal(((login < GLOBALS2.LOGINSUCCESS and -1) or (login > GLOBALS2.LOGINSUCCESS and 1) or 0), 0) then
                    self.weblisketSession:setAttempts(0)
                    do return "__jreturn", true end
                end
                self:nextAttempt()
                do return "__jreturn", false end
            end
            self:nextAttempt()
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processIfNewLogin()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "processIfNewLogin", 0)


-- throws LicensingException
function FileAuthenticationTag:processInvalidation()
        local try_ok, try_error, try_value = pcall(function()
            if BooleanUtil.getInstance():getFromString(self.timeout) then
                self:invalidateSession()
                do return "__jreturn", true end
            end
            do
                self.weblisketSession:setTimeout(BooleanFactory.getInstance().TRUE_STRING)
                do return "__jreturn", false end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isSetToInvalidate()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "processInvalidation", 0)


-- throws JspTagException
function FileAuthenticationTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            local stringUtil = StringUtil.getInstance()
            self.request = self.pageContext:getRequest()
            self.weblisketSession = BasicWeblisketSession.new(self.pageContext)
            self:getFormData()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                self.logUtil:putF("Started", self, self.tagStrings.DO_START_TAG)
            end
            if not rawequal(self.command, nil) then
                if rawequal(((self.command < GLOBALS2.CHANGEPASSWORD and -1) or (self.command > GLOBALS2.CHANGEPASSWORD and 1) or 0), 0) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                        self.logUtil:putF("Change Password", self, self.tagStrings.DO_START_TAG)
                    end
                    if not (self:changePassword()) then
                        self.pageContext:getOut():print("Password Change Attempt Failed.<p>")
                        do return "__jreturn", self.EVAL_BODY_INCLUDE end
                    else
                        self.pageContext:getOut():print("Password Changed Successfully.<p>")
                        do return "__jreturn", self.SKIP_BODY end
                    end
                elseif rawequal(((self.command < WeblisketSessionData.INVALIDATESESSION and -1) or (self.command > WeblisketSessionData.INVALIDATESESSION and 1) or 0), 0) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                        self.logUtil:putF("INVALIDATESESSION", self, self.tagStrings.DO_START_TAG)
                    end
                    do return "__jreturn", self:invalidateSession() end
                else
                    if self:isSessionOld() then
                        if self:processInvalidation() then
                            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                                self.logUtil:putF("Processing Invalidation", self, self.tagStrings.DO_START_TAG)
                            end
                            self.pageContext:getOut():print("Please login again.<p>")
                            if rawequal(((self.command < GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0), 0) then
                                do return "__jreturn", TagSupport.SKIP_BODY end
                            else
                                do return "__jreturn", TagSupport.EVAL_BODY_INCLUDE end
                            end
                        else
                            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                                self.logUtil:putF("Preparing session for invalidation", self, self.tagStrings.DO_START_TAG)
                            end
                            if rawequal(((self.command < GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0), 0) then
                                do return "__jreturn", TagSupport.SKIP_BODY end
                            else
                                do return "__jreturn", TagSupport.EVAL_BODY_INCLUDE end
                            end
                        end
                    end
                    if (rawequal(self.userName, nil) or rawequal(((self.userName < stringUtil.EMPTY_STRING and -1) or (self.userName > stringUtil.EMPTY_STRING and 1) or 0), 0)) and (rawequal(self.password, nil) or rawequal(((self.password < stringUtil.EMPTY_STRING and -1) or (self.password > stringUtil.EMPTY_STRING and 1) or 0), 0)) and not rawequal(self.roles, nil) and self:isAuthenticationSessionValid() then
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                            self.logUtil:putF("Authenticated session is valid", self, self.tagStrings.DO_START_TAG)
                        end
                        if rawequal(((self.command < GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0), 0) then
                            do return "__jreturn", TagSupport.EVAL_BODY_INCLUDE end
                        else
                            do return "__jreturn", TagSupport.SKIP_BODY end
                        end
                    end
                    if not rawequal(self.userName, nil) and not rawequal(self.password, nil) and self:processIfNewLogin() then
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                            self.logUtil:putF("Processing new login.", self, self.tagStrings.DO_START_TAG)
                        end
                        if self:isRoleValid() then
                            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                                self.logUtil:putF("Role is valid - Processing new login", self, self.tagStrings.DO_START_TAG)
                            end
                            self.pageContext:getOut():print(self:validRole())
                            if rawequal(((self.command < GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0), 0) then
                                do return "__jreturn", self.EVAL_BODY_INCLUDE end
                            else
                                do return "__jreturn", self.SKIP_BODY end
                            end
                        else
                            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                                self.logUtil:putF("Role is not valid - Processing new login", self, self.tagStrings.DO_START_TAG)
                            end
                            self.pageContext:getOut():print(self:invalidRole())
                            if rawequal(((self.command < GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0), 0) then
                                do return "__jreturn", self.SKIP_BODY end
                            else
                                do return "__jreturn", self.EVAL_BODY_INCLUDE end
                            end
                        end
                    else
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                            self.logUtil:putF("Invalid Login", self, self.tagStrings.DO_START_TAG)
                        end
                        if not rawequal(self.userName, nil) and not rawequal(((self.userName < StringUtil.getInstance().EMPTY_STRING and -1) or (self.userName > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) and not rawequal(self.password, nil) and not rawequal(((self.password < StringUtil.getInstance().EMPTY_STRING and -1) or (self.password > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) then
                            self.pageContext:getOut():print("Sorry your username and/or password is invalid.<p>")
                        end
                    end
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Major authentication error - userName: ")
                        stringBuffer:append(self.userName)
                        stringBuffer:append(" Password: ")
                        stringBuffer:append(self.password)
                        stringBuffer:append(" Command: ")
                        stringBuffer:append(self.command)
                        self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
                    end
                    if rawequal(((self.command < GLOBALS2.PROCESSBODYIFAUTHENTICATED and -1) or (self.command > GLOBALS2.PROCESSBODYIFAUTHENTICATED and 1) or 0), 0) then
                        do return "__jreturn", TagSupport.SKIP_BODY end
                    else
                        do return "__jreturn", TagSupport.EVAL_BODY_INCLUDE end
                    end
                end
            end
            do return "__jreturn", self.SKIP_BODY end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(FileAuthenticationTag, "doStartTag", 0)

return FileAuthenticationTag

