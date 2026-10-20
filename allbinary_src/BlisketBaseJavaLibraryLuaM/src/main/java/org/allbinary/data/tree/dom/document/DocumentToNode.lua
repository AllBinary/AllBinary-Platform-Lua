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

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DocumentToNode = {}
DocumentToNode.__index = DocumentToNode
DocumentToNode.className = "DocumentToNode"


function DocumentToNode.new()
    local self = setmetatable({}, DocumentToNode)
    return self
end


-- throws Exception
function DocumentToNode.convertDocumentToNodeString(documentString)
        documentString = DocumentToNode.remove(documentString, DocumentToNode.XMLJSPROOTSTART, DocumentToNode.XMLEND)
        documentString = DocumentToNode.remove(documentString, DocumentToNode.XMLJSPROOTENDSTART, DocumentToNode.XMLEND)
        local replaceXmlRoot = Replace.new(DocumentToNode.XMLROOT, StringUtil.getInstance().EMPTY_STRING)
        return replaceXmlRoot:all(documentString)
end


function DocumentToNode.removeXmlDefinitionFromDocumentString(documentString)
        return DocumentToNode.remove(documentString, DocumentToNode.XMLROOTSTART, DocumentToNode.XMLROOTEND)
end


function DocumentToNode.remove(documentString, start, end_)
        local startIndex = 0
        while ((function() startIndex = ((string.find(documentString, start, 1, true) or 0) - 1) return startIndex end)()) ~= -1 do
            if startIndex >= 0 then
                local endIndex = ((string.find(documentString, end_, (startIndex) + 1, true) or 0) - 1)
                if endIndex >= 0 then
                    local startString = string.sub(documentString, (0) + 1, startIndex)
                    local resultString = string.sub(documentString, (endIndex + 1) + 1)
                    return startString .. resultString
                end
            end
        end
        return documentString
end

DocumentToNode.XMLROOT = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
DocumentToNode.XMLROOTSTART = "<?xml"
DocumentToNode.XMLROOTEND = "?>"
DocumentToNode.XMLJSPROOTSTART = "<jsp:root"
DocumentToNode.XMLEND = ">"
DocumentToNode.XMLJSPROOTENDSTART = "</jsp:root"

return DocumentToNode

