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
-- package org.allbinary.data.tables.category

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Category = require("org.allbinary.business.category.Category")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CategoryEntityInterface = require("org.allbinary.data.tables.category.CategoryEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryEntity = {}
CategoryEntity.__index = CategoryEntity
CategoryEntity.className = "CategoryEntity"
setmetatable(CategoryEntity, {__index = AbSqlBean})

function CategoryEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "categories"
end

function CategoryEntity.new(...)
    local count = select("#", ...)
    if count == 1 then return CategoryEntity._new1(...)
    elseif count == 0 then return CategoryEntity._new0(...)
    end
end


function CategoryEntity._new1(categoryFactoryInterface)
    local self = setmetatable(AbSqlBean.new(InventoryDbInitInfo.new()), CategoryEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function CategoryEntity._new0()
    local self = setmetatable(AbSqlBean.new(InventoryDbInitInfo.new()), CategoryEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function CategoryEntity:insert(category)
        local try_ok, try_error = pcall(function()
            local categoryVector = category:toVector()
            local values = BasicArrayListD.new()
            values:add(categoryVector:get(0))
            values:add(categoryVector:get(1))
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


function CategoryEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, CategoryData.getInstance().NAME, value)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.commonStrings.delete)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
            end
        end
end


function CategoryEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(CategoryData.getInstance().NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(CategoryData.getInstance().LEVEL)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(CategoryData.getInstance().NAME)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function CategoryEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function CategoryEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, CategoryData.getInstance().NAME, updatedValues:get(CategoryData.getInstance().NAME), updatedValues)
end


function CategoryEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return CategoryEntity

