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
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local QuoteRequest = require("org.allbinary.business.user.quoterequest.QuoteRequest")
local QuoteRequestEntityFactory = require("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

--TWB - Am I missing the correct Quote Request? Probably not
local QuoteRequestHelper = {}
QuoteRequestHelper.__index = QuoteRequestHelper
QuoteRequestHelper.className = "QuoteRequestHelper"
setmetatable(QuoteRequestHelper, {__index = ModifyTable})

function QuoteRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.quoteRequest = nil
end


function QuoteRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), QuoteRequestHelper)
    self:_init_fields()
        local request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.quoteRequest = QuoteRequest.new(self.weblisketSession:getUserName(), request)
        local storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        end
    return self
end


function QuoteRequestHelper:isValid()
        return self.quoteRequest:isValid()
end


function QuoteRequestHelper:validationInfo()
        return self.quoteRequest:validationInfo()
end


function QuoteRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local values = self.quoteRequest:toVector()
            QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance():insert(values)
            local success = "New QuoteRequest Successfully added to the QuoteRequest Table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "add()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add QuoteRequest"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error
        end
end


function QuoteRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local values = self.quoteRequest:toHashMap()
            QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance():update(self.quoteRequest:getUserName(), values)
            local success = "New QuoteRequest Successfully updated"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update QuoteRequest"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


function QuoteRequestHelper:delete()
        return self.commonStrings.NOT_IMPLEMENTED
end

return QuoteRequestHelper

