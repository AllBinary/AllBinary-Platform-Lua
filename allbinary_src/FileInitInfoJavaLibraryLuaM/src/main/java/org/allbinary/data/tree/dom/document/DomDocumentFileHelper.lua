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

-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local DOMSource = require("javax.xml.transform.dom.DOMSource")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
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

local DomDocumentFileHelper = {}
DomDocumentFileHelper.__index = DomDocumentFileHelper
DomDocumentFileHelper.className = "DomDocumentFileHelper"


function DomDocumentFileHelper.new()
    local self = setmetatable({}, DomDocumentFileHelper)
    return self
end


-- throws Exception
function DomDocumentFileHelper.createDocument(xmlFile)
        local try_ok, try_error = pcall(function()
            return DomDocumentHelper.create(AbFileInputStream.new(xmlFile))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
function DomDocumentFileHelper.save(file, document)
        local dataOutputStream = nil
        local try_ok, try_error = pcall(function()
            local copyTransformerFactory = TransformerFactory.newInstance()
            local copyTransformer = copyTransformerFactory:newTransformer()
            local domSource = DOMSource.new(document)
            if file:isFile() then
                file:delete()
            end
            file:createNewFile()
            dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(file)
            local streamResult = StreamResult.new(dataOutputStream)
            copyTransformer:transform(domSource, streamResult)
            dataOutputStream:flush()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
        do -- finally
            StreamUtil.getInstance():close(dataOutputStream)
        end
end

return DomDocumentFileHelper

