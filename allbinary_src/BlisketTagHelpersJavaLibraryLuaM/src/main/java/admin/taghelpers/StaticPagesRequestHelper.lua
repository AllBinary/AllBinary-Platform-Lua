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

local StaticPagesRequestHelper = {}
package.loaded["admin.taghelpers.StaticPagesRequestHelper"] = StaticPagesRequestHelper

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
local AbContext = require("org.allbinary.business.context.AbContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local AcceptableResponseGenerator = java_lazy("org.allbinary.logic.communication.http.AcceptableResponseGenerator")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = java_lazy("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local AdminEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local SearchParams = java_lazy("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local ProductListingFactory = java_lazy("views.admin.inventory.listings.ProductListingFactory")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TagHelperInterface = require("admin.taghelpers.TagHelperInterface")

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

-- class table StaticPagesRequestHelper is declared before the requires
StaticPagesRequestHelper.__index = StaticPagesRequestHelper
StaticPagesRequestHelper.className = "StaticPagesRequestHelper"
StaticPagesRequestHelper.javaClassName = "admin.taghelpers.StaticPagesRequestHelper"
setmetatable(StaticPagesRequestHelper, {__index = AbContext})
StaticPagesRequestHelper.java_implements = " TagHelperInterface "
StaticPagesRequestHelper.java_interfaces = function() return {TagHelperInterface} end

function StaticPagesRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.request == nil then self.request = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.searchParams == nil then self.searchParams = nil end
    if self.xslFile == nil then self.xslFile = nil end
end


function StaticPagesRequestHelper._jinit(self, propertiesHashMap, pageContext)
    java_super_init(AbContext, self, propertiesHashMap, pageContext)
    StaticPagesRequestHelper._init_fields(self)
        -- super(...) made self above
        self.request = pageContext:getRequest()
        self.xslFile = propertiesHashMap:get(TransformInfoData.getInstance().TEMPLATEFILENAME)
        self:getFormData()
    return self
end

function StaticPagesRequestHelper.new(...)
    local self = setmetatable({}, StaticPagesRequestHelper)
    StaticPagesRequestHelper._jinit(self, ...)
    return self
end


function StaticPagesRequestHelper:getFormData()
        self.storeName = self.request:getParameter(StoreFrontData.getInstance().NAME)
        self.searchParams = SearchParams.new(self.request)
end
java_overload(StaticPagesRequestHelper, "getFormData", 0)


-- throws Exception
function StaticPagesRequestHelper:email()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Generated Static Pages Notification Email", self, "email")
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self.storeName)
            local adminEmailSubject = "Generated Static Pages Email Notification"
            local adminEmailTextBody = require("allbinary_java").to_string("Generated static pages for store: ") .. require("allbinary_java").to_string(self.storeName)
            local adminBasicEmailInfo = AdminEmailInfo.new(adminEmailSubject, adminEmailTextBody)
            local storeAdminBasicEmailInfo = StoreEmailInfo.new(storeFrontInterface, adminEmailSubject, adminEmailTextBody)
            local storeAdminEmailInfo = EmailInfo.new(storeAdminBasicEmailInfo)
            local adminEmailInfo = EmailInfo.new(adminBasicEmailInfo)
            local adminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.STOREGENERATINGSTATICPAGES)
            local storeAdminUserEmailEventHandler = StoreAdminUserEmailEventHandlerSingletons.getInstance():getInstance(UserEmailEventNameData.STOREGENERATINGSTATICPAGES, self.abeClientInformation, storeFrontInterface)
            storeAdminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.STOREGENERATINGSTATICPAGES, storeAdminEmailInfo)
            adminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.STOREGENERATINGSTATICPAGES, adminEmailInfo)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "email", e)
            end
        end
end
java_overload(StaticPagesRequestHelper, "email", 0)


function StaticPagesRequestHelper:generateStaticPages()
        local try_ok, try_error, try_value = pcall(function()
            local contentType = AcceptableResponseGenerator.getInstance():get(self.request)
            local searchRequest = SearchRequest.new(nil, self.searchParams, self.xslFile, contentType, self:getPropertiesHashMap(), self:getPageContext())
            local success = ProductListingFactory.getInstance(searchRequest):generateAll(self.storeName)
            self:email()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "generateStaticPages()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to generate staticpages table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateStaticPages()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StaticPagesRequestHelper, "generateStaticPages", 0)


function StaticPagesRequestHelper:makePublic()
        local try_ok, try_error, try_value = pcall(function()
            local storeFrontInterface = StoreFrontFactory.getInstance(self.storeName)
            local fromAbPath = AbPath.new(storeFrontInterface:getTestHtmlPath() + storeFrontInterface:getStaticPath(), StringUtil.getInstance().EMPTY_STRING)
            local toAbPath = AbPath.new(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string(storeFrontInterface:getName())) .. require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR)) .. require("allbinary_java").to_string(storeFrontInterface:getStaticPath()), StringUtil.getInstance().EMPTY_STRING)
            FileUtil.getInstance():copy(fromAbPath, toAbPath)
            local success = "Made Public"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "makePublic()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to makePublic"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "makePublic()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(StaticPagesRequestHelper, "makePublic", 0)

return StaticPagesRequestHelper

