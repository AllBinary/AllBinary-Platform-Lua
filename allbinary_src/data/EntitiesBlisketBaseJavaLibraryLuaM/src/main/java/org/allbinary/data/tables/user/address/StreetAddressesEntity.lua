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

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = require("org.allbinary.business.user.UserData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local TableDataFactory = require("org.allbinary.data.tables.TableDataFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StreetAddressesEntityInterface = require("org.allbinary.data.tables.user.address.StreetAddressesEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StreetAddressesEntity = {}
StreetAddressesEntity.__index = StreetAddressesEntity
StreetAddressesEntity.className = "StreetAddressesEntity"
setmetatable(StreetAddressesEntity, {__index = AbSqlBean})

function StreetAddressesEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userName = nil
end

function StreetAddressesEntity.new(...)
    local count = select("#", ...)
    if count == 0 then return StreetAddressesEntity._new0(...)
    elseif count == 1 then return StreetAddressesEntity._new1(...)
    end
end


function StreetAddressesEntity._new0()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), StreetAddressesEntity)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function StreetAddressesEntity._new1(userName)
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), StreetAddressesEntity)
    self:_init_fields()
        -- super(...) made self above
        self.userName = userName
    return self
end


function StreetAddressesEntity:remove(index)
        local try_ok, try_error = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(UserData.USERNAME, self.userName)
            whereHashMap:put(StreetAddressData.ID, tostring(index))
            AbSqlBean.deleteWhere(self, whereHashMap)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "remove")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "remove", e)
            end
        end
end


function StreetAddressesEntity:add(address)
        self:add(address, TableDataFactory.getInstance().INTEGER_MAX_VALUE_STRING)
end


-- Java overloaded method: Lua keeps the last definition
function StreetAddressesEntity:add(address, index)
        local try_ok, try_error = pcall(function()
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
            AbSqlBean.insert(self, values)
            self:setDefault(self:getLastId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "add")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "add", e)
            end
        end
end


function StreetAddressesEntity:update(address)
        local try_ok, try_error = pcall(function()
            local addressHashMap = address:toHashMap()
            local whereKeyValuePairs = StdUtil.getInstance():createHashMap()
            whereKeyValuePairs:put(StreetAddressData.ID, address:getId())
            whereKeyValuePairs:put(UserData.USERNAME, self.userName)
            AbSqlBean.updateWhere(self, whereKeyValuePairs, addressHashMap)
            self:setDefault(address:getId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "update")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "add", e)
            end
        end
end


function StreetAddressesEntity:getLastId()
        return AbSqlBean.getLargestIntegerInColumnWhere(self, StreetAddressData.ID, UserData.USERNAME, self.userName)
end


function StreetAddressesEntity:get()
        local try_ok, try_error = pcall(function()
            local streetAddressVector = BasicArrayListD.new()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(UserData.USERNAME, self.userName)
            local addressList = AbSqlBean.getRows(self, keyAndValue)
            local size = addressList:size()
            for index = 0, size - 1 do
                local addressHashMap = addressList:get(index)
                local streetAddress = StreetAddress.new(addressHashMap)
                if streetAddress ~= nil then
                    streetAddressVector:add(streetAddress)
                end
            end
            return streetAddressVector
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StreetAddressesEntity:get(index)
        local try_ok, try_error = pcall(function()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(UserData.USERNAME, self.userName)
            keyAndValue:put(StreetAddressData.ID, tostring(index))
            local addressHashMap = AbSqlBean.getRow(self, keyAndValue)
            if addressHashMap ~= nil then
                return StreetAddress.new(addressHashMap)
            else
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


function StreetAddressesEntity:getDefault()
        local try_ok, try_error = pcall(function()
            local addressHashMap = StdUtil.getInstance():createHashMap()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            updateKeyAndValue:put(StreetAddressData.DEFAULT, StreetAddressData.DEFAULT)
            updateKeyAndValue:put(UserData.USERNAME, self.userName)
            addressHashMap = AbSqlBean.getRow(self, updateKeyAndValue)
            if addressHashMap ~= nil then
                local streetAddress = StreetAddress.new(addressHashMap)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getDefault")
                end
                return streetAddress
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF("No Default Address Found", self, "getDefault")
                end
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getDefault", e)
            end
            return nil
        end
end


function StreetAddressesEntity:setDefault(value)
        local try_ok, try_error = pcall(function()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            local whereKeyAndValue = StdUtil.getInstance():createHashMap()
            whereKeyAndValue:put(UserData.USERNAME, self.userName)
            local streetAddress = self:getDefault()
            if streetAddress ~= nil then
                updateKeyAndValue:put(StreetAddressData.DEFAULT, StringUtil.getInstance().EMPTY_STRING)
                whereKeyAndValue:put(StreetAddressData.ID, streetAddress:getId())
                AbSqlBean.updateWhere(self, whereKeyAndValue, updateKeyAndValue)
            end
            whereKeyAndValue:put(StreetAddressData.ID, value)
            updateKeyAndValue:put(StreetAddressData.DEFAULT, StreetAddressData.DEFAULT)
            AbSqlBean.updateWhere(self, whereKeyAndValue, updateKeyAndValue)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "setDefault")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setShippingAddress", e)
            end
        end
end


function StreetAddressesEntity:getUserName()
        return self.userName
end


function StreetAddressesEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self:getTableName()):append(self.sqlStrings.START):append(StreetAddressData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StreetAddressData.DEFAULT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StreetAddressData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StreetAddressData.STREET):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.CITY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.STATE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.CODE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(StreetAddressData.COUNTRY):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(StreetAddressData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function StreetAddressesEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function StreetAddressesEntity:drop()
        return AbSqlBean.dropTable(self)
end

return StreetAddressesEntity

