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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local EntryData = require("org.allbinary.business.entry.EntryData")
local Portion = require("org.allbinary.business.installer.Portion")
local NewUserFactory = require("org.allbinary.business.user.NewUserFactory")
local UserData = require("org.allbinary.business.user.UserData")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserName = require("org.allbinary.business.user.username.UserName")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Table = require("admin.taghelpers.Table")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserHelper = {}
UserHelper.__index = UserHelper
UserHelper.className = "UserHelper"
setmetatable(UserHelper, {__index = Table})

function UserHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = nil
    self.pageContext = nil
    self.request = nil
    self.path = nil
    self.portion = nil
end


function UserHelper.new(hashMap, pageContext)
    local self = setmetatable(Table.new(), UserHelper)
    self:_init_fields()
        self.hashMap = hashMap
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        self.path = self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH
        self.portion = Portion.new(hashMap)
    return self
end


function UserHelper:delete()
        local try_ok, try_error = pcall(function()
            local requestHashMap = RequestParams.new(self.request):toHashMap()
            local userName = UserName.new(requestHashMap)
            UserEntityFactory.getInstance():deleteWhere(UserData.USERNAME, userName:get())
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Successfully Removed the user with ")
            stringBuffer:append(UserData.USERNAME)
            stringBuffer:append("=")
            stringBuffer:append(userName:get())
            stringBuffer:append(" from to the user table")
            local success = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to remove user with " .. tostring(UserData.USERNAME) .. " from User table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
end


-- throws Exception
function UserHelper:insert()
        local try_ok, try_error = pcall(function()
            local userInterface = NewUserFactory.getInstance(self.request, self.hashMap)
            local enable = self.hashMap:get(EntryData.getInstance().ENABLE)
            if not StringValidationUtil.getInstance():isEmpty(enable) then
                userInterface:setEnable(enable)
            end
            local values = userInterface:toVector()
            UserEntityFactory.getInstance():insert(values)
            local success = "New User Successfully added to the Users Table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "add()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add User"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error
        end
end


function UserHelper:update()
        local try_ok, try_error = pcall(function()
            local user = NewUserFactory.getInstance(self.request, self.hashMap)
            local values = user:toHashMap()
            UserEntityFactory.getInstance():update(user:getUserName(), values)
            local success = "New User Successfully added to the Users Table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add User"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


function UserHelper:drop()
        local try_ok, try_error = pcall(function()
            local success = UserEntityFactory.getInstance():dropTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop user table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function UserHelper:create()
        local try_ok, try_error = pcall(function()
            local success = UserEntityFactory.getInstance():createTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF(success, self, "create()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create user table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function UserHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(UserEntityFactory.getInstance(), self.portion)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "restore()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to restore backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
end


function UserHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(UserEntityFactory.getInstance())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF(success, self, "backup()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to make backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
end

return UserHelper

