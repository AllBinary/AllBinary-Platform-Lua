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
-- package org.allbinary.data.tables.user.commerce.money.payment.gateway

local PaymentGatewayEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntity"] = PaymentGatewayEntity

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
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewayEncryptedMapping = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayEncryptedMapping")
local PaymentGatewayInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local PaymentGatewayInterfaceFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory")
local BasicPaymentType = java_lazy("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local BasicPaymentTypeUtil = java_lazy("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local PaymentGatewayIdGenerator = java_lazy("org.allbinary.data.generator.PaymentGatewayIdGenerator")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local PaymentGatewayEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityInterface")

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

-- class table PaymentGatewayEntity is declared before the requires
PaymentGatewayEntity.__index = PaymentGatewayEntity
PaymentGatewayEntity.className = "PaymentGatewayEntity"
PaymentGatewayEntity.javaClassName = "org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntity"
setmetatable(PaymentGatewayEntity, {__index = AbSqlBean})
PaymentGatewayEntity.java_implements = " PaymentGatewayEntityInterface "
PaymentGatewayEntity.java_interfaces = function() return {PaymentGatewayEntityInterface} end

function PaymentGatewayEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "paymentgateways"
end


function PaymentGatewayEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    PaymentGatewayEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function PaymentGatewayEntity.new(...)
    local self = setmetatable({}, PaymentGatewayEntity)
    PaymentGatewayEntity._jinit(self, ...)
    return self
end


function PaymentGatewayEntity:add(paymentGatewayInterface)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.START, self, "add")
            end
            local vector = BasicArrayListD.new()
            vector:add(PaymentGatewayIdGenerator.new():getNext())
            vector:addAllList(PaymentGatewayEncryptedMapping.new(paymentGatewayInterface):toVector())
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            vector:add(time)
            vector:add(time)
            java_super(AbSqlBean, "insert", 1)(self, vector)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.END, self, "add")
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
java_overload(PaymentGatewayEntity, "add", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PaymentGatewayInterface")) end)


function PaymentGatewayEntity:update(paymentGatewayInterface)
        local try_ok, try_error, try_value = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            paymentGatewayInterface:setLastModified(time)
            local whereKeyValuePairs = StdUtil.getInstance():createHashMap()
            whereKeyValuePairs:put(tostring(StoreFrontData.getInstance().NAME), paymentGatewayInterface:getStoreName())
            whereKeyValuePairs:put(tostring(PaymentGatewayData.NAME), paymentGatewayInterface:getName())
            if whereKeyValuePairs:get(EntryData.getInstance().TIMECREATED) ~= nil then
                error(require("java.lang.Exception").new("Don't update TimeCreated for update"), 0)
            end
            local updateHashMap = PaymentGatewayEncryptedMapping.new(paymentGatewayInterface):toHashMap()
            java_super(AbSqlBean, "updateWhere", 2)(self, whereKeyValuePairs, updateHashMap)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "update")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "update", e)
            end
        end
end
java_overload(PaymentGatewayEntity, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PaymentGatewayInterface")) end)


function PaymentGatewayEntity:getPaymentGatewayInterface(storeName, paymentType)
        local try_ok, try_error, try_value = pcall(function()
            local paymentGatewayHashMap = StdUtil.getInstance():createHashMap()
            local whereKeyAndValue = StdUtil.getInstance():createHashMap()
            whereKeyAndValue:put(tostring(StoreFrontData.getInstance().NAME), storeName)
            whereKeyAndValue:put(tostring(PaymentGatewayData.NAME), paymentType:getName())
            paymentGatewayHashMap = java_super(AbSqlBean, "getRow", 1)(self, whereKeyAndValue)
            if paymentGatewayHashMap ~= nil then
                local userName = paymentGatewayHashMap:get(tostring(UserData.USERNAME))
                local password = paymentGatewayHashMap:get(tostring(UserData.PASSWORD))
                local special1 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL1))
                local special2 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL2))
                local special3 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL3))
                local special4 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL4))
                local special5 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL5))
                local special6 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL6))
                local special7 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL7))
                local special8 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL8))
                local special9 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL9))
                local superCrypt = SuperCrypt.new(PaymentGatewayData.CRYPTNUM)
                paymentGatewayHashMap:put(tostring(UserData.USERNAME), superCrypt:decrypt(userName))
                paymentGatewayHashMap:put(tostring(UserData.PASSWORD), superCrypt:decrypt(password))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL1), superCrypt:decrypt(special1))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL2), superCrypt:decrypt(special2))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL3), superCrypt:decrypt(special3))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL4), superCrypt:decrypt(special4))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL5), superCrypt:decrypt(special5))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL6), superCrypt:decrypt(special6))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL7), superCrypt:decrypt(special7))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL8), superCrypt:decrypt(special8))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL9), superCrypt:decrypt(special9))
                local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(paymentGatewayHashMap)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getPaymentGatewayInterface()")
                end
                do return "__jreturn", paymentGatewayInterface end
            else
                do return "__jreturn", PaymentGatewayInterfaceFactory.new():getInstance(paymentType) end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put("Command Failed for paymentType: " .. paymentType:getName(), self, "getPaymentGatewayInterface", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayEntity, "getPaymentGatewayInterface", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "BasicPaymentType")) end)


function PaymentGatewayEntity:findPaymentTypeVectorByStore(storeName)
        local try_ok, try_error, try_value = pcall(function()
            local paymentGatewayNameVector = BasicArrayListD.new()
            paymentGatewayNameVector = java_super(AbSqlBean, "getColumnWhere", 3)(self, tostring(PaymentGatewayData.NAME), tostring(StoreFrontData.getInstance().NAME), storeName)
            if paymentGatewayNameVector ~= nil then
                local paymentGatewayVector = BasicArrayListD.new()
                local size = paymentGatewayNameVector:size()
                for i = 0, size - 1 do
                    local paymentTypeString = paymentGatewayNameVector:get(i)
                    local paymentType = BasicPaymentTypeUtil.getInstance():get(paymentTypeString)
                    paymentGatewayVector:add(paymentType)
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "findPaymentTypeVectorByStore()")
                end
                do return "__jreturn", paymentGatewayVector end
            else
                do return "__jreturn", BasicArrayListD.new() end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "findPaymentTypeVectorByStore", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayEntity, "findPaymentTypeVectorByStore", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function PaymentGatewayEntity:remove(storeName, paymentType)
        local try_ok, try_error, try_value = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(tostring(StoreFrontData.getInstance().NAME), storeName)
            whereHashMap:put(tostring(PaymentGatewayData.NAME), paymentType:getName())
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
java_overload(PaymentGatewayEntity, "remove", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "BasicPaymentType")) end)


function PaymentGatewayEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(tostring(PaymentGatewayData.ID))
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().ENABLE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(StoreFrontData.getInstance().NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.NAME))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(PaymentData.METHOD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.MODE))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTPROTOCOL))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTSERVER))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTPORT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTPATH))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVERPROTOCOL))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVER))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVERPORT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVERPATH))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(UserData.USERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(UserData.PASSWORD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TIMEOUT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPROTOCOL))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYSERVER))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPORT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPATH))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYUSERNAME))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPASSWORD))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYTIMEOUT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL1))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL2))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL3))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL4))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL5))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL6))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL7))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL8))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL9))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(tostring(PaymentGatewayData.ID))
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(PaymentGatewayEntity, "createTableStatement", 0)


function PaymentGatewayEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(PaymentGatewayEntity, "createTable", 0)


function PaymentGatewayEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(PaymentGatewayEntity, "dropTable", 0)

return PaymentGatewayEntity

