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
-- package org.allbinary.data.tree.dom

-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local AbFileLocalInputStream = require("org.allbinary.logic.io.AbFileLocalInputStream")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
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

local SimpleTransform = {}
SimpleTransform.__index = SimpleTransform
SimpleTransform.className = "SimpleTransform"

function SimpleTransform:_init_fields()
    self.xsltFilePath = nil
    self.dataFilePath = nil
end


function SimpleTransform.new(xsltFilePath, dataFilePath)
    local self = setmetatable({}, SimpleTransform)
    self:_init_fields()
        self.xsltFilePath = xsltFilePath
        self.dataFilePath = dataFilePath
    return self
end


-- throws Exception
function SimpleTransform:transform()
        local inputStream = AbFileLocalInputStream.new(AbFile.createAbFileFromAbPath(self.xsltFilePath))
        local document = DomDocumentHelper.create(AbFileLocalInputStream.new(AbFile.createAbFileFromAbPath(self.dataFilePath)))
        local result = XslHelper.getInstance():translate(StreamSource.new(inputStream), StreamSource.new(StringBufferInputStream.new(XmlDocumentHelper.toString(document))))
        return result
end

return SimpleTransform

