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

local ShippingAddressHelper = {}
package.loaded["admin.taghelpers.ShippingAddressHelper"] = ShippingAddressHelper

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
local UserData = java_lazy("org.allbinary.business.user.UserData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local BillingAddressesEntityFactory = java_lazy("org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory")
local ShippingAddressesEntity = java_lazy("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local ShippingAddressesEntityFactory = java_lazy("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = java_lazy("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
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

-- class table ShippingAddressHelper is declared before the requires
ShippingAddressHelper.__index = ShippingAddressHelper
ShippingAddressHelper.className = "ShippingAddressHelper"
ShippingAddressHelper.javaClassName = "admin.taghelpers.ShippingAddressHelper"
setmetatable(ShippingAddressHelper, {__index = BasicTable})

function ShippingAddressHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.request == nil then self.request = nil end
    if self.userName == nil then self.userName = nil end
    if self.streetAddress == nil then self.streetAddress = nil end
    if self.portion == nil then self.portion = nil end
end


function ShippingAddressHelper._jinit(self, hashMap, pageContext)
    java_super_init(BasicTable, self)
    ShippingAddressHelper._init_fields(self)
        self.request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
        self:getAddressForm()
    return self
end

function ShippingAddressHelper.new(...)
    local self = setmetatable({}, ShippingAddressHelper)
    ShippingAddressHelper._jinit(self, ...)
    return self
end


function ShippingAddressHelper:getAddressForm()
        self.userName = self.request:getParameter(UserData.USERNAME)
        if rawequal(self.userName, nil) then
            self.userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
        end
        self.streetAddress = StreetAddress.new(self.request)
end
java_overload(ShippingAddressHelper, "getAddressForm", 0)


function ShippingAddressHelper:drop()
        local try_ok, try_error, try_value = pcall(function()
            local success = ShippingAddressesEntity.new(self.stringUtil.EMPTY_STRING):drop()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to drop Admin table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "drop", 0)


function ShippingAddressHelper:create()
        local try_ok, try_error, try_value = pcall(function()
            local success = ShippingAddressesEntity.new(self.stringUtil.EMPTY_STRING):createTable()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to create user table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "create", 0)


function ShippingAddressHelper:restore()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(ShippingAddressesEntity.new(StringUtil.getInstance().EMPTY_STRING), self.portion)
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
java_overload(ShippingAddressHelper, "restore", 0)


function ShippingAddressHelper:backup()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Backup Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(ShippingAddressesEntity.new(StringUtil.getInstance().EMPTY_STRING))
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
java_overload(ShippingAddressHelper, "backup", 0)


function ShippingAddressHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Successfully Added Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):add(self.streetAddress)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add Shipping streetAddress"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "insert", 0)


function ShippingAddressHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Successfully Updated Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):update(self.streetAddress)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF("Successfull update of a Users Shipping Address table", self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed update of a Users Shipping Address Table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "update", 0)


function ShippingAddressHelper:setToBillingAddress()
        local try_ok, try_error, try_value = pcall(function()
            local streetAddress = BillingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):getDefault()
            if not rawequal(streetAddress, nil) then
                ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):add(streetAddress)
            else
                do return "__jreturn", "No Billing Address" end
            end
            do return "__jreturn", StringUtil.getInstance().EMPTY_STRING end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed Setting Shipping address to Billing Address"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setToBillingAddress()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "setToBillingAddress", 0)


function ShippingAddressHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Successfully Removed Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):remove(self.streetAddress:getId())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "remove()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to remove Shipping Address"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "remove()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "delete", 0)


function ShippingAddressHelper:set()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Successfully Set Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):setDefault(self.streetAddress:getId())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "set()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to set Shipping Address"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "set()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingAddressHelper, "set", 0)

return ShippingAddressHelper

