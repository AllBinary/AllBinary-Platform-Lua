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
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local ToDomHelper = require("org.allbinary.data.tree.dom.ToDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
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

local SearchParams = {}
SearchParams.__index = SearchParams
SearchParams.className = "SearchParams"

function SearchParams:_init_fields()
    self.columnsAndSearchValues = nil
    self.order = nil
    self.sortBy = nil
    self.listLength = nil
    self.startPage = nil
    self.endPage = nil
end


function SearchParams.new(request)
    local self = setmetatable({}, SearchParams)
    self:_init_fields()
        self.columnsAndSearchValues = StdUtil.getInstance():createHashMap()
        self:setLength(request:getParameter(SearchData.LENGTH))
        self:setOrder(request:getParameter(SearchData.ORDER))
        local page = request:getParameter(SearchData.PAGE)
        self:setStartPage(page)
        self:setEndPage(page)
        self:setSortBy(request:getParameter(SearchData.SORTBY))
        local index = 0
        local columnName = request:getParameter(tostring(SearchData.COLUMNNAME) .. "[0]")
        local columnValue = request:getParameter(tostring(SearchData.COLUMNVALUE) .. "[0]")
        while columnName ~= nil do
            self:add(columnName, columnValue)
            index = index + 1
            columnName = request:getParameter(tostring(SearchData.COLUMNNAME) .. "[" .. tostring(index) .. "]")
            columnValue = request:getParameter(tostring(SearchData.COLUMNVALUE) .. "[" .. tostring(index) .. "]")
        end
    return self
end


function SearchParams:add(column, value)
        self.columnsAndSearchValues:put(column, value)
end


function SearchParams:setOrder(value)
        self.order = value
end


function SearchParams:setSortBy(value)
        self.sortBy = value
end


function SearchParams:setLength(value)
        self.listLength = value
end


function SearchParams:setStartPage(value)
        self.startPage = value
end


function SearchParams:setEndPage(value)
        self.endPage = value
end


function SearchParams:get()
        return self.columnsAndSearchValues
end


function SearchParams:getOrder()
        return self.order
end


function SearchParams:getSortBy()
        return self.sortBy
end


function SearchParams:getLength()
        return self.listLength
end


function SearchParams:getLengthInt()
        if self.listLength ~= nil then
            return self.listLength
        else
            return 0
        end
end


function SearchParams:getStartPage()
        return self.startPage
end


function SearchParams:getEndPage()
        return self.endPage
end


function SearchParams:getStartPageInt()
        if self.startPage ~= nil then
            return self.startPage
        else
            return 0
        end
end


function SearchParams:getEndPageInt()
        if self.endPage ~= nil then
            return self.endPage
        else
            return 0
        end
end


-- throws Exception
function SearchParams:getParamsNode(document)
        local paramsNode = ModDomHelper.createNameValueNodes(document, SearchData.PARAMS, SearchData.PARAMS)
        paramsNode:appendChild(self:getFieldsNode(document))
        paramsNode:appendChild(self:getOrderNode(document))
        paramsNode:appendChild(self:getSortByNode(document))
        paramsNode:appendChild(self:getLengthNode(document))
        return paramsNode
end


-- throws Exception
function SearchParams:getFieldsNode(document)
        local fieldsNode = ModDomHelper.createNameValueNodes(document, SearchData.FIELDS, tostring(self.columnsAndSearchValues:size()))
        local set = self.columnsAndSearchValues:keySet()
        local searchValueArray = set:toArray()
        local size = (searchValueArray.n or #searchValueArray)
        for index = 0, size - 1 do
            local key = searchValueArray[index + 1]
            local searchValue = self.columnsAndSearchValues:get(key)
            fieldsNode:appendChild(ModDomHelper.createNameValueNodes(document, SearchData.FIELD, key, ToDomHelper.convertNull(searchValue)))
        end
        return fieldsNode
end


-- throws Exception
function SearchParams:getOrderNode(document)
        return ModDomHelper.createNameValueNodes(document, SearchData.ORDER, ToDomHelper.convertNull(self:getOrder()))
end


-- throws Exception
function SearchParams:getSortByNode(document)
        return ModDomHelper.createNameValueNodes(document, SearchData.SORTBY, ToDomHelper.convertNull(self:getSortBy()))
end


-- throws Exception
function SearchParams:getLengthNode(document)
        return ModDomHelper.createNameValueNodes(document, SearchData.LENGTH, ToDomHelper.convertNull(self:getLength()))
end

return SearchParams

