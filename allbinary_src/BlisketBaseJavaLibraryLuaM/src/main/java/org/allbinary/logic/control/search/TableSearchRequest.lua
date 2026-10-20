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

local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
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

local TableSearchRequest = {}
TableSearchRequest.__index = TableSearchRequest
TableSearchRequest.className = "TableSearchRequest"

function TableSearchRequest:_init_fields()
    self.xslFile = nil
    self.pageName = nil
    self.contentType = nil
    self.keywords = nil
    self.searchParams = nil
end


function TableSearchRequest.new(keywords, searchParams, xslFile, contentType)
    local self = setmetatable({}, TableSearchRequest)
    self:_init_fields()
        self.keywords = keywords
        self.searchParams = searchParams
        self.xslFile = xslFile
        self.pageName = self.pageName
        self.contentType = contentType
    return self
end


function TableSearchRequest:setKeywords(value)
        self.keywords = value
end


function TableSearchRequest:setParams(searchParams)
        self.searchParams = searchParams
end


function TableSearchRequest:setXslFile(value)
        self.xslFile = value
end


function TableSearchRequest:setFileBaseName(value)
        self.pageName = value
end


function TableSearchRequest:setContentType(value)
        self.contentType = value
end


function TableSearchRequest:getKeywords()
        return self.keywords
end


function TableSearchRequest:getParams()
        return self.searchParams
end


-- throws Exception
function TableSearchRequest:getXslFile()
        local path = tostring(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH) .. self.xslFile
        return path
end


function TableSearchRequest:getFileBaseName()
        return self.pageName
end


function TableSearchRequest:getContentType()
        return self.contentType
end


-- throws Exception
function TableSearchRequest:getFileBaseNameNode(document)
        return ModDomHelper.createNameValueNodes(document, SearchData.FILENAME, self:getFileBaseName())
end

return TableSearchRequest

