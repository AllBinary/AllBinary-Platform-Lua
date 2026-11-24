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

local StoreFrontsHelper = {}
package.loaded["admin.taghelpers.StoreFrontsHelper"] = StoreFrontsHelper

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local Portion = java_lazy("org.allbinary.business.installer.Portion")
local StoreFrontsEntityFactory = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = java_lazy("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local HtmlSelect = java_lazy("org.allbinary.logic.visual.dhtml.html.select.HtmlSelect")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
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

-- class table StoreFrontsHelper is declared before the requires
StoreFrontsHelper.__index = StoreFrontsHelper
StoreFrontsHelper.className = "StoreFrontsHelper"
StoreFrontsHelper.javaClassName = "admin.taghelpers.StoreFrontsHelper"
setmetatable(StoreFrontsHelper, {__index = BasicTable})

function StoreFrontsHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.portion == nil then self.portion = nil end
    self.commonPhoneStrings = CommonPhoneStrings.getInstance()
end


function StoreFrontsHelper._jinit(self, hashMap, pageContext)
    java_super_init(BasicTable, self)
    StoreFrontsHelper._init_fields(self)
        self.portion = Portion.new(hashMap)
    return self
end

function StoreFrontsHelper.new(...)
    local self = setmetatable({}, StoreFrontsHelper)
    StoreFrontsHelper._jinit(self, ...)
    return self
end


function StoreFrontsHelper:drop()
        local try_ok, try_error, try_value = pcall(function()
            local success = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():dropTable()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to drop storefronts table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsHelper, "drop", 0)


function StoreFrontsHelper:create()
        local try_ok, try_error, try_value = pcall(function()
            local success = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():createTable()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to create new storefronts table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsHelper, "create", 0)


function StoreFrontsHelper:restore()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance(), self.portion)
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
java_overload(StoreFrontsHelper, "restore", 0)


function StoreFrontsHelper:backup()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance())
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
java_overload(StoreFrontsHelper, "backup", 0)


function StoreFrontsHelper:generateSelect()
        local try_ok, try_error, try_value = pcall(function()
            local success = CommonSeps.getInstance().SPACE
            local storeNamesVector = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():getStoreFrontNames()
            local storeSelect = HtmlSelect.new(StringUtil.getInstance().EMPTY_STRING, self.commonPhoneStrings.ONE, StoreFrontData.getInstance().SELECTSTORENAME, StringUtil.getInstance().EMPTY_STRING)
            storeSelect:addAttribute(StoreFrontsHelper.CLASS, StoreFrontsHelper.TEXT)
            local size = storeNamesVector:size()
            for index = 0, size - 1 do
                local storeName = storeNamesVector:get(index)
                storeSelect:addOption(storeName)
            end
            success = success .. tostring(storeSelect)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "generateSelect()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to generate storefronts select"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateSelect()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsHelper, "generateSelect", 0)

StoreFrontsHelper.CLASS = "class"
StoreFrontsHelper.TEXT = "text"

return StoreFrontsHelper

