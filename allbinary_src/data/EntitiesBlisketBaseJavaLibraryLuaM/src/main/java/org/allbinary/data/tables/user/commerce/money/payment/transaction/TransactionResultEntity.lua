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
-- package org.allbinary.data.tables.user.commerce.money.payment.transaction

local TransactionResultEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntity"] = TransactionResultEntity

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
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local PaymentTransactionKeysFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory")
local TransactionResult = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResult")
local TransactionResultInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransactionResultEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntityInterface")

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

-- class table TransactionResultEntity is declared before the requires
TransactionResultEntity.__index = TransactionResultEntity
TransactionResultEntity.className = "TransactionResultEntity"
TransactionResultEntity.javaClassName = "org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntity"
setmetatable(TransactionResultEntity, {__index = AbSqlBean})
TransactionResultEntity.java_implements = " TransactionResultEntityInterface "
TransactionResultEntity.java_interfaces = function() return {TransactionResultEntityInterface} end

function TransactionResultEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "vresults"
end


function TransactionResultEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    TransactionResultEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function TransactionResultEntity.new(...)
    local self = setmetatable({}, TransactionResultEntity)
    TransactionResultEntity._jinit(self, ...)
    return self
end


function TransactionResultEntity:remove(userName, orderNumber)
        local try_ok, try_error, try_value = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(OrderData.ID, orderNumber)
            whereHashMap:put(UserData.USERNAME, userName)
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
java_overload(TransactionResultEntity, "remove", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function TransactionResultEntity:add(userName, orderNumber, transactionResultInterface)
        local try_ok, try_error, try_value = pcall(function()
            local values = BasicArrayListD.new()
            values:add(orderNumber)
            values:add(userName)
            values:addAllList(transactionResultInterface:getValues())
            local calendar = Calendar.getInstance()
            local time = tostring(calendar:getTimeInMillis())
            values:add(time)
            values:add(time)
            java_super(AbSqlBean, "insert", 1)(self, values)
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
java_overload(TransactionResultEntity, "add", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "TransactionResultInterface")) end)


function TransactionResultEntity:getTransactionResultInterface(orderNumber)
        local try_ok, try_error, try_value = pcall(function()
            local resultHashMap = StdUtil.getInstance():createHashMap()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            updateKeyAndValue:put(OrderData.ID, orderNumber)
            resultHashMap = java_super(AbSqlBean, "getRow", 1)(self, updateKeyAndValue)
            if not rawequal(resultHashMap, nil) then
                local transactionResult = TransactionResult.new(resultHashMap)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getTransactionResultInterface")
                end
                do return "__jreturn", transactionResult end
            else
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getTransactionResultInterface", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TransactionResultEntity, "getTransactionResultInterface", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransactionResultEntity:createTableStatement()
        local paymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(OrderData.ID):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.RESULT)):append(self.sqlTypeStrings.MAX_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PNREF)):append(self.sqlTypeStrings.TWELVE_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.RESPMSG)):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AUTHCODE)):append(self.sqlTypeStrings.SIX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AVSADDR)):append(self.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.AVSZIP)):append(self.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ORIGRESULT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.STATUS)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.FRAUDCODE)):append(self.sqlTypeStrings.TWO_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.FRAUDMSG)):append(self.sqlTypeStrings.MAX_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.ERRCODE)):append(self.sqlTypeStrings.MAX_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.SCORE)):append(self.sqlTypeStrings.THREE_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.REASON1)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.REASON2)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.REASON3))
        stringBuffer:append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION1)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION2)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION3)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION4)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION5)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION6)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION7)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(OrderData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(TransactionResultEntity, "createTableStatement", 0)


function TransactionResultEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(TransactionResultEntity, "createTable", 0)


function TransactionResultEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(TransactionResultEntity, "dropTable", 0)

return TransactionResultEntity

