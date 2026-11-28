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

local AuthenticationTag = {}
package.loaded["admin.tags.AuthenticationTag"] = AuthenticationTag

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

-- local Method = require("java.lang.reflect.Method")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local AuthenticationHelperFactory = java_lazy("admin.taghelpers.AuthenticationHelperFactory")
local AuthenticationRequestHelperFactory = java_lazy("admin.taghelpers.AuthenticationRequestHelperFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
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

-- class table AuthenticationTag is declared before the requires
AuthenticationTag.__index = AuthenticationTag
AuthenticationTag.className = "AuthenticationTag"
AuthenticationTag.javaClassName = "admin.tags.AuthenticationTag"
setmetatable(AuthenticationTag, {__index = CustomTagSupport})

function AuthenticationTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.command == nil then self.command = nil end
    if self.userName == nil then self.userName = nil end
    if self.password == nil then self.password = nil end
    if self.newPassword_f == nil then self.newPassword_f = nil end
    if self.roles == nil then self.roles = nil end
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
end


function AuthenticationTag._jinit(self)
    java_super_init(CustomTagSupport, self)
    AuthenticationTag._init_fields(self)
        local stringUtil = StringUtil.getInstance()
        self.userName = stringUtil.EMPTY_STRING
        self.password = stringUtil.EMPTY_STRING
    return self
end

function AuthenticationTag.new(...)
    local self = setmetatable({}, AuthenticationTag)
    AuthenticationTag._jinit(self, ...)
    return self
end


function AuthenticationTag:setCommand(command)
        self.command = command
end
java_overload(AuthenticationTag, "setCommand", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AuthenticationTag:setUserName(userName)
        self.userName = userName
end
java_overload(AuthenticationTag, "setUserName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AuthenticationTag:setPassword(value)
        self.password = value
end
java_overload(AuthenticationTag, "setPassword", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AuthenticationTag:setNewPassword(value)
        self.newPassword_f = value
end
java_overload(AuthenticationTag, "setNewPassword", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AuthenticationTag:setRoles(values)
        self.roles = values
end
java_overload(AuthenticationTag, "setRoles", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws LicensingException
function AuthenticationTag:changePassword()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("changePassword", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "changePassword", 0)


-- throws LicensingException
function AuthenticationTag:newPassword()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("newPassword", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "newPassword", 0)


-- throws LicensingException
function AuthenticationTag:invalidateSession()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("invalidateSession", nil)
            local resultInteger = method:invoke(anyType, nil)
            do return "__jreturn", require("allbinary_java").number_value(resultInteger, "intValue") end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "invalidateSession", 0)


-- throws LicensingException
function AuthenticationTag:isSessionOld()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("isSessionOld", nil)
            local resultBoolean = method:invoke(anyType, nil)
            do return "__jreturn", resultBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "isSessionOld", 0)


-- throws LicensingException
function AuthenticationTag:isRoleValid()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.userName), getmetatable(self.password), getmetatable(self.roles)}
            local method = addressHelperClass:getMethod("isRoleValid", methodParams)
            local methodArgs = {self.userName, self.password, self.roles}
            local resultBoolean = method:invoke(anyType, methodArgs)
            do return "__jreturn", resultBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "isRoleValid", 0)


-- throws LicensingException
function AuthenticationTag:validRole()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("validRole", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "validRole", 0)


-- throws LicensingException
function AuthenticationTag:invalidRole()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("invalidRole", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "invalidRole", 0)


-- throws LicensingException
function AuthenticationTag:isAuthenticationSessionValid()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.roles)}
            local method = addressHelperClass:getMethod("isAuthenticationSessionValid", methodParams)
            local methodArgs = {self.roles}
            local resultBoolean = method:invoke(anyType, methodArgs)
            do return "__jreturn", resultBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "isAuthenticationSessionValid", 0)


-- throws LicensingException
function AuthenticationTag:processIfNewLogin()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local helperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.userName), getmetatable(self.password)}
            local method = helperClass:getMethod("processIfNewLogin", methodParams)
            local methodArgs = {self.userName, self.password}
            local resultBoolean = method:invoke(anyType, methodArgs)
            do return "__jreturn", resultBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "processIfNewLogin", 0)


-- throws LicensingException
function AuthenticationTag:processInvalidation()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AuthenticationHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("processInvalidation", nil)
            local resultBoolean = method:invoke(anyType, nil)
            do return "__jreturn", resultBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationTag, "processInvalidation", 0)


-- throws JspTagException
function AuthenticationTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            local stringUtil = StringUtil.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                local request = self.pageContext:getRequest()
                local stringBuffer = StringMaker.new()
                stringBuffer:append(" Request URI: ")
                stringBuffer:append(request:getRequestURI())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            if not rawequal(self.command, nil) then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                if rawequal(((self.command < GLOBALS2.NEWPASSWORD and -1) or (self.command > GLOBALS2.NEWPASSWORD and 1) or 0), 0) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                        self.logUtil:putF("New Password", self, self.tagStrings.DO_START_TAG)
                    end
                    if not (self:newPassword()) then
                        self.pageContext:getOut():print("New Password Request Failed.<p/>")
                        do return "__jreturn", self.EVAL_BODY_INCLUDE end
                    else
                        self.pageContext:getOut():print("New Password Was Sent.<p/>")
                        do return "__jreturn", self.SKIP_BODY end
                    end
                elseif rawequal(((self.command < GLOBALS2.CHANGEPASSWORD and -1) or (self.command > GLOBALS2.CHANGEPASSWORD and 1) or 0), 0) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                        self.logUtil:putF("Change Password", self, self.tagStrings.DO_START_TAG)
                    end
                    if not (self:changePassword()) then
                        self.pageContext:getOut():print("Password Change Attempt Failed.<p/>")
                        do return "__jreturn", self.EVAL_BODY_INCLUDE end
                    else
                        self.pageContext:getOut():print("Password Changed Successfully.<p/>")
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
                        if not rawequal(self.userName, nil) and not rawequal(((self.userName < stringUtil.EMPTY_STRING and -1) or (self.userName > stringUtil.EMPTY_STRING and 1) or 0), 0) and not rawequal(self.password, nil) and not rawequal(((self.password < stringUtil.EMPTY_STRING and -1) or (self.password > stringUtil.EMPTY_STRING and 1) or 0), 0) then
                            self.pageContext:getOut():print("Sorry your username and/or password is invalid.<p/>")
                        end
                    end
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                        self.logUtil:putF(tostring(StringMaker.new():append("Major authentication error - userName: "):append(self.userName):append(" Password: "):append(self.password):append(" Command: "):append(self.command)), self, self.tagStrings.DO_START_TAG)
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
java_overload(AuthenticationTag, "doStartTag", 0)

return AuthenticationTag

