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

local AbTransformer = {}
package.loaded["org.allbinary.logic.visual.transform.AbTransformer"] = AbTransformer

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

-- local InputStream = require("java.io.InputStream")
-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local XslHelper = java_lazy("org.allbinary.data.tree.dom.XslHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigGenerator = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator")
local TransformInfoObjectConfigGeneratorFactory = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AbTransformer is declared before the requires
AbTransformer.__index = AbTransformer
AbTransformer.className = "AbTransformer"
AbTransformer.javaClassName = "org.allbinary.logic.visual.transform.AbTransformer"
AbTransformer.java_implements = " BasicTransformerInterface "
AbTransformer.java_interfaces = function() return {BasicTransformerInterface} end

function AbTransformer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
    if self.inputStream == nil then self.inputStream = nil end
    if self.uriResolver == nil then self.uriResolver = nil end
end


function AbTransformer._jinit(self, transformInfoInterface)
    AbTransformer._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
    return self
end

function AbTransformer.new(...)
    local self = setmetatable({}, AbTransformer)
    AbTransformer._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XMLLOGGING) then
                self.logUtil:putF("xml: \n" .. xmlDocumentStr, self, "translate(String xmlDocumentStr)")
            end
            if self:getURIResolver() == nil then
                error(require("java.lang.Exception").new("No URIResolver"), 0)
            end
            local result = XslHelper.getInstance():translate(self:getURIResolver(), StreamSource.new(self:getInputStream()), StreamSource.new(StringBufferInputStream.new(xmlDocumentStr)))
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XSLLOGGING) then
                self.logUtil:putF("translated xml: " .. result, self, "translate(String xmlDocumentStr)")
            end
            local transformInfoObjectConfigGeneratorInterface = TransformInfoObjectConfigGeneratorFactory.getInstance():getInstance(self:getTransformInfoInterface())
            do return "__jreturn", transformInfoObjectConfigGeneratorInterface:process(result) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.transformInfoInterface:log(), self, "translate(document)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return AbTransformer

