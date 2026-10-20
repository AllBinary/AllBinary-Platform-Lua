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

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserConfigurationDomDocumentMapping = require("org.allbinary.business.user.modules.configuration.UserConfigurationDomDocumentMapping")
local UserConfigurationInterface = require("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")
local UserConfigurationInterfaceFactory = require("org.allbinary.business.user.modules.configuration.UserConfigurationInterfaceFactory")
local Password = require("org.allbinary.business.user.password.Password")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleB = require("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local UserName = require("org.allbinary.business.user.username.UserName")
local StdUtil = require("org.allbinary.logic.StdUtil")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSessionData = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local User = {}
User.__index = User
User.className = "User"

function User:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userName = nil
    self.prefixName = nil
    self.firstName = nil
    self.lastName = nil
    self.middleName = nil
    self.suffixName = nil
    self.company = nil
    self.positionAtCompany = nil
    self.mainEmail = nil
    self.secondaryEmail = nil
    self.homePhone = nil
    self.cellPhone = nil
    self.workPhone = nil
    self.otherContact = nil
    self.electronicDevice = nil
    self.fax = nil
    self.role = nil
    self.encryption = nil
    self.secret = nil
    self.password = nil
    self.enable = nil
    self.permissions = nil
    self.userConfigurationInterface = nil
end

function User.new(...)
    local count = select("#", ...)
    if count == 0 then return User._new0(...)
    elseif count == 1 then return User._new1(...)
    elseif count == 1 then return User._new1(...)
    end
end


function User._new0()
    local self = setmetatable({}, User)
    self:_init_fields()
        self.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance()
        self.password = Password.new(StringUtil.getInstance().EMPTY_STRING)
    return self
end


function User._new1(request)
    local self = setmetatable({}, User)
    self:_init_fields()
        self:getFormData(RequestParams.new(request):toHashMap())
        self.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance(self:getRole())
    return self
end


function User._new1(userHashMap)
    local self = setmetatable({}, User)
    self:_init_fields()
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
        if not stringValidationUtil:isEmpty(self.permissions) and ((self.permissions < StoreFrontData.getInstance().NAME and -1) or (self.permissions > StoreFrontData.getInstance().NAME and 1) or 0) == 0 then
            self.permissions = stringUtil:getNonNull(userHashMap:get(StoreFrontData.getInstance().NAME))
        elseif self.permissions == nil then
            self.permissions = "No Permissions"
        end
        self.enable = stringUtil:getNonNull(userHashMap:get(EntryData.getInstance().ENABLE))
end


function User:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if not UserName.getInstance():isValid(self.userName) then
                valid = false
            end
            if not self.password:isValid() then
                valid = false
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            if not stringValidationUtil:isValidRequired(self.firstName, 1, UserData.MAXLEN) then
                valid = false
            end
            if not stringValidationUtil:isValidRequired(self.lastName, 1, UserData.MAXLEN) then
                valid = false
            end
            if not stringValidationUtil:isValidRequired(self.mainEmail, 1, UserData.MAXLEN) or ((string.find(self.mainEmail, "@", 1, true) or 0) - 1) == -1 then
                valid = false
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VALIDATIONERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put("Failed to validate form", self, commonStrings.IS_VALID, e)
            end
            return false
        end
end


function User:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(UserName.getValidationInfo(self.userName))
            stringBuffer:append(self.password:getValidationInfo())
            if not stringValidationUtil:isValidRequired(self.firstName, 1, UserData.MAXLEN) then
                stringBuffer:append("Please enter a valid First Name.<br />")
            end
            if not stringValidationUtil:isValidRequired(self.lastName, 1, UserData.MAXLEN) then
                stringBuffer:append("Please enter a valid Last Name.<br />")
            end
            if not stringValidationUtil:isValidRequired(self.mainEmail, 1, UserData.MAXLEN) or ((string.find(self.mainEmail, "@", 1, true) or 0) - 1) == -1 then
                stringBuffer:append("Please enter a valid email address.<br />")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
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
        self.enable = enable
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
        values:add(self.enable)
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
        if self:getRole() ~= nil then
            values:put(tostring(UserRoleData.NAME), tostring(self:getRole()))
        end
        local userConfigurationDomDocumentMapping = UserConfigurationDomDocumentMapping.new(self:getUserConfigurationInterface())
        values:put(UserData.CONFIGURATION, userConfigurationDomDocumentMapping:toDomDocumentString())
        values:put(UserData.PERMISSIONS, self.permissions)
        values:putAll(self.password:toHashMap(self.secret))
        values:put(EntryData.getInstance().ENABLE, self.enable)
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

