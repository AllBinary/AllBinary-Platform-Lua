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
-- package taghelpers

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local TagHelper = require("admin.taghelpers.TagHelper")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local AcceptableResponseGenerator = require("org.allbinary.logic.communication.http.AcceptableResponseGenerator")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchParams = require("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local InventoryViewFactory = require("views.admin.inventory.listings.InventoryViewFactory")
local InventoryViewSearchInterface = require("views.admin.inventory.listings.InventoryViewSearchInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventoryHelper = {}
InventoryHelper.__index = InventoryHelper
InventoryHelper.className = "InventoryHelper"
setmetatable(InventoryHelper, {__index = TagHelper})

function InventoryHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.weblisketSession = nil
    self.response = nil
    self.request = nil
    self.streetAddress = nil
    self.id = nil
    self.searchRequest = nil
end


function InventoryHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(TagHelper.new(), InventoryHelper)
    self:_init_fields()
        self.response = pageContext:getResponse()
        self.request = pageContext:getRequest()
        local storeName = propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        local xslFile = propertiesHashMap:get(TransformInfoData.getInstance().TEMPLATEFILENAME)
        if storeName ~= nil then
            local storeFrontInterface = StoreFrontFactory.getInstance(storeName)
            local contentType = AcceptableResponseGenerator.getInstance():get(self.request)
            local searchParams = SearchParams.new(self.request)
            self.searchRequest = SearchRequest.new(storeFrontInterface, searchParams, xslFile, contentType, propertiesHashMap, pageContext)
        end
        self:getFormData()
    return self
end


function InventoryHelper:getFormData()
        self.id = self.request:getParameter(self.basicItemData.ID)
end


function InventoryHelper:viewSummary()
        local try_ok, try_error = pcall(function()
            local inventoryViewSearchInterface = InventoryViewFactory.getInstance(self.searchRequest)
            local result = inventoryViewSearchInterface:getProduct(self.id)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfull Inventory View Summary", self, "viewSummary()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to View Summary"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "viewSummary()", e)
            end
            return error .. "<br>" .. "Exception: " .. tostring(e) .. "<br>"
        end
end


function InventoryHelper:search()
        local try_ok, try_error = pcall(function()
            local stringUtil = StringUtil.getInstance()
            local keywords = self.searchRequest:getParams():get():get(self.basicItemData.KEYWORDS)
            if keywords == nil or ((keywords < stringUtil.EMPTY_STRING and -1) or (keywords > stringUtil.EMPTY_STRING and 1) or 0) == 0 then
                return "Please enter a keyword in the search field above the Search button."
            end
            local inventoryViewSearchInterface = InventoryViewFactory.getInstance(self.searchRequest)
            local result = inventoryViewSearchInterface:searchSingleDynamicPage()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successful Inventory Dynamic Search", self, "searchSingleDynamicPage()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to search Inventory by keyword"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "searchSingleDynamicPage()", e)
            end
            return error .. "<br>" .. "Exception: " .. tostring(e) .. "<br>"
        end
end

return InventoryHelper

