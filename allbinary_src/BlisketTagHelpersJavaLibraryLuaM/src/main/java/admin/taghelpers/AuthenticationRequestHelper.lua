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

local AuthenticationRequestHelper = {}
package.loaded["admin.taghelpers.AuthenticationRequestHelper"] = AuthenticationRequestHelper

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local Password = java_lazy("org.allbinary.business.user.password.Password")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")
local UserEntityFactory = java_lazy("org.allbinary.data.tables.user.UserEntityFactory")
local UserEntityInterface = java_lazy("org.allbinary.data.tables.user.UserEntityInterface")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local WeblisketSessionInterface = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local NewPasswordEmail = java_lazy("org.allbinary.logic.communication.smtp.email.NewPasswordEmail")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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

-- class table AuthenticationRequestHelper is declared before the requires
AuthenticationRequestHelper.__index = AuthenticationRequestHelper
AuthenticationRequestHelper.className = "AuthenticationRequestHelper"
AuthenticationRequestHelper.javaClassName = "admin.taghelpers.AuthenticationRequestHelper"
setmetatable(AuthenticationRequestHelper, {__index = TagHelper})

function AuthenticationRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.request == nil then self.request = nil end
end

function AuthenticationRequestHelper._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return AuthenticationRequestHelper._new2(self, ...)
    end
    error("No constructor of AuthenticationRequestHelper takes " .. count .. " arguments")
end

function AuthenticationRequestHelper.new(...)
    local self = setmetatable({}, AuthenticationRequestHelper)
    AuthenticationRequestHelper._jinit(self, ...)
    return self
end

function AuthenticationRequestHelper._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "PageContext")) then return AuthenticationRequestHelper._new2_1(self, ...) end
    return AuthenticationRequestHelper._new2_2(self, ...)
end


function AuthenticationRequestHelper._new2_1(self, hashMap, pageContext)
    java_super_init(TagHelper, self)
    AuthenticationRequestHelper._init_fields(self)
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.request = pageContext:getRequest()
    return self
end


function AuthenticationRequestHelper._new2_2(self, hashMap, httpServletRequest)
    java_super_init(TagHelper, self)
    AuthenticationRequestHelper._init_fields(self)
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
                error(require("java.lang.Exception").new("Error Generating New Password"), 0)
            end
        else
            error(require("java.lang.Exception").new("No Session Available For Generating New Password"), 0)
        end
end
java_overload(AuthenticationRequestHelper, "generateNewPassword", 0)


function AuthenticationRequestHelper:newPassword()
        local try_ok, try_error, try_value = pcall(function()
            local userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
            local email = self.request:getParameter(UserData.MAINEMAIL)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                self.logUtil:putF("Generating New Password For: " .. userName, self, "newPassword()")
            end
            local userEntityInterface = UserEntityFactory.getInstance()
            local userInterface = userEntityInterface:getUser(userName)
            if userInterface:getMainEmail():compareTo(email) ~= 0 then
                if userInterface:getSecondaryEmail() ~= nil and userInterface:getSecondaryEmail():compareTo(email) ~= 0 then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                        self.logUtil:putF("Requested Email Is Not In User Profile", self, "newPassword()")
                    end
                    do return "__jreturn", false end
                end
            end
            local newPassword = self:generateNewPassword()
            userInterface:setPassword(newPassword)
            local newPasswordHashMap = userInterface:toPasswordHashMap()
            UserEntityFactory.getInstance():update(userName, newPasswordHashMap)
            NewPasswordEmail.new(self.abeClientInformation, userInterface, newPassword):process()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                self.logUtil:putF("Generated New Password For: " .. userName, self, "newPassword()")
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "newPassword()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationRequestHelper, "newPassword", 0)


function AuthenticationRequestHelper:changePassword()
        local try_ok, try_error, try_value = pcall(function()
            local userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
            local passwordString = self.request:getParameter(WeblisketSessionData.REMOVABLEPASSWORD)
            local newPassword = self.request:getParameter(WeblisketSessionData.REMOVABLENEWPASSWORD)
            local newReenteredPassword = self.request:getParameter(WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                self.logUtil:putF("Changing Password For User: " .. userName, self, "changePassword()")
            end
            local password = Password.new(newPassword)
            if not password:isValid() then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.logUtil:putF("New Password Is Not Valid", self, "changePassword()")
                end
                do return "__jreturn", false end
            end
            if ((newPassword < newReenteredPassword and -1) or (newPassword > newReenteredPassword and 1) or 0) ~= 0 then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.logUtil:putF("New Password Fields Do Not Match", self, "changePassword()")
                end
                do return "__jreturn", false end
            end
            local sessionPassword = self.weblisketSession:getPassword()
            local userEntityInterface = UserEntityFactory.getInstance()
            local userInterface = userEntityInterface:getUser(userName)
            local login = userEntityInterface:login(userName, passwordString)
            if ((login < GLOBALS2.LOGINSUCCESS and -1) or (login > GLOBALS2.LOGINSUCCESS and 1) or 0) == 0 then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.logUtil:putF("Authentication Successful", self, "changePassword()")
                end
                local newPasswordHashMap = password:toHashMap(nil)
                UserEntityFactory.getInstance():update(userName, newPasswordHashMap)
                NewPasswordEmail.new(self.abeClientInformation, userInterface, newPassword):process()
                do return "__jreturn", true end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                self.logUtil:putF("Authentication Failed", self, "changePassword()")
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put("Authentication Failed", self, "changePassword()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationRequestHelper, "changePassword", 0)


function AuthenticationRequestHelper:isRoleValid(userName, password, roles)
        local try_ok, try_error, try_value = pcall(function()
            local userEntityInterface = UserEntityFactory.getInstance()
            local userInterface = userEntityInterface:getUser(userName)
            if userInterface:getRole() == nil then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.logUtil:putF("Role is null: " .. tostring(userInterface:getRole()) .. " Valid Roles: " .. tostring(roles), self, "isRoleValid()")
                end
                do return "__jreturn", false end
            end
            local basicUserRoleArray = roles:toArray()
            local size = (basicUserRoleArray.n or #basicUserRoleArray)
            for index = 0, size - 1 do
                local nextRole = basicUserRoleArray[index + 1]
                if userInterface:getRole():getBasicUserRole():equals(nextRole) then
                    userInterface:validateSession(self.weblisketSession)
                    self.request:removeAttribute(WeblisketSessionData.REMOVABLEUSERNAME)
                    self.request:removeAttribute(WeblisketSessionData.REMOVABLEPASSWORD)
                    do return "__jreturn", true end
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Role is not valid: ")
                stringBuffer:append(tostring(userInterface:getRole()))
                stringBuffer:append(" Valid Roles: ")
                stringBuffer:append(tostring(roles))
                self.logUtil:putF(tostring(stringBuffer), self, "isRoleValid()")
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isRoleValid()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AuthenticationRequestHelper, "isRoleValid", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "BasicArrayList")) end)

return AuthenticationRequestHelper

