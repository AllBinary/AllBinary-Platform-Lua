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
-- package org.allbinary.logic.control.search

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbContext = require("org.allbinary.business.context.AbContext")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SearchRequest = {}
SearchRequest.__index = SearchRequest
SearchRequest.className = "SearchRequest"
setmetatable(SearchRequest, {__index = AbContext})

function SearchRequest:_init_fields()
    self.xslFile = nil
    self.pageName = nil
    self.contentType = nil
    self.searchParams = nil
    self.storeFront = nil
end


function SearchRequest.new(storeFront, searchParams, xslFile, contentType, propertiesHashMap, pageContext)
    local self = setmetatable(AbContext.new(propertiesHashMap, pageContext), SearchRequest)
    self:_init_fields()
        -- super(...) made self above
        self.storeFront = storeFront
        self.searchParams = searchParams
        self.xslFile = xslFile
        self.pageName = self.pageName
        self.contentType = contentType
    return self
end


function SearchRequest:setStoreFront(storeFront)
        self.storeFront = storeFront
end


function SearchRequest:setParams(searchParams)
        self.searchParams = searchParams
end


function SearchRequest:setXslFile(value)
        self.xslFile = value
end


function SearchRequest:setFileBaseName(value)
        self.pageName = value
end


function SearchRequest:setContentType(value)
        self.contentType = value
end


function SearchRequest:getStoreFront()
        return self.storeFront
end


function SearchRequest:getParams()
        return self.searchParams
end


function SearchRequest:getXslFile()
        return self.xslFile
end


function SearchRequest:getFileBaseName()
        return self.pageName
end


function SearchRequest:getContentType()
        return self.contentType
end


-- throws Exception
function SearchRequest:getFileBaseNameNode(document)
        return ModDomHelper.createNameValueNodes(document, SearchData.FILENAME, self:getFileBaseName())
end

return SearchRequest

