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

local CustomUriResolver = {}
package.loaded["org.allbinary.data.tree.dom.CustomUriResolver"] = CustomUriResolver

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

-- local Source = require("javax.xml.transform.Source")
-- local TransformerException = require("javax.xml.transform.TransformerException")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbFilePath = java_lazy("org.allbinary.logic.io.path.AbFilePath")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfoTemplateData = java_lazy("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local BasicUriResolver = java_lazy("org.allbinary.data.tree.dom.BasicUriResolver")
local URIResolverStrings = java_lazy("org.allbinary.data.tree.dom.URIResolverStrings")

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

-- class table CustomUriResolver is declared before the requires
CustomUriResolver.__index = CustomUriResolver
CustomUriResolver.className = "CustomUriResolver"
CustomUriResolver.javaClassName = "org.allbinary.data.tree.dom.CustomUriResolver"
CustomUriResolver.java_implements = " URIResolver "
CustomUriResolver.java_interfaces = function() return {URIResolver} end

function CustomUriResolver:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.uriResolverStrings = URIResolverStrings.getInstance()
    if self.path == nil then self.path = nil end
    if self.basicURIResolver == nil then self.basicURIResolver = nil end
end


function CustomUriResolver._jinit(self, path, basicURIResolver)
    CustomUriResolver._init_fields(self)
        self.path = path
        self.basicURIResolver = basicURIResolver
    return self
end

function CustomUriResolver.new(...)
    local self = setmetatable({}, CustomUriResolver)
    CustomUriResolver._jinit(self, ...)
    return self
end


-- throws TransformerException
function CustomUriResolver:resolve(href, base)
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.path)
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            stringBuffer:append(href)
            local fileAbPath = AbFilePath.new(tostring(stringBuffer))
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XMLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.uriResolverStrings.ATTEMPT)
                stringBuffer:append(href)
                stringBuffer:append(self.uriResolverStrings.BASE)
                stringBuffer:append(base)
                stringBuffer:append(self.uriResolverStrings.NEW_PATH)
                stringBuffer:append(tostring(fileAbPath))
                stringBuffer:append(self.uriResolverStrings.NOTE)
                stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
                stringBuffer:append(self.uriResolverStrings.URL_GLOBAL)
                stringBuffer:append(self.uriResolverStrings.REQUIRED_EXTENSION)
                stringBuffer:append(self.basicURIResolver:getExtension())
            end
            do return "__jreturn", StreamSource.new(CryptFileReader.new(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION):getInputStream(fileAbPath)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function CustomUriResolver:toString()
        return self.path
end
CustomUriResolver.__tostring = function(self) return self:toString() end

return CustomUriResolver

