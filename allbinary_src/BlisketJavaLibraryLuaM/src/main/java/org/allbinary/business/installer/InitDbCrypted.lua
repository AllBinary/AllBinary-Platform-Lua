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
-- package org.allbinary.business.installer

local InitDbCrypted = {}
package.loaded["org.allbinary.business.installer.InitDbCrypted"] = InitDbCrypted

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

local InitInfoEntity = java_lazy("org.allbinary.business.init.InitInfoEntity")
local DatabaseConnectionInfoInterface = java_lazy("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local HistoryDbInitInfo = java_lazy("org.allbinary.business.init.db.HistoryDbInitInfo")
local InventoryDbInitInfo = java_lazy("org.allbinary.business.init.db.InventoryDbInitInfo")
local LogDbInitInfo = java_lazy("org.allbinary.business.init.db.LogDbInitInfo")
local StaticPagesDbInitInfo = java_lazy("org.allbinary.business.init.db.StaticPagesDbInitInfo")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local StoreFrontsEntityFactory = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local LogTableEntityFactory = java_lazy("org.allbinary.data.tables.log.LogTableEntityFactory")
local StaticPagesEntityFactory = java_lazy("org.allbinary.data.tables.staticpages.StaticPagesEntityFactory")
local TransformInfoEntityBuilder = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local UserEntityFactory = java_lazy("org.allbinary.data.tables.user.UserEntityFactory")
local BillingAddressesEntityFactory = java_lazy("org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory")
local ShippingAddressesEntityFactory = java_lazy("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local OrderHistoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderItemsEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory")
local PaymentEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory")
local PaymentGatewayEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local TransactionEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityFactory")
local TransactionResultEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntityFactory")
local QuoteRequestEntityFactory = java_lazy("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbDatabaseManagement = require("org.allbinary.logic.communication.sql.AbDatabaseManagement")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local DataOutputStreamFactory = java_lazy("org.allbinary.logic.io.DataOutputStreamFactory")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileFactory = java_lazy("org.allbinary.logic.io.file.FileFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

--Warning you must have sql root access
-- class table InitDbCrypted is declared before the requires
InitDbCrypted.__index = InitDbCrypted
InitDbCrypted.className = "InitDbCrypted"
InitDbCrypted.javaClassName = "org.allbinary.business.installer.InitDbCrypted"
setmetatable(InitDbCrypted, {__index = AbDatabaseManagement})

function InitDbCrypted:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.userDbInitInfo == nil then self.userDbInitInfo = nil end
    if self.inventoryDbInitInfo == nil then self.inventoryDbInitInfo = nil end
    if self.historyDbInitInfo == nil then self.historyDbInitInfo = nil end
    if self.staticpagesDbInitInfo == nil then self.staticpagesDbInitInfo = nil end
    if self.logDbInitInfo == nil then self.logDbInitInfo = nil end
    self.SQL_FILE = "initWeblisket.sql"
end


function InitDbCrypted._jinit(self, databaseConnectionInfoInterface)
    java_super_init(AbDatabaseManagement, self, databaseConnectionInfoInterface)
    InitDbCrypted._init_fields(self)
        -- super(...) made self above
    return self
end

function InitDbCrypted.new(...)
    local self = setmetatable({}, InitDbCrypted)
    InitDbCrypted._jinit(self, ...)
    return self
end


function InitDbCrypted:addUsers()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.METHOD_ADD_USERS)
            self.userDbInitInfo = UserDbInitInfo.new()
            self.inventoryDbInitInfo = InventoryDbInitInfo.new()
            self.historyDbInitInfo = HistoryDbInitInfo.new()
            self.staticpagesDbInitInfo = StaticPagesDbInitInfo.new()
            self.logDbInitInfo = LogDbInitInfo.new()
            local CUSTOMERDB = self.userDbInitInfo:getName()
            local CUSTOMERDBUSER = self.userDbInitInfo:getUserName()
            local CUSTOMERDBPASSWORD = self.userDbInitInfo:getPassword()
            if not (self:addDbUser(CUSTOMERDB, CUSTOMERDBUSER, CUSTOMERDBPASSWORD)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_USER) .. require("allbinary_java").to_string(CUSTOMERDBUSER), self, self.METHOD_ADD_USERS)
                do return "__jreturn", false end
            end
            local INVENTORYDB = self.inventoryDbInitInfo:getName()
            local INVENTORYDBUSER = self.inventoryDbInitInfo:getUserName()
            local INVENTORYDBPASSWORD = self.inventoryDbInitInfo:getPassword()
            if not (self:addDbUser(INVENTORYDB, INVENTORYDBUSER, INVENTORYDBPASSWORD)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_USER) .. require("allbinary_java").to_string(INVENTORYDBUSER), self, self.METHOD_ADD_USERS)
                do return "__jreturn", false end
            end
            local HISTORYDB = self.historyDbInitInfo:getName()
            local HISTORYDBUSER = self.historyDbInitInfo:getUserName()
            local HISTORYDBPASSWORD = self.historyDbInitInfo:getPassword()
            if not (self:addDbUser(HISTORYDB, HISTORYDBUSER, HISTORYDBPASSWORD)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_USER) .. require("allbinary_java").to_string(HISTORYDBUSER), self, self.METHOD_ADD_USERS)
                do return "__jreturn", false end
            end
            local STATICPAGESDB = self.staticpagesDbInitInfo:getName()
            local STATICPAGESDBUSER = self.staticpagesDbInitInfo:getUserName()
            local STATICPAGESDBPASSWORD = self.staticpagesDbInitInfo:getPassword()
            if not (self:addDbUser(STATICPAGESDB, STATICPAGESDBUSER, STATICPAGESDBPASSWORD)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_USER) .. require("allbinary_java").to_string(STATICPAGESDBUSER), self, self.METHOD_ADD_USERS)
                do return "__jreturn", false end
            end
            local LOGDB = self.logDbInitInfo:getName()
            local LOGDBUSER = self.logDbInitInfo:getUserName()
            local LOGDBPASSWORD = self.logDbInitInfo:getPassword()
            if not (self:addDbUser(LOGDB, LOGDBUSER, LOGDBPASSWORD)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_USER) .. require("allbinary_java").to_string(LOGDBUSER), self, self.METHOD_ADD_USERS)
                do return "__jreturn", false end
            end
            self.logUtil:putF(self.commonStrings.END, self, self.METHOD_ADD_USERS)
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_ADD_USERS, e)
            return true
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InitDbCrypted, "addUsers", 0)


function InitDbCrypted:addDatabases()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.METHOD_ADD_DATABASES)
            self.userDbInitInfo = UserDbInitInfo.new()
            self.inventoryDbInitInfo = InventoryDbInitInfo.new()
            self.historyDbInitInfo = HistoryDbInitInfo.new()
            self.staticpagesDbInitInfo = StaticPagesDbInitInfo.new()
            self.logDbInitInfo = LogDbInitInfo.new()
            local CUSTOMERDB = self.userDbInitInfo:getName()
            if not (self:addDb(CUSTOMERDB)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_DATABASE) .. require("allbinary_java").to_string(CUSTOMERDB), self, self.METHOD_ADD_DATABASES)
                do return "__jreturn", false end
            end
            local INVENTORYDB = self.inventoryDbInitInfo:getName()
            if not (self:addDb(INVENTORYDB)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_DATABASE) .. require("allbinary_java").to_string(INVENTORYDB), self, self.METHOD_ADD_DATABASES)
                do return "__jreturn", false end
            end
            local HISTORYDB = self.historyDbInitInfo:getName()
            if not (self:addDb(HISTORYDB)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_DATABASE) .. require("allbinary_java").to_string(HISTORYDB), self, self.METHOD_ADD_DATABASES)
                do return "__jreturn", false end
            end
            local STATICPAGESDB = self.staticpagesDbInitInfo:getName()
            if not (self:addDb(STATICPAGESDB)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_DATABASE) .. require("allbinary_java").to_string(STATICPAGESDB), self, self.METHOD_ADD_DATABASES)
                do return "__jreturn", false end
            end
            local LOGDB = self.logDbInitInfo:getName()
            if not (self:addDb(LOGDB)) then
                self.logUtil:putF(require("allbinary_java").to_string(self.UNABLE_TO_CREATE_DATABASE) .. require("allbinary_java").to_string(LOGDB), self, self.METHOD_ADD_DATABASES)
                do return "__jreturn", false end
            end
            local file = FileFactory.getInstance():getInstance(self.SQL_FILE)
            file:createNewFile()
            local idOutData = DataOutputStreamFactory.getInstance():getInstanceForAbFile(file)
            idOutData:writeBytes(tostring(self.sqlCommandLog))
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_ADD_DATABASES, e)
            return true
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InitDbCrypted, "addDatabases", 0)


function InitDbCrypted:addTables()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            self.logUtil:putF(self.commonStrings.START, self, self.METHOD_ADD_TABLES)
            stringBuffer:append(UserEntityFactory.getInstance():createTable())
            stringBuffer:append(StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():createTable())
            stringBuffer:append(BillingAddressesEntityFactory.getInstance():getInstance(self.stringUtil.EMPTY_STRING):createTable())
            stringBuffer:append(ShippingAddressesEntityFactory.getInstance():getInstance(self.stringUtil.EMPTY_STRING):createTable())
            stringBuffer:append(PaymentEntityFactory.getInstance():getPaymentEntityInstance():createTable())
            stringBuffer:append(QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance():createTable())
            stringBuffer:append(OrderHistoryEntityFactory.getInstance():createTable())
            stringBuffer:append(OrderItemsEntityFactory.getInstance():createTable())
            stringBuffer:append(TransactionEntityFactory.getInstance():getTransactionEntityInstance():createTable())
            stringBuffer:append(TransactionResultEntityFactory.getInstance():getTransactionResultEntityInstance():createTable())
            stringBuffer:append(PaymentGatewayEntityFactory.getInstance():createTable())
            stringBuffer:append(InventoryEntityFactory.getInstance():getInventoryEntityInstance():createTable())
            stringBuffer:append(InitInfoEntity.new():createTable())
            stringBuffer:append(LogTableEntityFactory.getInstance():getLogTableEntityInstance():createTable())
            stringBuffer:append(StaticPagesEntityFactory.getInstance():getStaticPagesEntityInstance():createTable())
            stringBuffer:append(TransformInfoEntityBuilder.getInstance():createTable())
            self.logUtil:putF(require("allbinary_java").to_string(self.ADD_TABLES_RESULTS_LABEL) .. require("allbinary_java").to_string(tostring(stringBuffer)), self, self.METHOD_ADD_TABLES)
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_ADD_TABLES, e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InitDbCrypted, "addTables", 0)

return InitDbCrypted

