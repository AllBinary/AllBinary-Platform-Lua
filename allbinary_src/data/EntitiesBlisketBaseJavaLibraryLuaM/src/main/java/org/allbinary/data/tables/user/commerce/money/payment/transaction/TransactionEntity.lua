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

local TransactionEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntity"] = TransactionEntity

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
local PaymentTransactionInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface")
local PaymentTransactionKeysFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransactionEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityInterface")

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

-- class table TransactionEntity is declared before the requires
TransactionEntity.__index = TransactionEntity
TransactionEntity.className = "TransactionEntity"
TransactionEntity.javaClassName = "org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntity"
setmetatable(TransactionEntity, {__index = AbSqlBean})
TransactionEntity.java_implements = " TransactionEntityInterface "
TransactionEntity.java_interfaces = function() return {TransactionEntityInterface} end

function TransactionEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "vtrans"
end


function TransactionEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    TransactionEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function TransactionEntity.new(...)
    local self = setmetatable({}, TransactionEntity)
    TransactionEntity._jinit(self, ...)
    return self
end


function TransactionEntity:remove(userName, orderNumber)
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
java_overload(TransactionEntity, "remove", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function TransactionEntity:add(userName, orderNumber, paymentTransactionInterface)
        local try_ok, try_error, try_value = pcall(function()
            local values = BasicArrayListD.new()
            values:add(orderNumber)
            values:add(userName)
            values:addAllList(paymentTransactionInterface:toVector())
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
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
java_overload(TransactionEntity, "add", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "PaymentTransactionInterface")) end)


function TransactionEntity:createTableStatement()
        local paymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(OrderData.ID):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TRXTYPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TENDER)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ACCT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXPDATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AUTHCODE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.MICR)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CHECKNUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.NAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.STREET)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CITY)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.STATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ZIP)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DL)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EMAIL)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COMMENT1)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COMMENT2)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ORIGID)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PONUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DESC)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DESC1TO4)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.INVNUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOZIP)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SWIPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TAXAMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COMMCARD)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DUTYAMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.FREIGHTAMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ORDERDATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TAXEXEMPT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COUNTRYCODE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CUSTCODE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CVV2)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ABA)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ACCTTYPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DISCOUNT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.FIRSTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.LASTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPFROMZIP)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PRENOTE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CHKTYPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DOB)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PHONENUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SS)):append(" VARCHAR(30) NOT NULL,"):append(tostring(paymentTransactionKeysFactory.COMPANYNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COUNTRY)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOCITY)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOFIRSTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOLASTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOSTATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOSTREET)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SPECIAL1)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SPECIAL2)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SPECIAL3)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(OrderData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(TransactionEntity, "createTableStatement", 0)


function TransactionEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(TransactionEntity, "createTable", 0)


function TransactionEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(TransactionEntity, "dropTable", 0)

return TransactionEntity

