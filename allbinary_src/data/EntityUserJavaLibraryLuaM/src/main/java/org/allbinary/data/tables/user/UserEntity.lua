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
-- package org.allbinary.data.tables.user

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local CreateUserFactory = require("org.allbinary.business.user.CreateUserFactory")
local UserData = require("org.allbinary.business.user.UserData")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local User = require("org.allbinary.business.user.modules.User")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local UserRoleFactory = require("org.allbinary.business.user.role.UserRoleFactory")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local UserEntityInterface = require("org.allbinary.data.tables.user.UserEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEntity = {}
UserEntity.__index = UserEntity
UserEntity.className = "UserEntity"
setmetatable(UserEntity, {__index = AbSqlBean})

function UserEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "user"
    self.COMMAND_SUCCESS_FOR_USER = "Command Success for user: "
    self.PASSWORD_LABEL = " Password: "
    self.EQUALS = "=="
    self.COMMAND_SUCCESS_BUT_LOGIN_FAILED = "Command Success but login failed for user: "
    self.INVALID_PASSWORD_LABEL = " Password: \n\""
    self.NOT_EQUAL = "\"!=\""
    self.END_QUOTES = CommonSeps.getInstance().QUOTE
end


function UserEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), UserEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function UserEntity:insert(values)
        local try_ok, try_error = pcall(function()
            AbSqlBean.insert(self, values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end


-- throws Exception
function UserEntity:getAdministrators()
        return self:getUsersWithRole(UserRoleFactory.getInstance().ADMINISTRATOR)
end


-- throws Exception
function UserEntity:getStoreManagers(storeFrontInterface)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local usersVector = BasicArrayListD.new()
        keysAndValues:put(tostring(UserRoleData.NAME), tostring(UserRoleFactory.getInstance().STOREMANAGER))
        keysAndValues:put(UserData.PERMISSIONS, storeFrontInterface:getName())
        local usersHashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local size = usersHashMapVector:size()
        for i = 0, size - 1 do
            local userHashMap = usersHashMapVector:get(i)
            if userHashMap ~= nil then
                usersVector:add(User.new(userHashMap))
            end
        end
        return usersVector
end


-- throws Exception
function UserEntity:getCustomers()
        return self:getUsersWithRole(UserRoleFactory.getInstance().CUSTOMER)
end


-- throws Exception
function UserEntity:getUsersWithRole(userRole)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local usersVector = BasicArrayListD.new()
        keysAndValues:put(tostring(UserRoleData.NAME), tostring(userRole))
        local usersHashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local size = usersHashMapVector:size()
        for index = 0, size - 1 do
            local userHashMap = usersHashMapVector:get(index)
            if userHashMap ~= nil then
                usersVector:add(User.new(userHashMap))
            end
        end
        return usersVector
end


-- throws Exception
function UserEntity:getUsers(storeFrontInterface)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local usersVector = BasicArrayListD.new()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeFrontInterface:getName())
        local usersHashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local size = usersHashMapVector:size()
        for index = 0, size - 1 do
            local userHashMap = usersHashMapVector:get(index)
            if userHashMap ~= nil then
                usersVector:add(User.new(userHashMap))
            end
        end
        return usersVector
end


-- throws Exception
function UserEntity:getUser(userName)
        local row = StdUtil.getInstance():createHashMap()
        row:put(UserData.USERNAME, userName)
        local userHashMap = AbSqlBean.getRow(self, row)
        if userHashMap ~= nil then
            return CreateUserFactory.getInstance(userHashMap)
        else
            return nil
        end
end


function UserEntity:deleteWhere(key, value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, key, value)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "deleteWhere")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "deleteWhere", e)
            end
        end
end


function UserEntity:login(userName, password)
        local try_ok, try_error = pcall(function()
            local isUserNameAndPasswordCorrect = 0
            local result = AbSqlBean.getField(self, UserData.USERNAME, userName, UserData.PASSWORD)
            local encryption = AbSqlBean.getField(self, UserData.USERNAME, userName, EntryData.getInstance().ENCRYPTION)
            if encryption ~= nil and ((encryption < self.stringUtil.EMPTY_STRING and -1) or (encryption > self.stringUtil.EMPTY_STRING and 1) or 0) ~= 0 then
                isUserNameAndPasswordCorrect = ((result < SuperCrypt.new(math.tointeger(encryption // 1)):encrypt(password) and -1) or (result > SuperCrypt.new(math.tointeger(encryption // 1)):encrypt(password) and 1) or 0)
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF("Command Success but login failed for user: " .. userName .. " because user did not exist", self, "login")
                end
                return self.GLOBALS2.LOGINFAILED
            end
            if isUserNameAndPasswordCorrect == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self.COMMAND_SUCCESS_FOR_USER)
                    stringBuffer:append(userName)
                    stringBuffer:append(self.PASSWORD_LABEL)
                    stringBuffer:append(password)
                    stringBuffer:append(self.EQUALS)
                    stringBuffer:append(result)
                    self.logUtil:putF(tostring(stringBuffer), self, "login")
                end
                return self.GLOBALS2.LOGINSUCCESS
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self.COMMAND_SUCCESS_BUT_LOGIN_FAILED)
                    stringBuffer:append(userName)
                    stringBuffer:append(self.INVALID_PASSWORD_LABEL)
                    stringBuffer:append(SuperCrypt.new(math.tointeger(encryption // 1)):encrypt(password))
                    stringBuffer:append(self.NOT_EQUAL)
                    stringBuffer:append(result)
                    stringBuffer:append(self.END_QUOTES)
                    self.logUtil:putF(tostring(stringBuffer), self, "login")
                end
                return self.GLOBALS2.LOGINFAILED
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "login", e)
            end
            return "Error"
        end
end


function UserEntity:update(userName, updatedValues)
        AbSqlBean.updateWhere(self, UserData.USERNAME, userName, updatedValues)
end


function UserEntity:dropTables()
        return AbSqlBean.dropTable(self)
end


function UserEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.PREFIXNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.FIRSTNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.LASTNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.MIDDLENAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.SUFFIXNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.COMPANY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.POSITIONATCOMPANY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.MAINEMAIL):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.SECONDARYEMAIL):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.HOMEPHONE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.CELLPHONE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.WORKPHONE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.OTHERCONTACT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.ELECTRONICDEVICE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.FAX):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(tostring(UserRoleData.NAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.CONFIGURATION):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(UserData.PERMISSIONS):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(entryData.ENCRYPTION):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(UserData.SECRET):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.PASSWORD):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.ENABLE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(entryData.TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(UserData.USERNAME):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function UserEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end

return UserEntity

