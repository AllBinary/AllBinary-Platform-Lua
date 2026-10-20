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
-- package org.allbinary.business.context.modules.storefronts

-- local HashMap = require("java.util.HashMap")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local InitSql = require("org.allbinary.business.init.InitSql")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

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

local BasicStoreFrontsEntity = {}
BasicStoreFrontsEntity.__index = BasicStoreFrontsEntity
BasicStoreFrontsEntity.className = "BasicStoreFrontsEntity"
setmetatable(BasicStoreFrontsEntity, {__index = InitSql})

function BasicStoreFrontsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "storefronts"
end


function BasicStoreFrontsEntity.new()
    local self = setmetatable(InitSql.new(UserDbInitInfo.new()), BasicStoreFrontsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTable(self.tableName)
    return self
end


-- throws Exception
function BasicStoreFrontsEntity:getStoreFrontInterface(name)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, name)
        local storeHashMap = InitSql.getRow(self, keysAndValues)
        if storeHashMap == nil then
            error(java_exception("Exception", "No Such Store: " .. name), 0)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().FACTORYERROR) then
            self.logUtil:putF("StoreFront: " .. tostring(storeHashMap), self, "getStore()")
        end
        return BasicStoreFront.new(storeHashMap)
end

return BasicStoreFrontsEntity

