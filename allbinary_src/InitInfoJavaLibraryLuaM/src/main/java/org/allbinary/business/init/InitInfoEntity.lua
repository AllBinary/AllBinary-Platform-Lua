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
-- package org.allbinary.business.init

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local InitSql = require("org.allbinary.business.init.InitSql")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InitInfoEntity = {}
InitInfoEntity.__index = InitInfoEntity
InitInfoEntity.className = "InitInfoEntity"
setmetatable(InitInfoEntity, {__index = InitSql})

function InitInfoEntity:_init_fields()
    self.NAME = "InitInfoEntity"
    self.NOTHING = "NOTHING"
    self.tableName = "initdata"
    self.tableData = nil
    self.NOT_IN_DB = "Not In DB"
    self.METHOD_GET = "get()"
    self.METHOD_IS = "is()"
    self.METHOD_ADD = "add()"
    self.CREATED_SUCCESS = " Created Successfully"
    self.FAILED_TO_CREATE = "Failed to create "
end


function InitInfoEntity.new()
    local self = setmetatable(InitSql.new(UserDbInitInfo.new()), InitInfoEntity)
    self:_init_fields()
        -- super(...) made self above
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(self.NOTHING)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(InitInfo.getInstance().TESTING)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(InitInfo.getInstance().TESTHTMLPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(InitInfo.getInstance().MAINPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(self.NOTHING)
        stringBuffer:append(self.sqlStrings.END)
        self.tableData = tostring(stringBuffer)
        self:setTable(self.tableName)
    return self
end


function InitInfoEntity:get()
        local try_ok, try_error = pcall(function()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(self.NOTHING, self.NOTHING)
            local hashMap = self:getRow(keyAndValue)
            if hashMap ~= nil then
                InitInfo.getInstance():set(hashMap)
                return true
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                    PreLogUtil.put(self.NOT_IN_DB, self.NAME, self.METHOD_GET)
                end
                return false
            end
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.NAME, self.METHOD_GET, e)
            end
            return false
        end
end


function InitInfoEntity:is()
        local try_ok, try_error = pcall(function()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(self.NOTHING, self.NOTHING)
            local hashMap = self:getRow(keyAndValue)
            if hashMap ~= nil then
                return true
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                    PreLogUtil.put(self.NOT_IN_DB, self.NAME, self.METHOD_IS)
                end
                return false
            end
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.NAME, self.METHOD_IS, e)
            end
            return false
        end
end


function InitInfoEntity:update()
        self:updateWhere(self.NOTHING, self.NOTHING, InitInfo.getInstance():toHashMap())
end


function InitInfoEntity:add()
        local try_ok, try_error = pcall(function()
            local values = BasicArrayListD.new()
            values:add(self.NOTHING)
            values:add(InitInfo.getInstance():getTesting())
            values:add(InitInfo.getInstance():getTestHtmlPath())
            values:add(InitInfo.getInstance():getMainPath())
            self:insert(values)
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.NAME, self.METHOD_ADD, e)
            end
        end
end


function InitInfoEntity:createTable()
        if InitSql.createTable(self, self.tableData) then
            return self.tableName .. self.CREATED_SUCCESS
        else
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.FAILED_TO_CREATE)
            stringBuffer:append(self.tableData)
            stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
            return tostring(stringBuffer)
        end
end

return InitInfoEntity

