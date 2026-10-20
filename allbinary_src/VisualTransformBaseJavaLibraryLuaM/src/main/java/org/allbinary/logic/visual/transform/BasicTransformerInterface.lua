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
-- package org.allbinary.logic.visual.transform

-- local InputStream = require("java.io.InputStream")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local CompositeTransformInfoInterface = require("org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local BasicTransformerInterface = {}
BasicTransformerInterface.__index = BasicTransformerInterface
BasicTransformerInterface.className = "BasicTransformerInterface"
setmetatable(BasicTransformerInterface, {__index = CompositeTransformInfoInterface})


function BasicTransformerInterface:setInputStream(inputStream)
    error("abstract method setInputStream")
end


function BasicTransformerInterface:setURIResolver(uriResolver)
    error("abstract method setURIResolver")
end


function BasicTransformerInterface:getStreamSource()
    error("abstract method getStreamSource")
end


function BasicTransformerInterface:getInputStream()
    error("abstract method getInputStream")
end


function BasicTransformerInterface:getURIResolver()
    error("abstract method getURIResolver")
end


-- throws Exception
function BasicTransformerInterface:translate(xmlDocumentStr)
    error("abstract method translate")
end

return BasicTransformerInterface

