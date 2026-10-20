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
-- package org.allbinary.logic.visual.transform.data

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontViewFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontViewFactory")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local TransformHttpRequestDocument = require("org.allbinary.logic.visual.transform.data.TransformHttpRequestDocument")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformStoreDocument = {}
TransformStoreDocument.__index = TransformStoreDocument
TransformStoreDocument.className = "TransformStoreDocument"
setmetatable(TransformStoreDocument, {__index = TransformHttpRequestDocument})

function TransformStoreDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformStoreDocument.new(...)
    local count = select("#", ...)
    if count == 2 then return TransformStoreDocument._new2(...)
    elseif count == 1 then return TransformStoreDocument._new1(...)
    end
end


function TransformStoreDocument._new2(pageContext, weblisketSession)
    local self = setmetatable(TransformHttpRequestDocument.new(pageContext, weblisketSession), TransformStoreDocument)
    self:_init_fields()
        -- super(...) made self above
        local try_ok, try_error = pcall(function()
            local storeName = weblisketSession:getStoreName()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Using Session StoreName: " .. storeName, self, self.commonStrings.CONSTRUCTOR)
            end
            self:getBaseNode():appendChild(StoreFrontViewFactory.getInstance(storeName):toXmlNode(self:getDoc()))
            self:getBaseNode():appendChild(RequestParams.new(pageContext:getRequest()):toXmlNode(self:getDoc()))
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end


function TransformStoreDocument._new1(searchRequest)
    local self = setmetatable(TransformHttpRequestDocument.new(searchRequest), TransformStoreDocument)
    self:_init_fields()
        -- super(...) made self above
        local try_ok, try_error = pcall(function()
            self:getBaseNode():appendChild(StoreFrontViewFactory.getInstance(searchRequest:getStoreFront():getName()):toXmlNode(self:getDoc()))
            self:getBaseNode():appendChild(searchRequest:getParams():getParamsNode(self:getDoc()))
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end

return TransformStoreDocument

