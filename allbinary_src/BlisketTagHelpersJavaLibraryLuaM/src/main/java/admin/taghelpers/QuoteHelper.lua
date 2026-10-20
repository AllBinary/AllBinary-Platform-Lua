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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local Portion = require("org.allbinary.business.installer.Portion")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local QuoteRequest = require("org.allbinary.business.user.quoterequest.QuoteRequest")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local QuoteRequestEntity = require("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntity")
local QuoteRequestEntityFactory = require("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local UserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = require("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local BasicTable = require("admin.taghelpers.BasicTable")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local QuoteHelper = {}
QuoteHelper.__index = QuoteHelper
QuoteHelper.className = "QuoteHelper"
setmetatable(QuoteHelper, {__index = BasicTable})

function QuoteHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.portion = nil
end


function QuoteHelper.new(hashMap, pageContext)
    local self = setmetatable(BasicTable.new(), QuoteHelper)
    self:_init_fields()
        local storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        else
            self.storeFrontInterface = StoreFront.new()
        end
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
    return self
end


-- throws Exception
function QuoteHelper:emailUser(quoteRequest)
        local user = UserEntityFactory.getInstance():getUser(quoteRequest:getUserName())
        local userEmailSubject = "Quote Request Receipt"
        local stringBuffer = StringMaker.new()
        stringBuffer:append("This is just a verification email. ")
        stringBuffer:append("We usually respond to quote request within 24 hours.")
        stringBuffer:append("\n\nThank You For Your Business.")
        local userEmailTextBody = tostring(stringBuffer)
        local basicEmailInfo = StoreEmailInfo.new(self.storeFrontInterface, userEmailSubject, userEmailTextBody)
        local emailInfo = EmailInfo.new(basicEmailInfo)
        local userEmailEventHandler = UserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.QUOTEREQUEST, user)
        userEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.QUOTEREQUEST, emailInfo)
end


-- throws Exception
function QuoteHelper:emailAdmins(quoteRequest)
        local adminEmailSubject = "Quote Request"
        local stringBuffer = StringMaker.new()
        stringBuffer:append("\nUserName: ")
        stringBuffer:append(quoteRequest:getUserName())
        stringBuffer:append("\nProject Info: \n")
        stringBuffer:append(quoteRequest:getProjectInfo())
        stringBuffer:append("\nUser Comments: \n")
        stringBuffer:append(quoteRequest:getUserComments())
        stringBuffer:append("\nBudget: \n")
        stringBuffer:append(quoteRequest:getBudget())
        stringBuffer:append("\nTime Frame: \n")
        stringBuffer:append(quoteRequest:getTimeFrame())
        stringBuffer:append("\nComments: \n")
        stringBuffer:append(quoteRequest:getComments())
        local adminEmailTextBody = tostring(stringBuffer)
        local basicEmailInfo = StoreEmailInfo.new(self.storeFrontInterface, adminEmailSubject, adminEmailTextBody)
        local emailInfo = EmailInfo.new(basicEmailInfo)
        local storeAdminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.QUOTEREQUEST)
        local adminUserEmailEventHandler = StoreAdminUserEmailEventHandlerSingletons.getInstance():getInstance(UserEmailEventNameData.QUOTEREQUEST, self.abeClientInformation, self.storeFrontInterface)
        storeAdminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.QUOTEREQUEST, emailInfo)
        adminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.QUOTEREQUEST, emailInfo)
end


-- throws Exception
function QuoteHelper:email()
        local try_ok, try_error = pcall(function()
            local quoteRequestEntity = QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance()
            local userName = self.weblisketSession:getUserName()
            local vector = quoteRequestEntity:getIds(userName)
            local id = 0
            local size = vector:size()
            for index = 0, size - 1 do
                local nextId = math.tointeger((vector:get(index)) // 1)
                if id < nextId then
                    id = nextId
                end
            end
            local quoteRequest = quoteRequestEntity:get(userName, id)
            if quoteRequest ~= nil then
                self:emailUser(quoteRequest)
                self:emailAdmins(quoteRequest)
                return "Thank You For Your Business.<p/>"
            else
                error(java_exception("Exception", "No Quote Request"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "email", e)
            end
            return "Thank You For Your Business.<p>"
        end
end


function QuoteHelper:drop()
        local try_ok, try_error = pcall(function()
            local success = QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance():dropTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop QuoteRequest table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function QuoteHelper:create()
        local try_ok, try_error = pcall(function()
            local success = QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance():createTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create new QuoteRequest table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function QuoteHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance(), self.portion)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "restore()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to restore backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
end


function QuoteHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "backup()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to make backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
end

return QuoteHelper

