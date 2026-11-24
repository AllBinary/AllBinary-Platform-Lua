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
-- package org.allbinary.data.tables.user.address

local StreetAddressesEntity = {}
package.loaded["org.allbinary.data.tables.user.address.StreetAddressesEntity"] = StreetAddressesEntity

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
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = java_lazy("org.allbinary.business.user.address.StreetAddressData")
local TableDataFactory = java_lazy("org.allbinary.data.tables.TableDataFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StreetAddressesEntityInterface = require("org.allbinary.data.tables.user.address.StreetAddressesEntityInterface")

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

-- class table StreetAddressesEntity is declared before the requires
StreetAddressesEntity.__index = StreetAddressesEntity
StreetAddressesEntity.className = "StreetAddressesEntity"
StreetAddressesEntity.javaClassName = "org.allbinary.data.tables.user.address.StreetAddressesEntity"
setmetatable(StreetAddressesEntity, {__index = AbSqlBean})
StreetAddressesEntity.java_implements = " StreetAddressesEntityInterface "
StreetAddressesEntity.java_interfaces = function() return {StreetAddressesEntityInterface} end

function StreetAddressesEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.userName == nil then self.userName = nil end
end

function StreetAddressesEntity._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return StreetAddressesEntity._new0(self, ...)
    elseif count == 1 then return StreetAddressesEntity._new1(self, ...)
    end
    error("No constructor of StreetAddressesEntity takes " .. count .. " arguments")
end

function StreetAddressesEntity.new(...)
    local self = setmetatable({}, StreetAddressesEntity)
    StreetAddressesEntity._jinit(self, ...)
    return self
end


function StreetAddressesEntity._new0(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    StreetAddressesEntity._init_fields(self)
        -- super(...) made self above
    return self
end


function StreetAddressesEntity._new1(self, userName)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    StreetAddressesEntity._init_fields(self)
        -- super(...) made self above
        self.userName = userName
    return self
end


function StreetAddressesEntity:remove(index)
        local try_ok, try_error, try_value = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(UserData.USERNAME, self.userName)
            whereHashMap:put(StreetAddressData.ID, tostring(index))
            java_super(AbSqlBean, "deleteWhere", 1)(self, whereHashMap)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "remove")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "remove", e)
            end
        end
end
java_overload(StreetAddressesEntity, "remove", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function StreetAddressesEntity:add_j1(address)
        self:add(address, TableDataFactory.getInstance().INTEGER_MAX_VALUE_STRING)
end


function StreetAddressesEntity:add_j2(address, index)
        local try_ok, try_error, try_value = pcall(function()
            local values = BasicArrayListD.new()
            values:add(index)
            values:add(self.userName)
            values:add(StringUtil.getInstance().EMPTY_STRING)
            values:add(address:getName())
            values:add(address:getStreet())
            values:add(address:getCity())
            values:add(address:getState())
            values:add(address:getCode())
            values:add(address:getCountry())
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            values:add(time)
            java_super(AbSqlBean, "insert", 1)(self, values)
            self:setDefault(self:getLastId())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "add")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "add", e)
            end
        end
end
function StreetAddressesEntity:add(...)
    local count = select("#", ...)
    if count == 1 then return self:add_j1(...) end
    if count == 2 then return self:add_j2(...) end
    error("No method add takes " .. count .. " arguments")
end
StreetAddressesEntity.add__jdispatcher = StreetAddressesEntity.add


function StreetAddressesEntity:update(address)
        local try_ok, try_error, try_value = pcall(function()
            local addressHashMap = address:toHashMap()
            local whereKeyValuePairs = StdUtil.getInstance():createHashMap()
            whereKeyValuePairs:put(StreetAddressData.ID, address:getId())
            whereKeyValuePairs:put(UserData.USERNAME, self.userName)
            java_super(AbSqlBean, "updateWhere", 2)(self, whereKeyValuePairs, addressHashMap)
            self:setDefault(address:getId())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "update")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "add", e)
            end
        end
end
java_overload(StreetAddressesEntity, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StreetAddress")) end)


function StreetAddressesEntity:getLastId()
        return java_super(AbSqlBean, "getLargestIntegerInColumnWhere", 3)(self, StreetAddressData.ID, UserData.USERNAME, self.userName)
end
java_overload(StreetAddressesEntity, "getLastId", 0)


function StreetAddressesEntity:get_j0()
        local try_ok, try_error, try_value = pcall(function()
            local streetAddressVector = BasicArrayListD.new()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(UserData.USERNAME, self.userName)
            local addressList = java_super(AbSqlBean, "getRows", 1)(self, keyAndValue)
            local size = addressList:size()
            for index = 0, size - 1 do
                local addressHashMap = addressList:get(index)
                local streetAddress = StreetAddress.new(addressHashMap)
                if streetAddress ~= nil then
                    streetAddressVector:add(streetAddress)
                end
            end
            do return "__jreturn", streetAddressVector end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StreetAddressesEntity:get_j1(index)
        local try_ok, try_error, try_value = pcall(function()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(UserData.USERNAME, self.userName)
            keyAndValue:put(StreetAddressData.ID, tostring(index))
            local addressHashMap = java_super(AbSqlBean, "getRow", 1)(self, keyAndValue)
            if addressHashMap ~= nil then
                do return "__jreturn", StreetAddress.new(addressHashMap) end
            else
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function StreetAddressesEntity:get(...)
    local count = select("#", ...)
    if count == 0 then return self:get_j0(...) end
    if count == 1 then return self:get_j1(...) end
    error("No method get takes " .. count .. " arguments")
end
StreetAddressesEntity.get__jdispatcher = StreetAddressesEntity.get


function StreetAddressesEntity:getDefault()
        local try_ok, try_error, try_value = pcall(function()
            local addressHashMap = StdUtil.getInstance():createHashMap()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            updateKeyAndValue:put(StreetAddressData.DEFAULT, StreetAddressData.DEFAULT)
            updateKeyAndValue:put(UserData.USERNAME, self.userName)
            addressHashMap = java_super(AbSqlBean, "getRow", 1)(self, updateKeyAndValue)
            if addressHashMap ~= nil then
                local streetAddress = StreetAddress.new(addressHashMap)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getDefault")
                end
                do return "__jreturn", streetAddress end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF("No Default Address Found", self, "getDefault")
                end
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getDefault", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StreetAddressesEntity, "getDefault", 0)


function StreetAddressesEntity:setDefault(value)
        local try_ok, try_error, try_value = pcall(function()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            local whereKeyAndValue = StdUtil.getInstance():createHashMap()
            whereKeyAndValue:put(UserData.USERNAME, self.userName)
            local streetAddress = self:getDefault()
            if streetAddress ~= nil then
                updateKeyAndValue:put(StreetAddressData.DEFAULT, StringUtil.getInstance().EMPTY_STRING)
                whereKeyAndValue:put(StreetAddressData.ID, streetAddress:getId())
                java_super(AbSqlBean, "updateWhere", 2)(self, whereKeyAndValue, updateKeyAndValue)
            end
            whereKeyAndValue:put(StreetAddressData.ID, value)
            updateKeyAndValue:put(StreetAddressData.DEFAULT, StreetAddressData.DEFAULT)
            java_super(AbSqlBean, "updateWhere", 2)(self, whereKeyAndValue, updateKeyAndValue)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "setDefault")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setShippingAddress", e)
            end
        end
end
java_overload(StreetAddressesEntity, "setDefault", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function StreetAddressesEntity:getUserName()
        return self.userName
end
java_overload(StreetAddressesEntity, "getUserName", 0)


function StreetAddressesEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self:getTableName()):append(self.sqlStrings.START):append(StreetAddressData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StreetAddressData.DEFAULT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StreetAddressData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StreetAddressData.STREET):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.CITY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.STATE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.CODE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.COUNTRY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(StreetAddressData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(StreetAddressesEntity, "createTableStatement", 0)


function StreetAddressesEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(StreetAddressesEntity, "createTable", 0)


function StreetAddressesEntity:drop()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(StreetAddressesEntity, "drop", 0)


function StreetAddressesEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(StreetAddressesEntity, "dropTable", 0)

return StreetAddressesEntity

