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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbContext = require("org.allbinary.business.context.AbContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local AcceptableResponseGenerator = require("org.allbinary.logic.communication.http.AcceptableResponseGenerator")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local AdminEmailInfo = require("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = require("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local SearchParams = require("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local ProductListingFactory = require("views.admin.inventory.listings.ProductListingFactory")
local TagHelperInterface = require("admin.taghelpers.TagHelperInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StaticPagesRequestHelper = {}
StaticPagesRequestHelper.__index = StaticPagesRequestHelper
StaticPagesRequestHelper.className = "StaticPagesRequestHelper"
setmetatable(StaticPagesRequestHelper, {__index = AbContext})

function StaticPagesRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.request = nil
    self.storeName = nil
    self.searchParams = nil
    self.xslFile = nil
end


function StaticPagesRequestHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(AbContext.new(propertiesHashMap, pageContext), StaticPagesRequestHelper)
    self:_init_fields()
        -- super(...) made self above
        self.request = pageContext:getRequest()
        self.xslFile = propertiesHashMap:get(TransformInfoData.getInstance().TEMPLATEFILENAME)
        self:getFormData()
    return self
end


function StaticPagesRequestHelper:getFormData()
        self.storeName = self.request:getParameter(StoreFrontData.getInstance().NAME)
        self.searchParams = SearchParams.new(self.request)
end


-- throws Exception
function StaticPagesRequestHelper:email()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Generated Static Pages Notification Email", self, "email")
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self.storeName)
            local adminEmailSubject = "Generated Static Pages Email Notification"
            local adminEmailTextBody = "Generated static pages for store: " .. self.storeName
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
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "email", e)
            end
        end
end


function StaticPagesRequestHelper:generateStaticPages()
        local try_ok, try_error = pcall(function()
            local contentType = AcceptableResponseGenerator.getInstance():get(self.request)
            local searchRequest = SearchRequest.new(nil, self.searchParams, self.xslFile, contentType, self:getPropertiesHashMap(), self:getPageContext())
            local success = ProductListingFactory.getInstance(searchRequest):generateAll(self.storeName)
            self:email()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "generateStaticPages()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to generate staticpages table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateStaticPages()", e)
            end
            return error
        end
end


function StaticPagesRequestHelper:makePublic()
        local try_ok, try_error = pcall(function()
            local storeFrontInterface = StoreFrontFactory.getInstance(self.storeName)
            local fromAbPath = AbPath.new(storeFrontInterface:getTestHtmlPath() + storeFrontInterface:getStaticPath(), StringUtil.getInstance().EMPTY_STRING)
            local toAbPath = AbPath.new(tostring(self.URLGLOBALS:getWebappPath()) .. storeFrontInterface:getName() .. tostring(AbPathData.getInstance().SEPARATOR) .. tostring(storeFrontInterface:getStaticPath()), StringUtil.getInstance().EMPTY_STRING)
            FileUtil.getInstance():copy(fromAbPath, toAbPath)
            local success = "Made Public"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "makePublic()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to makePublic"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "makePublic()", e)
            end
            return error
        end
end

return StaticPagesRequestHelper

