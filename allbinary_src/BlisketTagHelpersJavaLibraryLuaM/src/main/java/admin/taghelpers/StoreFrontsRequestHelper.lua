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

local StoreFrontsRequestHelper = {}
package.loaded["admin.taghelpers.StoreFrontsRequestHelper"] = StoreFrontsRequestHelper

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFront = java_lazy("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local Portion = java_lazy("org.allbinary.business.installer.Portion")
local StoreFrontsEntityFactory = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = java_lazy("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local AdminEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ModifyTable = require("admin.taghelpers.ModifyTable")

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

-- class table StoreFrontsRequestHelper is declared before the requires
StoreFrontsRequestHelper.__index = StoreFrontsRequestHelper
StoreFrontsRequestHelper.className = "StoreFrontsRequestHelper"
StoreFrontsRequestHelper.javaClassName = "admin.taghelpers.StoreFrontsRequestHelper"
setmetatable(StoreFrontsRequestHelper, {__index = ModifyTable})

function StoreFrontsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.pageContext == nil then self.pageContext = nil end
    if self.request == nil then self.request = nil end
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.modifyingStoreFrontInterface == nil then self.modifyingStoreFrontInterface = nil end
    if self.portion == nil then self.portion = nil end
end


function StoreFrontsRequestHelper._jinit(self, hashMap, pageContext)
    java_super_init(ModifyTable, self)
    StoreFrontsRequestHelper._init_fields(self)
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
        self:getFormData()
    return self
end

function StoreFrontsRequestHelper.new(...)
    local self = setmetatable({}, StoreFrontsRequestHelper)
    StoreFrontsRequestHelper._jinit(self, ...)
    return self
end


-- throws Exception
function StoreFrontsRequestHelper:getFormData()
        self.storeName = self.weblisketSession:getStoreName()
        self.modifyingStoreFrontInterface = StoreFront.new(self.request)
end
java_overload(StoreFrontsRequestHelper, "getFormData", 0)


function StoreFrontsRequestHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Updated Successfully"
            local hashMapData = self.modifyingStoreFrontInterface:toHashMap()
            StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():update(hashMapData)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to update storefronts table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsRequestHelper, "update", 0)


-- throws Exception
function StoreFrontsRequestHelper:sendStoreCreatedEmails()
        local storeManagerEmailSubject = require("allbinary_java").to_string("Store Manager Nofification For Store: ") .. require("allbinary_java").to_string(self.modifyingStoreFrontInterface:getName())
        local adminEmailSubject = require("allbinary_java").to_string("Admin Notification For Store: ") .. require("allbinary_java").to_string(self.modifyingStoreFrontInterface:getName())
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Store Created: ")
        stringBuffer:append(self.modifyingStoreFrontInterface:getName())
        stringBuffer:append("\n\n")
        stringBuffer:append("Click here for the Admin Interface:\n")
        stringBuffer:append(self.modifyingStoreFrontInterface:getCurrentHomeHostName())
        stringBuffer:append("/admin/login.jsp\n\n")
        stringBuffer:append("Goto Your Store:\n")
        stringBuffer:append(self.modifyingStoreFrontInterface:getCurrentHomeHostName())
        stringBuffer:append(self.modifyingStoreFrontInterface:getName())
        stringBuffer:append("/index.jsp")
        stringBuffer:append("\n\n")
        stringBuffer:append("UserName: ")
        stringBuffer:append(self.weblisketSession:getUserName())
        local adminEmailTextBody = tostring(stringBuffer)
        local adminBasicEmailInfo = AdminEmailInfo.new(adminEmailSubject, adminEmailTextBody)
        local storeAdminBasicEmailInfo = StoreEmailInfo.new(self.modifyingStoreFrontInterface, storeManagerEmailSubject, adminEmailTextBody)
        local storeAdminEmailInfo = EmailInfo.new(storeAdminBasicEmailInfo)
        local adminEmailInfo = EmailInfo.new(adminBasicEmailInfo)
        local adminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.STORECREATED)
        local storeAdminUserEmailEventHandler = StoreAdminUserEmailEventHandlerSingletons.getInstance():getInstance(UserEmailEventNameData.STORECREATED, self.abeClientInformation, self.modifyingStoreFrontInterface)
        storeAdminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.STORECREATED, storeAdminEmailInfo)
        adminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.STORECREATED, adminEmailInfo)
end
java_overload(StoreFrontsRequestHelper, "sendStoreCreatedEmails", 0)


function StoreFrontsRequestHelper:install()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Intall StoreFront Successfully: ")
            stringBuffer:appendint(java_int(require("allbinary_java").number_value(self.portion:getCurrent(), "intValue")))
            stringBuffer:append(" of ")
            stringBuffer:appendint(java_int(require("allbinary_java").number_value(self.portion:getTotal(), "intValue")))
            local success = tostring(stringBuffer)
            self.modifyingStoreFrontInterface:install(require("allbinary_java").number_value(self.portion:getCurrent(), "intValue"), require("allbinary_java").number_value(self.portion:getTotal(), "intValue"))
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "install()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to Install storefront"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "install()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsRequestHelper, "install", 0)


function StoreFrontsRequestHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Added Successfully"
            local values = self.modifyingStoreFrontInterface:toVector()
            StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():insert(values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add storefront"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsRequestHelper, "insert", 0)


function StoreFrontsRequestHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Delete Successfully"
            StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():delete(self.storeName)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to delete storefronts table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StoreFrontsRequestHelper, "delete", 0)

return StoreFrontsRequestHelper

