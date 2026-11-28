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

local TableSearchRequest = {}
package.loaded["org.allbinary.logic.control.search.TableSearchRequest"] = TableSearchRequest

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

local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local SearchData = java_lazy("org.allbinary.logic.control.search.SearchData")
local SearchParams = java_lazy("org.allbinary.logic.control.search.SearchParams")

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

-- class table TableSearchRequest is declared before the requires
TableSearchRequest.__index = TableSearchRequest
TableSearchRequest.className = "TableSearchRequest"
TableSearchRequest.javaClassName = "org.allbinary.logic.control.search.TableSearchRequest"

function TableSearchRequest:_init_fields()
    if self.xslFile == nil then self.xslFile = nil end
    if self.pageName == nil then self.pageName = nil end
    if self.contentType == nil then self.contentType = nil end
    if self.keywords == nil then self.keywords = nil end
    if self.searchParams == nil then self.searchParams = nil end
end


function TableSearchRequest._jinit(self, keywords, searchParams, xslFile, contentType)
    TableSearchRequest._init_fields(self)
        self.keywords = keywords
        self.searchParams = searchParams
        self.xslFile = xslFile
        self.pageName = self.pageName
        self.contentType = contentType
    return self
end

function TableSearchRequest.new(...)
    local self = setmetatable({}, TableSearchRequest)
    TableSearchRequest._jinit(self, ...)
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
        local path = require("allbinary_java").to_string(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH) .. require("allbinary_java").to_string(self.xslFile)
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

