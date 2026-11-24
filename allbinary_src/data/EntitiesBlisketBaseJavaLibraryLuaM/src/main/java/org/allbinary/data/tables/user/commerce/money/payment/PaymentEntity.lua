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
-- package org.allbinary.data.tables.user.commerce.money.payment

local PaymentEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity"] = PaymentEntity

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
local Random = java_lazy("java.util.Random")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local Payment = java_lazy("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local PaymentIdGenerator = java_lazy("org.allbinary.data.generator.PaymentIdGenerator")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local PaymentEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityInterface")

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

-- class table PaymentEntity is declared before the requires
PaymentEntity.__index = PaymentEntity
PaymentEntity.className = "PaymentEntity"
PaymentEntity.javaClassName = "org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity"
setmetatable(PaymentEntity, {__index = AbSqlBean})
PaymentEntity.java_implements = " PaymentEntityInterface "
PaymentEntity.java_interfaces = function() return {PaymentEntityInterface} end

function PaymentEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "payment"
end


function PaymentEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    PaymentEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function PaymentEntity.new(...)
    local self = setmetatable({}, PaymentEntity)
    PaymentEntity._jinit(self, ...)
    return self
end


function PaymentEntity:getLastId(userName)
        return java_super(AbSqlBean, "getLargestIntegerInColumnWhere", 3)(self, PaymentData.ID, UserData.USERNAME, userName)
end
java_overload(PaymentEntity, "getLastId", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function PaymentEntity:setDefault(userName, index)
        local try_ok, try_error, try_value = pcall(function()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            local whereKeyAndValue = StdUtil.getInstance():createHashMap()
            whereKeyAndValue:put(UserData.USERNAME, userName)
            local paymentInterface = self:getDefault(userName)
            if paymentInterface ~= nil then
                updateKeyAndValue:put(EntryData.getInstance().DEFAULT, StringUtil.getInstance().EMPTY_STRING)
                whereKeyAndValue:put(PaymentData.ID, paymentInterface:getId())
                java_super(AbSqlBean, "updateWhere", 2)(self, whereKeyAndValue, updateKeyAndValue)
            end
            updateKeyAndValue:put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT)
            whereKeyAndValue:put(PaymentData.ID, tostring(index))
            java_super(AbSqlBean, "updateWhere", 2)(self, whereKeyAndValue, updateKeyAndValue)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "setDefault")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setDefault", e)
            end
        end
end
java_overload(PaymentEntity, "setDefault", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or math.type(java_a2) == "integer") end)


function PaymentEntity:get(userName)
        local try_ok, try_error, try_value = pcall(function()
            local paymentVector = BasicArrayListD.new()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(UserData.USERNAME, userName)
            local paymentList = java_super(AbSqlBean, "getRows", 1)(self, keyAndValue)
            local size = paymentList:size()
            for index = 0, size - 1 do
                local paymentHashMap = paymentList:get(index)
                local payment = Payment.new(paymentHashMap)
                if payment ~= nil then
                    paymentVector:add(payment)
                end
            end
            do return "__jreturn", paymentVector end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentEntity, "get", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function PaymentEntity:getDefault(userName)
        local try_ok, try_error, try_value = pcall(function()
            local paymentHashMap = StdUtil.getInstance():createHashMap()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            updateKeyAndValue:put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT)
            updateKeyAndValue:put(UserData.USERNAME, userName)
            paymentHashMap = java_super(AbSqlBean, "getRow", 1)(self, updateKeyAndValue)
            if paymentHashMap ~= nil then
                local payment = Payment.new(paymentHashMap)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getDefault")
                end
                do return "__jreturn", payment end
            else
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getDefault", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentEntity, "getDefault", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function PaymentEntity:remove(userName, index)
        local try_ok, try_error, try_value = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(UserData.USERNAME, userName)
            whereHashMap:put(PaymentData.ID, tostring(index))
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
java_overload(PaymentEntity, "remove", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or math.type(java_a2) == "integer") end)


function PaymentEntity:add(userName, paymentInterface)
        local try_ok, try_error, try_value = pcall(function()
            local vector = BasicArrayListD.new()
            vector:add(PaymentIdGenerator.new():getNext())
            vector:add(userName)
            vector:add(StringUtil.getInstance().EMPTY_STRING)
            vector:add(paymentInterface:getName())
            vector:add(paymentInterface:getType())
            vector:add(paymentInterface:getExpiration())
            local random = Random.new():nextInt(SuperCrypt.KEYMAX)
            vector:add(SuperCrypt.new(random):encrypt(paymentInterface:getNumber()))
            vector:add(tostring(random))
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            vector:add(time)
            java_super(AbSqlBean, "insert", 1)(self, vector)
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
java_overload(PaymentEntity, "add", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "PaymentInterface")) end)


function PaymentEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(PaymentData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.DEFAULT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.TYPE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.EXPIRATION):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.NUMBER):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.ENCRYPTION):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(PaymentData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(PaymentEntity, "createTableStatement", 0)


function PaymentEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(PaymentEntity, "createTable", 0)


function PaymentEntity:drop()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(PaymentEntity, "drop", 0)


function PaymentEntity:insert(values)
        java_super(AbSqlBean, "insert", 1)(self, values)
end
java_overload(PaymentEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function PaymentEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(PaymentEntity, "dropTable", 0)

return PaymentEntity

