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
-- package org.allbinary.business.user.modules

local User = {}
package.loaded["org.allbinary.business.user.modules.User"] = User

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
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local UserConfigurationDomDocumentMapping = java_lazy("org.allbinary.business.user.modules.configuration.UserConfigurationDomDocumentMapping")
local UserConfigurationInterface = java_lazy("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")
local UserConfigurationInterfaceFactory = java_lazy("org.allbinary.business.user.modules.configuration.UserConfigurationInterfaceFactory")
local Password = java_lazy("org.allbinary.business.user.password.Password")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserRoleB = java_lazy("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = java_lazy("org.allbinary.business.user.role.UserRoleData")
local UserName = java_lazy("org.allbinary.business.user.username.UserName")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local RequestParams = java_lazy("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local WeblisketSessionInterface = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
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

-- class table User is declared before the requires
User.__index = User
User.className = "User"
User.javaClassName = "org.allbinary.business.user.modules.User"
User.java_implements = " UserInterface "
User.java_interfaces = function() return {UserInterface} end

function User:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.userName == nil then self.userName = nil end
    if self.prefixName == nil then self.prefixName = nil end
    if self.firstName == nil then self.firstName = nil end
    if self.lastName == nil then self.lastName = nil end
    if self.middleName == nil then self.middleName = nil end
    if self.suffixName == nil then self.suffixName = nil end
    if self.company == nil then self.company = nil end
    if self.positionAtCompany == nil then self.positionAtCompany = nil end
    if self.mainEmail == nil then self.mainEmail = nil end
    if self.secondaryEmail == nil then self.secondaryEmail = nil end
    if self.homePhone == nil then self.homePhone = nil end
    if self.cellPhone == nil then self.cellPhone = nil end
    if self.workPhone == nil then self.workPhone = nil end
    if self.otherContact == nil then self.otherContact = nil end
    if self.electronicDevice == nil then self.electronicDevice = nil end
    if self.fax == nil then self.fax = nil end
    if self.role == nil then self.role = nil end
    if self.encryption == nil then self.encryption = nil end
    if self.secret == nil then self.secret = nil end
    if self.password == nil then self.password = nil end
    if self.enable_f == nil then self.enable_f = nil end
    if self.permissions == nil then self.permissions = nil end
    if self.userConfigurationInterface == nil then self.userConfigurationInterface = nil end
end

function User._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return User._new0(self, ...)
    elseif count == 1 then return User._new1(self, ...)
    end
    error("No constructor of User takes " .. count .. " arguments")
end

function User.new(...)
    local self = setmetatable({}, User)
    User._jinit(self, ...)
    return self
end

function User._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) then return User._new1_1(self, ...) end
    return User._new1_2(self, ...)
end


function User._new0(self)
    User._init_fields(self)
        self.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance()
        self.password = Password.new(StringUtil.getInstance().EMPTY_STRING)
    return self
end


function User._new1_1(self, request)
    User._init_fields(self)
        self:getFormData(RequestParams.new(request):toHashMap())
        self.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance(self:getRole())
    return self
end


function User._new1_2(self, userHashMap)
    User._init_fields(self)
        self:getFormData(userHashMap)
        self.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance(self:getRole())
    return self
end


-- throws Exception
function User:getFormData(userHashMap)
        self.userName = UserName.new(userHashMap):get()
        local stringUtil = StringUtil.getInstance()
        local passwordString = stringUtil:getNonNull(userHashMap:get(UserData.PASSWORD))
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(self.userName) and stringValidationUtil:isEmpty(passwordString) then
            self.userName = stringUtil:getNonNull(userHashMap:get(WeblisketSessionData.REMOVABLEUSERNAME))
            passwordString = stringUtil:getNonNull(userHashMap:get(WeblisketSessionData.REMOVABLEPASSWORD))
        end
        local encryption = stringUtil:getNonNull(userHashMap:get(EntryData.getInstance().ENCRYPTION))
        local secret = stringUtil:getNonNull(userHashMap:get(UserData.SECRET))
        self.password = Password.new(passwordString)
        self.prefixName = stringUtil:getNonNull(userHashMap:get(UserData.PREFIXNAME))
        self.firstName = stringUtil:getNonNull(userHashMap:get(UserData.FIRSTNAME))
        self.lastName = stringUtil:getNonNull(userHashMap:get(UserData.LASTNAME))
        self.middleName = stringUtil:getNonNull(userHashMap:get(UserData.MIDDLENAME))
        self.suffixName = stringUtil:getNonNull(userHashMap:get(UserData.SUFFIXNAME))
        self.company = stringUtil:getNonNull(userHashMap:get(UserData.COMPANY))
        self.positionAtCompany = stringUtil:getNonNull(userHashMap:get(UserData.POSITIONATCOMPANY))
        self.mainEmail = stringUtil:getNonNull(userHashMap:get(UserData.MAINEMAIL))
        self.secondaryEmail = stringUtil:getNonNull(userHashMap:get(UserData.SECONDARYEMAIL))
        self.homePhone = stringUtil:getNonNull(userHashMap:get(UserData.HOMEPHONE))
        self.cellPhone = stringUtil:getNonNull(userHashMap:get(UserData.CELLPHONE))
        self.workPhone = stringUtil:getNonNull(userHashMap:get(UserData.WORKPHONE))
        self.otherContact = stringUtil:getNonNull(userHashMap:get(UserData.OTHERCONTACT))
        self.electronicDevice = stringUtil:getNonNull(userHashMap:get(UserData.ELECTRONICDEVICE))
        self.fax = stringUtil:getNonNull(userHashMap:get(UserData.FAX))
        self.role = UserRoleB.getRole(userHashMap:get(tostring(UserRoleData.NAME)))
        self.permissions = stringUtil:getNonNull(userHashMap:get(UserData.PERMISSIONS))
        if not (stringValidationUtil:isEmpty(self.permissions)) and rawequal(((self.permissions < StoreFrontData.getInstance().NAME and -1) or (self.permissions > StoreFrontData.getInstance().NAME and 1) or 0), 0) then
            self.permissions = stringUtil:getNonNull(userHashMap:get(StoreFrontData.getInstance().NAME))
        elseif rawequal(self.permissions, nil) then
            self.permissions = "No Permissions"
        end
        self.enable_f = stringUtil:getNonNull(userHashMap:get(EntryData.getInstance().ENABLE))
end


function User:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local valid = true
            if not (UserName.getInstance():isValid(self.userName)) then
                valid = false
            end
            if not (self.password:isValid()) then
                valid = false
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            if not (stringValidationUtil:isValidRequired(self.firstName, 1, UserData.MAXLEN)) then
                valid = false
            end
            if not (stringValidationUtil:isValidRequired(self.lastName, 1, UserData.MAXLEN)) then
                valid = false
            end
            if not (stringValidationUtil:isValidRequired(self.mainEmail, 1, UserData.MAXLEN)) or rawequal(((string.find(self.mainEmail, "@", 1, true) or 0) - 1), -1) then
                valid = false
            end
            do return "__jreturn", valid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VALIDATIONERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put("Failed to validate form", self, commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function User:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(UserName.getValidationInfo(self.userName))
            stringBuffer:append(self.password:getValidationInfo())
            if not (stringValidationUtil:isValidRequired(self.firstName, 1, UserData.MAXLEN)) then
                stringBuffer:append("Please enter a valid First Name.<br />")
            end
            if not (stringValidationUtil:isValidRequired(self.lastName, 1, UserData.MAXLEN)) then
                stringBuffer:append("Please enter a valid Last Name.<br />")
            end
            if not (stringValidationUtil:isValidRequired(self.mainEmail, 1, UserData.MAXLEN)) or rawequal(((string.find(self.mainEmail, "@", 1, true) or 0) - 1), -1) then
                stringBuffer:append("Please enter a valid email address.<br />")
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function User:setUserName(value)
        self.userName = value
end


function User:setPrefixName(value)
        self.prefixName = value
end


function User:setFirstName(value)
        self.firstName = value
end


function User:setLastName(value)
        self.lastName = value
end


function User:setMiddleName(value)
        self.middleName = value
end


function User:setSuffixName(value)
        self.suffixName = value
end


function User:setCompany(value)
        self.company = value
end


function User:setPositionAtCompany(value)
        self.positionAtCompany = value
end


function User:setMainEmail(value)
        self.mainEmail = value
end


function User:setSecondaryEmail(value)
        self.secondaryEmail = value
end


function User:setHomePhone(value)
        self.homePhone = value
end


function User:setCellPhone(value)
        self.cellPhone = value
end


function User:setWorkPhone(value)
        self.workPhone = value
end


function User:setOtherContact(value)
        self.otherContact = value
end


function User:setElectronicContact(value)
        self.electronicDevice = value
end


function User:setFax(value)
        self.fax = value
end


function User:setRole(role)
        self.role = role
end


function User:setPermissions(value)
        self.permissions = value
end


function User:setEncryption(value)
        self.encryption = value
end


function User:setSecret(value)
        self.secret = value
end


function User:setPassword(value)
        self.password:set(value)
end


function User:enable()
        self:setEnable("Yes")
end


function User:disable()
        self:setEnable("No")
end


function User:setEnable(enable)
        self.enable_f = enable
end


function User:getUserName()
        return self.userName
end


function User:getPrefixName()
        return self.prefixName
end


function User:getFirstName()
        return self.firstName
end


function User:getLastName()
        return self.lastName
end


function User:getMiddleName()
        return self.middleName
end


function User:getSuffixName()
        return self.suffixName
end


function User:getCompany()
        return self.company
end


function User:getPositionAtCompany()
        return self.positionAtCompany
end


function User:getMainEmail()
        return self.mainEmail
end


function User:getSecondaryEmail()
        return self.secondaryEmail
end


function User:getHomePhone()
        return self.homePhone
end


function User:getCellPhone()
        return self.cellPhone
end


function User:getWorkPhone()
        return self.workPhone
end


function User:getOtherContact()
        return self.otherContact
end


function User:getElectronicContact()
        return self.electronicDevice
end


function User:getFax()
        return self.fax
end


function User:getRole()
        return self.role
end


function User:getPermissions()
        return self.permissions
end


function User:getEncryption()
        return self.encryption
end


function User:getSecret()
        return self.secret
end


function User:getPassword()
        return self.password:get()
end


-- throws Exception
function User:toVector()
        local values = BasicArrayListD.new()
        values:add(self.userName)
        values:add(self.prefixName)
        values:add(self.firstName)
        values:add(self.lastName)
        values:add(self.middleName)
        values:add(self.suffixName)
        values:add(self.company)
        values:add(self.positionAtCompany)
        values:add(self.mainEmail)
        values:add(self.secondaryEmail)
        values:add(self.homePhone)
        values:add(self.cellPhone)
        values:add(self.workPhone)
        values:add(self.otherContact)
        values:add(self.electronicDevice)
        values:add(self.fax)
        values:add(tostring(self:getRole()))
        local userConfigurationDomDocumentMapping = UserConfigurationDomDocumentMapping.new(self:getUserConfigurationInterface())
        values:add(userConfigurationDomDocumentMapping:toDomDocumentString())
        values:add(self.permissions)
        values:addAllList(self.password:toVector(self.secret))
        values:add(self.enable_f)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:add(time)
        values:add(time)
        return values
end


-- throws Exception
function User:toHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(UserData.USERNAME, self.userName)
        values:put(UserData.PREFIXNAME, self.prefixName)
        values:put(UserData.FIRSTNAME, self.firstName)
        values:put(UserData.LASTNAME, self.lastName)
        values:put(UserData.MIDDLENAME, self.middleName)
        values:put(UserData.SUFFIXNAME, self.suffixName)
        values:put(UserData.COMPANY, self.company)
        values:put(UserData.POSITIONATCOMPANY, self.positionAtCompany)
        values:put(UserData.MAINEMAIL, self.mainEmail)
        values:put(UserData.SECONDARYEMAIL, self.secondaryEmail)
        values:put(UserData.HOMEPHONE, self.homePhone)
        values:put(UserData.CELLPHONE, self.cellPhone)
        values:put(UserData.WORKPHONE, self.workPhone)
        values:put(UserData.OTHERCONTACT, self.otherContact)
        values:put(UserData.ELECTRONICDEVICE, self.electronicDevice)
        values:put(UserData.FAX, self.fax)
        if not rawequal(self:getRole(), nil) then
            values:put(tostring(UserRoleData.NAME), tostring(self:getRole()))
        end
        local userConfigurationDomDocumentMapping = UserConfigurationDomDocumentMapping.new(self:getUserConfigurationInterface())
        values:put(UserData.CONFIGURATION, userConfigurationDomDocumentMapping:toDomDocumentString())
        values:put(UserData.PERMISSIONS, self.permissions)
        values:putAll(self.password:toHashMap(self.secret))
        values:put(EntryData.getInstance().ENABLE, self.enable_f)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function User:toPasswordHashMap()
        return self.password:toHashMap(self.secret)
end


function User:validateSession(weblisketSession)
        weblisketSession:setAuthenticated()
        weblisketSession:setRole(self:getRole())
        weblisketSession:setUserName(self:getUserName())
end


function User:updateSession(weblisketSession)
end


function User:isSessionValid()
        return true
end


-- throws Exception
function User:getKey()
        return self.userName
end


function User:toValidationInfoDoc()
        return nil
end


function User:toValidationInfoNode(document)
        return nil
end


function User:getUserConfigurationInterface()
        return self.userConfigurationInterface
end


function User:setUserConfigurationInterface(userConfigurationInterface)
        self.userConfigurationInterface = userConfigurationInterface
end

return User

