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
-- package org.allbinary.data.tree.dom.document

-- local InputStream = require("java.io.InputStream")
-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local DocumentBuilder = require("javax.xml.parsers.DocumentBuilder")
-- local DocumentBuilderFactory = require("javax.xml.parsers.DocumentBuilderFactory")
local Document = require("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DomDocumentHelper = {}
DomDocumentHelper.__index = DomDocumentHelper
DomDocumentHelper.className = "DomDocumentHelper"


function DomDocumentHelper.new()
    local self = setmetatable({}, DomDocumentHelper)
    return self
end


function DomDocumentHelper.init()
        System.setProperty("jdk.xml.maxElementDepth", "0")
        System.setProperty("jdk.xml.xpathExprOpLimit", "0")
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0")
        local LIMIT = "500000"
        System.setProperty("jdk.xml.maxGeneralEntitySizeLimit", LIMIT)
        System.setProperty("jdk.xml.totalEntitySizeLimit", LIMIT)
end


function DomDocumentHelper.create()
        local try_ok, try_error = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:newDocument()
            return document
        end)
        if not try_ok then
            local e = try_error
            return nil
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function DomDocumentHelper.create(inputStream)
        local try_ok, try_error = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:parse(inputStream)
            return document
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function DomDocumentHelper.create(xmlString)
        local try_ok, try_error = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:parse(StringBufferInputStream.new(xmlString))
            return document
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

return DomDocumentHelper

