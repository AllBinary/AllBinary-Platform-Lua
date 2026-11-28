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

local AuthenticationHelper = {}
package.loaded["admin.taghelpers.AuthenticationHelper"] = AuthenticationHelper

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
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserRoleFactory = java_lazy("org.allbinary.business.user.role.UserRoleFactory")
local UserEntityFactory = java_lazy("org.allbinary.data.tables.user.UserEntityFactory")
local UserEntityInterface = java_lazy("org.allbinary.data.tables.user.UserEntityInterface")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local BooleanUtil = java_lazy("org.allbinary.logic.java.bool.BooleanUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TagHelper = require("admin.taghelpers.TagHelper")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table AuthenticationHelper is declared before the requires
AuthenticationHelper.__index = AuthenticationHelper
AuthenticationHelper.className = "AuthenticationHelper"
AuthenticationHelper.javaClassName = "admin.taghelpers.AuthenticationHelper"
setmetatable(AuthenticationHelper, {__index = TagHelper})

function AuthenticationHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.authenticated == nil then self.authenticated = nil end
    if self.sessionUserName == nil then self.sessionUserName = nil end
    if self.role == nil then self.role = nil end
    if self.timeout == nil then self.timeout = nil end
    if self.attemptsInteger == nil then self.attemptsInteger = nil end
end

function AuthenticationHelper._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return AuthenticationHelper._new2(self, ...)
    end
    error("No constructor of AuthenticationHelper takes " .. count .. " arguments")
end

function AuthenticationHelper.new(...)
    local self = setmetatable({}, AuthenticationHelper)
    AuthenticationHelper._jinit(self, ...)
    return self
end

function AuthenticationHelper._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "PageContext")) then return AuthenticationHelper._new2_1(self, ...) end
    return AuthenticationHelper._new2_2(self, ...)
end


function AuthenticationHelper._new2_1(self, hashMap, pageContext)
    AuthenticationHelper._jinit(self, hashMap, pageContext:getRequest())
        -- this(...) made self above
    return self
end


function AuthenticationHelper._new2_2(self, hashMap, httpServletRequest)
    java_super_init(TagHelper, self)
    AuthenticationHelper._init_fields(self)
        self.weblisketSession = WeblisketSession.new(hashMap, httpServletRequest)
        self:getFormData()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
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
java_overload(AuthenticationHelper, "getFormData", 0)


-- throws Exception
function AuthenticationHelper:invalidateSession()
        local try_ok, try_error, try_value = pcall(function()
            self.weblisketSession:clear()
            do return "__jreturn", TagSupport.EVAL_BODY_INCLUDE end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidateSession()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "invalidateSession", 0)


function AuthenticationHelper:isSessionOld()
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
                return true
            end
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
                self.logUtil:putF("Role Is Not In Session", self, "isSessionOld()")
            end
        end
        return self:isRarelyUsedSession()
end
java_overload(AuthenticationHelper, "isSessionOld", 0)


function AuthenticationHelper:isRarelyUsedSession()
        if not rawequal(self.role, nil) then
            local timeCreated = self.weblisketSession:getCreationTime()
            local lastAccess = self.weblisketSession:getLastAccessedTime()
            local inactivityAllowed = self.role:getSessionInactivityTimeout()
            local calendar = Calendar.getInstance()
            local timeFirst = calendar:getTimeInMillis() - lastAccess
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
                self.logUtil:putF("Role Is Not In Session", self, "isRarelyUsedSession()")
            end
        end
        return false
end
java_overload(AuthenticationHelper, "isRarelyUsedSession", 0)


function AuthenticationHelper:validRole()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Trying New login<p/>")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to set valid role"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validRole()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "validRole", 0)


function AuthenticationHelper:invalidRole()
        local try_ok, try_error, try_value = pcall(function()
            self.weblisketSession:setAuthenticated(false)
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Sorry your username and password is invalid on this page. ")
            stringBuffer:append("Trying New login<p/>")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to set role invalid"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "invalidRole()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "invalidRole", 0)


-- throws Exception
function AuthenticationHelper:isAuthenticated()
        if BooleanUtil.getInstance():getFromString(self.authenticated) then
            return true
        else
            return false
        end
end
java_overload(AuthenticationHelper, "isAuthenticated", 0)


function AuthenticationHelper:isAuthenticationSessionValid(roles)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(self.role, nil) then
                if self:isAuthenticated() then
                    if not rawequal(self.sessionUserName, nil) then
                        local basicUserRole = self.role:getBasicUserRole()
                        local basicUserRoleArray = roles:toArray()
                        local size = (basicUserRoleArray.n or #basicUserRoleArray)
                        for index = 0, size - 1 do
                            local mustBeOfRole = basicUserRoleArray[index + 1]
                            if require("allbinary_java").equals(basicUserRole, mustBeOfRole) then
                                if require("allbinary_java").equals(basicUserRole, UserRoleFactory.getInstance().CUSTOMER) then
                                    local userEntityInterface = UserEntityFactory.getInstance()
                                    local userInterface = userEntityInterface:getUser(self.sessionUserName)
                                    if not (userInterface:isSessionValid()) then
                                        do return "__jreturn", false end
                                    end
                                end
                                do return "__jreturn", true end
                            end
                        end
                    end
                    do return "__jreturn", false end
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATION) then
                    self.logUtil:putF("Role Is Not In Session", self, "isAuthenticationSessionValid()")
                end
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isAuthenticatedSessionValid()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "isAuthenticationSessionValid", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function AuthenticationHelper:nextAttempt()
        if not rawequal(self.attemptsInteger, nil) and require("allbinary_java").number_value(self.attemptsInteger, "intValue") > 0 then
            self.weblisketSession:setAttempts(require("allbinary_java").number_value(self.attemptsInteger, "intValue") + 1)
        else
            self.weblisketSession:setAttempts(1)
        end
end
java_overload(AuthenticationHelper, "nextAttempt", 0)


function AuthenticationHelper:processIfNewLogin(userName, password)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:putF(require("allbinary_java").to_string("Starting: ") .. require("allbinary_java").to_string(userName), self, "processIfNewLogin()")
            end
            if not rawequal(userName, nil) and not rawequal(((userName < StringUtil.getInstance().EMPTY_STRING and -1) or (userName > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) and not rawequal(password, nil) and not rawequal(((password < StringUtil.getInstance().EMPTY_STRING and -1) or (password > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) then
                local login = nil
                local userEntityInterface = UserEntityFactory.getInstance()
                login = userEntityInterface:login(userName, password)
                if rawequal(((login < GLOBALS2.LOGINSUCCESS and -1) or (login > GLOBALS2.LOGINSUCCESS and 1) or 0), 0) then
                    local userInterface = userEntityInterface:getUser(userName)
                    if userInterface:isSessionValid() then
                        self.weblisketSession:setAttempts(0)
                        do return "__jreturn", true end
                    end
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processIfNewLogin()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "processIfNewLogin", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function AuthenticationHelper:processInvalidation()
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processInvalidation()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "processInvalidation", 0)


function AuthenticationHelper:outputSessionInfo()
        local try_ok, try_error, try_value = pcall(function()
            local calendar = Calendar.getInstance()
            local timeCreated = self.weblisketSession:getCreationTime()
            local stringBuffer = StringMaker.new()
            local lastAccess = self.weblisketSession:getLastAccessedTime()
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string("Time Since Last Access: ") .. require("allbinary_java").to_string((calendar:getTimeInMillis() - lastAccess))) .. require("allbinary_java").to_string("<br/>\n"))
            if not rawequal(self.role, nil) then
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
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return "Error"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationHelper, "outputSessionInfo", 0)


function AuthenticationHelper:getRole()
        return self.role
end
java_overload(AuthenticationHelper, "getRole", 0)

return AuthenticationHelper

