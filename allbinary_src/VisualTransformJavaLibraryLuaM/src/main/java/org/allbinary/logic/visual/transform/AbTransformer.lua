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
-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local XslHelper = require("org.allbinary.data.tree.dom.XslHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigGenerator = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator")
local TransformInfoObjectConfigGeneratorFactory = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicTransformerInterface = require("org.allbinary.logic.visual.transform.BasicTransformerInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbTransformer = {}
AbTransformer.__index = AbTransformer
AbTransformer.className = "AbTransformer"

function AbTransformer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.transformInfoInterface = nil
    self.inputStream = nil
    self.uriResolver = nil
end


function AbTransformer.new(transformInfoInterface)
    local self = setmetatable({}, AbTransformer)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
    return self
end


function AbTransformer:getTransformInfoInterface()
        return self.transformInfoInterface
end


function AbTransformer:setInputStream(inputStream)
        self.inputStream = inputStream
end


function AbTransformer:setURIResolver(uriResolver)
        self.uriResolver = uriResolver
end


function AbTransformer:getInputStream()
        return self.inputStream
end


function AbTransformer:getURIResolver()
        return self.uriResolver
end


function AbTransformer:getStreamSource()
        return StreamSource.new(self:getInputStream())
end


-- throws Exception
function AbTransformer:translate(xmlDocumentStr)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XMLLOGGING) then
                self.logUtil:putF("xml: \n" .. xmlDocumentStr, self, "translate(String xmlDocumentStr)")
            end
            if self:getURIResolver() == nil then
                error(java_exception("Exception", "No URIResolver"), 0)
            end
            local result = XslHelper.getInstance():translate(self:getURIResolver(), StreamSource.new(self:getInputStream()), StreamSource.new(StringBufferInputStream.new(xmlDocumentStr)))
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGING) then
                self.logUtil:putF("translated xml: " .. result, self, "translate(String xmlDocumentStr)")
            end
            local transformInfoObjectConfigGeneratorInterface = TransformInfoObjectConfigGeneratorFactory.getInstance():getInstance(self:getTransformInfoInterface())
            return transformInfoObjectConfigGeneratorInterface:process(result)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.transformInfoInterface:log(), self, "translate(document)", e)
            end
            error(e, 0)
        end
end

return AbTransformer

