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

local DocumentToNode = {}
package.loaded["org.allbinary.data.tree.dom.document.DocumentToNode"] = DocumentToNode

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")

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

-- class table DocumentToNode is declared before the requires
DocumentToNode.__index = DocumentToNode
DocumentToNode.className = "DocumentToNode"
DocumentToNode.javaClassName = "org.allbinary.data.tree.dom.document.DocumentToNode"


function DocumentToNode._jinit(self)
    return self
end

function DocumentToNode.new(...)
    local self = setmetatable({}, DocumentToNode)
    DocumentToNode._jinit(self, ...)
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
        while not rawequal(((function() startIndex = ((string.find(documentString, start, 1, true) or 0) - 1) return startIndex end)()), -1) do
            if startIndex >= 0 then
                local endIndex = ((string.find(documentString, end_, (startIndex) + 1, true) or 0) - 1)
                if endIndex >= 0 then
                    local startString = string.sub(documentString, (0) + 1, startIndex)
                    local resultString = string.sub(documentString, (endIndex + 1) + 1)
                    return require("allbinary_java").to_string(startString) .. require("allbinary_java").to_string(resultString)
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

