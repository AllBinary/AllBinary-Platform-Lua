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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local Portion = require("org.allbinary.business.installer.Portion")
local StoreFrontsEntityFactory = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local AdminEmailInfo = require("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = require("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local ModifyTable = require("admin.taghelpers.ModifyTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontsRequestHelper = {}
StoreFrontsRequestHelper.__index = StoreFrontsRequestHelper
StoreFrontsRequestHelper.className = "StoreFrontsRequestHelper"
setmetatable(StoreFrontsRequestHelper, {__index = ModifyTable})

function StoreFrontsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.pageContext = nil
    self.request = nil
    self.weblisketSession = nil
    self.storeName = nil
    self.modifyingStoreFrontInterface = nil
    self.portion = nil
end


function StoreFrontsRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), StoreFrontsRequestHelper)
    self:_init_fields()
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
        self:getFormData()
    return self
end


-- throws Exception
function StoreFrontsRequestHelper:getFormData()
        self.storeName = self.weblisketSession:getStoreName()
        self.modifyingStoreFrontInterface = StoreFront.new(self.request)
end


function StoreFrontsRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Updated Successfully"
            local hashMapData = self.modifyingStoreFrontInterface:toHashMap()
            StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():update(hashMapData)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


-- throws Exception
function StoreFrontsRequestHelper:sendStoreCreatedEmails()
        local storeManagerEmailSubject = "Store Manager Nofification For Store: " .. self.modifyingStoreFrontInterface:getName()
        local adminEmailSubject = "Admin Notification For Store: " .. self.modifyingStoreFrontInterface:getName()
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


function StoreFrontsRequestHelper:install()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Intall StoreFront Successfully: ")
            stringBuffer:appendint(java_int(math.tointeger(self.portion:getCurrent() // 1)))
            stringBuffer:append(" of ")
            stringBuffer:appendint(java_int(math.tointeger(self.portion:getTotal() // 1)))
            local success = tostring(stringBuffer)
            self.modifyingStoreFrontInterface:install(math.tointeger(self.portion:getCurrent() // 1), math.tointeger(self.portion:getTotal() // 1))
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "install()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to Install storefront"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "install()", e)
            end
            return error
        end
end


function StoreFrontsRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "Added Successfully"
            local values = self.modifyingStoreFrontInterface:toVector()
            StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():insert(values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add storefront"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
end


function StoreFrontsRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            local success = "Delete Successfully"
            StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():delete(self.storeName)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to delete storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
end

return StoreFrontsRequestHelper

