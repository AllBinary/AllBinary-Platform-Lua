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

local UserEntity = {}
package.loaded["org.allbinary.data.tables.user.UserEntity"] = UserEntity

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
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local CreateUserFactory = java_lazy("org.allbinary.business.user.CreateUserFactory")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local User = java_lazy("org.allbinary.business.user.modules.User")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserRoleData = java_lazy("org.allbinary.business.user.role.UserRoleData")
local UserRoleFactory = java_lazy("org.allbinary.business.user.role.UserRoleFactory")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local UserEntityInterface = require("org.allbinary.data.tables.user.UserEntityInterface")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table UserEntity is declared before the requires
UserEntity.__index = UserEntity
UserEntity.className = "UserEntity"
UserEntity.javaClassName = "org.allbinary.data.tables.user.UserEntity"
setmetatable(UserEntity, {__index = AbSqlBean})
UserEntity.java_implements = " UserEntityInterface "
UserEntity.java_interfaces = function() return {UserEntityInterface} end

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


function UserEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    UserEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function UserEntity.new(...)
    local self = setmetatable({}, UserEntity)
    UserEntity._jinit(self, ...)
    return self
end


function UserEntity:insert(values)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "insert", 1)(self, values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end
java_overload(UserEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function UserEntity:getAdministrators()
        return self:getUsersWithRole(UserRoleFactory.getInstance().ADMINISTRATOR)
end
java_overload(UserEntity, "getAdministrators", 0)


-- throws Exception
function UserEntity:getStoreManagers(storeFrontInterface)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local usersVector = BasicArrayListD.new()
        keysAndValues:put(tostring(UserRoleData.NAME), tostring(UserRoleFactory.getInstance().STOREMANAGER))
        keysAndValues:put(UserData.PERMISSIONS, storeFrontInterface:getName())
        local usersHashMapVector = java_super(AbSqlBean, "getRows", 1)(self, keysAndValues)
        local size = usersHashMapVector:size()
        for i = 0, size - 1 do
            local userHashMap = usersHashMapVector:get(i)
            if not rawequal(userHashMap, nil) then
                usersVector:add(User.new(userHashMap))
            end
        end
        return usersVector
end
java_overload(UserEntity, "getStoreManagers", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StoreFrontInterface")) end)


-- throws Exception
function UserEntity:getCustomers()
        return self:getUsersWithRole(UserRoleFactory.getInstance().CUSTOMER)
end
java_overload(UserEntity, "getCustomers", 0)


-- throws Exception
function UserEntity:getUsersWithRole(userRole)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local usersVector = BasicArrayListD.new()
        keysAndValues:put(tostring(UserRoleData.NAME), tostring(userRole))
        local usersHashMapVector = java_super(AbSqlBean, "getRows", 1)(self, keysAndValues)
        local size = usersHashMapVector:size()
        for index = 0, size - 1 do
            local userHashMap = usersHashMapVector:get(index)
            if not rawequal(userHashMap, nil) then
                usersVector:add(User.new(userHashMap))
            end
        end
        return usersVector
end
java_overload(UserEntity, "getUsersWithRole", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "UserRole")) end)


-- throws Exception
function UserEntity:getUsers(storeFrontInterface)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local usersVector = BasicArrayListD.new()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeFrontInterface:getName())
        local usersHashMapVector = java_super(AbSqlBean, "getRows", 1)(self, keysAndValues)
        local size = usersHashMapVector:size()
        for index = 0, size - 1 do
            local userHashMap = usersHashMapVector:get(index)
            if not rawequal(userHashMap, nil) then
                usersVector:add(User.new(userHashMap))
            end
        end
        return usersVector
end
java_overload(UserEntity, "getUsers", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StoreFrontInterface")) end)


-- throws Exception
function UserEntity:getUser(userName)
        local row = StdUtil.getInstance():createHashMap()
        row:put(UserData.USERNAME, userName)
        local userHashMap = java_super(AbSqlBean, "getRow", 1)(self, row)
        if not rawequal(userHashMap, nil) then
            return CreateUserFactory.getInstance(userHashMap)
        else
            return nil
        end
end
java_overload(UserEntity, "getUser", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function UserEntity:deleteWhere(key, value)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "deleteWhere", 2)(self, key, value)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "deleteWhere")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "deleteWhere", e)
            end
        end
end
java_overload(UserEntity, "deleteWhere", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function UserEntity:login(userName, password)
        local try_ok, try_error, try_value = pcall(function()
            local isUserNameAndPasswordCorrect = 0
            local result = java_super(AbSqlBean, "getField", 3)(self, UserData.USERNAME, userName, UserData.PASSWORD)
            local encryption = java_super(AbSqlBean, "getField", 3)(self, UserData.USERNAME, userName, EntryData.getInstance().ENCRYPTION)
            if not rawequal(encryption, nil) and not rawequal(((encryption < self.stringUtil.EMPTY_STRING and -1) or (encryption > self.stringUtil.EMPTY_STRING and 1) or 0), 0) then
                isUserNameAndPasswordCorrect = ((result < SuperCrypt.new(require("allbinary_java").number_value(encryption, "intValue")):encrypt(password) and -1) or (result > SuperCrypt.new(require("allbinary_java").number_value(encryption, "intValue")):encrypt(password) and 1) or 0)
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("Command Success but login failed for user: ") .. require("allbinary_java").to_string(userName)) .. require("allbinary_java").to_string(" because user did not exist"), self, "login")
                end
                do return "__jreturn", GLOBALS2.LOGINFAILED end
            end
            if rawequal(isUserNameAndPasswordCorrect, 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self.COMMAND_SUCCESS_FOR_USER)
                    stringBuffer:append(userName)
                    stringBuffer:append(self.PASSWORD_LABEL)
                    stringBuffer:append(password)
                    stringBuffer:append(self.EQUALS)
                    stringBuffer:append(result)
                    self.logUtil:putF(tostring(stringBuffer), self, "login")
                end
                do return "__jreturn", GLOBALS2.LOGINSUCCESS end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self.COMMAND_SUCCESS_BUT_LOGIN_FAILED)
                    stringBuffer:append(userName)
                    stringBuffer:append(self.INVALID_PASSWORD_LABEL)
                    stringBuffer:append(SuperCrypt.new(require("allbinary_java").number_value(encryption, "intValue")):encrypt(password))
                    stringBuffer:append(self.NOT_EQUAL)
                    stringBuffer:append(result)
                    stringBuffer:append(self.END_QUOTES)
                    self.logUtil:putF(tostring(stringBuffer), self, "login")
                end
                do return "__jreturn", GLOBALS2.LOGINFAILED end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "login", e)
            end
            return "Error"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(UserEntity, "login", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function UserEntity:update(userName, updatedValues)
        java_super(AbSqlBean, "updateWhere", 3)(self, UserData.USERNAME, userName, updatedValues)
end
java_overload(UserEntity, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "HashMap")) end)


function UserEntity:dropTables()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(UserEntity, "dropTables", 0)


function UserEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.PREFIXNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.FIRSTNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.LASTNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.MIDDLENAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.SUFFIXNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.COMPANY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.POSITIONATCOMPANY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.MAINEMAIL):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.SECONDARYEMAIL):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.HOMEPHONE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.CELLPHONE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.WORKPHONE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.OTHERCONTACT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.ELECTRONICDEVICE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.FAX):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(tostring(UserRoleData.NAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.CONFIGURATION):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(UserData.PERMISSIONS):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(entryData.ENCRYPTION):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(UserData.SECRET):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(UserData.PASSWORD):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.ENABLE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(entryData.TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(UserData.USERNAME):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(UserEntity, "createTableStatement", 0)


function UserEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(UserEntity, "createTable", 0)


function UserEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(UserEntity, "dropTable", 0)

return UserEntity

