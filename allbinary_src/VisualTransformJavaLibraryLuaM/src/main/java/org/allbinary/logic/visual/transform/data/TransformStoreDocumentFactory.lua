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

-- local PageContext = require("javax.servlet.jsp.PageContext")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformStoreDocumentFactory = {}
TransformStoreDocumentFactory.__index = TransformStoreDocumentFactory
TransformStoreDocumentFactory.className = "TransformStoreDocumentFactory"


function TransformStoreDocumentFactory.new()
    local self = setmetatable({}, TransformStoreDocumentFactory)
    return self
end


-- throws Exception
function TransformStoreDocumentFactory.getInstance(pageContext, weblisketSession)
        return TransformStoreDocument.new(pageContext, weblisketSession)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformStoreDocumentFactory.getInstance(searchRequest)
        return TransformStoreDocument.new(searchRequest)
end

return TransformStoreDocumentFactory

