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
-- package org.allbinary.data.tables.staticpages

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StaticPagesDbInitInfo = require("org.allbinary.business.init.db.StaticPagesDbInitInfo")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SearchData = require("org.allbinary.logic.control.search.SearchData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StaticPagesEntityInterface = require("org.allbinary.data.tables.staticpages.StaticPagesEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StaticPagesEntity = {}
StaticPagesEntity.__index = StaticPagesEntity
StaticPagesEntity.className = "StaticPagesEntity"
setmetatable(StaticPagesEntity, {__index = AbSqlBean})

function StaticPagesEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.TABLENAME = "staticpages"
end


function StaticPagesEntity.new()
    local self = setmetatable(AbSqlBean.new(StaticPagesDbInitInfo.new()), StaticPagesEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.TABLENAME)
    return self
end


function StaticPagesEntity:insert(values)
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


function StaticPagesEntity:getFile(store, keywords)
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(StoreFrontData.getInstance().NAME, store)
        whereHashMap:put(self.basicItemData.KEYWORDS, keywords)
        local file = AbSqlBean.getField(self, whereHashMap, SearchData.PAGE)
        return file
end


function StaticPagesEntity:delete(keywords)
        AbSqlBean.deleteWhere(self, self.basicItemData.KEYWORDS, keywords)
end


function StaticPagesEntity:dropTable()
        local returnStr = AbSqlBean.dropTable(self)
        return returnStr
end


function StaticPagesEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, self.basicItemData.KEYWORDS, updatedValues:get(self.basicItemData.KEYWORDS), updatedValues)
end


function StaticPagesEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.TABLENAME):append(self.sqlStrings.START):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.SIXTY_CHAR_COLUMN_NOT_NULL):append(self.basicItemData.KEYWORDS):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(SearchData.PAGE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(StoreFrontData.getInstance().NAME):append(CommonSeps.getInstance().COMMA_SEP):append(self.basicItemData.KEYWORDS):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function StaticPagesEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end

return StaticPagesEntity

