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
-- package admin.taghelpers

local PaymentGatewayHelper = {}
package.loaded["admin.taghelpers.PaymentGatewayHelper"] = PaymentGatewayHelper

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

local HashMap = java_lazy("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local Portion = java_lazy("org.allbinary.business.installer.Portion")
local PaymentGatewayInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local PaymentGatewayInterfaceFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory")
local BasicPaymentTypeUtil = java_lazy("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local PaymentGatewayEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = java_lazy("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local BasicTable = require("admin.taghelpers.BasicTable")

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

-- class table PaymentGatewayHelper is declared before the requires
PaymentGatewayHelper.__index = PaymentGatewayHelper
PaymentGatewayHelper.className = "PaymentGatewayHelper"
PaymentGatewayHelper.javaClassName = "admin.taghelpers.PaymentGatewayHelper"
setmetatable(PaymentGatewayHelper, {__index = BasicTable})

function PaymentGatewayHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.httpServletRequest == nil then self.httpServletRequest = nil end
    if self.portion == nil then self.portion = nil end
end


function PaymentGatewayHelper._jinit(self, hashMap, pageContext)
    java_super_init(BasicTable, self)
    PaymentGatewayHelper._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
            self.httpServletRequest = pageContext:getRequest()
            self.portion = Portion.new(hashMap)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENTERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end

function PaymentGatewayHelper.new(...)
    local self = setmetatable({}, PaymentGatewayHelper)
    PaymentGatewayHelper._jinit(self, ...)
    return self
end


function PaymentGatewayHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(self.httpServletRequest)
            paymentGatewayInterface:setStoreName(self.weblisketSession:getStoreName())
            PaymentGatewayEntityFactory.getInstance():add(paymentGatewayInterface)
            local success = "Successfully Added New Payment Gateway"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            do return "__jreturn", success .. "<br/>" end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error .. "<br>" .. "Exception: " .. tostring(e) .. "<br>"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "insert", 0)


function PaymentGatewayHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(self.httpServletRequest)
            paymentGatewayInterface:setStoreName(self.weblisketSession:getStoreName())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Gateway Name: ")
                stringBuffer:append(paymentGatewayInterface:getName())
                stringBuffer:append(" HashMap=")
                stringBuffer:append(tostring(paymentGatewayInterface:toHashMap(true)))
                self.logUtil:putF(tostring(stringBuffer), self, "update()")
            end
            PaymentGatewayEntityFactory.getInstance():update(paymentGatewayInterface)
            local success = "Successfully Updated Payment Gateway information"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            do return "__jreturn", success .. "<br/>" end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to update payment gateway information"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error .. "<br/>" .. "Exception: " .. tostring(e) .. "<br/>"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "update", 0)


function PaymentGatewayHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(self.httpServletRequest)
            paymentGatewayInterface:setStoreName(self.weblisketSession:getStoreName())
            local storeName = paymentGatewayInterface:getStoreName()
            local gatewayName = paymentGatewayInterface:getName()
            PaymentGatewayEntityFactory.getInstance():remove(storeName, BasicPaymentTypeUtil.getInstance():get(gatewayName))
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Successfully Removed payment gateway where store name=")
            stringBuffer:append(storeName)
            stringBuffer:append(" and gateway name=")
            stringBuffer:append(gatewayName)
            local success = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            do return "__jreturn", success .. "<br/>" end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to remove payment gateway from table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "remove()", e)
            end
            return error .. "<br/>" .. "Exception: " .. tostring(e) .. "<br>"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "delete", 0)


function PaymentGatewayHelper:drop()
        local try_ok, try_error, try_value = pcall(function()
            local success = PaymentGatewayEntityFactory.getInstance():dropTable()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to drop payment transaction result table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "drop", 0)


function PaymentGatewayHelper:create()
        local try_ok, try_error, try_value = pcall(function()
            local success = PaymentGatewayEntityFactory.getInstance():createTable()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to create payment transaction result table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "create", 0)


function PaymentGatewayHelper:restore()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(PaymentGatewayEntityFactory.getInstance(), self.portion)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "restore()")
            end
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to restore backup"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "restore", 0)


function PaymentGatewayHelper:backup()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(PaymentGatewayEntityFactory.getInstance())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "backup()")
            end
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to make backup"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewayHelper, "backup", 0)

return PaymentGatewayHelper

