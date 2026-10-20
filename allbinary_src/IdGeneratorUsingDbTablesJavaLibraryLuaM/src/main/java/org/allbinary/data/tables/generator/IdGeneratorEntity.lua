-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.data.tables.generator

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local IdGeneratorEntityInterface = require("org.allbinary.data.tables.generator.IdGeneratorEntityInterface")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IdGeneratorEntity = {}
IdGeneratorEntity.__index = IdGeneratorEntity
IdGeneratorEntity.className = "IdGeneratorEntity"
setmetatable(IdGeneratorEntity, {__index = AbSqlBean})

function IdGeneratorEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "idgenerator"
    self.tableData = nil
    self.NAME = "NAME"
    self.VALUE = "VALUE"
end


function IdGeneratorEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), IdGeneratorEntity)
    self:_init_fields()
        -- super(...) made self above
        self.tableData = tostring(StringMaker.new():append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(self.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(self.VALUE):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(self.NAME):append(self.sqlStrings.END))
        AbSqlBean.setTableName(self, self.tableName)
    return self
end


-- throws Exception
function IdGeneratorEntity:get(name)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(self.NAME, name)
        local hashMap = AbSqlBean.getRow(self, keysAndValues)
        if (hashMap:get(self.NAME)):compareTo(name) ~= 0 then
            error(java_exception("Exception", "results do not match"), 0)
        end
        local value = hashMap:get(self.VALUE)
        return math.tointeger(tonumber(value))
end


function IdGeneratorEntity:insert(values)
        local try_ok, try_error = pcall(function()
            AbSqlBean.insert(self, values)
            self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
        end
end


function IdGeneratorEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, self.NAME, value)
            self.logUtil:putF(self.commonStrings.SUCCESS, self, self.commonStrings.delete)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
        end
end


function IdGeneratorEntity:update(name, value)
        local map = StdUtil.getInstance():createHashMap()
        map:put(self.NAME, name)
        map:put(self.VALUE, value)
        self:update(map)
end


-- Java overloaded method: Lua keeps the last definition
function IdGeneratorEntity:update(hashMap)
        AbSqlBean.updateWhere(self, self.NAME, hashMap:get(self.NAME), hashMap)
end


function IdGeneratorEntity:createTable()
        local returnStr = AbSqlBean.createTable(self, self.tableData)
        return returnStr
end


function IdGeneratorEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return IdGeneratorEntity

